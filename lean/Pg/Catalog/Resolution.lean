/-
Pg.Catalog.Resolution — search_path-aware name resolution
+ schema-qualified immunity theorem.

Given a catalog `Snapshot` and a `search_path`, resolve a
`QualifiedName` to the appropriate kind of `Oid` (relation, type,
or proc).

Two resolution shapes:

  Qualified (`{schema := some s, name := n}`):
    Look up schema `s` by name; if found, look up name `n` in
    that schema; otherwise return `none`. Crucially, this does
    NOT consult `search_path` — making schema-qualified names
    immune to search_path manipulation. This is the headline
    property: `resolveX_qualified_sp_independent`.

  Unqualified (`{schema := none, name := n}`):
    Walk `search_path` left-to-right and return the oid of the
    first matching object in the first schema that has one.
    `findSome?` makes this exact left-bias explicit.

The unqualified path is exactly the bug surface for
search_path-injection attacks: an attacker who can prepend a
schema to `search_path` and create a malicious object in it
will shadow the legitimate object.

Moved from Aion's `lean/Aion/Db/Catalog/Resolution.lean` as part of
PgAst extraction Phase 1b.
-/

import Pg.Catalog.Snapshot
import Pg.Catalog.RegTypes

namespace Pg.Catalog

/-- An ordered list of namespace oids — the resolved form of
    Postgres's `search_path` GUC. The first schema containing a
    matching object wins.

    We model `search_path` as resolved oids rather than schema-
    name strings; mapping `current_setting('search_path')` (which
    yields `"\"$user\",public"`) to this list is a separate
    layer not encoded here. -/
abbrev SearchPath := List (Oid .namespace)

namespace Snapshot

/-- Resolve `q` to a relation oid under `s` + `sp`. See module
    docstring for the two resolution shapes. -/
def resolveRelation (s : Snapshot) (sp : SearchPath) (q : QualifiedName)
    : Option (Oid .relation) :=
  match q.schema with
  | some schemaName =>
      match s.findNamespaceByName schemaName with
      | some ns => (s.findRelationInSchema ns.oid q.name).map (·.oid)
      | none    => none
  | none =>
      sp.findSome? (fun ns => (s.findRelationInSchema ns q.name).map (·.oid))

/-- Resolve `q` to a type oid. -/
def resolveType (s : Snapshot) (sp : SearchPath) (q : QualifiedName)
    : Option (Oid .type) :=
  match q.schema with
  | some schemaName =>
      match s.findNamespaceByName schemaName with
      | some ns => (s.findTypeInSchema ns.oid q.name).map (·.oid)
      | none    => none
  | none =>
      sp.findSome? (fun ns => (s.findTypeInSchema ns q.name).map (·.oid))

/-- Resolve `q` to a proc oid. -/
def resolveProc (s : Snapshot) (sp : SearchPath) (q : QualifiedName)
    : Option (Oid .proc) :=
  match q.schema with
  | some schemaName =>
      match s.findNamespaceByName schemaName with
      | some ns => (s.findProcInSchema ns.oid q.name).map (·.oid)
      | none    => none
  | none =>
      sp.findSome? (fun ns => (s.findProcInSchema ns q.name).map (·.oid))

end Snapshot

/-! ## search_path immunity for schema-qualified names.

    The three theorems below are the central correctness claim
    of this module: a schema-qualified `QualifiedName` resolves
    to the same oid (or to `none`) regardless of `search_path`.
    No matter what an attacker prepends to `search_path`, a
    function that names `auth.has_permission_v2` cannot be
    redirected to a different proc.

    These reduce to `rfl` because the qualified branch never
    inspects `sp`. -/

theorem Snapshot.resolveRelation_qualified_sp_independent
    (s : Snapshot) (sp sp' : SearchPath) (schemaName name : String) :
    s.resolveRelation sp (QualifiedName.qualified schemaName name)
      = s.resolveRelation sp' (QualifiedName.qualified schemaName name) := rfl

theorem Snapshot.resolveType_qualified_sp_independent
    (s : Snapshot) (sp sp' : SearchPath) (schemaName name : String) :
    s.resolveType sp (QualifiedName.qualified schemaName name)
      = s.resolveType sp' (QualifiedName.qualified schemaName name) := rfl

theorem Snapshot.resolveProc_qualified_sp_independent
    (s : Snapshot) (sp sp' : SearchPath) (schemaName name : String) :
    s.resolveProc sp (QualifiedName.qualified schemaName name)
      = s.resolveProc sp' (QualifiedName.qualified schemaName name) := rfl

/-! ## Empty search_path implies unqualified lookup is `none`. -/

theorem Snapshot.resolveRelation_empty_searchPath_none
    (s : Snapshot) (name : String) :
    s.resolveRelation [] (QualifiedName.unqualified name) = none := rfl

theorem Snapshot.resolveType_empty_searchPath_none
    (s : Snapshot) (name : String) :
    s.resolveType [] (QualifiedName.unqualified name) = none := rfl

theorem Snapshot.resolveProc_empty_searchPath_none
    (s : Snapshot) (name : String) :
    s.resolveProc [] (QualifiedName.unqualified name) = none := rfl

/-! ## Generic argument-form qualified-immunity theorems.

    Keyed on `schema.isSome` rather than on the explicit constructor.
    Useful for downstream emit-target proofs where the qualified
    Identifier is opaque (e.g. `CreateFunctionStmt.name`). -/

theorem Snapshot.resolveRelation_qualified_arg_sp_independent
    (snap : Snapshot) (sp sp' : SearchPath) (id : QualifiedName)
    (h : id.schema.isSome) :
    snap.resolveRelation sp id = snap.resolveRelation sp' id := by
  match id, h with
  | ⟨some _, _⟩, _ => rfl
  | ⟨none, _⟩, h => nomatch h

theorem Snapshot.resolveType_qualified_arg_sp_independent
    (snap : Snapshot) (sp sp' : SearchPath) (id : QualifiedName)
    (h : id.schema.isSome) :
    snap.resolveType sp id = snap.resolveType sp' id := by
  match id, h with
  | ⟨some _, _⟩, _ => rfl
  | ⟨none, _⟩, h => nomatch h

theorem Snapshot.resolveProc_qualified_arg_sp_independent
    (snap : Snapshot) (sp sp' : SearchPath) (id : QualifiedName)
    (h : id.schema.isSome) :
    snap.resolveProc sp id = snap.resolveProc sp' id := by
  match id, h with
  | ⟨some _, _⟩, _ => rfl
  | ⟨none, _⟩, h => nomatch h

end Pg.Catalog
