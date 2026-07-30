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

/-- Can this object be dropped with `RESTRICT`? -/
def droppableRestrict (s : CatalogState) (kind : OidKind) (objid : Nat) : Bool :=
  (s.dependentsOf kind objid).isEmpty

end CatalogState

end Pg.Catalog
