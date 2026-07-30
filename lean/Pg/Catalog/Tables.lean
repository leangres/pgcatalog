/-
Pg.Catalog.Tables — pg_catalog 5-table kernel.

Models the five system-catalog tables that anchor ~90% of catalog
reasoning:

  pg_namespace  — schemas
  pg_class      — relations (tables, indexes, views, sequences, ...)
  pg_type       — types
  pg_proc       — functions / procedures
  pg_attribute  — columns (keyed by attrelid + attnum, no oid)

Coverage is the minimum field set needed for catalog-grounded
identifier migration (Catalog.Ref) plus the SECURITY DEFINER /
search_path / relkind discriminators required to make the auth-bug
classes provable. Field additions land here as Postgres surface
coverage grows.

Discriminators (relkind, typtype, provolatile, prokind) are encoded
as Lean inductives rather than `Char`, so case analysis on a relation
exhausts the legal alternatives. The on-disk Postgres encoding (a
single char) is recovered via `*.toChar`.

Moved from Aion's `lean/Aion/Db/Catalog/Tables.lean` as part of
PgAst extraction Phase 1b.
-/

import Pg.Catalog.Oid

namespace Pg.Catalog

/-- `pg_class.relkind` — what kind of relation this row describes.
    The chars are the on-disk Postgres encoding (`pg_class.relkind`
    is a single `char`). -/
inductive RelKind where
  | ordinaryTable    : RelKind  -- 'r' — regular table
  | index            : RelKind  -- 'i'
  | sequence         : RelKind  -- 'S'
  | toastTable       : RelKind  -- 't'
  | view             : RelKind  -- 'v'
  | materializedView : RelKind  -- 'm'
  | compositeType    : RelKind  -- 'c'
  | foreignTable     : RelKind  -- 'f'
  | partitionedTable : RelKind  -- 'p'
  | partitionedIndex : RelKind  -- 'I'
deriving DecidableEq, Repr

/-- Map back to the Postgres on-disk char encoding. -/
def RelKind.toChar : RelKind → Char
  | .ordinaryTable    => 'r'
  | .index            => 'i'
  | .sequence         => 'S'
  | .toastTable       => 't'
  | .view             => 'v'
  | .materializedView => 'm'
  | .compositeType    => 'c'
  | .foreignTable     => 'f'
  | .partitionedTable => 'p'
  | .partitionedIndex => 'I'

/-- `pg_type.typtype` — how the type is constructed. -/
inductive TypType where
  | base       : TypType  -- 'b'
  | composite  : TypType  -- 'c'  — composite types correspond to a pg_class row
  | domain     : TypType  -- 'd'
  | enum       : TypType  -- 'e'
  | pseudo     : TypType  -- 'p'
  | range      : TypType  -- 'r'
  | multirange : TypType  -- 'm'
deriving DecidableEq, Repr

def TypType.toChar : TypType → Char
  | .base       => 'b'
  | .composite  => 'c'
  | .domain     => 'd'
  | .enum       => 'e'
  | .pseudo     => 'p'
  | .range      => 'r'
  | .multirange => 'm'

/-- `pg_proc.provolatile` — function volatility classification. -/
inductive ProVolatile where
  | immutable : ProVolatile  -- 'i'
  | stable    : ProVolatile  -- 's'
  | volatile  : ProVolatile  -- 'v'
deriving DecidableEq, Repr

def ProVolatile.toChar : ProVolatile → Char
  | .immutable => 'i'
  | .stable    => 's'
  | .volatile  => 'v'

/-- `pg_proc.prokind` — distinguishes functions from aggregates,
    window functions, and procedures. -/
inductive ProKind where
  | function  : ProKind  -- 'f'
  | aggregate : ProKind  -- 'a'
  | window    : ProKind  -- 'w'
  | procedure : ProKind  -- 'p'
deriving DecidableEq, Repr

def ProKind.toChar : ProKind → Char
  | .function  => 'f'
  | .aggregate => 'a'
  | .window    => 'w'
  | .procedure => 'p'

/-- A row of `pg_namespace`. -/
structure PgNamespace where
  oid       : Oid .namespace
  nspname   : String
  nspowner  : Oid .role := Oid.invalid .role
deriving Repr

/-- A row of `pg_class`. `relnamespace` references the owning schema;
    `reltype` references this relation's row type (every relation
    has an implicit composite type in `pg_type`). `relowner`
    references `pg_authid.oid` (a role oid, not a relation oid —
    the phantom keeps them distinct). -/
structure PgClass where
  oid           : Oid .relation
  relname       : String
  relnamespace  : Oid .namespace
  relkind       : RelKind
  relowner      : Oid .role := Oid.invalid .role
  reltype       : Oid .type
deriving Repr

/-- A row of `pg_type`. For composite types, `typrelid` points back
    to the pg_class row whose `reltype` equals this type's oid; for
    non-composite types, `typrelid` is `Oid.invalid .relation`.

    `typbasetype` is the underlying type for DOMAIN rows
    (`typtype = .domain`) — the type the domain wraps. For all
    other rows it is `Oid.invalid .type`.

    `typelem` is the element type for ARRAY rows — postgres
    encodes arrays as `typtype = .base` plus
    `typcategory = 'A'` plus a non-invalid `typelem`. For all
    non-array rows it is `Oid.invalid .type`. (`typcategory`
    itself is not yet modelled; downstream code uses
    `typelem != Oid.invalid .type` as the array discriminator
    until `typcategory` lands.)

    Both fields default to `Oid.invalid .type` so existing
    `PgType` literal sites compile unchanged; consumers wanting
    the new precision populate them explicitly. -/
structure PgType where
  oid           : Oid .type
  typname       : String
  typnamespace  : Oid .namespace
  typtype       : TypType
  typrelid      : Oid .relation := Oid.invalid .relation
  typbasetype   : Oid .type     := Oid.invalid .type
  typelem       : Oid .type     := Oid.invalid .type
deriving Repr

/-- `pg_proc.proargmodes` — argument direction / role per
    declared parameter.

    Postgres encodes these as single chars in the catalog
    column; we mirror the enum at the Lean level for case
    safety. When `proargmodes` is empty (the bootstrap default)
    every argument is treated as `.in`. -/
inductive ArgMode where
  | in_       : ArgMode  -- 'i' — input (default)
  | out       : ArgMode  -- 'o' — output only (composite return)
  | inout     : ArgMode  -- 'b' — both input AND output
  | variadic  : ArgMode  -- 'v' — variadic (array-of-…)
  | tableOut  : ArgMode  -- 't' — RETURNS TABLE(...) column
deriving DecidableEq, Repr

def ArgMode.toChar : ArgMode → Char
  | .in_      => 'i'
  | .out      => 'o'
  | .inout    => 'b'
  | .variadic => 'v'
  | .tableOut => 't'

/-- A row of `pg_proc`. `prosecdef = true` iff the function was
    declared `SECURITY DEFINER` (runs with the privileges of the
    defining role rather than the invoking role) — the centerpiece
    of one of the auth-bug classes catalog grounding aims to make
    provable.

    `proargnames` is the per-argument source name (`pg_proc.proargnames`).
    Defaults to `[]` for catalogs that don't carry them; consumers
    that need named args populate the field, otherwise they fall
    back to positional `arg0`/`arg1`/… naming.

    `proretset = true` for set-returning functions (`SETOF X`,
    `RETURNS TABLE(...)`). Mirrors the postgres column directly.

    `proargmodes` lines up positionally with `proargtypes` /
    `proargnames`. Empty means "all IN" (the postgres-default
    encoding). For `RETURNS TABLE(...)` the table columns appear
    as trailing `.tableOut` entries. -/
structure PgProc where
  oid           : Oid .proc
  proname       : String
  pronamespace  : Oid .namespace
  prokind       : ProKind
  prosecdef     : Bool
  provolatile   : ProVolatile
  prorettype    : Oid .type
  proargtypes   : List (Oid .type) := []
  proowner      : Oid .role := Oid.invalid .role
  proargnames   : List String  := []
  proretset     : Bool         := false
  proargmodes   : List ArgMode := []
deriving Repr

/-- A row of `pg_attribute`. Attributes have no oid of their own;
    they are keyed by `(attrelid, attnum)`. `attnum` is positive
    for user-defined columns and negative for system columns
    (`ctid`, `xmin`, etc.). -/
structure PgAttribute where
  attrelid   : Oid .relation
  attname    : String
  atttypid   : Oid .type
  attnum     : Int
  attnotnull : Bool
deriving Repr

/-- A row of `pg_authid`. Login roles, group roles, and the
    predefined system roles (`pg_read_all_data`, etc.) all live
    here. The `rolsuper` flag is the headline bit for security
    reasoning — combined with `prosecdef` on `pg_proc`, this is
    where the "who actually ran this function with what privileges"
    answer lives. -/
structure PgAuthid where
  oid            : Oid .role
  rolname        : String
  rolsuper       : Bool
  rolinherit     : Bool := true
  rolcreaterole  : Bool := false
  rolcreatedb    : Bool := false
  rolcanlogin    : Bool := false
  rolreplication : Bool := false
  rolbypassrls   : Bool := false
deriving Repr

/-! ## Constraints, indexes and dependencies

    These four tables are what a *migration* needs and a static schema model
    does not. Without them there is no `DROP … RESTRICT` (nothing to compute a
    dependent set from), no `NOT VALID` / `VALIDATE` (that state lives in
    `convalidated`), and no foreign-key invariant to preserve across a change.

    ⚠ **Expressions are stored rendered, not as trees.** `conbin` and `indpred`
    are `Option String` rather than a typed expression, because this module is
    deliberately dep-free and the expression type lives in `pgast`, which
    depends on *this* module — typing them properly would be a cycle.

    That is a real limitation, not a shortcut to tidy up later in place: a
    reference walker that asks "does anything still mention this column?" cannot
    work off a rendered string. When that is needed it belongs in `pgmigrate`,
    which can see both this model and the AST. Postgres itself keeps both forms
    (`conbin` as a node tree, historically `consrc` as text), so the split is
    not unnatural. -/

/-- What a `pg_constraint` row constrains. -/
inductive ConType where
  | check      : ConType
  | foreignKey : ConType
  | primaryKey : ConType
  | unique     : ConType
  | exclusion  : ConType
deriving DecidableEq, Repr

/-- A row of `pg_constraint`.

    `convalidated` is the field that makes online migrations expressible. A
    constraint added `NOT VALID` is enforced on new and updated rows immediately
    but has never been checked against existing ones; `VALIDATE CONSTRAINT`
    scans and flips this. `pgast` can emit both, so the catalog has to be able
    to distinguish them — otherwise the model says a table is constrained when
    only its future rows are. -/
structure PgConstraint where
  oid          : Oid .constraint
  conname      : String
  connamespace : Oid .namespace
  contype      : ConType
  /-- False iff added `NOT VALID` and not yet validated. -/
  convalidated : Bool := true
  /-- The constrained relation. -/
  conrelid     : Oid .relation
  /-- The index backing a PK/UNIQUE/EXCLUDE constraint, if any. -/
  conindid     : Option (Oid .relation) := none
  /-- The referenced relation, for a foreign key. -/
  confrelid    : Option (Oid .relation) := none
  /-- Constrained column numbers, as `pg_attribute.attnum`. -/
  conkey       : List Int := []
  /-- Referenced column numbers, for a foreign key. -/
  confkey      : List Int := []
  /-- The CHECK expression, RENDERED. See the note above on why this is not a
      tree. -/
  conbin       : Option String := none
deriving DecidableEq, Repr

/-- A row of `pg_index`.

    An index is also a `pg_class` row, so both identifiers here are relation
    OIDs — `indexrelid` is the index itself, `indrelid` the table it covers. -/
structure PgIndex where
  indexrelid : Oid .relation
  indrelid   : Oid .relation
  indisunique  : Bool := false
  indisprimary : Bool := false
  /-- False while a `CREATE INDEX CONCURRENTLY` is still building, or after one
      has failed — a state that looks like a usable index in `pg_class` alone
      and is not. -/
  indisvalid   : Bool := true
  /-- Indexed column numbers; `0` marks an expression element. -/
  indkey     : List Int := []
  /-- Partial-index predicate, RENDERED. -/
  indpred    : Option String := none
deriving DecidableEq, Repr

/-- Why one catalog object depends on another. Matches `pg_depend.deptype`.

    The distinction that matters for `DROP`: `normal` dependents block a
    `RESTRICT` and are removed by a `CASCADE`, whereas `auto` and `internal`
    ones are implementation detail that goes with the parent either way. -/
inductive DepType where
  | normal    : DepType
  | auto      : DepType
  | internal  : DepType
  | extension : DepType
  | pin       : DepType
deriving DecidableEq, Repr

/-- A row of `pg_depend`. Deliberately untyped in its object references: a
    dependency edge can point at any catalog kind, so the phantom-typed `Oid k`
    cannot express both ends. `classid` names which catalog the `objid` is in. -/
structure PgDepend where
  classid      : OidKind
  objid        : Nat
  /-- Column number when the dependency is on one column rather than the whole
      relation; `0` means the object itself. -/
  objsubid     : Int := 0
  refclassid   : OidKind
  refobjid     : Nat
  refobjsubid  : Int := 0
  deptype      : DepType
deriving DecidableEq, Repr

/-- A row of `pg_attrdef` — a column default, RENDERED. Separate from
    `pg_attribute` exactly as in Postgres. -/
structure PgAttrdef where
  adrelid : Oid .relation
  adnum   : Int
  adbin   : String
deriving DecidableEq, Repr

end Pg.Catalog
