# Changelog

All notable changes to pgcatalog. Version headers mirror the published
bazel-registry entries.

## 17.6.0 — carved out of rules_postgres

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
