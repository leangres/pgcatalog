/-
Pg.Catalog.SnapshotEmitTest — smoke check for the printer.

Hand-builds a tiny `Snapshot` value (1 user namespace, 2 user
types — one domain + one composite — + 2 referenced builtins +
1 relation + 2 attributes + 1 enum row + 1 proc) and verifies
the printer's output:

  * is non-empty
  * contains the expected top-level `def`s
  * contains a few well-known substrings (OID literals, ctor names)

A full end-to-end byte-equivalence assertion against
`pgpb_to_snapshot.c`'s output lives in `pg_sql_catalog_library_lean`'s
file-level diff_test once the Aion side wires it up.
-/
import Pg.Catalog.SnapshotEmit

namespace Pg.Catalog.SnapshotEmitTest

open Pg.Catalog

/-- Substring search via structural recursion on the haystack's
    `List Char`. Lean's stdlib has no `String.containsSubstr`;
    this is a tiny replacement. -/
private def listIsPrefixOf : List Char → List Char → Bool
  | [],      _      => true
  | _ :: _,  []     => false
  | x :: xs, y :: ys => x == y && listIsPrefixOf xs ys

private def hasSubstrAux : List Char → List Char → Bool
  | hs, needle =>
    if listIsPrefixOf needle hs then true
    else
      match hs with
      | []      => false
      | _ :: rs => hasSubstrAux rs needle

private def hasSubstr (haystack needle : String) : Bool :=
  hasSubstrAux haystack.toList needle.toList

/-- A small hand-crafted snapshot covering every row kind. -/
def sample : Snapshot := {
  namespaces := [
    { oid := ⟨11⟩,   nspname := "pg_catalog" },
    { oid := ⟨2200⟩, nspname := "public" },
    { oid := ⟨16384⟩, nspname := "smoke" }
  ]
  types := [
    -- referenced builtins (would be added by augmentBuiltins)
    { oid := ⟨23⟩, typname := "int4", typnamespace := ⟨11⟩, typtype := .base },
    { oid := ⟨25⟩, typname := "text", typnamespace := ⟨11⟩, typtype := .base },
    -- user types
    { oid := ⟨16385⟩, typname := "identifier", typnamespace := ⟨16384⟩,
      typtype := .domain, typbasetype := ⟨25⟩ },
    { oid := ⟨16386⟩, typname := "point", typnamespace := ⟨16384⟩,
      typtype := .composite, typrelid := ⟨16387⟩ },
    { oid := ⟨16388⟩, typname := "color", typnamespace := ⟨16384⟩,
      typtype := .enum }
  ]
  relations := [
    { oid := ⟨16387⟩, relname := "point", relnamespace := ⟨16384⟩,
      relkind := .compositeType, reltype := ⟨16386⟩ }
  ]
  attributes := [
    { attrelid := ⟨16387⟩, attname := "x", atttypid := ⟨23⟩,
      attnum := 1, attnotnull := true },
    { attrelid := ⟨16387⟩, attname := "y", atttypid := ⟨23⟩,
      attnum := 2, attnotnull := true }
  ]
  procs := [
    { oid := ⟨16389⟩, proname := "make_point", pronamespace := ⟨16384⟩,
      prokind := .function, prosecdef := false, provolatile := .stable,
      prorettype := ⟨16386⟩, proargtypes := [⟨23⟩, ⟨23⟩],
      proargnames := ["x", "y"] }
  ]
}

def sampleEnums : List (Oid .type × List String) :=
  [(⟨16388⟩, ["red", "green", "blue"])]

def emitted : String :=
  Snapshot.toLeanSource sample sampleEnums "SmokeModule"

/-! ### Sanity asserts — surface that the printer ran. -/

example : 0 < emitted.length := by native_decide

example : hasSubstr emitted "def snapshot : Snapshot where" := by
  native_decide

example : hasSubstr emitted "def enumLabels" := by native_decide

example : hasSubstr emitted "namespace SmokeModule" := by native_decide

example : hasSubstr emitted "end SmokeModule" := by native_decide

/-! ### Per-row format spot-checks -/

-- Builtins emitted as .base.
example : hasSubstr emitted
    "{ oid := ⟨23⟩, typname := \"int4\", typnamespace := ⟨11⟩, typtype := .base }" := by
  native_decide

-- Domain emits typbasetype.
example : hasSubstr emitted "typname := \"identifier\"" := by native_decide
example : hasSubstr emitted "typbasetype := ⟨25⟩" := by native_decide

-- Composite type emits typrelid.
example : hasSubstr emitted "typname := \"point\"" := by native_decide
example : hasSubstr emitted "typrelid := ⟨16387⟩" := by native_decide

-- Relation row.
example : hasSubstr emitted
    "{ oid := ⟨16387⟩, relname := \"point\", relnamespace := ⟨16384⟩, relkind := .compositeType, reltype := ⟨16386⟩ }" := by
  native_decide

-- Attribute row.
example : hasSubstr emitted
    "{ attrelid := ⟨16387⟩, attname := \"x\", atttypid := ⟨23⟩, attnum := 1, attnotnull := true }" := by
  native_decide

-- Proc row.
example : hasSubstr emitted
    "proname := \"make_point\"" := by native_decide
example : hasSubstr emitted
    "proargtypes := [⟨23⟩, ⟨23⟩]" := by native_decide
example : hasSubstr emitted "proargnames := [\"x\", \"y\"]" := by native_decide

-- Enum sibling table.
example : hasSubstr emitted "(⟨16388⟩, [\"red\", \"green\", \"blue\"])" := by
  native_decide

-- Standard scaffolding.
example : hasSubstr emitted "  roles := []" := by native_decide
example : hasSubstr emitted "import Pg.Catalog.Snapshot" := by native_decide
example : hasSubstr emitted "open Pg.Catalog" := by native_decide

end Pg.Catalog.SnapshotEmitTest
