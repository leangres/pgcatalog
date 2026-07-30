/-
Pg.Catalog.Canonical — OID-independent identity for catalog objects.

⛔ THE DIFFERENTIAL GATE CANNOT COMPARE OIDs, AND FINDING THAT OUT LATE SINKS IT.

`Pg.Migrate.step` allocates OIDs deterministically from 16384. A real Postgres
allocates from a cluster-wide counter that is shared with every other object
ever created, moves during `initdb`, and leaves gaps. So two catalogs can be
IDENTICAL in every way anyone cares about and agree on not one single OID.

Any claim made against real Postgres therefore has to be stated over a name-based
identity. That is `ObjKey`. Claims INTERNAL to the model keep their deterministic
OIDs — those are cheap, total, and exactly right for `native_decide`.

## Why `unresolved` is a KEY and not a `none`

The tempting signature is `canonRelation : CatalogState → Oid .relation →
Option ObjKey`, returning `none` when an OID does not resolve in this state.

That fails open, and in the worst way for a differential gate. The gate compares
two key sets; if canonicalization can yield `none` and the gate filters those
out, then an OID that resolves on neither side simply *disappears from both* —
and the two sides agree by omission. A dangling `confrelid` would read as a
clean diff.

So a failure to resolve is a VALUE in the key space, carrying the kind and the
raw OID. It cannot be dropped without someone writing code to drop it, and if
the two sides dangle differently the keys differ and the gate fires.

## What is deliberately NOT in a key

Nothing that Postgres decides for itself and that carries no schema meaning:
`relpages`, `reltuples`, ACL columns, `pg_description`. Those must be masked by
the gate, not encoded here — a key that included them would never match. The
gate is required to PRINT its mask list, so a reader can see what is not being
compared.
-/

import Pg.Catalog.State

namespace Pg.Catalog

/-- A catalog object's identity as anything outside the model must see it:
    schema-qualified names, never OIDs.

    Flat rather than recursive — a function's argument types are rendered
    strings, not nested `ObjKey`s. A nested inductive here would buy nothing
    (an argument type is always a type, so the extra structure is never
    inspected) and would cost the `DecidableEq` instance that every downstream
    `native_decide` needs. -/
inductive ObjKey where
  /-- A schema. -/
  | namespace_  (name : String)
  /-- Table, view, index, sequence — anything in `pg_class`. `relkind` is NOT
      part of the key: Postgres forbids two relations sharing a name in one
      schema regardless of kind, so name is already unique, and including kind
      would make a table→view change read as an unrelated drop plus create
      rather than as the kind change it is. -/
  | relation    (schema name : String)
  | type_       (schema name : String)
  /-- Functions are overloadable, so the argument types are part of the
      identity. Rendered canonically (`schema.name`) so the key stays flat. -/
  | proc        (schema name : String) (argTypes : List String)
  | attribute   (schema rel name : String)
  | constraint  (schema rel name : String)
  | index       (schema name : String)
  /-- Roles are cluster-scoped, so no schema. -/
  | role        (name : String)
  /-- An OID that does not resolve in the state being canonicalized. See the
      header: this is a value precisely so it cannot be silently dropped. -/
  | unresolved  (kind : String) (oid : Nat)
deriving DecidableEq, Repr, Inhabited

namespace ObjKey

/-- Rendered form, for diffs a human reads. Not parsed by anything — `ObjKey`
    itself is the comparison surface. -/
def render : ObjKey → String
  | .namespace_ n        => s!"schema {n}"
  | .relation s n        => s!"relation {s}.{n}"
  | .type_ s n           => s!"type {s}.{n}"
  | .proc s n args       => s!"function {s}.{n}({String.intercalate ", " args})"
  | .attribute s r n     => s!"column {s}.{r}.{n}"
  | .constraint s r n    => s!"constraint {n} on {s}.{r}"
  | .index s n           => s!"index {s}.{n}"
  | .role n              => s!"role {n}"
  | .unresolved k o      => s!"<unresolved {k} oid {o}>"

end ObjKey

namespace CatalogState

/-- The schema name owning an OID, or `none` if it does not resolve. Internal —
    every public entry point turns a miss into `.unresolved`. -/
private def schemaName (s : CatalogState) (ns : Oid .namespace) : Option String :=
  (s.snap.findNamespaceByOid ns).map (·.nspname)

def canonNamespace (s : CatalogState) (o : Oid .namespace) : ObjKey :=
  match s.snap.findNamespaceByOid o with
  | some ns => .namespace_ ns.nspname
  | none    => .unresolved "namespace" o.raw

def canonRelation (s : CatalogState) (o : Oid .relation) : ObjKey :=
  match s.snap.findRelationByOid o with
  | none     => .unresolved "relation" o.raw
  | some rel =>
    match schemaName s rel.relnamespace with
    | some sch => .relation sch rel.relname
    | none     => .unresolved "relation" o.raw

def canonType (s : CatalogState) (o : Oid .type) : ObjKey :=
  match s.snap.findTypeByOid o with
  | none    => .unresolved "type" o.raw
  | some ty =>
    match schemaName s ty.typnamespace with
    | some sch => .type_ sch ty.typname
    | none     => .unresolved "type" o.raw

/-- An argument type as it appears inside a `proc` key. An unresolvable argument
    type renders as the unresolved key rather than being skipped — dropping it
    would silently collapse two different overloads onto one key. -/
private def argRender (s : CatalogState) (o : Oid .type) : String :=
  match canonType s o with
  | .type_ sch n => s!"{sch}.{n}"
  | k            => k.render

def canonProc (s : CatalogState) (o : Oid .proc) : ObjKey :=
  match s.snap.findProcByOid o with
  | none   => .unresolved "proc" o.raw
  | some p =>
    match schemaName s p.pronamespace with
    | some sch => .proc sch p.proname (p.proargtypes.map (argRender s))
    | none     => .unresolved "proc" o.raw

def canonRole (s : CatalogState) (o : Oid .role) : ObjKey :=
  match s.snap.findRoleByOid o with
  | some r => .role r.rolname
  | none   => .unresolved "role" o.raw

/-- A column key. Built from the owning relation's key so it inherits the
    relation's unresolved handling. -/
def canonAttribute (s : CatalogState) (rel : Oid .relation) (name : String) : ObjKey :=
  match canonRelation s rel with
  | .relation sch r => .attribute sch r name
  | _               => .unresolved "attribute" rel.raw

def canonConstraint (s : CatalogState) (c : PgConstraint) : ObjKey :=
  match canonRelation s c.conrelid with
  | .relation sch r => .constraint sch r c.conname
  | _               => .unresolved "constraint" c.oid.raw

/-- An index's key comes from its OWN `pg_class` row — an index is a relation.
    Keying it by the table it indexes would collapse every index on one table. -/
def canonIndex (s : CatalogState) (i : PgIndex) : ObjKey :=
  match canonRelation s i.indexrelid with
  | .relation sch n => .index sch n
  | _               => .unresolved "index" i.indexrelid.raw

/-! ## The whole state as a key set

    What a differential gate diffs. Deliberately a `List` in a fixed traversal
    order rather than a set: the caller sorts and diffs, and keeping the order
    observable means a duplicate key (two objects canonicalizing the same, which
    would be a modelling bug) shows up rather than being silently deduplicated. -/

/-- Every object in the state, as keys. -/
def canonicalize (s : CatalogState) : List ObjKey :=
  s.snap.namespaces.map (fun n => ObjKey.namespace_ n.nspname)
  ++ s.snap.relations.map  (fun r => canonRelation s r.oid)
  ++ s.snap.types.map      (fun t => canonType s t.oid)
  ++ s.snap.procs.map      (fun p => canonProc s p.oid)
  ++ s.snap.roles.map      (fun r => ObjKey.role r.rolname)
  ++ s.snap.attributes.map (fun a => canonAttribute s a.attrelid a.attname)
  ++ s.constraints.map     (canonConstraint s)
  ++ s.indexes.map         (canonIndex s)

/-- Keys that failed to resolve. A gate should report these separately: they are
    a defect in the state, not a difference between two states, and a run where
    both sides are equally broken would otherwise look clean. -/
def unresolvedKeys (s : CatalogState) : List ObjKey :=
  (canonicalize s).filter fun
    | .unresolved _ _ => true
    | _               => false

end CatalogState
end Pg.Catalog
