/-
Pg.Catalog.SnapshotEmit — emit a `Snapshot` back to Lean source.

Mirror of `pgpb_to_snapshot.c::emit_lean`'s output format. Used by
the lean_emit-based replacement for `pg_sql_catalog_library`: the
typed decoder produces a `TopParseResult`, `Pg.Catalog.Fold` folds
it into a `Snapshot`, and this module prints the result as Lean
source that downstream consumers (`catalogFromSnapshotWithEnums`,
Aion's V0 codegen pipeline) import unchanged.

The emit format matches `pgpb_to_snapshot.c` field-for-field:

  * Optional `PgType.typrelid` / `typbasetype` / `typelem` are
    omitted when zero (default).
  * `PgProc.proargmodes` omitted when empty.
  * `PgProc.proretset` omitted when false.
  * List fields use `[ first , item2 , item3 ]` block form;
    empty lists are `[]`.
  * `roles := []` is always emitted (snapshot has no role tracking).
-/
import Pg.Catalog.Snapshot

namespace Pg.Catalog

/-! ### Per-field formatters -/

private def emitOid (oid : Nat) : String := "⟨" ++ toString oid ++ "⟩"

/-- Escape a string for a Lean string literal: `\\` and `"`. -/
private def escapeString (s : String) : String :=
  s.foldl
    (fun acc c =>
      if c == '\\' || c == '"' then acc.push '\\' |>.push c
      else acc.push c)
    ""

private def emitStringLit (s : String) : String :=
  "\"" ++ escapeString s ++ "\""

private def emitTypType : TypType → String
  | .base       => ".base"
  | .composite  => ".composite"
  | .domain     => ".domain"
  | .enum       => ".enum"
  | .pseudo     => ".pseudo"
  | .range      => ".range"
  | .multirange => ".multirange"

private def emitRelKind : RelKind → String
  | .ordinaryTable    => ".ordinaryTable"
  | .index            => ".index"
  | .sequence         => ".sequence"
  | .toastTable       => ".toastTable"
  | .view             => ".view"
  | .materializedView => ".materializedView"
  | .compositeType    => ".compositeType"
  | .foreignTable     => ".foreignTable"
  | .partitionedTable => ".partitionedTable"
  | .partitionedIndex => ".partitionedIndex"

private def emitProKind : ProKind → String
  | .function  => ".function"
  | .procedure => ".procedure"
  | .aggregate => ".aggregate"
  | .window    => ".window"

private def emitProVolatile : ProVolatile → String
  | .immutable => ".immutable"
  | .stable    => ".stable"
  | .volatile  => ".volatile"

private def emitArgMode : ArgMode → String
  | .in_      => ".in_"
  | .out      => ".out"
  | .inout    => ".inout"
  | .variadic => ".variadic"
  | .tableOut => ".tableOut"

private def emitBool (b : Bool) : String := if b then "true" else "false"

/-! ### Per-row formatters -/

private def emitNamespaceRow (n : PgNamespace) : String :=
  "{ oid := " ++ emitOid n.oid.raw
    ++ ", nspname := " ++ emitStringLit n.nspname ++ " }"

private def emitTypeRow (t : PgType) : String := Id.run do
  let mut s := "{ oid := " ++ emitOid t.oid.raw
    ++ ", typname := " ++ emitStringLit t.typname
    ++ ", typnamespace := " ++ emitOid t.typnamespace.raw
    ++ ", typtype := " ++ emitTypType t.typtype
  if t.typrelid.raw ≠ 0 then
    s := s ++ ", typrelid := " ++ emitOid t.typrelid.raw
  if t.typbasetype.raw ≠ 0 then
    s := s ++ ", typbasetype := " ++ emitOid t.typbasetype.raw
  if t.typelem.raw ≠ 0 then
    s := s ++ ", typelem := " ++ emitOid t.typelem.raw
  return s ++ " }"

private def emitRelationRow (r : PgClass) : String :=
  "{ oid := " ++ emitOid r.oid.raw
    ++ ", relname := " ++ emitStringLit r.relname
    ++ ", relnamespace := " ++ emitOid r.relnamespace.raw
    ++ ", relkind := " ++ emitRelKind r.relkind
    ++ ", reltype := " ++ emitOid r.reltype.raw ++ " }"

private def emitAttributeRow (a : PgAttribute) : String :=
  "{ attrelid := " ++ emitOid a.attrelid.raw
    ++ ", attname := " ++ emitStringLit a.attname
    ++ ", atttypid := " ++ emitOid a.atttypid.raw
    ++ ", attnum := " ++ toString a.attnum
    ++ ", attnotnull := " ++ emitBool a.attnotnull ++ " }"

private def emitProcRow (p : PgProc) : String := Id.run do
  let argtypes := String.intercalate ", " (p.proargtypes.map (fun o => emitOid o.raw))
  let argnames := String.intercalate ", " (p.proargnames.map emitStringLit)
  let mut s := "{ oid := " ++ emitOid p.oid.raw
    ++ ", proname := " ++ emitStringLit p.proname
    ++ ", pronamespace := " ++ emitOid p.pronamespace.raw
    ++ ", prokind := " ++ emitProKind p.prokind
    ++ ", prosecdef := " ++ emitBool p.prosecdef
    ++ ", provolatile := " ++ emitProVolatile p.provolatile
    ++ ", prorettype := " ++ emitOid p.prorettype.raw
    ++ ", proargtypes := [" ++ argtypes ++ "]"
    ++ ", proargnames := [" ++ argnames ++ "]"
  if !p.proargmodes.isEmpty then
    let modes := String.intercalate ", " (p.proargmodes.map emitArgMode)
    s := s ++ ", proargmodes := [" ++ modes ++ "]"
  if p.proretset then
    s := s ++ ", proretset := true"
  return s ++ " }"

/-! ### List formatter — matches the C tool's
    `[ first \n , item2 \n ... \n ]` block form, or `[]` for empty. -/

private def emitListBlock (indent : String) (rows : List String) : String :=
  match rows with
  | []          => "[]"
  | first :: rest =>
    let head := indent ++ "[ " ++ first ++ "\n"
    let body := rest.foldl
      (fun acc row => acc ++ indent ++ ", " ++ row ++ "\n")
      ""
    head ++ body ++ indent ++ "]"

/-! ### Top-level entry -/

/-- Emit a full Lean module containing `def enumLabels` + `def snapshot`,
    matching `pgpb_to_snapshot.c::emit_lean`. -/
def Snapshot.toLeanSource (snap : Snapshot)
    (enums : List (Oid .type × List String))
    (moduleName : String) : String := Id.run do
  let mut out := ""
  out := out ++ "/- Auto-generated by @rules_postgres//lean:Pg/Catalog/Fold.\n"
  out := out ++ "   DO NOT EDIT BY HAND — regenerate from migration .sql files. -/\n\n"
  out := out ++ "import Pg.Catalog.Snapshot\nimport Pg.Catalog.Tables\n\n"
  out := out ++ "namespace " ++ moduleName ++ "\n\n"
  out := out ++ "open Pg.Catalog\n\n"

  -- enumLabels sibling table
  out := out ++ "/-- Enum labels by type OID, paired with the snapshot for use\n"
  out := out ++ "    with `catalogFromSnapshotWithEnums`. -/\n"
  out := out ++ "def enumLabels : List (Oid .type × List String) :=\n  [\n"
  for (oid, labels) in enums do
    let labelStr := String.intercalate ", " (labels.map emitStringLit)
    out := out ++ "    (" ++ emitOid oid.raw ++ ", [" ++ labelStr ++ "]),\n"
  out := out ++ "  ]\n\n"

  -- snapshot record
  out := out ++ "def snapshot : Snapshot where\n"
  out := out ++ "  namespaces :=\n"
    ++ emitListBlock "    " (snap.namespaces.map emitNamespaceRow) ++ "\n"
  out := out ++ "  types :=\n"
    ++ emitListBlock "    " (snap.types.map emitTypeRow) ++ "\n"
  out := out ++ "  relations :=\n"
    ++ emitListBlock "    " (snap.relations.map emitRelationRow) ++ "\n"
  out := out ++ "  attributes :=\n"
    ++ emitListBlock "    " (snap.attributes.map emitAttributeRow) ++ "\n"
  out := out ++ "  procs :=\n"
    ++ emitListBlock "    " (snap.procs.map emitProcRow) ++ "\n"
  out := out ++ "  roles := []\n\n"

  out := out ++ "end " ++ moduleName ++ "\n"
  return out

end Pg.Catalog
