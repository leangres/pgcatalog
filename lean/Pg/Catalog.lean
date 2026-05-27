/-
Pg.Catalog — umbrella import for the pg_catalog first-principles
model.

Modules:
  Oid          — `OidKind` discriminator + kind-indexed `Oid k`
                 phantom-typed identifier.
  Tables       — pg_namespace / pg_class / pg_type / pg_proc /
                 pg_attribute structures + the on-disk-char-encoded
                 discriminators (RelKind, TypType, ProVolatile,
                 ProKind).
  RegTypes     — `RegClass` / `RegType` / `RegProcedure` /
                 `RegNamespace` / `RegRole` abbreviations +
                 `QualifiedName` unresolved-form structure.
  Snapshot     — point-in-time bundle of the 5 kernel tables as
                 lists + lookup helpers (by oid, by schema+name).
  Resolution   — `SearchPath` + `resolveRelation` / `resolveType` /
                 `resolveProc` + the schema-qualified-immunity
                 theorems (qualified resolution is independent of
                 `search_path`).
  AttributeRef — `AttributeRef` column-reference type +
                 `resolveAttribute` + column-layer immunity.
  Generated    — the catalog snapshot itself, regenerated from a
                 pinned postgres-source `*.dat` checkout, byte-gated
                 against the committed copy (drift-gate analog to
                 the libpg_query pattern).

Downstream consumers `import Pg.Catalog` to get the full model in
one go.

Moved from Aion's `lean/Aion/Db/Catalog.lean` umbrella as part of
PgAst extraction Phase 1b. Aion's original umbrella was missing
`AttributeRef` (shipped 2026-05-25, commit `49bd3a9`) and
`Generated` — completed here.
-/

import Pg.Catalog.Oid
import Pg.Catalog.Tables
import Pg.Catalog.RegTypes
import Pg.Catalog.Snapshot
import Pg.Catalog.Resolution
import Pg.Catalog.AttributeRef
import Pg.Catalog.Generated
