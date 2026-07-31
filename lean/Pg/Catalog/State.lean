/-
Pg.Catalog.State — the catalog as a MUTABLE state, not a static view.

`Snapshot` models the six kernel tables and answers "what does this schema look
like". That is what a schema emitter needs. A migration needs more: constraints
(including whether they have actually been validated), indexes, and the
dependency edges that decide whether a `DROP … RESTRICT` is allowed.

`CatalogState` carries `Snapshot` **unchanged** alongside the new tables rather
than extending it. That is deliberate:

  * `Pg.Migrate.Fold` produces a `Snapshot`, under a byte-equivalence claim
    against a retired C tool over a 1,384-statement production schema. Adding
    fields to `Snapshot` would change what that produces and put the claim at
    risk for no benefit.
  * `Catalog.Generated` constructs `Snapshot` literals — 4,686 lines of them,
    regenerated only on a Postgres bump.

So the seam is additive: everything that reads a `Snapshot` keeps working, and
the transition function reads a `CatalogState`.
-/

import Pg.Catalog.Snapshot

namespace Pg.Catalog

/-- The catalog as a transition operates on it.

    `nextOid` is carried here rather than derived, so allocation is a pure
    function of the state — the same discipline `Fold` uses, and what makes a
    transition's output reproducible. Postgres allocates user objects from
    16384; below that is the bootstrap catalog. -/
structure CatalogState where
  /-- The six kernel tables, exactly as `Snapshot` models them. -/
  snap        : Snapshot := {}
  /-- Monotonic allocator. Matches `Fold`'s scheme so the two agree on any
      schema both accept. -/
  nextOid     : Nat := 16384
  constraints : List PgConstraint := []
  indexes     : List PgIndex      := []
  depends     : List PgDepend     := []
  attrdefs    : List PgAttrdef    := []
deriving Repr

namespace CatalogState

/-- Seeded the way Postgres is: `pg_catalog` at 11, `public` at 2200. Same as
    `Fold`'s `FoldState.empty`, so a state built either way starts identically. -/
def empty : CatalogState where
  snap := {
    namespaces := [
      { oid := ⟨11⟩,   nspname := "pg_catalog" },
      { oid := ⟨2200⟩, nspname := "public" }
    ]
  }

/-- Allocate one OID. -/
def alloc (s : CatalogState) : Nat × CatalogState :=
  (s.nextOid, { s with nextOid := s.nextOid + 1 })

/-! ## Lookups the transition needs -/

/-- Constraints on a relation. -/
def constraintsOf (s : CatalogState) (rel : Oid .relation) : List PgConstraint :=
  s.constraints.filter (fun c => c.conrelid == rel)

/-- A constraint by name within a relation — the key `ALTER TABLE … VALIDATE` /
    `DROP CONSTRAINT` resolve against. Constraint names are unique per relation,
    not per schema. -/
def findConstraint (s : CatalogState) (rel : Oid .relation) (name : String)
    : Option PgConstraint :=
  (s.constraintsOf rel).find? (fun c => c.conname == name)

/-- Indexes on a relation. -/
def indexesOf (s : CatalogState) (rel : Oid .relation) : List PgIndex :=
  s.indexes.filter (fun i => i.indrelid == rel)

/-- Does a UNIQUE or PRIMARY KEY index cover exactly these columns?

    This is the check Postgres performs when a foreign key is created and
    `Pg.Schema.consistentB` does not: an FK must reference a uniquely-constrained
    set of columns, or it does not identify a single row. Order matters —
    Postgres matches the index's column list, not a set. -/
def hasUniqueIndexOn (s : CatalogState) (rel : Oid .relation) (cols : List Int) : Bool :=
  (s.indexesOf rel).any fun i =>
    (i.indisunique || i.indisprimary) && i.indisvalid && i.indkey == cols

/-- Everything that depends on an object, by `normal` edges only.

    `auto` and `internal` dependents are implementation detail that goes with
    the parent either way — an index Postgres created to back a PRIMARY KEY is
    not a reason to refuse the DROP. Only `normal` edges make a `RESTRICT` fail,
    which is why the deptype is modelled rather than collapsed to a boolean. -/
def dependentsOf (s : CatalogState) (kind : OidKind) (objid : Nat)
    : List PgDepend :=
  s.depends.filter fun d =>
    d.refclassid == kind && d.refobjid == objid && d.deptype == .normal

/-- Can this object be dropped with `RESTRICT`?

    Direct dependents only, which is correct: `RESTRICT` refuses if anything
    depends on the object, and it does not need to know how far the damage would
    spread. `CASCADE` is the one that needs the closure below. -/
def droppableRestrict (s : CatalogState) (kind : OidKind) (objid : Nat) : Bool :=
  (s.dependentsOf kind objid).isEmpty

/-! ## The CASCADE closure

    `DROP … CASCADE` drops the object AND everything that depends on it,
    transitively. Computing only the direct dependents is the bug that makes a
    cascade leave a view behind pointing at a table that no longer exists.

    ⚠ FUEL-BOUNDED, and not as a shortcut. `pg_depend` is a general graph — real
    Postgres has cycles in it (a table and its composite type reference each
    other) — so there is no structural recursion for Lean to accept and a
    well-founded measure would need a proof that the frontier strictly shrinks,
    which is exactly what a cycle breaks. Fuel is the honest encoding.

    The bound is `s.depends.length`: each round either adds at least one new
    object to the closure or stops, and no round can add more objects than there
    are edges. So the fuel can only be exhausted on a state whose closure is
    larger than its edge count, which is impossible — but if the invariant ever
    broke, this TRUNCATES rather than loops. `cascadeClosureComplete` below is
    how a caller checks it did not. -/

/-- Append preserving order, skipping anything already present. Written out
    because this is Lean core only — no batteries, so no `eraseDups`. Order is
    kept stable so the closure reads as a breadth-first discovery, which is what
    an error message wants to show. -/
private def pushNew (acc : List (OidKind × Nat)) (x : OidKind × Nat)
    : List (OidKind × Nat) :=
  if acc.contains x then acc else acc ++ [x]

/-- One round: everything directly depending on anything already in `acc`. -/
private def dependentsStep (s : CatalogState) (acc : List (OidKind × Nat))
    : List (OidKind × Nat) :=
  let grown := acc.flatMap fun (k, o) =>
    (s.dependentsOf k o).map (fun d => (d.classid, d.objid))
  grown.foldl pushNew acc

private def cascadeFix (s : CatalogState) : Nat → List (OidKind × Nat) → List (OidKind × Nat)
  | 0,       acc => acc
  | fuel+1,  acc =>
      let acc' := dependentsStep s acc
      if acc'.length == acc.length then acc else cascadeFix s fuel acc'

/-- Every object a `DROP … CASCADE` of this one would take with it, INCLUDING
    the object itself — because that is the list the caller turns into drop
    effects, and omitting the root is the kind of off-by-one that shows up as a
    table surviving its own DROP. -/
def cascadeClosure (s : CatalogState) (kind : OidKind) (objid : Nat)
    : List (OidKind × Nat) :=
  cascadeFix s (s.depends.length + 1) [(kind, objid)]

/-- Did the closure actually reach a fixpoint, or did it run out of fuel?

    A caller that cannot tolerate a truncated answer checks this. It is separate
    from `cascadeClosure` rather than folded into an `Option` for the same reason
    `Canonical` makes `unresolved` a value: a `none` here would be filtered by
    someone, and a silently-short cascade is worse than a loud one. -/
def cascadeClosureComplete (s : CatalogState) (kind : OidKind) (objid : Nat) : Bool :=
  let c := cascadeClosure s kind objid
  (dependentsStep s c).length == c.length

/-- The closure minus the root — what `RESTRICT` would have refused over, and
    what a hazard classifier reports as collateral. -/
def cascadeCollateral (s : CatalogState) (kind : OidKind) (objid : Nat)
    : List (OidKind × Nat) :=
  (s.cascadeClosure kind objid).filter (fun p => !(p.1 == kind && p.2 == objid))

end CatalogState

end Pg.Catalog
