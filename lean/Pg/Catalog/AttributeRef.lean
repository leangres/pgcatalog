/-
Pg.Catalog.AttributeRef — schema-coherence column reference.

Columns in postgres are not standalone oids: they're keyed by
`(attrelid, attnum)` in `pg_attribute`. The catalog-grounding work
on standalone-oid entities (relations, types, procs, namespaces,
roles) is at `Pg.Catalog.Resolution`; columns need a different
shape — a `(table-ref, column-name)` pair plus a snapshot lookup.

## Scope honesty

The catalog migration's security wedge is `search_path`-injection
prevention on tables and function callees. Column references are
NOT the same kind of attack surface — an attacker who can prepend
a malicious schema to `search_path` gets value from shadowing
*tables* and *functions*, but column names within a table can't
be shadowed the same way: they belong to the table's `pg_attribute`
rows, keyed by the table's oid.

Column-grounding is therefore mostly schema-coherence work —
proving that every emitted `field (.var "r") "id"` matches an
actual `pg_attribute` row in the table aliased as `r`.

Moved from Aion's `lean/Aion/Db/Catalog/AttributeRef.lean` as part
of PgAst extraction Phase 1b.
-/

import Pg.Catalog.Snapshot
import Pg.Catalog.Resolution

namespace Pg.Catalog

/-- A `(table, column)` pair — the AST-level shape of a
    catalog-bound column reference. The table is itself an
    `Identifier` (alias of `QualifiedName`), so column refs inherit
    the search-path-immunity story of the underlying table reference. -/
structure AttributeRef where
  /-- The relation this column belongs to. Schema-qualified for
      catalog grounding. -/
  table : QualifiedName
  /-- The column name (matches `pg_attribute.attname`). -/
  column : String
deriving Repr

namespace Snapshot

/-- Resolve an `AttributeRef` against a snapshot + search_path.
    First resolves the relation via the existing
    `resolveRelation` machinery (search-path-aware iff the table
    is unqualified), then looks up the column in that relation's
    `pg_attribute` rows.

    Returns `none` if either:
      - the table can't be resolved
      - the table exists but has no column of the given name -/
def resolveAttribute (s : Snapshot) (sp : SearchPath) (ref : AttributeRef)
    : Option PgAttribute :=
  match s.resolveRelation sp ref.table with
  | none     => none
  | some rel => s.findColumn rel ref.column

end Snapshot

/-! ## Search-path immunity at the column layer.

    When the AttributeRef's table is schema-qualified, the column
    resolution is `search_path`-independent — lifts directly from
    `Snapshot.resolveRelation_qualified_arg_sp_independent`. -/

theorem Snapshot.resolveAttribute_qualified_sp_independent
    (snap : Snapshot) (sp sp' : SearchPath) (ref : AttributeRef)
    (h : ref.table.schema.isSome) :
    snap.resolveAttribute sp ref = snap.resolveAttribute sp' ref := by
  unfold Snapshot.resolveAttribute
  rw [Snapshot.resolveRelation_qualified_arg_sp_independent snap sp sp'
        ref.table h]

end Pg.Catalog
