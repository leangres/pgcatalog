/-
Pg.Catalog.Snapshot — point-in-time catalog view.

A `Snapshot` bundles the 5 kernel tables as `List`s so that lookups
and resolution operate on a concrete in-memory catalog rather than
ambient I/O.

Real snapshots come from one of two sources:
  - the postgres-source generator (Pg.Catalog.Generated) — pinned
    subset of `src/include/catalog/*.dat` rendered as Lean literals
    with a byte-stable drift gate;
  - hand-built fixtures (worked examples, smoke tests, audit
    scenarios) — used to demonstrate the kind-indexing contract
    and to drive theorems that quantify over snapshots.

The lookup helpers (`findX`, `XInSchema`) are the building
blocks for `Pg.Catalog.Resolution`. Keeping them on the
`Snapshot` namespace makes the resolution code read as a
straight composition of catalog queries.

Moved from Aion's `lean/Aion/Db/Catalog/Snapshot.lean` as part of
PgAst extraction Phase 1b.
-/

import Pg.Catalog.Tables

namespace Pg.Catalog

/-- A point-in-time view of the postgres catalog. Each field is
    the full row set of the named system table at that point. -/
structure Snapshot where
  namespaces : List PgNamespace := []
  relations  : List PgClass     := []
  types      : List PgType      := []
  procs      : List PgProc      := []
  attributes : List PgAttribute := []
  roles      : List PgAuthid    := []
deriving Repr

namespace Snapshot

/-! ### Namespace lookups -/

def findNamespaceByOid (s : Snapshot) (oid : Oid .namespace) : Option PgNamespace :=
  s.namespaces.find? (fun n => n.oid == oid)

def findNamespaceByName (s : Snapshot) (name : String) : Option PgNamespace :=
  s.namespaces.find? (fun n => n.nspname == name)

/-! ### Relation lookups -/

def findRelationByOid (s : Snapshot) (oid : Oid .relation) : Option PgClass :=
  s.relations.find? (fun r => r.oid == oid)

def findRelationInSchema (s : Snapshot) (ns : Oid .namespace) (name : String)
    : Option PgClass :=
  s.relations.find? (fun r => r.relnamespace == ns && r.relname == name)

/-! ### Type lookups -/

def findTypeByOid (s : Snapshot) (oid : Oid .type) : Option PgType :=
  s.types.find? (fun t => t.oid == oid)

def findTypeInSchema (s : Snapshot) (ns : Oid .namespace) (name : String)
    : Option PgType :=
  s.types.find? (fun t => t.typnamespace == ns && t.typname == name)

/-! ### Proc lookups -/

def findProcByOid (s : Snapshot) (oid : Oid .proc) : Option PgProc :=
  s.procs.find? (fun p => p.oid == oid)

def findProcInSchema (s : Snapshot) (ns : Oid .namespace) (name : String)
    : Option PgProc :=
  s.procs.find? (fun p => p.pronamespace == ns && p.proname == name)

/-! ### Role lookups -/

def findRoleByOid (s : Snapshot) (oid : Oid .role) : Option PgAuthid :=
  s.roles.find? (fun r => r.oid == oid)

def findRoleByName (s : Snapshot) (name : String) : Option PgAuthid :=
  s.roles.find? (fun r => r.rolname == name)

/-! ### Attribute (column) lookups -/

/-- All columns of a given relation, in arbitrary order. -/
def attributesOf (s : Snapshot) (rel : Oid .relation) : List PgAttribute :=
  s.attributes.filter (fun a => a.attrelid == rel)

def findColumn (s : Snapshot) (rel : Oid .relation) (col : String)
    : Option PgAttribute :=
  s.attributes.find? (fun a => a.attrelid == rel && a.attname == col)

end Snapshot

end Pg.Catalog
