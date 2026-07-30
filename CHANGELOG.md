# Changelog

## 17.6.3 — OID-independent identity (`Pg.Catalog.Canonical`)

⛔ **A differential gate against a real Postgres cannot compare OIDs, and finding
that out late sinks the harness.** `Pg.Migrate.step` allocates deterministically
from 16384; a live cluster allocates from a counter shared with every object
ever created, moved during `initdb`, with gaps. Two catalogs can be identical in
every way anyone cares about and agree on not one single OID.

`ObjKey` is the identity every claim made against real Postgres has to be stated
over. Claims internal to the model keep their deterministic OIDs — cheap, total,
and exactly right for `native_decide`.

**`unresolved` is a KEY, not a `none`.** The tempting signature returns
`Option ObjKey` for an OID that does not resolve. That fails open in the worst
way for a differential gate: it compares two key sets, and if misses are
filtered out then an OID dangling on *both* sides disappears from both and the
sides **agree by omission** — a dangling `confrelid` reads as a clean diff. So a
failure to resolve is a value carrying the kind and raw OID. It cannot be
dropped without someone writing code to drop it.

Flat rather than recursive: a function's argument types are rendered strings.
A nested inductive would buy nothing (an argument type is always a type) and
would cost the `DecidableEq` every downstream `native_decide` needs.

Two keying decisions worth knowing: `relkind` is NOT part of a relation's key
(Postgres already forbids two relations sharing a name in a schema, and
including kind would make a table→view change read as an unrelated drop plus
create), and an index keys on its OWN `pg_class` name rather than its table's
(otherwise every index on a table collapses onto one key and a dropped index
reads as clean).

Pinned, headline first: the same schema at disjoint OID ranges canonicalizes
identically — with a companion pin asserting those OIDs really do differ, so the
first is not vacuous.

## 17.6.2 — the catalog as a state, not just a view

`Snapshot` answers "what does this schema look like". A migration needs more,
and `pgast` 17.6.1 made the gap concrete: it can now emit
`ADD CONSTRAINT ... NOT VALID` and `VALIDATE CONSTRAINT`, and nothing here could
model the difference.

**Four new tables** — `PgConstraint`, `PgIndex`, `PgDepend`, `PgAttrdef` — plus
`ConType`, `DepType`, and four new `OidKind`s. Without them there is no
`DROP … RESTRICT` (nothing to compute a dependent set from), no
`NOT VALID`/`VALIDATE` (that state lives in `convalidated`), and no foreign-key
invariant to preserve across a change.

**`CatalogState` carries `Snapshot` unchanged alongside**, rather than extending
it. Deliberate: `Pg.Migrate.Fold` produces a `Snapshot` under a byte-equivalence
claim over a 1,384-statement production schema, and `Catalog.Generated`
constructs 4,686 lines of `Snapshot` literals. Everything reading a `Snapshot`
keeps working; the transition reads a `CatalogState`.

It seeds identically to `Fold` — `pg_catalog` 11, `public` 2200, OIDs from
16384 — so a state built either way starts the same, which is what lets the two
be compared later.

### Three lookups that are preconditions, not conveniences

- `findConstraint` — scoped **by relation**, because constraint names are unique
  per relation and not per schema.
- `hasUniqueIndexOn` — the check Postgres performs when a foreign key is created
  and `Pg.Schema.consistentB` does not: an FK must reference uniquely-indexed
  columns or it does not identify one row. Order matters; Postgres matches the
  index's column list, not a set. `indisvalid` is modelled because an index
  still building, or one whose `CONCURRENTLY` build failed, looks usable in
  `pg_class` alone and is not.
- `droppableRestrict` — only `normal` dependencies block. An `auto`/`internal`
  edge, such as the index Postgres created to back a PRIMARY KEY, goes with the
  parent either way, so refusing a DROP because of one would be wrong. That is
  why `deptype` is modelled rather than collapsed to a boolean.

### A named limitation

⚠ **`conbin`, `indpred` and `adbin` are `String`, not expression trees.** This
module is deliberately dep-free and the expression type lives in `pgast`, which
depends on *this* one — typing them properly would be a cycle.

That is a real limitation, not something to tidy up in place: a reference walker
asking "does anything still mention this column?" cannot work off rendered text.
When that is needed it belongs in `pgmigrate`, which can see both the catalog and
the AST. Postgres itself keeps both forms, so the split is not unnatural.

11 pins in `Pg/Catalog/StateTest.lean`; 3/3 test targets pass including the
`.dat` round-trip.

All notable changes to pgcatalog. Version headers mirror the published
bazel-registry entries.

## 17.6.1 — `compatibility_level` dropped; the versioning claim corrected

17.6.0 was tagged but **never published**, so nothing depended on it.

It carried `compatibility_level = 17` with a comment claiming bzlmod would refuse
to resolve a build mixing Postgres majors. **It would not.** Bazel 9 made
`compatibility_level` a no-op and prints so on every build — the attribute bought
a warning and nothing else, while the comment asserted a guarantee that did not
exist. Attribute removed and the claim corrected wherever it appeared.

The `<pg_major>.<pg_minor>.<patch>` scheme stands as a **convention**: it makes
the Postgres coupling visible in every dependency line and gives one coordination
axis. It is not enforced. A consumer can resolve `pgcatalog 17.6.x` alongside a
future `pgast 18.0.x` and resolution will not complain; the mismatch surfaces as a
Lean type error if shapes moved, or silently not at all.

Enforcement is owed. Candidates: an invariant in the registry admission gate,
which already ratchets cross-module properties of this shape, or a per-module Lean
version constant plus a consumer-side agreement test.

## 17.6.0 — carved out of rules_postgres (tagged, never published)

`Pg.Catalog.*` extracted from `tomato-bazel/rules_postgres` with
`git filter-repo`, history preserved (10 commits). 12 files, 6,092 lines, each
verified byte-identical to source by sha256 rather than inferred from the
extraction succeeding.

**Why its own module.** `Generated.lean` is 4,686 lines regenerated only when
Postgres releases; the AST layer above it is edited daily. `rules_lean` compiles a
whole library in one action, so a shared module would recompile the catalog dump
on every AST edit.

**Boundary.** `Pg.Catalog.Fold` is deliberately left behind — it is the only
catalog module that reaches outside `Pg.Catalog` (importing `Pg.Query.Top`), and
it is the ancestor of the migration transition function. The `Pg.Catalog`
aggregator imports the 7 core modules and not `Fold`, so nothing here depends on
it. Verified by reading every file's imports.

**Dep-free library; dev-only Postgres source.** Every module imports only other
`Pg.Catalog` modules and Lean core. `rules_postgres` is a `dev_dependency` needed
solely by the `.dat` gate, so consumers of the model do not inherit it.

**Ships compiled.** `//lean:pgcatalog_oleans` publishes the olean tree, and
`//lean:snapshot_emit_test` consumes the library via `deps` rather than re-listing
sources, so CI exercises the seam downstream modules will use.

**The `.dat` gate runs in CI, in its own job.** 24/24 of PG 17.6's bootstrap
catalog files round-trip stable (`pg_proc.dat` alone is 3,314 rows). It takes
~8.5 minutes, so keeping it off the fast lane means a catalog-model edit does not
wait on it. Note the `.dat` files are fetched from `@postgres_src`, not vendored —
`rules_postgres`'s comment claimed vendoring under `Pg/Catalog/dat/`, and no such
directory exists in either repo.

Requires `rules_lean` 0.6.1: earlier releases' `lean_olean_archive` fails on
linux, which is where consumers build.
