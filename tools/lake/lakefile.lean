import Lake
open Lake DSL

-- Minimal Lake workspace: pins the Lean toolchain this module type-checks under.
--
-- Dep-free. Every module in the catalog model imports only other `Pg.Catalog`
-- modules and Lean core — verified by checking each file's imports, not assumed.
-- rules_lean >= 0.5.1 accepts a zero-package workspace, so there is no nominal
-- `require` here; do not add one. A nominal `require batteries` elsewhere in this
-- ecosystem cost ~15 minutes on every CI run that pulled the module in.
--
-- The toolchain version must match every repo that consumes this module's
-- oleans. `.olean` is neither Lean-version- nor architecture-portable (it is a
-- compacted heap image), so a mismatch is a hard failure at use, not a warning.
package «pgcatalog» where
