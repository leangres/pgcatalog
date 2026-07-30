/-
Pins for the catalog-state lookups a migration transition needs.

These are the questions a `Snapshot` alone cannot answer, and each is a real
precondition rather than a convenience:

  * is this constraint actually validated, or only enforced on future rows?
  * does a UNIQUE index cover exactly these columns — i.e. may an FK reference
    them at all?
  * does anything still NORMALLY depend on this object, i.e. does `RESTRICT`
    refuse the DROP?

Discharged by computation over concrete data, which is the whole proof style
here: no mathlib, no tactics beyond `native_decide`.
-/

import Pg.Catalog.State

namespace Pg.Catalog.StateTest

open Pg.Catalog

/-! ## Seeding matches Fold, so the two agree from the start. -/

example : CatalogState.empty.nextOid = 16384 := by native_decide

example : (CatalogState.empty.snap.namespaces.map (fun n => n.nspname))
    = ["pg_catalog", "public"] := by native_decide

/-! ## NOT VALID is distinguishable from validated

    Without `convalidated` the model would say a table is constrained when in
    fact only its future rows are — the exact state `ADD CONSTRAINT ... NOT
    VALID` leaves behind, and one `pgast` can now emit. -/

private def resourceRel : Oid .relation := ⟨16400⟩

private def notYetValidated : CatalogState :=
  { CatalogState.empty with
    constraints := [
      { oid := ⟨16500⟩, conname := "kind_nn", connamespace := ⟨2200⟩
      , contype := .check, convalidated := false, conrelid := resourceRel } ] }

example : ((notYetValidated.findConstraint resourceRel "kind_nn").map
    (fun c => c.convalidated)) = some false := by native_decide

/-- After VALIDATE, the same constraint reads validated. Modelled as the state
    the transition would produce — written out rather than computed inline,
    because a nested record update inside the example defeats inference. -/
private def afterValidate : CatalogState :=
  { CatalogState.empty with
    constraints := [
      { oid := ⟨16500⟩, conname := "kind_nn", connamespace := ⟨2200⟩
      , contype := .check, convalidated := true, conrelid := resourceRel } ] }

example : ((afterValidate.findConstraint resourceRel "kind_nn").map
    (fun c => c.convalidated)) = some true := by native_decide

/-- A constraint name is unique per RELATION, not per schema — so a lookup has
    to be scoped by relation, and this misses. -/
example : (notYetValidated.findConstraint ⟨16401⟩ "kind_nn").isNone = true := by
  native_decide

/-! ## FK targets must be uniquely indexed

    Postgres refuses a foreign key whose referenced columns are not covered by a
    UNIQUE or PRIMARY KEY index — otherwise the reference does not identify one
    row. `Pg.Schema.consistentB` checks column existence and types but not this. -/

private def withPk : CatalogState :=
  { CatalogState.empty with
    indexes := [
      { indexrelid := ⟨16600⟩, indrelid := resourceRel
      , indisunique := true, indisprimary := true, indkey := [1] } ] }

example : withPk.hasUniqueIndexOn resourceRel [1] = true := by native_decide

/-- Column ORDER matters: Postgres matches the index's column list, not a set. -/
example : withPk.hasUniqueIndexOn resourceRel [1, 2] = false := by native_decide

/-- An index still building (or one whose CONCURRENTLY build failed) is not a
    valid target. It looks like a usable index in `pg_class` alone, which is
    exactly why `indisvalid` is modelled. -/
private def withInvalidPk : CatalogState :=
  { CatalogState.empty with
    indexes := [
      { indexrelid := ⟨16600⟩, indrelid := resourceRel
      , indisunique := true, indisvalid := false, indkey := [1] } ] }

example : withInvalidPk.hasUniqueIndexOn resourceRel [1] = false := by native_decide

/-! ## DROP … RESTRICT

    Only `normal` dependencies block. An `auto`/`internal` edge — the index
    Postgres itself created to back a PRIMARY KEY, say — goes with the parent
    either way, and refusing a DROP because of one would be wrong. -/

private def withNormalDep : CatalogState :=
  { CatalogState.empty with
    depends := [
      { classid := .relation, objid := 16700
      , refclassid := .relation, refobjid := 16400, deptype := .normal } ] }

private def withAutoDep : CatalogState :=
  { CatalogState.empty with
    depends := [
      { classid := .relation, objid := 16700
      , refclassid := .relation, refobjid := 16400, deptype := .auto } ] }

example : withNormalDep.droppableRestrict .relation 16400 = false := by native_decide

example : withAutoDep.droppableRestrict .relation 16400 = true := by native_decide

/-- Nothing depends on an unrelated object. -/
example : withNormalDep.droppableRestrict .relation 99999 = true := by native_decide

end Pg.Catalog.StateTest
