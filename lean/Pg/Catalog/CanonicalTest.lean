/-
Pins for OID-independent identity.

The headline one is `oid_independence`: two states holding the SAME logical
schema at COMPLETELY DIFFERENT OIDs must canonicalize identically. That is the
property the differential gate rests on, and it is the reason `ObjKey` exists —
`step` allocates from 16384 while a real Postgres allocates from a cluster-wide
counter with gaps, so the two agree on no OID whatsoever.

The rest pin the decisions that are easy to get wrong in a way that fails OPEN:
an unresolvable OID must survive as a value, overloads must not collapse, and an
index must key on its own name rather than its table's.
-/

import Pg.Catalog.Canonical

namespace Pg.Catalog.CanonicalTest

open Pg.Catalog

/-! ## The headline: identity does not depend on OIDs

    Same schema, disjoint OID ranges — `modelSide` allocates the way `step`
    does (from 16384), `pgSide` the way a real cluster might after unrelated
    activity. Nothing is shared but the names. -/

private def mkState (nsOid relOid typOid : Nat) : CatalogState :=
  { CatalogState.empty with
    snap := { CatalogState.empty.snap with
      namespaces := CatalogState.empty.snap.namespaces ++
        [{ oid := ⟨nsOid⟩, nspname := "graph" }]
      relations := [
        { oid := ⟨relOid⟩, relname := "resource", relnamespace := ⟨nsOid⟩
        , relkind := .ordinaryTable, reltype := ⟨typOid⟩ }]
      attributes := [
        { attrelid := ⟨relOid⟩, attname := "id", atttypid := ⟨20⟩, attnum := 1
        , attnotnull := true }] } }

private def modelSide : CatalogState := mkState 16384 16385 16386
private def pgSide    : CatalogState := mkState 41007 88213 88214

example : modelSide.canonicalize = pgSide.canonicalize := by native_decide

/-- And they share no OID at all, so the agreement above is not accidental. -/
example :
    (modelSide.snap.relations.map (fun r => r.oid.raw))
      ≠ (pgSide.snap.relations.map (fun r => r.oid.raw)) := by native_decide

/-- Spelled out, so a reader can see what the comparison surface actually is. -/
example : modelSide.canonicalize =
    [ .namespace_ "pg_catalog"
    , .namespace_ "public"
    , .namespace_ "graph"
    , .relation "graph" "resource"
    , .attribute "graph" "resource" "id" ] := by native_decide

/-! ## An unresolvable OID survives as a value

    If canonicalization returned `Option` and a gate filtered the misses, an OID
    dangling on BOTH sides would vanish from both and the sides would agree by
    omission. This is the arm that makes that impossible. -/

private def dangling : CatalogState :=
  { CatalogState.empty with
    constraints := [
      { oid := ⟨16500⟩, conname := "fk_missing", connamespace := ⟨2200⟩
      , contype := .foreignKey, conrelid := ⟨99999⟩ }] }

example : dangling.canonConstraint
    { oid := ⟨16500⟩, conname := "fk_missing", connamespace := ⟨2200⟩
    , contype := .foreignKey, conrelid := ⟨99999⟩ }
    = .unresolved "constraint" 16500 := by native_decide

/-- And it is reachable as a finding, not buried in the key list. -/
example : dangling.unresolvedKeys.length = 1 := by native_decide

/-- A clean state reports none — so the check above discriminates. -/
example : modelSide.unresolvedKeys = [] := by native_decide

/-! ## Overloads do not collapse

    Functions are overloadable, so argument types are part of the identity.
    Dropping them would make a migration that changes a signature look like a
    no-op. -/

private def twoOverloads : CatalogState :=
  { CatalogState.empty with
    snap := { CatalogState.empty.snap with
      types := [
        { oid := ⟨20⟩, typname := "int8", typnamespace := ⟨11⟩, typtype := .base }
      , { oid := ⟨25⟩, typname := "text", typnamespace := ⟨11⟩, typtype := .base }]
      procs := [
        { oid := ⟨16600⟩, proname := "f", pronamespace := ⟨2200⟩, prokind := .function
        , prosecdef := false, provolatile := .stable, prorettype := ⟨20⟩
        , proargtypes := [⟨20⟩] }
      , { oid := ⟨16601⟩, proname := "f", pronamespace := ⟨2200⟩, prokind := .function
        , prosecdef := false, provolatile := .stable, prorettype := ⟨20⟩
        , proargtypes := [⟨25⟩] }] } }

example : (twoOverloads.canonProc ⟨16600⟩) ≠ (twoOverloads.canonProc ⟨16601⟩) := by
  native_decide

example : twoOverloads.canonProc ⟨16600⟩
    = .proc "public" "f" ["pg_catalog.int8"] := by native_decide

/-! ## An index keys on its own name

    Keying an index by the table it indexes would collapse every index on that
    table onto one key, and a dropped index would read as clean. -/

private def twoIndexes : CatalogState :=
  { CatalogState.empty with
    snap := { CatalogState.empty.snap with
      namespaces := CatalogState.empty.snap.namespaces ++
        [{ oid := ⟨16384⟩, nspname := "graph" }]
      relations := [
        { oid := ⟨16385⟩, relname := "resource", relnamespace := ⟨16384⟩
        , relkind := .ordinaryTable, reltype := ⟨16386⟩ }
      , { oid := ⟨16390⟩, relname := "resource_pkey", relnamespace := ⟨16384⟩
        , relkind := .index, reltype := ⟨0⟩ }
      , { oid := ⟨16391⟩, relname := "resource_kind_idx", relnamespace := ⟨16384⟩
        , relkind := .index, reltype := ⟨0⟩ }] }
    indexes := [
      { indexrelid := ⟨16390⟩, indrelid := ⟨16385⟩, indisunique := true
      , indisprimary := true, indkey := [1] }
    , { indexrelid := ⟨16391⟩, indrelid := ⟨16385⟩, indkey := [2] }] }

example : (twoIndexes.indexes.map (twoIndexes.canonIndex))
    = [ .index "graph" "resource_pkey"
      , .index "graph" "resource_kind_idx" ] := by native_decide

end Pg.Catalog.CanonicalTest
