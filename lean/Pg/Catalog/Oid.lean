/-
Pg.Catalog.Oid — kind-indexed object identifiers.

Postgres uses 32-bit unsigned integers ("oids") as primary keys
across nearly every system-catalog table, but the type system is
uniform: at the SQL surface every `regclass`, `regtype`,
`regprocedure` column is just `oid`. That uniformity is where the
search_path-collision / SECURITY DEFINER-misrouting /
RLS-policy-oid-confusion bug classes live — the bugs are invisible
at the text level but show up at runtime.

This module gives oids a phantom kind index so that
`Oid .relation` and `Oid .proc` are distinct Lean types. Once
PgAst identifier fields migrate to `Catalog.Ref`, an admin function
that "accidentally" references a proc oid where a relation oid is
expected becomes a Lean type error rather than a runtime SQL error.

Moved from Aion's `lean/Aion/Db/Catalog/Oid.lean` as part of
PgAst extraction Phase 1b.
-/

namespace Pg.Catalog

/-- Catalog discriminator. One constructor per system-catalog table
    whose rows carry their own oid. (Note that `pg_attribute` rows
    do NOT have their own oid — they are keyed by `(attrelid, attnum)`
    — so `attribute` is intentionally absent here.) -/
inductive OidKind where
  | namespace : OidKind   -- pg_namespace.oid  (schemas)
  | relation  : OidKind   -- pg_class.oid      (tables, indexes, views, sequences, …)
  | type      : OidKind   -- pg_type.oid
  | proc      : OidKind   -- pg_proc.oid       (functions, procedures, aggregates)
  | role      : OidKind   -- pg_authid.oid     (login roles + group roles)
deriving DecidableEq, Repr

/-- Kind-indexed object identifier. The phantom `k : OidKind`
    keeps `Oid .relation` and `Oid .proc` distinct in Lean even
    though both serialize to a 32-bit unsigned integer at the
    Postgres level. -/
structure Oid (k : OidKind) where
  raw : Nat
deriving DecidableEq, BEq, Repr

namespace Oid

/-- Project the underlying integer (Postgres's `oid`). -/
@[inline] def toRaw {k : OidKind} (o : Oid k) : Nat := o.raw

/-- The reserved zero oid. Postgres uses 0 as InvalidOid; we model
    it the same way and downstream code treats `⟨0⟩` as a sentinel
    rather than a real reference. -/
def invalid (k : OidKind) : Oid k := ⟨0⟩

@[simp] theorem toRaw_mk {k : OidKind} (n : Nat) : (Oid.mk (k := k) n).toRaw = n := rfl

@[simp] theorem mk_toRaw {k : OidKind} (o : Oid k) : Oid.mk (k := k) o.toRaw = o := by
  cases o; rfl

end Oid

end Pg.Catalog
