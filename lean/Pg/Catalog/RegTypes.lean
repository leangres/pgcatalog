/-
Pg.Catalog.RegTypes — the `reg*` smart types.

SQL exposes "smart" oid types — `regclass`, `regtype`, `regprocedure`,
`regnamespace`, `regrole` — that accept either an integer oid or a
(search_path-resolved) name in cast expressions, e.g.
`'auth.secrets'::regclass`. At the column level they are stored as
plain `oid`, but the cast goes through the catalog and performs the
same kind of lookup our model formalizes.

We model each `reg*` family as an abbreviation over the kind-indexed
`Oid` from `Pg.Catalog.Oid`. Choosing abbreviations rather than
fresh structs lets these refs interoperate transparently with the
underlying `Oid k` while keeping the rendered intent visible at
call sites (`RegClass` reads better than `Oid .relation`).

`QualifiedName` is the un-resolved (catalog-snapshot-independent)
form — what literally appears in SQL source. Resolution to an
`Oid` requires a `Snapshot` and a `SearchPath`, which is the job
of `Pg.Catalog.Resolution`.

Moved from Aion's `lean/Aion/Db/Catalog/RegTypes.lean` as part of
PgAst extraction Phase 1b.
-/

import Pg.Catalog.Tables

namespace Pg.Catalog

/-- `regclass` — a relation oid. -/
abbrev RegClass     := Oid .relation
/-- `regtype` — a type oid. -/
abbrev RegType      := Oid .type
/-- `regprocedure` (a.k.a. `regproc`) — a function/procedure oid. -/
abbrev RegProcedure := Oid .proc
/-- `regnamespace` — a schema oid. -/
abbrev RegNamespace := Oid .namespace
/-- `regrole` — a role oid (`pg_authid.oid`). -/
abbrev RegRole      := Oid .role

/-- A name as it appears in SQL source — possibly schema-qualified
    or possibly leaving schema resolution to `search_path`. This is
    the *unresolved* form; mapping to an `Oid` requires a catalog
    snapshot. -/
structure QualifiedName where
  schema : Option String
  name   : String
deriving DecidableEq, Repr

namespace QualifiedName

/-- An unqualified name (schema resolution deferred to search_path). -/
def unqualified (n : String) : QualifiedName := { schema := none, name := n }

/-- A schema-qualified name. -/
def qualified (s n : String) : QualifiedName := { schema := some s, name := n }

/-- Render with double-quoted identifiers (Postgres's safe form for
    arbitrary identifiers including reserved words and mixed case).
    This is `format_type`-style rendering, not the bare `name`
    form. -/
def render (q : QualifiedName) : String :=
  match q.schema with
  | some s => "\"" ++ s ++ "\".\"" ++ q.name ++ "\""
  | none   => "\"" ++ q.name ++ "\""

/-- Render as the bare (unquoted) `schema.name` or `name` form that
    the existing PgAst SQL emit chain uses for identifiers in
    `CREATE FUNCTION` / `CREATE TABLE` / etc. positions.

    PG treats unquoted identifiers as case-insensitive (downcasing
    them); our schema only uses lowercase snake_case so the
    unquoted form matches the original case exactly. Reserved
    words or mixed-case identifiers would need `render` (the
    double-quoted form) instead. -/
def renderBare (q : QualifiedName) : String :=
  match q.schema with
  | some s => s ++ "." ++ q.name
  | none   => q.name

end QualifiedName

end Pg.Catalog
