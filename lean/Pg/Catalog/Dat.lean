/-!
# Pg.Catalog.Dat

Lean-native grammar + (eventual) parser/emitter for Postgres' `.dat`
system-catalog seed files (e.g. `pg_namespace.dat`, `pg_type.dat`).

**Status:** type scaffold + path-forward only. The parser/emitter
implementation is staged work — see the README at
`tools/catalog_gen/README.md` for the plan and
`tools/catalog_gen/reference/Catalog.pm` for the upstream grammar
reference (PG's own `.dat` parser; uses Perl `eval` on the input).

## Why grammar-typed in Lean

The user-facing goal is: replace the 631-LOC Python catalog generator
with a Lean-native pipeline that participates in the same Bazel-
native gates as Pg.Ir clusters. Specifically:

  - Lean module owns the `.dat` grammar as inductive types.
  - `lean_emit` runs the round-trip (parse a committed `.dat` →
    re-emit → byte-identical or canonical-form check).
  - `lean_regen_test` (from `@rules_lean//lean:lean.bzl`) gates the
    round-trip output against the committed expected.
  - `Pg/Catalog/Generated.lean` becomes a `lean_emit` whose entry is
    a Lean script that reads the parsed `.dat` and emits the
    catalog snapshot. No external generator, no committed-artifact
    drift gate — the snapshot just gets rebuilt from `.dat`.

This file defines the types only. Each parser / emitter / generator
phase below is staged work; landing them happens against
`tools/catalog_gen/reference/Catalog.pm` as the spec.

## PG's grammar (from `Catalog.pm::ParseData`)

`.dat` files are Perl source code. PG parses them via `eval`:

```perl
eval "$hash_ref = $_";
```

So the "grammar" is a subset of Perl literal syntax:
  - Top-level: `[ ... ]` array of hash references
  - Hash refs: `{ key => 'value', key => 'value' }`
  - Keys: bare identifiers (alphanumeric + underscore)
  - Values: single-quoted strings OR bare token `_null_` (returned
    as the Perl string `_null_`) OR (in some .dat files) array
    refs / sprintf-style escape sequences
  - Whitespace and `#` line comments anywhere

The MVP parser handles only what `pg_namespace.dat` uses (the
simplest of the bunch — 3 rows, no array values, no escapes).
Extensions for `pg_proc.dat` etc. land incrementally as each
`.dat` file is exercised.
-/

namespace Pg.Catalog.Dat

/-- A single `.dat` row field value. -/
inductive Value where
  /-- A single-quoted string. The wrapping quotes are NOT stored. -/
  | str (s : String)
  /-- The bare `_null_` token (PG semantic: the column is NULL in
  the bootstrap insert). -/
  | null
  deriving Repr, BEq, Inhabited

/-- One `key => value` field in a row. The MVP doesn't preserve
inter-token whitespace for byte-identical re-emit; canonical-form
emission is the v0 goal. -/
structure Field where
  key   : String
  value : Value
  deriving Repr, BEq, Inhabited

/-- One `{ k => v, k => v }` row. -/
structure Row where
  fields : Array Field
  /-- Source-line number, if the parser tracked it. Mirrors PG's
  `Catalog.pm` which annotates each hash with `line_number`. -/
  lineNumber : Option Nat := none
  deriving Repr, Inhabited

/-- A complete `.dat` file. -/
structure File where
  /-- The catalog table name, derived from the input file's basename
  (per PG's `Catalog.pm::ParseData`: `$input_file =~ /(\w+)\.dat$/`). -/
  catname : String
  rows    : Array Row
  deriving Repr, Inhabited

/-! ## Staged implementation

The functions below are stubs. They'll be implemented against
`tools/catalog_gen/reference/Catalog.pm` in follow-up turns:

  - `parse : String → Except String File`  -- read `.dat` text
  - `emit  : File → String`                  -- canonical text form

The round-trip test (once both land) is structural:

    do
      let f₁ ← parse src
      let f₂ ← parse (emit f₁)
      decide (f₁.rows = f₂.rows)

Byte-identical re-emit is a stretch goal — it requires preserving
inter-token whitespace + comments. The structural-round-trip MVP
is sufficient to make `Generated.lean` regeneratable from `.dat`
sources at build time.
-/

end Pg.Catalog.Dat
