# pgcatalog

**Postgres's system catalog, modelled in Lean 4.**

A first-principles model of `pg_catalog` — phantom-typed OIDs, the kernel system
tables, name resolution, and Postgres 17.6's own bootstrap data rendered as Lean.

Part of [leangres](https://github.com/leangres).

## Contents

| module | what |
|---|---|
| `Pg.Catalog.Oid` | `Oid k` — phantom-typed over the object kind, so a relation OID cannot be passed where a type OID is wanted |
| `Pg.Catalog.Tables` | `PgNamespace`, `PgClass`, `PgType`, `PgProc`, `PgAttribute`, `PgAuthid` + `RelKind` / `TypType` / `ProVolatile` / `ProKind` / `ArgMode` |
| `Pg.Catalog.RegTypes` | `QualifiedName` — schema-qualified naming |
| `Pg.Catalog.Snapshot` | a point-in-time view: each kernel table as a row list, with lookup helpers |
| `Pg.Catalog.Resolution` | name → OID resolution against a snapshot |
| `Pg.Catalog.AttributeRef` | column resolution |
| `Pg.Catalog.Generated` | PG 17.6's bootstrap catalog as Lean literals (4,686 lines) |
| `Pg.Catalog.SnapshotEmit` | `Snapshot.toLeanSource` — a snapshot back to Lean source |
| `Pg.Catalog.Dat` | parser + canonical emitter for Postgres's `.dat` bootstrap format |

## What is actually proven

**Resolution is independent of `search_path`.** The substantive theorems here:
`resolveRelation`/`resolveType`/`resolveProc`, applied to a schema-qualified name,
give the same answer regardless of `search_path` — plus the corresponding
`_empty_searchPath_none` cases, and the same for attribute resolution. These are
the load-bearing results in the module.

**The `.dat` grammar captures Postgres's real bootstrap format.**
`//lean:gate_catalog_dat_round_trip` parses each of PG 17.6's 24 bootstrap catalog
files, canonically re-emits, re-parses, and requires stability. Verified:
**24/24 files round-trip stable**, `pg_proc.dat` alone at 3,314 rows. The gate
takes ~8.5 minutes, dominated by the Lean compile and that run, which is why it
lives in its own CI job.

`DatRoundTrip.lean`'s `main : IO UInt32` self-validates and returns 0 only if
every file round-trips, so the gate needs no committed expected-output fixture.

The `.dat` files are read from the pinned `@postgres_src` tree, **not vendored**.
(`rules_postgres`'s own comment claimed vendoring under `Pg/Catalog/dat/`; no such
directory exists in either repo.)

## Why its own module

`Generated.lean` is 4,686 lines regenerated only when Postgres releases. The AST
layer above is edited daily. `rules_lean` compiles a whole library in **one
action**, so sharing a module would mean recompiling the catalog dump on every AST
edit.

## Dependencies

**Lean core only**, for the library. Every module imports only other `Pg.Catalog`
modules and Lean core — checked per file, not assumed.

`rules_postgres` is a **`dev_dependency`**, needed solely by the `.dat` gate to
reach Postgres source. Consumers of the catalog model do not inherit it.

No mathlib, no batteries — please keep it that way.

## Consuming it

```python
bazel_dep(name = "pgcatalog", version = "17.6.0")
```

```python
lean_library(
    name = "my_thing",
    srcs = ["MyThing.lean"],
    deps = ["@pgcatalog//lean:pgcatalog"],
)
```

Published as **compiled oleans**. `.olean` is a compacted heap image — neither
Lean-version- nor architecture-portable — so pin the same toolchain
(`leanprover/lean4:v4.30.0-rc2`) and select the artifact for your platform. Lean
rejects a mismatch loudly rather than misbehaving quietly.

## Versioning

`<pg_major>.<pg_minor>.<patch>`, with `compatibility_level = 17`.

This module genuinely models a Postgres release — `Generated.lean` comes from
17.6's own bootstrap files, and catalog OIDs move between majors. So bzlmod
**refuses** to resolve a build that mixes Postgres majors, which is correct: a
catalog model built from 17's data does not describe 18, and a build that silently
mixed them would be wrong in ways no test would name.

## Not included

`Pg.Catalog.Fold` — the DDL→catalog projection — is deliberately absent. It is the
one catalog module that reaches outside `Pg.Catalog` (it imports `Pg.Query.Top`),
and it is the ancestor of the migration transition function, so it belongs with
the migration layer rather than the model. The `Pg.Catalog` aggregator does not
import it, so nothing here depends on it.

## Provenance

Carved from
[`tomato-bazel/rules_postgres`](https://github.com/tomato-bazel/rules_postgres)
with `git filter-repo`, history preserved. Commit hashes quoted in those messages
may refer to commits that were filtered out — harmless, but they will not resolve
here.

## License

MIT.
