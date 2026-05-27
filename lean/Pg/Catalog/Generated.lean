/-
Pg.Catalog.Generated — auto-generated catalog snapshot from
pinned postgres source.

DO NOT EDIT BY HAND. Regenerate via:

    bazel run @rules_postgres//tools/catalog_gen:update_catalog_generated (post-move)

The drift gate `@rules_postgres//tools/catalog_gen:catalog_generated_drift_gate_test (post-move)` blocks
PR merges when this file diverges from what
`@rules_postgres//tools/catalog_gen:gen_catalog_lean.py (post-move)` produces against
`@postgres_src//:catalog_dat_files`.

Currently emits (PR-CAT-3d): pg_namespace + pg_type (explicit +
array-companion synthesized) + pg_authid + pg_class (bootstrap
catalogs only) + pg_proc (3314 functions, inline records).
Composite-type `typrelid`, `pg_namespace.nspowner`, and
`pg_proc.proargtypes`/`prorettype` cross-links wired by name
lookup.

Coming next: Track R A1 — migrate `PgAst` identifier fields from
`String` to `Catalog.Ref` using this generated snapshot as the
semantic anchor.

Source: postgres-17.6 (pinned via
`tools/postgres_src/postgres_src_repositories.bzl`).
-/

import Pg.Catalog.Snapshot

-- The pg_proc list literal in bootstrapSnapshot has ~3300 inline
-- records. Elaboration needs both depth and heartbeat headroom
-- relative to the defaults; raise generously — generated data
-- files aren't proof-search-bound by these settings.
set_option maxRecDepth 100000
set_option maxHeartbeats 4000000

namespace Pg.Catalog.Generated

open Pg.Catalog

/-! ## pg_authid rows -/

def bootstrapSuperuserid : PgAuthid :=
  { oid := ⟨10⟩, rolname := "POSTGRES"
  , rolsuper := true
  , rolcreaterole := true
  , rolcreatedb := true
  , rolcanlogin := true
  , rolreplication := true
  , rolbypassrls := true
  }

def rolePgDatabaseOwner : PgAuthid :=
  { oid := ⟨6171⟩, rolname := "pg_database_owner"
  , rolsuper := false
  }

def rolePgReadAllData : PgAuthid :=
  { oid := ⟨6181⟩, rolname := "pg_read_all_data"
  , rolsuper := false
  }

def rolePgWriteAllData : PgAuthid :=
  { oid := ⟨6182⟩, rolname := "pg_write_all_data"
  , rolsuper := false
  }

def rolePgMonitor : PgAuthid :=
  { oid := ⟨3373⟩, rolname := "pg_monitor"
  , rolsuper := false
  }

def rolePgReadAllSettings : PgAuthid :=
  { oid := ⟨3374⟩, rolname := "pg_read_all_settings"
  , rolsuper := false
  }

def rolePgReadAllStats : PgAuthid :=
  { oid := ⟨3375⟩, rolname := "pg_read_all_stats"
  , rolsuper := false
  }

def rolePgStatScanTables : PgAuthid :=
  { oid := ⟨3377⟩, rolname := "pg_stat_scan_tables"
  , rolsuper := false
  }

def rolePgReadServerFiles : PgAuthid :=
  { oid := ⟨4569⟩, rolname := "pg_read_server_files"
  , rolsuper := false
  }

def rolePgWriteServerFiles : PgAuthid :=
  { oid := ⟨4570⟩, rolname := "pg_write_server_files"
  , rolsuper := false
  }

def rolePgExecuteServerProgram : PgAuthid :=
  { oid := ⟨4571⟩, rolname := "pg_execute_server_program"
  , rolsuper := false
  }

def rolePgSignalBackend : PgAuthid :=
  { oid := ⟨4200⟩, rolname := "pg_signal_backend"
  , rolsuper := false
  }

def rolePgCheckpoint : PgAuthid :=
  { oid := ⟨4544⟩, rolname := "pg_checkpoint"
  , rolsuper := false
  }

def rolePgMaintain : PgAuthid :=
  { oid := ⟨6337⟩, rolname := "pg_maintain"
  , rolsuper := false
  }

def rolePgUseReservedConnections : PgAuthid :=
  { oid := ⟨4550⟩, rolname := "pg_use_reserved_connections"
  , rolsuper := false
  }

def rolePgCreateSubscription : PgAuthid :=
  { oid := ⟨6304⟩, rolname := "pg_create_subscription"
  , rolsuper := false
  }

/-! ## pg_namespace rows -/

def pgCatalogNamespace : PgNamespace :=
  { oid := ⟨11⟩, nspname := "pg_catalog" }

def pgToastNamespace : PgNamespace :=
  { oid := ⟨99⟩, nspname := "pg_toast" }

def pgPublicNamespace : PgNamespace :=
  { oid := ⟨2200⟩, nspname := "public"
  , nspowner := ⟨6171⟩ }

/-! ## pg_type rows -/

def bool : PgType :=
  { oid := ⟨16⟩, typname := "bool"
  , typnamespace := pgCatalogNamespace.oid
  , typtype := .base }

def bytea : PgType :=
  { oid := ⟨17⟩, typname := "bytea"
  , typnamespace := pgCatalogNamespace.oid
  , typtype := .base }

def char : PgType :=
  { oid := ⟨18⟩, typname := "char"
  , typnamespace := pgCatalogNamespace.oid
  , typtype := .base }

def name : PgType :=
  { oid := ⟨19⟩, typname := "name"
  , typnamespace := pgCatalogNamespace.oid
  , typtype := .base }

def int8 : PgType :=
  { oid := ⟨20⟩, typname := "int8"
  , typnamespace := pgCatalogNamespace.oid
  , typtype := .base }

def int2 : PgType :=
  { oid := ⟨21⟩, typname := "int2"
  , typnamespace := pgCatalogNamespace.oid
  , typtype := .base }

def int2vector : PgType :=
  { oid := ⟨22⟩, typname := "int2vector"
  , typnamespace := pgCatalogNamespace.oid
  , typtype := .base }

def int4 : PgType :=
  { oid := ⟨23⟩, typname := "int4"
  , typnamespace := pgCatalogNamespace.oid
  , typtype := .base }

def regproc : PgType :=
  { oid := ⟨24⟩, typname := "regproc"
  , typnamespace := pgCatalogNamespace.oid
  , typtype := .base }

def text : PgType :=
  { oid := ⟨25⟩, typname := "text"
  , typnamespace := pgCatalogNamespace.oid
  , typtype := .base }

def oid : PgType :=
  { oid := ⟨26⟩, typname := "oid"
  , typnamespace := pgCatalogNamespace.oid
  , typtype := .base }

def tid : PgType :=
  { oid := ⟨27⟩, typname := "tid"
  , typnamespace := pgCatalogNamespace.oid
  , typtype := .base }

def xid : PgType :=
  { oid := ⟨28⟩, typname := "xid"
  , typnamespace := pgCatalogNamespace.oid
  , typtype := .base }

def cid : PgType :=
  { oid := ⟨29⟩, typname := "cid"
  , typnamespace := pgCatalogNamespace.oid
  , typtype := .base }

def oidvector : PgType :=
  { oid := ⟨30⟩, typname := "oidvector"
  , typnamespace := pgCatalogNamespace.oid
  , typtype := .base }

def pg_type : PgType :=
  { oid := ⟨71⟩, typname := "pg_type"
  , typnamespace := pgCatalogNamespace.oid
  , typtype := .composite
  , typrelid := ⟨1247⟩ }

def pg_attribute : PgType :=
  { oid := ⟨75⟩, typname := "pg_attribute"
  , typnamespace := pgCatalogNamespace.oid
  , typtype := .composite
  , typrelid := ⟨1249⟩ }

def pg_proc : PgType :=
  { oid := ⟨81⟩, typname := "pg_proc"
  , typnamespace := pgCatalogNamespace.oid
  , typtype := .composite
  , typrelid := ⟨1255⟩ }

def pg_class : PgType :=
  { oid := ⟨83⟩, typname := "pg_class"
  , typnamespace := pgCatalogNamespace.oid
  , typtype := .composite
  , typrelid := ⟨1259⟩ }

def json : PgType :=
  { oid := ⟨114⟩, typname := "json"
  , typnamespace := pgCatalogNamespace.oid
  , typtype := .base }

def xml : PgType :=
  { oid := ⟨142⟩, typname := "xml"
  , typnamespace := pgCatalogNamespace.oid
  , typtype := .base }

def pg_node_tree : PgType :=
  { oid := ⟨194⟩, typname := "pg_node_tree"
  , typnamespace := pgCatalogNamespace.oid
  , typtype := .base }

def pg_ndistinct : PgType :=
  { oid := ⟨3361⟩, typname := "pg_ndistinct"
  , typnamespace := pgCatalogNamespace.oid
  , typtype := .base }

def pg_dependencies : PgType :=
  { oid := ⟨3402⟩, typname := "pg_dependencies"
  , typnamespace := pgCatalogNamespace.oid
  , typtype := .base }

def pg_mcv_list : PgType :=
  { oid := ⟨5017⟩, typname := "pg_mcv_list"
  , typnamespace := pgCatalogNamespace.oid
  , typtype := .base }

def pg_ddl_command : PgType :=
  { oid := ⟨32⟩, typname := "pg_ddl_command"
  , typnamespace := pgCatalogNamespace.oid
  , typtype := .pseudo }

def xid8 : PgType :=
  { oid := ⟨5069⟩, typname := "xid8"
  , typnamespace := pgCatalogNamespace.oid
  , typtype := .base }

def point : PgType :=
  { oid := ⟨600⟩, typname := "point"
  , typnamespace := pgCatalogNamespace.oid
  , typtype := .base }

def lseg : PgType :=
  { oid := ⟨601⟩, typname := "lseg"
  , typnamespace := pgCatalogNamespace.oid
  , typtype := .base }

def path : PgType :=
  { oid := ⟨602⟩, typname := "path"
  , typnamespace := pgCatalogNamespace.oid
  , typtype := .base }

def box : PgType :=
  { oid := ⟨603⟩, typname := "box"
  , typnamespace := pgCatalogNamespace.oid
  , typtype := .base }

def polygon : PgType :=
  { oid := ⟨604⟩, typname := "polygon"
  , typnamespace := pgCatalogNamespace.oid
  , typtype := .base }

def line : PgType :=
  { oid := ⟨628⟩, typname := "line"
  , typnamespace := pgCatalogNamespace.oid
  , typtype := .base }

def float4 : PgType :=
  { oid := ⟨700⟩, typname := "float4"
  , typnamespace := pgCatalogNamespace.oid
  , typtype := .base }

def float8 : PgType :=
  { oid := ⟨701⟩, typname := "float8"
  , typnamespace := pgCatalogNamespace.oid
  , typtype := .base }

def unknown : PgType :=
  { oid := ⟨705⟩, typname := "unknown"
  , typnamespace := pgCatalogNamespace.oid
  , typtype := .pseudo }

def circle : PgType :=
  { oid := ⟨718⟩, typname := "circle"
  , typnamespace := pgCatalogNamespace.oid
  , typtype := .base }

def money : PgType :=
  { oid := ⟨790⟩, typname := "money"
  , typnamespace := pgCatalogNamespace.oid
  , typtype := .base }

def macaddr : PgType :=
  { oid := ⟨829⟩, typname := "macaddr"
  , typnamespace := pgCatalogNamespace.oid
  , typtype := .base }

def inet : PgType :=
  { oid := ⟨869⟩, typname := "inet"
  , typnamespace := pgCatalogNamespace.oid
  , typtype := .base }

def cidr : PgType :=
  { oid := ⟨650⟩, typname := "cidr"
  , typnamespace := pgCatalogNamespace.oid
  , typtype := .base }

def macaddr8 : PgType :=
  { oid := ⟨774⟩, typname := "macaddr8"
  , typnamespace := pgCatalogNamespace.oid
  , typtype := .base }

def aclitem : PgType :=
  { oid := ⟨1033⟩, typname := "aclitem"
  , typnamespace := pgCatalogNamespace.oid
  , typtype := .base }

def bpchar : PgType :=
  { oid := ⟨1042⟩, typname := "bpchar"
  , typnamespace := pgCatalogNamespace.oid
  , typtype := .base }

def varchar : PgType :=
  { oid := ⟨1043⟩, typname := "varchar"
  , typnamespace := pgCatalogNamespace.oid
  , typtype := .base }

def date : PgType :=
  { oid := ⟨1082⟩, typname := "date"
  , typnamespace := pgCatalogNamespace.oid
  , typtype := .base }

def time : PgType :=
  { oid := ⟨1083⟩, typname := "time"
  , typnamespace := pgCatalogNamespace.oid
  , typtype := .base }

def timestamp : PgType :=
  { oid := ⟨1114⟩, typname := "timestamp"
  , typnamespace := pgCatalogNamespace.oid
  , typtype := .base }

def timestamptz : PgType :=
  { oid := ⟨1184⟩, typname := "timestamptz"
  , typnamespace := pgCatalogNamespace.oid
  , typtype := .base }

def interval : PgType :=
  { oid := ⟨1186⟩, typname := "interval"
  , typnamespace := pgCatalogNamespace.oid
  , typtype := .base }

def timetz : PgType :=
  { oid := ⟨1266⟩, typname := "timetz"
  , typnamespace := pgCatalogNamespace.oid
  , typtype := .base }

def bit : PgType :=
  { oid := ⟨1560⟩, typname := "bit"
  , typnamespace := pgCatalogNamespace.oid
  , typtype := .base }

def varbit : PgType :=
  { oid := ⟨1562⟩, typname := "varbit"
  , typnamespace := pgCatalogNamespace.oid
  , typtype := .base }

def numeric : PgType :=
  { oid := ⟨1700⟩, typname := "numeric"
  , typnamespace := pgCatalogNamespace.oid
  , typtype := .base }

def refcursor : PgType :=
  { oid := ⟨1790⟩, typname := "refcursor"
  , typnamespace := pgCatalogNamespace.oid
  , typtype := .base }

def regprocedure : PgType :=
  { oid := ⟨2202⟩, typname := "regprocedure"
  , typnamespace := pgCatalogNamespace.oid
  , typtype := .base }

def regoper : PgType :=
  { oid := ⟨2203⟩, typname := "regoper"
  , typnamespace := pgCatalogNamespace.oid
  , typtype := .base }

def regoperator : PgType :=
  { oid := ⟨2204⟩, typname := "regoperator"
  , typnamespace := pgCatalogNamespace.oid
  , typtype := .base }

def regclass : PgType :=
  { oid := ⟨2205⟩, typname := "regclass"
  , typnamespace := pgCatalogNamespace.oid
  , typtype := .base }

def regcollation : PgType :=
  { oid := ⟨4191⟩, typname := "regcollation"
  , typnamespace := pgCatalogNamespace.oid
  , typtype := .base }

def regtype : PgType :=
  { oid := ⟨2206⟩, typname := "regtype"
  , typnamespace := pgCatalogNamespace.oid
  , typtype := .base }

def regrole : PgType :=
  { oid := ⟨4096⟩, typname := "regrole"
  , typnamespace := pgCatalogNamespace.oid
  , typtype := .base }

def regnamespace : PgType :=
  { oid := ⟨4089⟩, typname := "regnamespace"
  , typnamespace := pgCatalogNamespace.oid
  , typtype := .base }

def uuid : PgType :=
  { oid := ⟨2950⟩, typname := "uuid"
  , typnamespace := pgCatalogNamespace.oid
  , typtype := .base }

def pg_lsn : PgType :=
  { oid := ⟨3220⟩, typname := "pg_lsn"
  , typnamespace := pgCatalogNamespace.oid
  , typtype := .base }

def tsvector : PgType :=
  { oid := ⟨3614⟩, typname := "tsvector"
  , typnamespace := pgCatalogNamespace.oid
  , typtype := .base }

def gtsvector : PgType :=
  { oid := ⟨3642⟩, typname := "gtsvector"
  , typnamespace := pgCatalogNamespace.oid
  , typtype := .base }

def tsquery : PgType :=
  { oid := ⟨3615⟩, typname := "tsquery"
  , typnamespace := pgCatalogNamespace.oid
  , typtype := .base }

def regconfig : PgType :=
  { oid := ⟨3734⟩, typname := "regconfig"
  , typnamespace := pgCatalogNamespace.oid
  , typtype := .base }

def regdictionary : PgType :=
  { oid := ⟨3769⟩, typname := "regdictionary"
  , typnamespace := pgCatalogNamespace.oid
  , typtype := .base }

def jsonb : PgType :=
  { oid := ⟨3802⟩, typname := "jsonb"
  , typnamespace := pgCatalogNamespace.oid
  , typtype := .base }

def jsonpath : PgType :=
  { oid := ⟨4072⟩, typname := "jsonpath"
  , typnamespace := pgCatalogNamespace.oid
  , typtype := .base }

def txid_snapshot : PgType :=
  { oid := ⟨2970⟩, typname := "txid_snapshot"
  , typnamespace := pgCatalogNamespace.oid
  , typtype := .base }

def pg_snapshot : PgType :=
  { oid := ⟨5038⟩, typname := "pg_snapshot"
  , typnamespace := pgCatalogNamespace.oid
  , typtype := .base }

def int4range : PgType :=
  { oid := ⟨3904⟩, typname := "int4range"
  , typnamespace := pgCatalogNamespace.oid
  , typtype := .range }

def numrange : PgType :=
  { oid := ⟨3906⟩, typname := "numrange"
  , typnamespace := pgCatalogNamespace.oid
  , typtype := .range }

def tsrange : PgType :=
  { oid := ⟨3908⟩, typname := "tsrange"
  , typnamespace := pgCatalogNamespace.oid
  , typtype := .range }

def tstzrange : PgType :=
  { oid := ⟨3910⟩, typname := "tstzrange"
  , typnamespace := pgCatalogNamespace.oid
  , typtype := .range }

def daterange : PgType :=
  { oid := ⟨3912⟩, typname := "daterange"
  , typnamespace := pgCatalogNamespace.oid
  , typtype := .range }

def int8range : PgType :=
  { oid := ⟨3926⟩, typname := "int8range"
  , typnamespace := pgCatalogNamespace.oid
  , typtype := .range }

def int4multirange : PgType :=
  { oid := ⟨4451⟩, typname := "int4multirange"
  , typnamespace := pgCatalogNamespace.oid
  , typtype := .multirange }

def nummultirange : PgType :=
  { oid := ⟨4532⟩, typname := "nummultirange"
  , typnamespace := pgCatalogNamespace.oid
  , typtype := .multirange }

def tsmultirange : PgType :=
  { oid := ⟨4533⟩, typname := "tsmultirange"
  , typnamespace := pgCatalogNamespace.oid
  , typtype := .multirange }

def tstzmultirange : PgType :=
  { oid := ⟨4534⟩, typname := "tstzmultirange"
  , typnamespace := pgCatalogNamespace.oid
  , typtype := .multirange }

def datemultirange : PgType :=
  { oid := ⟨4535⟩, typname := "datemultirange"
  , typnamespace := pgCatalogNamespace.oid
  , typtype := .multirange }

def int8multirange : PgType :=
  { oid := ⟨4536⟩, typname := "int8multirange"
  , typnamespace := pgCatalogNamespace.oid
  , typtype := .multirange }

def record : PgType :=
  { oid := ⟨2249⟩, typname := "record"
  , typnamespace := pgCatalogNamespace.oid
  , typtype := .pseudo }

def _record : PgType :=
  { oid := ⟨2287⟩, typname := "_record"
  , typnamespace := pgCatalogNamespace.oid
  , typtype := .pseudo }

def cstring : PgType :=
  { oid := ⟨2275⟩, typname := "cstring"
  , typnamespace := pgCatalogNamespace.oid
  , typtype := .pseudo }

def any : PgType :=
  { oid := ⟨2276⟩, typname := "any"
  , typnamespace := pgCatalogNamespace.oid
  , typtype := .pseudo }

def anyarray : PgType :=
  { oid := ⟨2277⟩, typname := "anyarray"
  , typnamespace := pgCatalogNamespace.oid
  , typtype := .pseudo }

def void : PgType :=
  { oid := ⟨2278⟩, typname := "void"
  , typnamespace := pgCatalogNamespace.oid
  , typtype := .pseudo }

def trigger : PgType :=
  { oid := ⟨2279⟩, typname := "trigger"
  , typnamespace := pgCatalogNamespace.oid
  , typtype := .pseudo }

def event_trigger : PgType :=
  { oid := ⟨3838⟩, typname := "event_trigger"
  , typnamespace := pgCatalogNamespace.oid
  , typtype := .pseudo }

def language_handler : PgType :=
  { oid := ⟨2280⟩, typname := "language_handler"
  , typnamespace := pgCatalogNamespace.oid
  , typtype := .pseudo }

def internal : PgType :=
  { oid := ⟨2281⟩, typname := "internal"
  , typnamespace := pgCatalogNamespace.oid
  , typtype := .pseudo }

def anyelement : PgType :=
  { oid := ⟨2283⟩, typname := "anyelement"
  , typnamespace := pgCatalogNamespace.oid
  , typtype := .pseudo }

def anynonarray : PgType :=
  { oid := ⟨2776⟩, typname := "anynonarray"
  , typnamespace := pgCatalogNamespace.oid
  , typtype := .pseudo }

def anyenum : PgType :=
  { oid := ⟨3500⟩, typname := "anyenum"
  , typnamespace := pgCatalogNamespace.oid
  , typtype := .pseudo }

def fdw_handler : PgType :=
  { oid := ⟨3115⟩, typname := "fdw_handler"
  , typnamespace := pgCatalogNamespace.oid
  , typtype := .pseudo }

def index_am_handler : PgType :=
  { oid := ⟨325⟩, typname := "index_am_handler"
  , typnamespace := pgCatalogNamespace.oid
  , typtype := .pseudo }

def tsm_handler : PgType :=
  { oid := ⟨3310⟩, typname := "tsm_handler"
  , typnamespace := pgCatalogNamespace.oid
  , typtype := .pseudo }

def table_am_handler : PgType :=
  { oid := ⟨269⟩, typname := "table_am_handler"
  , typnamespace := pgCatalogNamespace.oid
  , typtype := .pseudo }

def anyrange : PgType :=
  { oid := ⟨3831⟩, typname := "anyrange"
  , typnamespace := pgCatalogNamespace.oid
  , typtype := .pseudo }

def anycompatible : PgType :=
  { oid := ⟨5077⟩, typname := "anycompatible"
  , typnamespace := pgCatalogNamespace.oid
  , typtype := .pseudo }

def anycompatiblearray : PgType :=
  { oid := ⟨5078⟩, typname := "anycompatiblearray"
  , typnamespace := pgCatalogNamespace.oid
  , typtype := .pseudo }

def anycompatiblenonarray : PgType :=
  { oid := ⟨5079⟩, typname := "anycompatiblenonarray"
  , typnamespace := pgCatalogNamespace.oid
  , typtype := .pseudo }

def anycompatiblerange : PgType :=
  { oid := ⟨5080⟩, typname := "anycompatiblerange"
  , typnamespace := pgCatalogNamespace.oid
  , typtype := .pseudo }

def anymultirange : PgType :=
  { oid := ⟨4537⟩, typname := "anymultirange"
  , typnamespace := pgCatalogNamespace.oid
  , typtype := .pseudo }

def anycompatiblemultirange : PgType :=
  { oid := ⟨4538⟩, typname := "anycompatiblemultirange"
  , typnamespace := pgCatalogNamespace.oid
  , typtype := .pseudo }

def pg_brin_bloom_summary : PgType :=
  { oid := ⟨4600⟩, typname := "pg_brin_bloom_summary"
  , typnamespace := pgCatalogNamespace.oid
  , typtype := .base }

def pg_brin_minmax_multi_summary : PgType :=
  { oid := ⟨4601⟩, typname := "pg_brin_minmax_multi_summary"
  , typnamespace := pgCatalogNamespace.oid
  , typtype := .base }

def _bool : PgType :=
  { oid := ⟨1000⟩, typname := "_bool"
  , typnamespace := pgCatalogNamespace.oid
  , typtype := .base }

def _bytea : PgType :=
  { oid := ⟨1001⟩, typname := "_bytea"
  , typnamespace := pgCatalogNamespace.oid
  , typtype := .base }

def _char : PgType :=
  { oid := ⟨1002⟩, typname := "_char"
  , typnamespace := pgCatalogNamespace.oid
  , typtype := .base }

def _name : PgType :=
  { oid := ⟨1003⟩, typname := "_name"
  , typnamespace := pgCatalogNamespace.oid
  , typtype := .base }

def _int8 : PgType :=
  { oid := ⟨1016⟩, typname := "_int8"
  , typnamespace := pgCatalogNamespace.oid
  , typtype := .base }

def _int2 : PgType :=
  { oid := ⟨1005⟩, typname := "_int2"
  , typnamespace := pgCatalogNamespace.oid
  , typtype := .base }

def _int2vector : PgType :=
  { oid := ⟨1006⟩, typname := "_int2vector"
  , typnamespace := pgCatalogNamespace.oid
  , typtype := .base }

def _int4 : PgType :=
  { oid := ⟨1007⟩, typname := "_int4"
  , typnamespace := pgCatalogNamespace.oid
  , typtype := .base }

def _regproc : PgType :=
  { oid := ⟨1008⟩, typname := "_regproc"
  , typnamespace := pgCatalogNamespace.oid
  , typtype := .base }

def _text : PgType :=
  { oid := ⟨1009⟩, typname := "_text"
  , typnamespace := pgCatalogNamespace.oid
  , typtype := .base }

def _oid : PgType :=
  { oid := ⟨1028⟩, typname := "_oid"
  , typnamespace := pgCatalogNamespace.oid
  , typtype := .base }

def _tid : PgType :=
  { oid := ⟨1010⟩, typname := "_tid"
  , typnamespace := pgCatalogNamespace.oid
  , typtype := .base }

def _xid : PgType :=
  { oid := ⟨1011⟩, typname := "_xid"
  , typnamespace := pgCatalogNamespace.oid
  , typtype := .base }

def _cid : PgType :=
  { oid := ⟨1012⟩, typname := "_cid"
  , typnamespace := pgCatalogNamespace.oid
  , typtype := .base }

def _oidvector : PgType :=
  { oid := ⟨1013⟩, typname := "_oidvector"
  , typnamespace := pgCatalogNamespace.oid
  , typtype := .base }

def _pg_type : PgType :=
  { oid := ⟨210⟩, typname := "_pg_type"
  , typnamespace := pgCatalogNamespace.oid
  , typtype := .base }

def _pg_attribute : PgType :=
  { oid := ⟨270⟩, typname := "_pg_attribute"
  , typnamespace := pgCatalogNamespace.oid
  , typtype := .base }

def _pg_proc : PgType :=
  { oid := ⟨272⟩, typname := "_pg_proc"
  , typnamespace := pgCatalogNamespace.oid
  , typtype := .base }

def _pg_class : PgType :=
  { oid := ⟨273⟩, typname := "_pg_class"
  , typnamespace := pgCatalogNamespace.oid
  , typtype := .base }

def _json : PgType :=
  { oid := ⟨199⟩, typname := "_json"
  , typnamespace := pgCatalogNamespace.oid
  , typtype := .base }

def _xml : PgType :=
  { oid := ⟨143⟩, typname := "_xml"
  , typnamespace := pgCatalogNamespace.oid
  , typtype := .base }

def _xid8 : PgType :=
  { oid := ⟨271⟩, typname := "_xid8"
  , typnamespace := pgCatalogNamespace.oid
  , typtype := .base }

def _point : PgType :=
  { oid := ⟨1017⟩, typname := "_point"
  , typnamespace := pgCatalogNamespace.oid
  , typtype := .base }

def _lseg : PgType :=
  { oid := ⟨1018⟩, typname := "_lseg"
  , typnamespace := pgCatalogNamespace.oid
  , typtype := .base }

def _path : PgType :=
  { oid := ⟨1019⟩, typname := "_path"
  , typnamespace := pgCatalogNamespace.oid
  , typtype := .base }

def _box : PgType :=
  { oid := ⟨1020⟩, typname := "_box"
  , typnamespace := pgCatalogNamespace.oid
  , typtype := .base }

def _polygon : PgType :=
  { oid := ⟨1027⟩, typname := "_polygon"
  , typnamespace := pgCatalogNamespace.oid
  , typtype := .base }

def _line : PgType :=
  { oid := ⟨629⟩, typname := "_line"
  , typnamespace := pgCatalogNamespace.oid
  , typtype := .base }

def _float4 : PgType :=
  { oid := ⟨1021⟩, typname := "_float4"
  , typnamespace := pgCatalogNamespace.oid
  , typtype := .base }

def _float8 : PgType :=
  { oid := ⟨1022⟩, typname := "_float8"
  , typnamespace := pgCatalogNamespace.oid
  , typtype := .base }

def _circle : PgType :=
  { oid := ⟨719⟩, typname := "_circle"
  , typnamespace := pgCatalogNamespace.oid
  , typtype := .base }

def _money : PgType :=
  { oid := ⟨791⟩, typname := "_money"
  , typnamespace := pgCatalogNamespace.oid
  , typtype := .base }

def _macaddr : PgType :=
  { oid := ⟨1040⟩, typname := "_macaddr"
  , typnamespace := pgCatalogNamespace.oid
  , typtype := .base }

def _inet : PgType :=
  { oid := ⟨1041⟩, typname := "_inet"
  , typnamespace := pgCatalogNamespace.oid
  , typtype := .base }

def _cidr : PgType :=
  { oid := ⟨651⟩, typname := "_cidr"
  , typnamespace := pgCatalogNamespace.oid
  , typtype := .base }

def _macaddr8 : PgType :=
  { oid := ⟨775⟩, typname := "_macaddr8"
  , typnamespace := pgCatalogNamespace.oid
  , typtype := .base }

def _aclitem : PgType :=
  { oid := ⟨1034⟩, typname := "_aclitem"
  , typnamespace := pgCatalogNamespace.oid
  , typtype := .base }

def _bpchar : PgType :=
  { oid := ⟨1014⟩, typname := "_bpchar"
  , typnamespace := pgCatalogNamespace.oid
  , typtype := .base }

def _varchar : PgType :=
  { oid := ⟨1015⟩, typname := "_varchar"
  , typnamespace := pgCatalogNamespace.oid
  , typtype := .base }

def _date : PgType :=
  { oid := ⟨1182⟩, typname := "_date"
  , typnamespace := pgCatalogNamespace.oid
  , typtype := .base }

def _time : PgType :=
  { oid := ⟨1183⟩, typname := "_time"
  , typnamespace := pgCatalogNamespace.oid
  , typtype := .base }

def _timestamp : PgType :=
  { oid := ⟨1115⟩, typname := "_timestamp"
  , typnamespace := pgCatalogNamespace.oid
  , typtype := .base }

def _timestamptz : PgType :=
  { oid := ⟨1185⟩, typname := "_timestamptz"
  , typnamespace := pgCatalogNamespace.oid
  , typtype := .base }

def _interval : PgType :=
  { oid := ⟨1187⟩, typname := "_interval"
  , typnamespace := pgCatalogNamespace.oid
  , typtype := .base }

def _timetz : PgType :=
  { oid := ⟨1270⟩, typname := "_timetz"
  , typnamespace := pgCatalogNamespace.oid
  , typtype := .base }

def _bit : PgType :=
  { oid := ⟨1561⟩, typname := "_bit"
  , typnamespace := pgCatalogNamespace.oid
  , typtype := .base }

def _varbit : PgType :=
  { oid := ⟨1563⟩, typname := "_varbit"
  , typnamespace := pgCatalogNamespace.oid
  , typtype := .base }

def _numeric : PgType :=
  { oid := ⟨1231⟩, typname := "_numeric"
  , typnamespace := pgCatalogNamespace.oid
  , typtype := .base }

def _refcursor : PgType :=
  { oid := ⟨2201⟩, typname := "_refcursor"
  , typnamespace := pgCatalogNamespace.oid
  , typtype := .base }

def _regprocedure : PgType :=
  { oid := ⟨2207⟩, typname := "_regprocedure"
  , typnamespace := pgCatalogNamespace.oid
  , typtype := .base }

def _regoper : PgType :=
  { oid := ⟨2208⟩, typname := "_regoper"
  , typnamespace := pgCatalogNamespace.oid
  , typtype := .base }

def _regoperator : PgType :=
  { oid := ⟨2209⟩, typname := "_regoperator"
  , typnamespace := pgCatalogNamespace.oid
  , typtype := .base }

def _regclass : PgType :=
  { oid := ⟨2210⟩, typname := "_regclass"
  , typnamespace := pgCatalogNamespace.oid
  , typtype := .base }

def _regcollation : PgType :=
  { oid := ⟨4192⟩, typname := "_regcollation"
  , typnamespace := pgCatalogNamespace.oid
  , typtype := .base }

def _regtype : PgType :=
  { oid := ⟨2211⟩, typname := "_regtype"
  , typnamespace := pgCatalogNamespace.oid
  , typtype := .base }

def _regrole : PgType :=
  { oid := ⟨4097⟩, typname := "_regrole"
  , typnamespace := pgCatalogNamespace.oid
  , typtype := .base }

def _regnamespace : PgType :=
  { oid := ⟨4090⟩, typname := "_regnamespace"
  , typnamespace := pgCatalogNamespace.oid
  , typtype := .base }

def _uuid : PgType :=
  { oid := ⟨2951⟩, typname := "_uuid"
  , typnamespace := pgCatalogNamespace.oid
  , typtype := .base }

def _pg_lsn : PgType :=
  { oid := ⟨3221⟩, typname := "_pg_lsn"
  , typnamespace := pgCatalogNamespace.oid
  , typtype := .base }

def _tsvector : PgType :=
  { oid := ⟨3643⟩, typname := "_tsvector"
  , typnamespace := pgCatalogNamespace.oid
  , typtype := .base }

def _gtsvector : PgType :=
  { oid := ⟨3644⟩, typname := "_gtsvector"
  , typnamespace := pgCatalogNamespace.oid
  , typtype := .base }

def _tsquery : PgType :=
  { oid := ⟨3645⟩, typname := "_tsquery"
  , typnamespace := pgCatalogNamespace.oid
  , typtype := .base }

def _regconfig : PgType :=
  { oid := ⟨3735⟩, typname := "_regconfig"
  , typnamespace := pgCatalogNamespace.oid
  , typtype := .base }

def _regdictionary : PgType :=
  { oid := ⟨3770⟩, typname := "_regdictionary"
  , typnamespace := pgCatalogNamespace.oid
  , typtype := .base }

def _jsonb : PgType :=
  { oid := ⟨3807⟩, typname := "_jsonb"
  , typnamespace := pgCatalogNamespace.oid
  , typtype := .base }

def _jsonpath : PgType :=
  { oid := ⟨4073⟩, typname := "_jsonpath"
  , typnamespace := pgCatalogNamespace.oid
  , typtype := .base }

def _txid_snapshot : PgType :=
  { oid := ⟨2949⟩, typname := "_txid_snapshot"
  , typnamespace := pgCatalogNamespace.oid
  , typtype := .base }

def _pg_snapshot : PgType :=
  { oid := ⟨5039⟩, typname := "_pg_snapshot"
  , typnamespace := pgCatalogNamespace.oid
  , typtype := .base }

def _int4range : PgType :=
  { oid := ⟨3905⟩, typname := "_int4range"
  , typnamespace := pgCatalogNamespace.oid
  , typtype := .base }

def _numrange : PgType :=
  { oid := ⟨3907⟩, typname := "_numrange"
  , typnamespace := pgCatalogNamespace.oid
  , typtype := .base }

def _tsrange : PgType :=
  { oid := ⟨3909⟩, typname := "_tsrange"
  , typnamespace := pgCatalogNamespace.oid
  , typtype := .base }

def _tstzrange : PgType :=
  { oid := ⟨3911⟩, typname := "_tstzrange"
  , typnamespace := pgCatalogNamespace.oid
  , typtype := .base }

def _daterange : PgType :=
  { oid := ⟨3913⟩, typname := "_daterange"
  , typnamespace := pgCatalogNamespace.oid
  , typtype := .base }

def _int8range : PgType :=
  { oid := ⟨3927⟩, typname := "_int8range"
  , typnamespace := pgCatalogNamespace.oid
  , typtype := .base }

def _int4multirange : PgType :=
  { oid := ⟨6150⟩, typname := "_int4multirange"
  , typnamespace := pgCatalogNamespace.oid
  , typtype := .base }

def _nummultirange : PgType :=
  { oid := ⟨6151⟩, typname := "_nummultirange"
  , typnamespace := pgCatalogNamespace.oid
  , typtype := .base }

def _tsmultirange : PgType :=
  { oid := ⟨6152⟩, typname := "_tsmultirange"
  , typnamespace := pgCatalogNamespace.oid
  , typtype := .base }

def _tstzmultirange : PgType :=
  { oid := ⟨6153⟩, typname := "_tstzmultirange"
  , typnamespace := pgCatalogNamespace.oid
  , typtype := .base }

def _datemultirange : PgType :=
  { oid := ⟨6155⟩, typname := "_datemultirange"
  , typnamespace := pgCatalogNamespace.oid
  , typtype := .base }

def _int8multirange : PgType :=
  { oid := ⟨6157⟩, typname := "_int8multirange"
  , typnamespace := pgCatalogNamespace.oid
  , typtype := .base }

def _cstring : PgType :=
  { oid := ⟨1263⟩, typname := "_cstring"
  , typnamespace := pgCatalogNamespace.oid
  , typtype := .base }

/-! ## pg_class rows (bootstrap catalogs) -/

def relation_pg_type : PgClass :=
  { oid := ⟨1247⟩, relname := "pg_type"
  , relnamespace := pgCatalogNamespace.oid
  , relkind := .ordinaryTable
  , reltype := pg_type.oid }

def relation_pg_attribute : PgClass :=
  { oid := ⟨1249⟩, relname := "pg_attribute"
  , relnamespace := pgCatalogNamespace.oid
  , relkind := .ordinaryTable
  , reltype := pg_attribute.oid }

def relation_pg_proc : PgClass :=
  { oid := ⟨1255⟩, relname := "pg_proc"
  , relnamespace := pgCatalogNamespace.oid
  , relkind := .ordinaryTable
  , reltype := pg_proc.oid }

def relation_pg_class : PgClass :=
  { oid := ⟨1259⟩, relname := "pg_class"
  , relnamespace := pgCatalogNamespace.oid
  , relkind := .ordinaryTable
  , reltype := pg_class.oid }

/-- A `Snapshot` populated with the bootstrap-fixed-oid
    catalog rows emitted from pinned postgres source.
    pg_namespace + pg_type (explicit + array-synthesized)
    + pg_authid + pg_class (bootstrap catalogs only) +
    pg_proc (3314 functions, inline records). -/
def bootstrapSnapshot : Snapshot :=
  { namespaces :=
    [ pgCatalogNamespace
    , pgToastNamespace
    , pgPublicNamespace
    ]
  , relations :=
    [ relation_pg_type
    , relation_pg_attribute
    , relation_pg_proc
    , relation_pg_class
    ]
  , types :=
    [ bool
    , bytea
    , char
    , name
    , int8
    , int2
    , int2vector
    , int4
    , regproc
    , text
    , oid
    , tid
    , xid
    , cid
    , oidvector
    , pg_type
    , pg_attribute
    , pg_proc
    , pg_class
    , json
    , xml
    , pg_node_tree
    , pg_ndistinct
    , pg_dependencies
    , pg_mcv_list
    , pg_ddl_command
    , xid8
    , point
    , lseg
    , path
    , box
    , polygon
    , line
    , float4
    , float8
    , unknown
    , circle
    , money
    , macaddr
    , inet
    , cidr
    , macaddr8
    , aclitem
    , bpchar
    , varchar
    , date
    , time
    , timestamp
    , timestamptz
    , interval
    , timetz
    , bit
    , varbit
    , numeric
    , refcursor
    , regprocedure
    , regoper
    , regoperator
    , regclass
    , regcollation
    , regtype
    , regrole
    , regnamespace
    , uuid
    , pg_lsn
    , tsvector
    , gtsvector
    , tsquery
    , regconfig
    , regdictionary
    , jsonb
    , jsonpath
    , txid_snapshot
    , pg_snapshot
    , int4range
    , numrange
    , tsrange
    , tstzrange
    , daterange
    , int8range
    , int4multirange
    , nummultirange
    , tsmultirange
    , tstzmultirange
    , datemultirange
    , int8multirange
    , record
    , _record
    , cstring
    , any
    , anyarray
    , void
    , trigger
    , event_trigger
    , language_handler
    , internal
    , anyelement
    , anynonarray
    , anyenum
    , fdw_handler
    , index_am_handler
    , tsm_handler
    , table_am_handler
    , anyrange
    , anycompatible
    , anycompatiblearray
    , anycompatiblenonarray
    , anycompatiblerange
    , anymultirange
    , anycompatiblemultirange
    , pg_brin_bloom_summary
    , pg_brin_minmax_multi_summary
    , _bool
    , _bytea
    , _char
    , _name
    , _int8
    , _int2
    , _int2vector
    , _int4
    , _regproc
    , _text
    , _oid
    , _tid
    , _xid
    , _cid
    , _oidvector
    , _pg_type
    , _pg_attribute
    , _pg_proc
    , _pg_class
    , _json
    , _xml
    , _xid8
    , _point
    , _lseg
    , _path
    , _box
    , _polygon
    , _line
    , _float4
    , _float8
    , _circle
    , _money
    , _macaddr
    , _inet
    , _cidr
    , _macaddr8
    , _aclitem
    , _bpchar
    , _varchar
    , _date
    , _time
    , _timestamp
    , _timestamptz
    , _interval
    , _timetz
    , _bit
    , _varbit
    , _numeric
    , _refcursor
    , _regprocedure
    , _regoper
    , _regoperator
    , _regclass
    , _regcollation
    , _regtype
    , _regrole
    , _regnamespace
    , _uuid
    , _pg_lsn
    , _tsvector
    , _gtsvector
    , _tsquery
    , _regconfig
    , _regdictionary
    , _jsonb
    , _jsonpath
    , _txid_snapshot
    , _pg_snapshot
    , _int4range
    , _numrange
    , _tsrange
    , _tstzrange
    , _daterange
    , _int8range
    , _int4multirange
    , _nummultirange
    , _tsmultirange
    , _tstzmultirange
    , _datemultirange
    , _int8multirange
    , _cstring
    ]
  , roles :=
    [ bootstrapSuperuserid
    , rolePgDatabaseOwner
    , rolePgReadAllData
    , rolePgWriteAllData
    , rolePgMonitor
    , rolePgReadAllSettings
    , rolePgReadAllStats
    , rolePgStatScanTables
    , rolePgReadServerFiles
    , rolePgWriteServerFiles
    , rolePgExecuteServerProgram
    , rolePgSignalBackend
    , rolePgCheckpoint
    , rolePgMaintain
    , rolePgUseReservedConnections
    , rolePgCreateSubscription
    ]
  , procs :=
    [ { oid := ⟨1242⟩, proname := "boolin", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨2275⟩] }
    , { oid := ⟨1243⟩, proname := "boolout", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨2275⟩, proargtypes := [⟨16⟩] }
    , { oid := ⟨1244⟩, proname := "byteain", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨17⟩, proargtypes := [⟨2275⟩] }
    , { oid := ⟨31⟩, proname := "byteaout", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨2275⟩, proargtypes := [⟨17⟩] }
    , { oid := ⟨1245⟩, proname := "charin", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨18⟩, proargtypes := [⟨2275⟩] }
    , { oid := ⟨33⟩, proname := "charout", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨2275⟩, proargtypes := [⟨18⟩] }
    , { oid := ⟨34⟩, proname := "namein", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨19⟩, proargtypes := [⟨2275⟩] }
    , { oid := ⟨35⟩, proname := "nameout", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨2275⟩, proargtypes := [⟨19⟩] }
    , { oid := ⟨38⟩, proname := "int2in", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨21⟩, proargtypes := [⟨2275⟩] }
    , { oid := ⟨39⟩, proname := "int2out", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨2275⟩, proargtypes := [⟨21⟩] }
    , { oid := ⟨40⟩, proname := "int2vectorin", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨22⟩, proargtypes := [⟨2275⟩] }
    , { oid := ⟨41⟩, proname := "int2vectorout", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨2275⟩, proargtypes := [⟨22⟩] }
    , { oid := ⟨42⟩, proname := "int4in", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨23⟩, proargtypes := [⟨2275⟩] }
    , { oid := ⟨43⟩, proname := "int4out", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨2275⟩, proargtypes := [⟨23⟩] }
    , { oid := ⟨44⟩, proname := "regprocin", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨24⟩, proargtypes := [⟨2275⟩] }
    , { oid := ⟨45⟩, proname := "regprocout", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨2275⟩, proargtypes := [⟨24⟩] }
    , { oid := ⟨3494⟩, proname := "to_regproc", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨24⟩, proargtypes := [⟨25⟩] }
    , { oid := ⟨3479⟩, proname := "to_regprocedure", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨2202⟩, proargtypes := [⟨25⟩] }
    , { oid := ⟨46⟩, proname := "textin", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨25⟩, proargtypes := [⟨2275⟩] }
    , { oid := ⟨47⟩, proname := "textout", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨2275⟩, proargtypes := [⟨25⟩] }
    , { oid := ⟨48⟩, proname := "tidin", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨27⟩, proargtypes := [⟨2275⟩] }
    , { oid := ⟨49⟩, proname := "tidout", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨2275⟩, proargtypes := [⟨27⟩] }
    , { oid := ⟨50⟩, proname := "xidin", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨28⟩, proargtypes := [⟨2275⟩] }
    , { oid := ⟨51⟩, proname := "xidout", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨2275⟩, proargtypes := [⟨28⟩] }
    , { oid := ⟨5070⟩, proname := "xid8in", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨5069⟩, proargtypes := [⟨2275⟩] }
    , { oid := ⟨5081⟩, proname := "xid8out", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨2275⟩, proargtypes := [⟨5069⟩] }
    , { oid := ⟨5082⟩, proname := "xid8recv", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨5069⟩, proargtypes := [⟨2281⟩] }
    , { oid := ⟨5083⟩, proname := "xid8send", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨17⟩, proargtypes := [⟨5069⟩] }
    , { oid := ⟨52⟩, proname := "cidin", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨29⟩, proargtypes := [⟨2275⟩] }
    , { oid := ⟨53⟩, proname := "cidout", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨2275⟩, proargtypes := [⟨29⟩] }
    , { oid := ⟨54⟩, proname := "oidvectorin", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨30⟩, proargtypes := [⟨2275⟩] }
    , { oid := ⟨55⟩, proname := "oidvectorout", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨2275⟩, proargtypes := [⟨30⟩] }
    , { oid := ⟨56⟩, proname := "boollt", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨16⟩, ⟨16⟩] }
    , { oid := ⟨57⟩, proname := "boolgt", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨16⟩, ⟨16⟩] }
    , { oid := ⟨60⟩, proname := "booleq", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨16⟩, ⟨16⟩] }
    , { oid := ⟨61⟩, proname := "chareq", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨18⟩, ⟨18⟩] }
    , { oid := ⟨62⟩, proname := "nameeq", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨19⟩, ⟨19⟩] }
    , { oid := ⟨63⟩, proname := "int2eq", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨21⟩, ⟨21⟩] }
    , { oid := ⟨64⟩, proname := "int2lt", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨21⟩, ⟨21⟩] }
    , { oid := ⟨65⟩, proname := "int4eq", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨23⟩, ⟨23⟩] }
    , { oid := ⟨66⟩, proname := "int4lt", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨23⟩, ⟨23⟩] }
    , { oid := ⟨67⟩, proname := "texteq", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨25⟩, ⟨25⟩] }
    , { oid := ⟨3696⟩, proname := "starts_with", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨25⟩, ⟨25⟩] }
    , { oid := ⟨6242⟩, proname := "text_starts_with_support", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨2281⟩, proargtypes := [⟨2281⟩] }
    , { oid := ⟨68⟩, proname := "xideq", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨28⟩, ⟨28⟩] }
    , { oid := ⟨3308⟩, proname := "xidneq", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨28⟩, ⟨28⟩] }
    , { oid := ⟨5084⟩, proname := "xid8eq", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨5069⟩, ⟨5069⟩] }
    , { oid := ⟨5085⟩, proname := "xid8ne", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨5069⟩, ⟨5069⟩] }
    , { oid := ⟨5034⟩, proname := "xid8lt", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨5069⟩, ⟨5069⟩] }
    , { oid := ⟨5035⟩, proname := "xid8gt", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨5069⟩, ⟨5069⟩] }
    , { oid := ⟨5036⟩, proname := "xid8le", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨5069⟩, ⟨5069⟩] }
    , { oid := ⟨5037⟩, proname := "xid8ge", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨5069⟩, ⟨5069⟩] }
    , { oid := ⟨5096⟩, proname := "xid8cmp", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨23⟩, proargtypes := [⟨5069⟩, ⟨5069⟩] }
    , { oid := ⟨5071⟩, proname := "xid", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨28⟩, proargtypes := [⟨5069⟩] }
    , { oid := ⟨5097⟩, proname := "xid8_larger", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨5069⟩, proargtypes := [⟨5069⟩, ⟨5069⟩] }
    , { oid := ⟨5098⟩, proname := "xid8_smaller", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨5069⟩, proargtypes := [⟨5069⟩, ⟨5069⟩] }
    , { oid := ⟨69⟩, proname := "cideq", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨29⟩, ⟨29⟩] }
    , { oid := ⟨70⟩, proname := "charne", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨18⟩, ⟨18⟩] }
    , { oid := ⟨1246⟩, proname := "charlt", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨18⟩, ⟨18⟩] }
    , { oid := ⟨72⟩, proname := "charle", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨18⟩, ⟨18⟩] }
    , { oid := ⟨73⟩, proname := "chargt", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨18⟩, ⟨18⟩] }
    , { oid := ⟨74⟩, proname := "charge", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨18⟩, ⟨18⟩] }
    , { oid := ⟨77⟩, proname := "int4", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨23⟩, proargtypes := [⟨18⟩] }
    , { oid := ⟨78⟩, proname := "char", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨18⟩, proargtypes := [⟨23⟩] }
    , { oid := ⟨79⟩, proname := "nameregexeq", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨19⟩, ⟨25⟩] }
    , { oid := ⟨1252⟩, proname := "nameregexne", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨19⟩, ⟨25⟩] }
    , { oid := ⟨1254⟩, proname := "textregexeq", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨25⟩, ⟨25⟩] }
    , { oid := ⟨1256⟩, proname := "textregexne", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨25⟩, ⟨25⟩] }
    , { oid := ⟨1364⟩, proname := "textregexeq_support", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨2281⟩, proargtypes := [⟨2281⟩] }
    , { oid := ⟨1257⟩, proname := "textlen", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨23⟩, proargtypes := [⟨25⟩] }
    , { oid := ⟨1258⟩, proname := "textcat", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨25⟩, proargtypes := [⟨25⟩, ⟨25⟩] }
    , { oid := ⟨84⟩, proname := "boolne", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨16⟩, ⟨16⟩] }
    , { oid := ⟨89⟩, proname := "version", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨25⟩, proargtypes := [] }
    , { oid := ⟨86⟩, proname := "pg_ddl_command_in", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨32⟩, proargtypes := [⟨2275⟩] }
    , { oid := ⟨87⟩, proname := "pg_ddl_command_out", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨2275⟩, proargtypes := [⟨32⟩] }
    , { oid := ⟨88⟩, proname := "pg_ddl_command_recv", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨32⟩, proargtypes := [⟨2281⟩] }
    , { oid := ⟨90⟩, proname := "pg_ddl_command_send", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨17⟩, proargtypes := [⟨32⟩] }
    , { oid := ⟨101⟩, proname := "eqsel", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨701⟩, proargtypes := [⟨2281⟩, ⟨26⟩, ⟨2281⟩, ⟨23⟩] }
    , { oid := ⟨102⟩, proname := "neqsel", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨701⟩, proargtypes := [⟨2281⟩, ⟨26⟩, ⟨2281⟩, ⟨23⟩] }
    , { oid := ⟨103⟩, proname := "scalarltsel", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨701⟩, proargtypes := [⟨2281⟩, ⟨26⟩, ⟨2281⟩, ⟨23⟩] }
    , { oid := ⟨104⟩, proname := "scalargtsel", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨701⟩, proargtypes := [⟨2281⟩, ⟨26⟩, ⟨2281⟩, ⟨23⟩] }
    , { oid := ⟨105⟩, proname := "eqjoinsel", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨701⟩, proargtypes := [⟨2281⟩, ⟨26⟩, ⟨2281⟩, ⟨21⟩, ⟨2281⟩] }
    , { oid := ⟨106⟩, proname := "neqjoinsel", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨701⟩, proargtypes := [⟨2281⟩, ⟨26⟩, ⟨2281⟩, ⟨21⟩, ⟨2281⟩] }
    , { oid := ⟨107⟩, proname := "scalarltjoinsel", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨701⟩, proargtypes := [⟨2281⟩, ⟨26⟩, ⟨2281⟩, ⟨21⟩, ⟨2281⟩] }
    , { oid := ⟨108⟩, proname := "scalargtjoinsel", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨701⟩, proargtypes := [⟨2281⟩, ⟨26⟩, ⟨2281⟩, ⟨21⟩, ⟨2281⟩] }
    , { oid := ⟨336⟩, proname := "scalarlesel", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨701⟩, proargtypes := [⟨2281⟩, ⟨26⟩, ⟨2281⟩, ⟨23⟩] }
    , { oid := ⟨337⟩, proname := "scalargesel", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨701⟩, proargtypes := [⟨2281⟩, ⟨26⟩, ⟨2281⟩, ⟨23⟩] }
    , { oid := ⟨386⟩, proname := "scalarlejoinsel", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨701⟩, proargtypes := [⟨2281⟩, ⟨26⟩, ⟨2281⟩, ⟨21⟩, ⟨2281⟩] }
    , { oid := ⟨398⟩, proname := "scalargejoinsel", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨701⟩, proargtypes := [⟨2281⟩, ⟨26⟩, ⟨2281⟩, ⟨21⟩, ⟨2281⟩] }
    , { oid := ⟨109⟩, proname := "unknownin", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨705⟩, proargtypes := [⟨2275⟩] }
    , { oid := ⟨110⟩, proname := "unknownout", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨2275⟩, proargtypes := [⟨705⟩] }
    , { oid := ⟨115⟩, proname := "box_above_eq", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨603⟩, ⟨603⟩] }
    , { oid := ⟨116⟩, proname := "box_below_eq", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨603⟩, ⟨603⟩] }
    , { oid := ⟨117⟩, proname := "point_in", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨600⟩, proargtypes := [⟨2275⟩] }
    , { oid := ⟨118⟩, proname := "point_out", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨2275⟩, proargtypes := [⟨600⟩] }
    , { oid := ⟨119⟩, proname := "lseg_in", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨601⟩, proargtypes := [⟨2275⟩] }
    , { oid := ⟨120⟩, proname := "lseg_out", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨2275⟩, proargtypes := [⟨601⟩] }
    , { oid := ⟨121⟩, proname := "path_in", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨602⟩, proargtypes := [⟨2275⟩] }
    , { oid := ⟨122⟩, proname := "path_out", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨2275⟩, proargtypes := [⟨602⟩] }
    , { oid := ⟨123⟩, proname := "box_in", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨603⟩, proargtypes := [⟨2275⟩] }
    , { oid := ⟨124⟩, proname := "box_out", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨2275⟩, proargtypes := [⟨603⟩] }
    , { oid := ⟨125⟩, proname := "box_overlap", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨603⟩, ⟨603⟩] }
    , { oid := ⟨126⟩, proname := "box_ge", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨603⟩, ⟨603⟩] }
    , { oid := ⟨127⟩, proname := "box_gt", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨603⟩, ⟨603⟩] }
    , { oid := ⟨128⟩, proname := "box_eq", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨603⟩, ⟨603⟩] }
    , { oid := ⟨129⟩, proname := "box_lt", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨603⟩, ⟨603⟩] }
    , { oid := ⟨130⟩, proname := "box_le", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨603⟩, ⟨603⟩] }
    , { oid := ⟨131⟩, proname := "point_above", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨600⟩, ⟨600⟩] }
    , { oid := ⟨132⟩, proname := "point_left", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨600⟩, ⟨600⟩] }
    , { oid := ⟨133⟩, proname := "point_right", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨600⟩, ⟨600⟩] }
    , { oid := ⟨134⟩, proname := "point_below", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨600⟩, ⟨600⟩] }
    , { oid := ⟨135⟩, proname := "point_eq", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨600⟩, ⟨600⟩] }
    , { oid := ⟨136⟩, proname := "on_pb", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨600⟩, ⟨603⟩] }
    , { oid := ⟨137⟩, proname := "on_ppath", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨600⟩, ⟨602⟩] }
    , { oid := ⟨138⟩, proname := "box_center", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨600⟩, proargtypes := [⟨603⟩] }
    , { oid := ⟨139⟩, proname := "areasel", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨701⟩, proargtypes := [⟨2281⟩, ⟨26⟩, ⟨2281⟩, ⟨23⟩] }
    , { oid := ⟨140⟩, proname := "areajoinsel", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨701⟩, proargtypes := [⟨2281⟩, ⟨26⟩, ⟨2281⟩, ⟨21⟩, ⟨2281⟩] }
    , { oid := ⟨141⟩, proname := "int4mul", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨23⟩, proargtypes := [⟨23⟩, ⟨23⟩] }
    , { oid := ⟨144⟩, proname := "int4ne", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨23⟩, ⟨23⟩] }
    , { oid := ⟨145⟩, proname := "int2ne", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨21⟩, ⟨21⟩] }
    , { oid := ⟨146⟩, proname := "int2gt", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨21⟩, ⟨21⟩] }
    , { oid := ⟨147⟩, proname := "int4gt", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨23⟩, ⟨23⟩] }
    , { oid := ⟨148⟩, proname := "int2le", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨21⟩, ⟨21⟩] }
    , { oid := ⟨149⟩, proname := "int4le", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨23⟩, ⟨23⟩] }
    , { oid := ⟨150⟩, proname := "int4ge", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨23⟩, ⟨23⟩] }
    , { oid := ⟨151⟩, proname := "int2ge", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨21⟩, ⟨21⟩] }
    , { oid := ⟨152⟩, proname := "int2mul", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨21⟩, proargtypes := [⟨21⟩, ⟨21⟩] }
    , { oid := ⟨153⟩, proname := "int2div", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨21⟩, proargtypes := [⟨21⟩, ⟨21⟩] }
    , { oid := ⟨154⟩, proname := "int4div", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨23⟩, proargtypes := [⟨23⟩, ⟨23⟩] }
    , { oid := ⟨155⟩, proname := "int2mod", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨21⟩, proargtypes := [⟨21⟩, ⟨21⟩] }
    , { oid := ⟨156⟩, proname := "int4mod", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨23⟩, proargtypes := [⟨23⟩, ⟨23⟩] }
    , { oid := ⟨157⟩, proname := "textne", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨25⟩, ⟨25⟩] }
    , { oid := ⟨158⟩, proname := "int24eq", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨21⟩, ⟨23⟩] }
    , { oid := ⟨159⟩, proname := "int42eq", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨23⟩, ⟨21⟩] }
    , { oid := ⟨160⟩, proname := "int24lt", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨21⟩, ⟨23⟩] }
    , { oid := ⟨161⟩, proname := "int42lt", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨23⟩, ⟨21⟩] }
    , { oid := ⟨162⟩, proname := "int24gt", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨21⟩, ⟨23⟩] }
    , { oid := ⟨163⟩, proname := "int42gt", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨23⟩, ⟨21⟩] }
    , { oid := ⟨164⟩, proname := "int24ne", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨21⟩, ⟨23⟩] }
    , { oid := ⟨165⟩, proname := "int42ne", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨23⟩, ⟨21⟩] }
    , { oid := ⟨166⟩, proname := "int24le", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨21⟩, ⟨23⟩] }
    , { oid := ⟨167⟩, proname := "int42le", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨23⟩, ⟨21⟩] }
    , { oid := ⟨168⟩, proname := "int24ge", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨21⟩, ⟨23⟩] }
    , { oid := ⟨169⟩, proname := "int42ge", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨23⟩, ⟨21⟩] }
    , { oid := ⟨170⟩, proname := "int24mul", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨23⟩, proargtypes := [⟨21⟩, ⟨23⟩] }
    , { oid := ⟨171⟩, proname := "int42mul", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨23⟩, proargtypes := [⟨23⟩, ⟨21⟩] }
    , { oid := ⟨172⟩, proname := "int24div", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨23⟩, proargtypes := [⟨21⟩, ⟨23⟩] }
    , { oid := ⟨173⟩, proname := "int42div", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨23⟩, proargtypes := [⟨23⟩, ⟨21⟩] }
    , { oid := ⟨176⟩, proname := "int2pl", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨21⟩, proargtypes := [⟨21⟩, ⟨21⟩] }
    , { oid := ⟨177⟩, proname := "int4pl", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨23⟩, proargtypes := [⟨23⟩, ⟨23⟩] }
    , { oid := ⟨178⟩, proname := "int24pl", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨23⟩, proargtypes := [⟨21⟩, ⟨23⟩] }
    , { oid := ⟨179⟩, proname := "int42pl", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨23⟩, proargtypes := [⟨23⟩, ⟨21⟩] }
    , { oid := ⟨180⟩, proname := "int2mi", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨21⟩, proargtypes := [⟨21⟩, ⟨21⟩] }
    , { oid := ⟨181⟩, proname := "int4mi", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨23⟩, proargtypes := [⟨23⟩, ⟨23⟩] }
    , { oid := ⟨182⟩, proname := "int24mi", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨23⟩, proargtypes := [⟨21⟩, ⟨23⟩] }
    , { oid := ⟨183⟩, proname := "int42mi", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨23⟩, proargtypes := [⟨23⟩, ⟨21⟩] }
    , { oid := ⟨184⟩, proname := "oideq", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨26⟩, ⟨26⟩] }
    , { oid := ⟨185⟩, proname := "oidne", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨26⟩, ⟨26⟩] }
    , { oid := ⟨186⟩, proname := "box_same", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨603⟩, ⟨603⟩] }
    , { oid := ⟨187⟩, proname := "box_contain", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨603⟩, ⟨603⟩] }
    , { oid := ⟨188⟩, proname := "box_left", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨603⟩, ⟨603⟩] }
    , { oid := ⟨189⟩, proname := "box_overleft", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨603⟩, ⟨603⟩] }
    , { oid := ⟨190⟩, proname := "box_overright", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨603⟩, ⟨603⟩] }
    , { oid := ⟨191⟩, proname := "box_right", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨603⟩, ⟨603⟩] }
    , { oid := ⟨192⟩, proname := "box_contained", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨603⟩, ⟨603⟩] }
    , { oid := ⟨193⟩, proname := "box_contain_pt", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨603⟩, ⟨600⟩] }
    , { oid := ⟨195⟩, proname := "pg_node_tree_in", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨194⟩, proargtypes := [⟨2275⟩] }
    , { oid := ⟨196⟩, proname := "pg_node_tree_out", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨2275⟩, proargtypes := [⟨194⟩] }
    , { oid := ⟨197⟩, proname := "pg_node_tree_recv", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨194⟩, proargtypes := [⟨2281⟩] }
    , { oid := ⟨198⟩, proname := "pg_node_tree_send", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨17⟩, proargtypes := [⟨194⟩] }
    , { oid := ⟨200⟩, proname := "float4in", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨700⟩, proargtypes := [⟨2275⟩] }
    , { oid := ⟨201⟩, proname := "float4out", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨2275⟩, proargtypes := [⟨700⟩] }
    , { oid := ⟨202⟩, proname := "float4mul", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨700⟩, proargtypes := [⟨700⟩, ⟨700⟩] }
    , { oid := ⟨203⟩, proname := "float4div", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨700⟩, proargtypes := [⟨700⟩, ⟨700⟩] }
    , { oid := ⟨204⟩, proname := "float4pl", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨700⟩, proargtypes := [⟨700⟩, ⟨700⟩] }
    , { oid := ⟨205⟩, proname := "float4mi", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨700⟩, proargtypes := [⟨700⟩, ⟨700⟩] }
    , { oid := ⟨206⟩, proname := "float4um", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨700⟩, proargtypes := [⟨700⟩] }
    , { oid := ⟨207⟩, proname := "float4abs", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨700⟩, proargtypes := [⟨700⟩] }
    , { oid := ⟨208⟩, proname := "float4_accum", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨1022⟩, proargtypes := [⟨1022⟩, ⟨700⟩] }
    , { oid := ⟨209⟩, proname := "float4larger", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨700⟩, proargtypes := [⟨700⟩, ⟨700⟩] }
    , { oid := ⟨211⟩, proname := "float4smaller", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨700⟩, proargtypes := [⟨700⟩, ⟨700⟩] }
    , { oid := ⟨212⟩, proname := "int4um", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨23⟩, proargtypes := [⟨23⟩] }
    , { oid := ⟨213⟩, proname := "int2um", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨21⟩, proargtypes := [⟨21⟩] }
    , { oid := ⟨214⟩, proname := "float8in", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨701⟩, proargtypes := [⟨2275⟩] }
    , { oid := ⟨215⟩, proname := "float8out", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨2275⟩, proargtypes := [⟨701⟩] }
    , { oid := ⟨216⟩, proname := "float8mul", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨701⟩, proargtypes := [⟨701⟩, ⟨701⟩] }
    , { oid := ⟨217⟩, proname := "float8div", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨701⟩, proargtypes := [⟨701⟩, ⟨701⟩] }
    , { oid := ⟨218⟩, proname := "float8pl", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨701⟩, proargtypes := [⟨701⟩, ⟨701⟩] }
    , { oid := ⟨219⟩, proname := "float8mi", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨701⟩, proargtypes := [⟨701⟩, ⟨701⟩] }
    , { oid := ⟨220⟩, proname := "float8um", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨701⟩, proargtypes := [⟨701⟩] }
    , { oid := ⟨221⟩, proname := "float8abs", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨701⟩, proargtypes := [⟨701⟩] }
    , { oid := ⟨222⟩, proname := "float8_accum", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨1022⟩, proargtypes := [⟨1022⟩, ⟨701⟩] }
    , { oid := ⟨276⟩, proname := "float8_combine", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨1022⟩, proargtypes := [⟨1022⟩, ⟨1022⟩] }
    , { oid := ⟨223⟩, proname := "float8larger", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨701⟩, proargtypes := [⟨701⟩, ⟨701⟩] }
    , { oid := ⟨224⟩, proname := "float8smaller", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨701⟩, proargtypes := [⟨701⟩, ⟨701⟩] }
    , { oid := ⟨225⟩, proname := "lseg_center", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨600⟩, proargtypes := [⟨601⟩] }
    , { oid := ⟨227⟩, proname := "poly_center", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨600⟩, proargtypes := [⟨604⟩] }
    , { oid := ⟨228⟩, proname := "dround", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨701⟩, proargtypes := [⟨701⟩] }
    , { oid := ⟨229⟩, proname := "dtrunc", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨701⟩, proargtypes := [⟨701⟩] }
    , { oid := ⟨2308⟩, proname := "ceil", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨701⟩, proargtypes := [⟨701⟩] }
    , { oid := ⟨2320⟩, proname := "ceiling", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨701⟩, proargtypes := [⟨701⟩] }
    , { oid := ⟨2309⟩, proname := "floor", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨701⟩, proargtypes := [⟨701⟩] }
    , { oid := ⟨2310⟩, proname := "sign", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨701⟩, proargtypes := [⟨701⟩] }
    , { oid := ⟨230⟩, proname := "dsqrt", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨701⟩, proargtypes := [⟨701⟩] }
    , { oid := ⟨231⟩, proname := "dcbrt", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨701⟩, proargtypes := [⟨701⟩] }
    , { oid := ⟨232⟩, proname := "dpow", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨701⟩, proargtypes := [⟨701⟩, ⟨701⟩] }
    , { oid := ⟨233⟩, proname := "dexp", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨701⟩, proargtypes := [⟨701⟩] }
    , { oid := ⟨234⟩, proname := "dlog1", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨701⟩, proargtypes := [⟨701⟩] }
    , { oid := ⟨235⟩, proname := "float8", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨701⟩, proargtypes := [⟨21⟩] }
    , { oid := ⟨236⟩, proname := "float4", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨700⟩, proargtypes := [⟨21⟩] }
    , { oid := ⟨237⟩, proname := "int2", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨21⟩, proargtypes := [⟨701⟩] }
    , { oid := ⟨238⟩, proname := "int2", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨21⟩, proargtypes := [⟨700⟩] }
    , { oid := ⟨239⟩, proname := "line_distance", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨701⟩, proargtypes := [⟨628⟩, ⟨628⟩] }
    , { oid := ⟨240⟩, proname := "nameeqtext", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨19⟩, ⟨25⟩] }
    , { oid := ⟨241⟩, proname := "namelttext", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨19⟩, ⟨25⟩] }
    , { oid := ⟨242⟩, proname := "nameletext", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨19⟩, ⟨25⟩] }
    , { oid := ⟨243⟩, proname := "namegetext", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨19⟩, ⟨25⟩] }
    , { oid := ⟨244⟩, proname := "namegttext", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨19⟩, ⟨25⟩] }
    , { oid := ⟨245⟩, proname := "namenetext", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨19⟩, ⟨25⟩] }
    , { oid := ⟨246⟩, proname := "btnametextcmp", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨23⟩, proargtypes := [⟨19⟩, ⟨25⟩] }
    , { oid := ⟨247⟩, proname := "texteqname", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨25⟩, ⟨19⟩] }
    , { oid := ⟨248⟩, proname := "textltname", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨25⟩, ⟨19⟩] }
    , { oid := ⟨249⟩, proname := "textlename", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨25⟩, ⟨19⟩] }
    , { oid := ⟨250⟩, proname := "textgename", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨25⟩, ⟨19⟩] }
    , { oid := ⟨251⟩, proname := "textgtname", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨25⟩, ⟨19⟩] }
    , { oid := ⟨252⟩, proname := "textnename", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨25⟩, ⟨19⟩] }
    , { oid := ⟨253⟩, proname := "bttextnamecmp", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨23⟩, proargtypes := [⟨25⟩, ⟨19⟩] }
    , { oid := ⟨266⟩, proname := "nameconcatoid", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨19⟩, proargtypes := [⟨19⟩, ⟨26⟩] }
    , { oid := ⟨274⟩, proname := "timeofday", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨25⟩, proargtypes := [] }
    , { oid := ⟨277⟩, proname := "inter_sl", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨601⟩, ⟨628⟩] }
    , { oid := ⟨278⟩, proname := "inter_lb", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨628⟩, ⟨603⟩] }
    , { oid := ⟨279⟩, proname := "float48mul", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨701⟩, proargtypes := [⟨700⟩, ⟨701⟩] }
    , { oid := ⟨280⟩, proname := "float48div", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨701⟩, proargtypes := [⟨700⟩, ⟨701⟩] }
    , { oid := ⟨281⟩, proname := "float48pl", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨701⟩, proargtypes := [⟨700⟩, ⟨701⟩] }
    , { oid := ⟨282⟩, proname := "float48mi", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨701⟩, proargtypes := [⟨700⟩, ⟨701⟩] }
    , { oid := ⟨283⟩, proname := "float84mul", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨701⟩, proargtypes := [⟨701⟩, ⟨700⟩] }
    , { oid := ⟨284⟩, proname := "float84div", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨701⟩, proargtypes := [⟨701⟩, ⟨700⟩] }
    , { oid := ⟨285⟩, proname := "float84pl", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨701⟩, proargtypes := [⟨701⟩, ⟨700⟩] }
    , { oid := ⟨286⟩, proname := "float84mi", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨701⟩, proargtypes := [⟨701⟩, ⟨700⟩] }
    , { oid := ⟨287⟩, proname := "float4eq", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨700⟩, ⟨700⟩] }
    , { oid := ⟨288⟩, proname := "float4ne", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨700⟩, ⟨700⟩] }
    , { oid := ⟨289⟩, proname := "float4lt", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨700⟩, ⟨700⟩] }
    , { oid := ⟨290⟩, proname := "float4le", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨700⟩, ⟨700⟩] }
    , { oid := ⟨291⟩, proname := "float4gt", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨700⟩, ⟨700⟩] }
    , { oid := ⟨292⟩, proname := "float4ge", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨700⟩, ⟨700⟩] }
    , { oid := ⟨293⟩, proname := "float8eq", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨701⟩, ⟨701⟩] }
    , { oid := ⟨294⟩, proname := "float8ne", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨701⟩, ⟨701⟩] }
    , { oid := ⟨295⟩, proname := "float8lt", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨701⟩, ⟨701⟩] }
    , { oid := ⟨296⟩, proname := "float8le", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨701⟩, ⟨701⟩] }
    , { oid := ⟨297⟩, proname := "float8gt", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨701⟩, ⟨701⟩] }
    , { oid := ⟨298⟩, proname := "float8ge", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨701⟩, ⟨701⟩] }
    , { oid := ⟨299⟩, proname := "float48eq", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨700⟩, ⟨701⟩] }
    , { oid := ⟨300⟩, proname := "float48ne", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨700⟩, ⟨701⟩] }
    , { oid := ⟨301⟩, proname := "float48lt", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨700⟩, ⟨701⟩] }
    , { oid := ⟨302⟩, proname := "float48le", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨700⟩, ⟨701⟩] }
    , { oid := ⟨303⟩, proname := "float48gt", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨700⟩, ⟨701⟩] }
    , { oid := ⟨304⟩, proname := "float48ge", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨700⟩, ⟨701⟩] }
    , { oid := ⟨305⟩, proname := "float84eq", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨701⟩, ⟨700⟩] }
    , { oid := ⟨306⟩, proname := "float84ne", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨701⟩, ⟨700⟩] }
    , { oid := ⟨307⟩, proname := "float84lt", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨701⟩, ⟨700⟩] }
    , { oid := ⟨308⟩, proname := "float84le", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨701⟩, ⟨700⟩] }
    , { oid := ⟨309⟩, proname := "float84gt", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨701⟩, ⟨700⟩] }
    , { oid := ⟨310⟩, proname := "float84ge", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨701⟩, ⟨700⟩] }
    , { oid := ⟨320⟩, proname := "width_bucket", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨23⟩, proargtypes := [⟨701⟩, ⟨701⟩, ⟨701⟩, ⟨23⟩] }
    , { oid := ⟨311⟩, proname := "float8", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨701⟩, proargtypes := [⟨700⟩] }
    , { oid := ⟨312⟩, proname := "float4", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨700⟩, proargtypes := [⟨701⟩] }
    , { oid := ⟨313⟩, proname := "int4", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨23⟩, proargtypes := [⟨21⟩] }
    , { oid := ⟨314⟩, proname := "int2", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨21⟩, proargtypes := [⟨23⟩] }
    , { oid := ⟨316⟩, proname := "float8", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨701⟩, proargtypes := [⟨23⟩] }
    , { oid := ⟨317⟩, proname := "int4", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨23⟩, proargtypes := [⟨701⟩] }
    , { oid := ⟨318⟩, proname := "float4", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨700⟩, proargtypes := [⟨23⟩] }
    , { oid := ⟨319⟩, proname := "int4", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨23⟩, proargtypes := [⟨700⟩] }
    , { oid := ⟨3⟩, proname := "heap_tableam_handler", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨269⟩, proargtypes := [⟨2281⟩] }
    , { oid := ⟨330⟩, proname := "bthandler", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨325⟩, proargtypes := [⟨2281⟩] }
    , { oid := ⟨331⟩, proname := "hashhandler", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨325⟩, proargtypes := [⟨2281⟩] }
    , { oid := ⟨332⟩, proname := "gisthandler", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨325⟩, proargtypes := [⟨2281⟩] }
    , { oid := ⟨333⟩, proname := "ginhandler", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨325⟩, proargtypes := [⟨2281⟩] }
    , { oid := ⟨334⟩, proname := "spghandler", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨325⟩, proargtypes := [⟨2281⟩] }
    , { oid := ⟨335⟩, proname := "brinhandler", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨325⟩, proargtypes := [⟨2281⟩] }
    , { oid := ⟨3952⟩, proname := "brin_summarize_new_values", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨23⟩, proargtypes := [⟨2205⟩] }
    , { oid := ⟨3999⟩, proname := "brin_summarize_range", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨23⟩, proargtypes := [⟨2205⟩, ⟨20⟩] }
    , { oid := ⟨4014⟩, proname := "brin_desummarize_range", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨2278⟩, proargtypes := [⟨2205⟩, ⟨20⟩] }
    , { oid := ⟨338⟩, proname := "amvalidate", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨26⟩] }
    , { oid := ⟨636⟩, proname := "pg_indexam_has_property", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨16⟩, proargtypes := [⟨26⟩, ⟨25⟩] }
    , { oid := ⟨637⟩, proname := "pg_index_has_property", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨16⟩, proargtypes := [⟨2205⟩, ⟨25⟩] }
    , { oid := ⟨638⟩, proname := "pg_index_column_has_property", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨16⟩, proargtypes := [⟨2205⟩, ⟨23⟩, ⟨25⟩] }
    , { oid := ⟨676⟩, proname := "pg_indexam_progress_phasename", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨25⟩, proargtypes := [⟨26⟩, ⟨20⟩] }
    , { oid := ⟨339⟩, proname := "poly_same", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨604⟩, ⟨604⟩] }
    , { oid := ⟨340⟩, proname := "poly_contain", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨604⟩, ⟨604⟩] }
    , { oid := ⟨341⟩, proname := "poly_left", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨604⟩, ⟨604⟩] }
    , { oid := ⟨342⟩, proname := "poly_overleft", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨604⟩, ⟨604⟩] }
    , { oid := ⟨343⟩, proname := "poly_overright", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨604⟩, ⟨604⟩] }
    , { oid := ⟨344⟩, proname := "poly_right", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨604⟩, ⟨604⟩] }
    , { oid := ⟨345⟩, proname := "poly_contained", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨604⟩, ⟨604⟩] }
    , { oid := ⟨346⟩, proname := "poly_overlap", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨604⟩, ⟨604⟩] }
    , { oid := ⟨347⟩, proname := "poly_in", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨604⟩, proargtypes := [⟨2275⟩] }
    , { oid := ⟨348⟩, proname := "poly_out", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨2275⟩, proargtypes := [⟨604⟩] }
    , { oid := ⟨350⟩, proname := "btint2cmp", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨23⟩, proargtypes := [⟨21⟩, ⟨21⟩] }
    , { oid := ⟨3129⟩, proname := "btint2sortsupport", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨2278⟩, proargtypes := [⟨2281⟩] }
    , { oid := ⟨351⟩, proname := "btint4cmp", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨23⟩, proargtypes := [⟨23⟩, ⟨23⟩] }
    , { oid := ⟨3130⟩, proname := "btint4sortsupport", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨2278⟩, proargtypes := [⟨2281⟩] }
    , { oid := ⟨842⟩, proname := "btint8cmp", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨23⟩, proargtypes := [⟨20⟩, ⟨20⟩] }
    , { oid := ⟨3131⟩, proname := "btint8sortsupport", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨2278⟩, proargtypes := [⟨2281⟩] }
    , { oid := ⟨354⟩, proname := "btfloat4cmp", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨23⟩, proargtypes := [⟨700⟩, ⟨700⟩] }
    , { oid := ⟨3132⟩, proname := "btfloat4sortsupport", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨2278⟩, proargtypes := [⟨2281⟩] }
    , { oid := ⟨355⟩, proname := "btfloat8cmp", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨23⟩, proargtypes := [⟨701⟩, ⟨701⟩] }
    , { oid := ⟨3133⟩, proname := "btfloat8sortsupport", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨2278⟩, proargtypes := [⟨2281⟩] }
    , { oid := ⟨356⟩, proname := "btoidcmp", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨23⟩, proargtypes := [⟨26⟩, ⟨26⟩] }
    , { oid := ⟨3134⟩, proname := "btoidsortsupport", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨2278⟩, proargtypes := [⟨2281⟩] }
    , { oid := ⟨404⟩, proname := "btoidvectorcmp", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨23⟩, proargtypes := [⟨30⟩, ⟨30⟩] }
    , { oid := ⟨358⟩, proname := "btcharcmp", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨23⟩, proargtypes := [⟨18⟩, ⟨18⟩] }
    , { oid := ⟨359⟩, proname := "btnamecmp", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨23⟩, proargtypes := [⟨19⟩, ⟨19⟩] }
    , { oid := ⟨3135⟩, proname := "btnamesortsupport", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨2278⟩, proargtypes := [⟨2281⟩] }
    , { oid := ⟨360⟩, proname := "bttextcmp", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨23⟩, proargtypes := [⟨25⟩, ⟨25⟩] }
    , { oid := ⟨3255⟩, proname := "bttextsortsupport", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨2278⟩, proargtypes := [⟨2281⟩] }
    , { oid := ⟨5050⟩, proname := "btvarstrequalimage", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨26⟩] }
    , { oid := ⟨377⟩, proname := "cash_cmp", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨23⟩, proargtypes := [⟨790⟩, ⟨790⟩] }
    , { oid := ⟨382⟩, proname := "btarraycmp", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨23⟩, proargtypes := [⟨2277⟩, ⟨2277⟩] }
    , { oid := ⟨4126⟩, proname := "in_range", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨20⟩, ⟨20⟩, ⟨20⟩, ⟨16⟩, ⟨16⟩] }
    , { oid := ⟨4127⟩, proname := "in_range", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨23⟩, ⟨23⟩, ⟨20⟩, ⟨16⟩, ⟨16⟩] }
    , { oid := ⟨4128⟩, proname := "in_range", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨23⟩, ⟨23⟩, ⟨23⟩, ⟨16⟩, ⟨16⟩] }
    , { oid := ⟨4129⟩, proname := "in_range", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨23⟩, ⟨23⟩, ⟨21⟩, ⟨16⟩, ⟨16⟩] }
    , { oid := ⟨4130⟩, proname := "in_range", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨21⟩, ⟨21⟩, ⟨20⟩, ⟨16⟩, ⟨16⟩] }
    , { oid := ⟨4131⟩, proname := "in_range", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨21⟩, ⟨21⟩, ⟨23⟩, ⟨16⟩, ⟨16⟩] }
    , { oid := ⟨4132⟩, proname := "in_range", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨21⟩, ⟨21⟩, ⟨21⟩, ⟨16⟩, ⟨16⟩] }
    , { oid := ⟨4139⟩, proname := "in_range", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨701⟩, ⟨701⟩, ⟨701⟩, ⟨16⟩, ⟨16⟩] }
    , { oid := ⟨4140⟩, proname := "in_range", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨700⟩, ⟨700⟩, ⟨701⟩, ⟨16⟩, ⟨16⟩] }
    , { oid := ⟨4141⟩, proname := "in_range", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨1700⟩, ⟨1700⟩, ⟨1700⟩, ⟨16⟩, ⟨16⟩] }
    , { oid := ⟨361⟩, proname := "lseg_distance", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨701⟩, proargtypes := [⟨601⟩, ⟨601⟩] }
    , { oid := ⟨362⟩, proname := "lseg_interpt", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨600⟩, proargtypes := [⟨601⟩, ⟨601⟩] }
    , { oid := ⟨363⟩, proname := "dist_ps", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨701⟩, proargtypes := [⟨600⟩, ⟨601⟩] }
    , { oid := ⟨380⟩, proname := "dist_sp", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨701⟩, proargtypes := [⟨601⟩, ⟨600⟩] }
    , { oid := ⟨364⟩, proname := "dist_pb", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨701⟩, proargtypes := [⟨600⟩, ⟨603⟩] }
    , { oid := ⟨357⟩, proname := "dist_bp", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨701⟩, proargtypes := [⟨603⟩, ⟨600⟩] }
    , { oid := ⟨365⟩, proname := "dist_sb", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨701⟩, proargtypes := [⟨601⟩, ⟨603⟩] }
    , { oid := ⟨381⟩, proname := "dist_bs", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨701⟩, proargtypes := [⟨603⟩, ⟨601⟩] }
    , { oid := ⟨366⟩, proname := "close_ps", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨600⟩, proargtypes := [⟨600⟩, ⟨601⟩] }
    , { oid := ⟨367⟩, proname := "close_pb", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨600⟩, proargtypes := [⟨600⟩, ⟨603⟩] }
    , { oid := ⟨368⟩, proname := "close_sb", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨600⟩, proargtypes := [⟨601⟩, ⟨603⟩] }
    , { oid := ⟨369⟩, proname := "on_ps", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨600⟩, ⟨601⟩] }
    , { oid := ⟨370⟩, proname := "path_distance", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨701⟩, proargtypes := [⟨602⟩, ⟨602⟩] }
    , { oid := ⟨371⟩, proname := "dist_ppath", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨701⟩, proargtypes := [⟨600⟩, ⟨602⟩] }
    , { oid := ⟨421⟩, proname := "dist_pathp", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨701⟩, proargtypes := [⟨602⟩, ⟨600⟩] }
    , { oid := ⟨372⟩, proname := "on_sb", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨601⟩, ⟨603⟩] }
    , { oid := ⟨373⟩, proname := "inter_sb", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨601⟩, ⟨603⟩] }
    , { oid := ⟨401⟩, proname := "text", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨25⟩, proargtypes := [⟨1042⟩] }
    , { oid := ⟨406⟩, proname := "text", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨25⟩, proargtypes := [⟨19⟩] }
    , { oid := ⟨407⟩, proname := "name", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨19⟩, proargtypes := [⟨25⟩] }
    , { oid := ⟨408⟩, proname := "bpchar", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨1042⟩, proargtypes := [⟨19⟩] }
    , { oid := ⟨409⟩, proname := "name", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨19⟩, proargtypes := [⟨1042⟩] }
    , { oid := ⟨449⟩, proname := "hashint2", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨23⟩, proargtypes := [⟨21⟩] }
    , { oid := ⟨441⟩, proname := "hashint2extended", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨20⟩, proargtypes := [⟨21⟩, ⟨20⟩] }
    , { oid := ⟨450⟩, proname := "hashint4", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨23⟩, proargtypes := [⟨23⟩] }
    , { oid := ⟨425⟩, proname := "hashint4extended", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨20⟩, proargtypes := [⟨23⟩, ⟨20⟩] }
    , { oid := ⟨949⟩, proname := "hashint8", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨23⟩, proargtypes := [⟨20⟩] }
    , { oid := ⟨442⟩, proname := "hashint8extended", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨20⟩, proargtypes := [⟨20⟩, ⟨20⟩] }
    , { oid := ⟨451⟩, proname := "hashfloat4", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨23⟩, proargtypes := [⟨700⟩] }
    , { oid := ⟨443⟩, proname := "hashfloat4extended", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨20⟩, proargtypes := [⟨700⟩, ⟨20⟩] }
    , { oid := ⟨452⟩, proname := "hashfloat8", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨23⟩, proargtypes := [⟨701⟩] }
    , { oid := ⟨444⟩, proname := "hashfloat8extended", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨20⟩, proargtypes := [⟨701⟩, ⟨20⟩] }
    , { oid := ⟨453⟩, proname := "hashoid", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨23⟩, proargtypes := [⟨26⟩] }
    , { oid := ⟨445⟩, proname := "hashoidextended", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨20⟩, proargtypes := [⟨26⟩, ⟨20⟩] }
    , { oid := ⟨454⟩, proname := "hashchar", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨23⟩, proargtypes := [⟨18⟩] }
    , { oid := ⟨446⟩, proname := "hashcharextended", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨20⟩, proargtypes := [⟨18⟩, ⟨20⟩] }
    , { oid := ⟨455⟩, proname := "hashname", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨23⟩, proargtypes := [⟨19⟩] }
    , { oid := ⟨447⟩, proname := "hashnameextended", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨20⟩, proargtypes := [⟨19⟩, ⟨20⟩] }
    , { oid := ⟨400⟩, proname := "hashtext", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨23⟩, proargtypes := [⟨25⟩] }
    , { oid := ⟨448⟩, proname := "hashtextextended", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨20⟩, proargtypes := [⟨25⟩, ⟨20⟩] }
    , { oid := ⟨456⟩, proname := "hashvarlena", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨23⟩, proargtypes := [⟨2281⟩] }
    , { oid := ⟨772⟩, proname := "hashvarlenaextended", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨20⟩, proargtypes := [⟨2281⟩, ⟨20⟩] }
    , { oid := ⟨457⟩, proname := "hashoidvector", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨23⟩, proargtypes := [⟨30⟩] }
    , { oid := ⟨776⟩, proname := "hashoidvectorextended", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨20⟩, proargtypes := [⟨30⟩, ⟨20⟩] }
    , { oid := ⟨329⟩, proname := "hash_aclitem", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨23⟩, proargtypes := [⟨1033⟩] }
    , { oid := ⟨777⟩, proname := "hash_aclitem_extended", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨20⟩, proargtypes := [⟨1033⟩, ⟨20⟩] }
    , { oid := ⟨399⟩, proname := "hashmacaddr", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨23⟩, proargtypes := [⟨829⟩] }
    , { oid := ⟨778⟩, proname := "hashmacaddrextended", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨20⟩, proargtypes := [⟨829⟩, ⟨20⟩] }
    , { oid := ⟨422⟩, proname := "hashinet", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨23⟩, proargtypes := [⟨869⟩] }
    , { oid := ⟨779⟩, proname := "hashinetextended", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨20⟩, proargtypes := [⟨869⟩, ⟨20⟩] }
    , { oid := ⟨432⟩, proname := "hash_numeric", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨23⟩, proargtypes := [⟨1700⟩] }
    , { oid := ⟨780⟩, proname := "hash_numeric_extended", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨20⟩, proargtypes := [⟨1700⟩, ⟨20⟩] }
    , { oid := ⟨328⟩, proname := "hashmacaddr8", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨23⟩, proargtypes := [⟨774⟩] }
    , { oid := ⟨781⟩, proname := "hashmacaddr8extended", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨20⟩, proargtypes := [⟨774⟩, ⟨20⟩] }
    , { oid := ⟨438⟩, proname := "num_nulls", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨23⟩, proargtypes := [⟨2276⟩] }
    , { oid := ⟨440⟩, proname := "num_nonnulls", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨23⟩, proargtypes := [⟨2276⟩] }
    , { oid := ⟨458⟩, proname := "text_larger", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨25⟩, proargtypes := [⟨25⟩, ⟨25⟩] }
    , { oid := ⟨459⟩, proname := "text_smaller", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨25⟩, proargtypes := [⟨25⟩, ⟨25⟩] }
    , { oid := ⟨460⟩, proname := "int8in", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨20⟩, proargtypes := [⟨2275⟩] }
    , { oid := ⟨461⟩, proname := "int8out", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨2275⟩, proargtypes := [⟨20⟩] }
    , { oid := ⟨462⟩, proname := "int8um", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨20⟩, proargtypes := [⟨20⟩] }
    , { oid := ⟨463⟩, proname := "int8pl", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨20⟩, proargtypes := [⟨20⟩, ⟨20⟩] }
    , { oid := ⟨464⟩, proname := "int8mi", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨20⟩, proargtypes := [⟨20⟩, ⟨20⟩] }
    , { oid := ⟨465⟩, proname := "int8mul", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨20⟩, proargtypes := [⟨20⟩, ⟨20⟩] }
    , { oid := ⟨466⟩, proname := "int8div", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨20⟩, proargtypes := [⟨20⟩, ⟨20⟩] }
    , { oid := ⟨467⟩, proname := "int8eq", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨20⟩, ⟨20⟩] }
    , { oid := ⟨468⟩, proname := "int8ne", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨20⟩, ⟨20⟩] }
    , { oid := ⟨469⟩, proname := "int8lt", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨20⟩, ⟨20⟩] }
    , { oid := ⟨470⟩, proname := "int8gt", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨20⟩, ⟨20⟩] }
    , { oid := ⟨471⟩, proname := "int8le", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨20⟩, ⟨20⟩] }
    , { oid := ⟨472⟩, proname := "int8ge", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨20⟩, ⟨20⟩] }
    , { oid := ⟨474⟩, proname := "int84eq", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨20⟩, ⟨23⟩] }
    , { oid := ⟨475⟩, proname := "int84ne", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨20⟩, ⟨23⟩] }
    , { oid := ⟨476⟩, proname := "int84lt", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨20⟩, ⟨23⟩] }
    , { oid := ⟨477⟩, proname := "int84gt", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨20⟩, ⟨23⟩] }
    , { oid := ⟨478⟩, proname := "int84le", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨20⟩, ⟨23⟩] }
    , { oid := ⟨479⟩, proname := "int84ge", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨20⟩, ⟨23⟩] }
    , { oid := ⟨480⟩, proname := "int4", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨23⟩, proargtypes := [⟨20⟩] }
    , { oid := ⟨481⟩, proname := "int8", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨20⟩, proargtypes := [⟨23⟩] }
    , { oid := ⟨482⟩, proname := "float8", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨701⟩, proargtypes := [⟨20⟩] }
    , { oid := ⟨483⟩, proname := "int8", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨20⟩, proargtypes := [⟨701⟩] }
    , { oid := ⟨626⟩, proname := "hash_array", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨23⟩, proargtypes := [⟨2277⟩] }
    , { oid := ⟨782⟩, proname := "hash_array_extended", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨20⟩, proargtypes := [⟨2277⟩, ⟨20⟩] }
    , { oid := ⟨652⟩, proname := "float4", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨700⟩, proargtypes := [⟨20⟩] }
    , { oid := ⟨653⟩, proname := "int8", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨20⟩, proargtypes := [⟨700⟩] }
    , { oid := ⟨714⟩, proname := "int2", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨21⟩, proargtypes := [⟨20⟩] }
    , { oid := ⟨754⟩, proname := "int8", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨20⟩, proargtypes := [⟨21⟩] }
    , { oid := ⟨655⟩, proname := "namelt", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨19⟩, ⟨19⟩] }
    , { oid := ⟨656⟩, proname := "namele", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨19⟩, ⟨19⟩] }
    , { oid := ⟨657⟩, proname := "namegt", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨19⟩, ⟨19⟩] }
    , { oid := ⟨658⟩, proname := "namege", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨19⟩, ⟨19⟩] }
    , { oid := ⟨659⟩, proname := "namene", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨19⟩, ⟨19⟩] }
    , { oid := ⟨668⟩, proname := "bpchar", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨1042⟩, proargtypes := [⟨1042⟩, ⟨23⟩, ⟨16⟩] }
    , { oid := ⟨3097⟩, proname := "varchar_support", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨2281⟩, proargtypes := [⟨2281⟩] }
    , { oid := ⟨669⟩, proname := "varchar", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨1043⟩, proargtypes := [⟨1043⟩, ⟨23⟩, ⟨16⟩] }
    , { oid := ⟨619⟩, proname := "oidvectorne", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨30⟩, ⟨30⟩] }
    , { oid := ⟨677⟩, proname := "oidvectorlt", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨30⟩, ⟨30⟩] }
    , { oid := ⟨678⟩, proname := "oidvectorle", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨30⟩, ⟨30⟩] }
    , { oid := ⟨679⟩, proname := "oidvectoreq", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨30⟩, ⟨30⟩] }
    , { oid := ⟨680⟩, proname := "oidvectorge", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨30⟩, ⟨30⟩] }
    , { oid := ⟨681⟩, proname := "oidvectorgt", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨30⟩, ⟨30⟩] }
    , { oid := ⟨710⟩, proname := "getpgusername", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨19⟩, proargtypes := [] }
    , { oid := ⟨716⟩, proname := "oidlt", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨26⟩, ⟨26⟩] }
    , { oid := ⟨717⟩, proname := "oidle", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨26⟩, ⟨26⟩] }
    , { oid := ⟨720⟩, proname := "octet_length", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨23⟩, proargtypes := [⟨17⟩] }
    , { oid := ⟨721⟩, proname := "get_byte", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨23⟩, proargtypes := [⟨17⟩, ⟨23⟩] }
    , { oid := ⟨722⟩, proname := "set_byte", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨17⟩, proargtypes := [⟨17⟩, ⟨23⟩, ⟨23⟩] }
    , { oid := ⟨723⟩, proname := "get_bit", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨23⟩, proargtypes := [⟨17⟩, ⟨20⟩] }
    , { oid := ⟨724⟩, proname := "set_bit", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨17⟩, proargtypes := [⟨17⟩, ⟨20⟩, ⟨23⟩] }
    , { oid := ⟨749⟩, proname := "overlay", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨17⟩, proargtypes := [⟨17⟩, ⟨17⟩, ⟨23⟩, ⟨23⟩] }
    , { oid := ⟨752⟩, proname := "overlay", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨17⟩, proargtypes := [⟨17⟩, ⟨17⟩, ⟨23⟩] }
    , { oid := ⟨6163⟩, proname := "bit_count", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨20⟩, proargtypes := [⟨17⟩] }
    , { oid := ⟨725⟩, proname := "dist_pl", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨701⟩, proargtypes := [⟨600⟩, ⟨628⟩] }
    , { oid := ⟨702⟩, proname := "dist_lp", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨701⟩, proargtypes := [⟨628⟩, ⟨600⟩] }
    , { oid := ⟨727⟩, proname := "dist_sl", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨701⟩, proargtypes := [⟨601⟩, ⟨628⟩] }
    , { oid := ⟨704⟩, proname := "dist_ls", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨701⟩, proargtypes := [⟨628⟩, ⟨601⟩] }
    , { oid := ⟨728⟩, proname := "dist_cpoly", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨701⟩, proargtypes := [⟨718⟩, ⟨604⟩] }
    , { oid := ⟨785⟩, proname := "dist_polyc", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨701⟩, proargtypes := [⟨604⟩, ⟨718⟩] }
    , { oid := ⟨729⟩, proname := "poly_distance", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨701⟩, proargtypes := [⟨604⟩, ⟨604⟩] }
    , { oid := ⟨3275⟩, proname := "dist_ppoly", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨701⟩, proargtypes := [⟨600⟩, ⟨604⟩] }
    , { oid := ⟨3292⟩, proname := "dist_polyp", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨701⟩, proargtypes := [⟨604⟩, ⟨600⟩] }
    , { oid := ⟨3290⟩, proname := "dist_cpoint", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨701⟩, proargtypes := [⟨718⟩, ⟨600⟩] }
    , { oid := ⟨740⟩, proname := "text_lt", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨25⟩, ⟨25⟩] }
    , { oid := ⟨741⟩, proname := "text_le", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨25⟩, ⟨25⟩] }
    , { oid := ⟨742⟩, proname := "text_gt", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨25⟩, ⟨25⟩] }
    , { oid := ⟨743⟩, proname := "text_ge", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨25⟩, ⟨25⟩] }
    , { oid := ⟨745⟩, proname := "current_user", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨19⟩, proargtypes := [] }
    , { oid := ⟨746⟩, proname := "session_user", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨19⟩, proargtypes := [] }
    , { oid := ⟨6311⟩, proname := "system_user", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨25⟩, proargtypes := [] }
    , { oid := ⟨744⟩, proname := "array_eq", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨2277⟩, ⟨2277⟩] }
    , { oid := ⟨390⟩, proname := "array_ne", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨2277⟩, ⟨2277⟩] }
    , { oid := ⟨391⟩, proname := "array_lt", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨2277⟩, ⟨2277⟩] }
    , { oid := ⟨392⟩, proname := "array_gt", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨2277⟩, ⟨2277⟩] }
    , { oid := ⟨393⟩, proname := "array_le", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨2277⟩, ⟨2277⟩] }
    , { oid := ⟨396⟩, proname := "array_ge", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨2277⟩, ⟨2277⟩] }
    , { oid := ⟨747⟩, proname := "array_dims", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨25⟩, proargtypes := [⟨2277⟩] }
    , { oid := ⟨748⟩, proname := "array_ndims", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨23⟩, proargtypes := [⟨2277⟩] }
    , { oid := ⟨750⟩, proname := "array_in", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨2277⟩, proargtypes := [⟨2275⟩, ⟨26⟩, ⟨23⟩] }
    , { oid := ⟨751⟩, proname := "array_out", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨2275⟩, proargtypes := [⟨2277⟩] }
    , { oid := ⟨2091⟩, proname := "array_lower", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨23⟩, proargtypes := [⟨2277⟩, ⟨23⟩] }
    , { oid := ⟨2092⟩, proname := "array_upper", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨23⟩, proargtypes := [⟨2277⟩, ⟨23⟩] }
    , { oid := ⟨2176⟩, proname := "array_length", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨23⟩, proargtypes := [⟨2277⟩, ⟨23⟩] }
    , { oid := ⟨3179⟩, proname := "cardinality", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨23⟩, proargtypes := [⟨2277⟩] }
    , { oid := ⟨378⟩, proname := "array_append", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨5078⟩, proargtypes := [⟨5078⟩, ⟨5077⟩] }
    , { oid := ⟨379⟩, proname := "array_prepend", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨5078⟩, proargtypes := [⟨5077⟩, ⟨5078⟩] }
    , { oid := ⟨383⟩, proname := "array_cat", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨5078⟩, proargtypes := [⟨5078⟩, ⟨5078⟩] }
    , { oid := ⟨394⟩, proname := "string_to_array", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨1009⟩, proargtypes := [⟨25⟩, ⟨25⟩] }
    , { oid := ⟨376⟩, proname := "string_to_array", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨1009⟩, proargtypes := [⟨25⟩, ⟨25⟩, ⟨25⟩] }
    , { oid := ⟨6160⟩, proname := "string_to_table", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨25⟩, proargtypes := [⟨25⟩, ⟨25⟩] }
    , { oid := ⟨6161⟩, proname := "string_to_table", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨25⟩, proargtypes := [⟨25⟩, ⟨25⟩, ⟨25⟩] }
    , { oid := ⟨395⟩, proname := "array_to_string", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨25⟩, proargtypes := [⟨2277⟩, ⟨25⟩] }
    , { oid := ⟨384⟩, proname := "array_to_string", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨25⟩, proargtypes := [⟨2277⟩, ⟨25⟩, ⟨25⟩] }
    , { oid := ⟨515⟩, proname := "array_larger", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨2277⟩, proargtypes := [⟨2277⟩, ⟨2277⟩] }
    , { oid := ⟨516⟩, proname := "array_smaller", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨2277⟩, proargtypes := [⟨2277⟩, ⟨2277⟩] }
    , { oid := ⟨3277⟩, proname := "array_position", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨23⟩, proargtypes := [⟨5078⟩, ⟨5077⟩] }
    , { oid := ⟨3278⟩, proname := "array_position", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨23⟩, proargtypes := [⟨5078⟩, ⟨5077⟩, ⟨23⟩] }
    , { oid := ⟨3279⟩, proname := "array_positions", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨1007⟩, proargtypes := [⟨5078⟩, ⟨5077⟩] }
    , { oid := ⟨1191⟩, proname := "generate_subscripts", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨23⟩, proargtypes := [⟨2277⟩, ⟨23⟩, ⟨16⟩] }
    , { oid := ⟨1192⟩, proname := "generate_subscripts", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨23⟩, proargtypes := [⟨2277⟩, ⟨23⟩] }
    , { oid := ⟨1193⟩, proname := "array_fill", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨2277⟩, proargtypes := [⟨2283⟩, ⟨1007⟩] }
    , { oid := ⟨1286⟩, proname := "array_fill", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨2277⟩, proargtypes := [⟨2283⟩, ⟨1007⟩, ⟨1007⟩] }
    , { oid := ⟨2331⟩, proname := "unnest", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨2283⟩, proargtypes := [⟨2277⟩] }
    , { oid := ⟨3996⟩, proname := "array_unnest_support", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨2281⟩, proargtypes := [⟨2281⟩] }
    , { oid := ⟨3167⟩, proname := "array_remove", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨5078⟩, proargtypes := [⟨5078⟩, ⟨5077⟩] }
    , { oid := ⟨3168⟩, proname := "array_replace", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨5078⟩, proargtypes := [⟨5078⟩, ⟨5077⟩, ⟨5077⟩] }
    , { oid := ⟨2333⟩, proname := "array_agg_transfn", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨2281⟩, proargtypes := [⟨2281⟩, ⟨2776⟩] }
    , { oid := ⟨6293⟩, proname := "array_agg_combine", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨2281⟩, proargtypes := [⟨2281⟩, ⟨2281⟩] }
    , { oid := ⟨6294⟩, proname := "array_agg_serialize", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨17⟩, proargtypes := [⟨2281⟩] }
    , { oid := ⟨6295⟩, proname := "array_agg_deserialize", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨2281⟩, proargtypes := [⟨17⟩, ⟨2281⟩] }
    , { oid := ⟨2334⟩, proname := "array_agg_finalfn", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨2277⟩, proargtypes := [⟨2281⟩, ⟨2776⟩] }
    , { oid := ⟨2335⟩, proname := "array_agg", pronamespace := pgCatalogNamespace.oid, prokind := .aggregate, prosecdef := false, provolatile := .volatile, prorettype := ⟨2277⟩, proargtypes := [⟨2776⟩] }
    , { oid := ⟨4051⟩, proname := "array_agg_array_transfn", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨2281⟩, proargtypes := [⟨2281⟩, ⟨2277⟩] }
    , { oid := ⟨6296⟩, proname := "array_agg_array_combine", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨2281⟩, proargtypes := [⟨2281⟩, ⟨2281⟩] }
    , { oid := ⟨6297⟩, proname := "array_agg_array_serialize", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨17⟩, proargtypes := [⟨2281⟩] }
    , { oid := ⟨6298⟩, proname := "array_agg_array_deserialize", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨2281⟩, proargtypes := [⟨17⟩, ⟨2281⟩] }
    , { oid := ⟨4052⟩, proname := "array_agg_array_finalfn", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨2277⟩, proargtypes := [⟨2281⟩, ⟨2277⟩] }
    , { oid := ⟨4053⟩, proname := "array_agg", pronamespace := pgCatalogNamespace.oid, prokind := .aggregate, prosecdef := false, provolatile := .volatile, prorettype := ⟨2277⟩, proargtypes := [⟨2277⟩] }
    , { oid := ⟨3218⟩, proname := "width_bucket", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨23⟩, proargtypes := [⟨5077⟩, ⟨5078⟩] }
    , { oid := ⟨6172⟩, proname := "trim_array", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨2277⟩, proargtypes := [⟨2277⟩, ⟨23⟩] }
    , { oid := ⟨6215⟩, proname := "array_shuffle", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨2277⟩, proargtypes := [⟨2277⟩] }
    , { oid := ⟨6216⟩, proname := "array_sample", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨2277⟩, proargtypes := [⟨2277⟩, ⟨23⟩] }
    , { oid := ⟨3816⟩, proname := "array_typanalyze", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨16⟩, proargtypes := [⟨2281⟩] }
    , { oid := ⟨3817⟩, proname := "arraycontsel", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨701⟩, proargtypes := [⟨2281⟩, ⟨26⟩, ⟨2281⟩, ⟨23⟩] }
    , { oid := ⟨3818⟩, proname := "arraycontjoinsel", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨701⟩, proargtypes := [⟨2281⟩, ⟨26⟩, ⟨2281⟩, ⟨21⟩, ⟨2281⟩] }
    , { oid := ⟨764⟩, proname := "lo_import", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨26⟩, proargtypes := [⟨25⟩] }
    , { oid := ⟨767⟩, proname := "lo_import", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨26⟩, proargtypes := [⟨25⟩, ⟨26⟩] }
    , { oid := ⟨765⟩, proname := "lo_export", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨23⟩, proargtypes := [⟨26⟩, ⟨25⟩] }
    , { oid := ⟨766⟩, proname := "int4inc", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨23⟩, proargtypes := [⟨23⟩] }
    , { oid := ⟨768⟩, proname := "int4larger", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨23⟩, proargtypes := [⟨23⟩, ⟨23⟩] }
    , { oid := ⟨769⟩, proname := "int4smaller", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨23⟩, proargtypes := [⟨23⟩, ⟨23⟩] }
    , { oid := ⟨770⟩, proname := "int2larger", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨21⟩, proargtypes := [⟨21⟩, ⟨21⟩] }
    , { oid := ⟨771⟩, proname := "int2smaller", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨21⟩, proargtypes := [⟨21⟩, ⟨21⟩] }
    , { oid := ⟨846⟩, proname := "cash_mul_flt4", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨790⟩, proargtypes := [⟨790⟩, ⟨700⟩] }
    , { oid := ⟨847⟩, proname := "cash_div_flt4", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨790⟩, proargtypes := [⟨790⟩, ⟨700⟩] }
    , { oid := ⟨848⟩, proname := "flt4_mul_cash", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨790⟩, proargtypes := [⟨700⟩, ⟨790⟩] }
    , { oid := ⟨849⟩, proname := "position", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨23⟩, proargtypes := [⟨25⟩, ⟨25⟩] }
    , { oid := ⟨850⟩, proname := "textlike", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨25⟩, ⟨25⟩] }
    , { oid := ⟨1023⟩, proname := "textlike_support", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨2281⟩, proargtypes := [⟨2281⟩] }
    , { oid := ⟨851⟩, proname := "textnlike", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨25⟩, ⟨25⟩] }
    , { oid := ⟨852⟩, proname := "int48eq", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨23⟩, ⟨20⟩] }
    , { oid := ⟨853⟩, proname := "int48ne", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨23⟩, ⟨20⟩] }
    , { oid := ⟨854⟩, proname := "int48lt", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨23⟩, ⟨20⟩] }
    , { oid := ⟨855⟩, proname := "int48gt", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨23⟩, ⟨20⟩] }
    , { oid := ⟨856⟩, proname := "int48le", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨23⟩, ⟨20⟩] }
    , { oid := ⟨857⟩, proname := "int48ge", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨23⟩, ⟨20⟩] }
    , { oid := ⟨858⟩, proname := "namelike", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨19⟩, ⟨25⟩] }
    , { oid := ⟨859⟩, proname := "namenlike", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨19⟩, ⟨25⟩] }
    , { oid := ⟨860⟩, proname := "bpchar", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨1042⟩, proargtypes := [⟨18⟩] }
    , { oid := ⟨861⟩, proname := "current_database", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨19⟩, proargtypes := [] }
    , { oid := ⟨817⟩, proname := "current_query", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨25⟩, proargtypes := [] }
    , { oid := ⟨3399⟩, proname := "int8_mul_cash", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨790⟩, proargtypes := [⟨20⟩, ⟨790⟩] }
    , { oid := ⟨862⟩, proname := "int4_mul_cash", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨790⟩, proargtypes := [⟨23⟩, ⟨790⟩] }
    , { oid := ⟨863⟩, proname := "int2_mul_cash", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨790⟩, proargtypes := [⟨21⟩, ⟨790⟩] }
    , { oid := ⟨3344⟩, proname := "cash_mul_int8", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨790⟩, proargtypes := [⟨790⟩, ⟨20⟩] }
    , { oid := ⟨3345⟩, proname := "cash_div_int8", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨790⟩, proargtypes := [⟨790⟩, ⟨20⟩] }
    , { oid := ⟨864⟩, proname := "cash_mul_int4", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨790⟩, proargtypes := [⟨790⟩, ⟨23⟩] }
    , { oid := ⟨865⟩, proname := "cash_div_int4", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨790⟩, proargtypes := [⟨790⟩, ⟨23⟩] }
    , { oid := ⟨866⟩, proname := "cash_mul_int2", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨790⟩, proargtypes := [⟨790⟩, ⟨21⟩] }
    , { oid := ⟨867⟩, proname := "cash_div_int2", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨790⟩, proargtypes := [⟨790⟩, ⟨21⟩] }
    , { oid := ⟨886⟩, proname := "cash_in", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨790⟩, proargtypes := [⟨2275⟩] }
    , { oid := ⟨887⟩, proname := "cash_out", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨2275⟩, proargtypes := [⟨790⟩] }
    , { oid := ⟨888⟩, proname := "cash_eq", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨790⟩, ⟨790⟩] }
    , { oid := ⟨889⟩, proname := "cash_ne", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨790⟩, ⟨790⟩] }
    , { oid := ⟨890⟩, proname := "cash_lt", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨790⟩, ⟨790⟩] }
    , { oid := ⟨891⟩, proname := "cash_le", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨790⟩, ⟨790⟩] }
    , { oid := ⟨892⟩, proname := "cash_gt", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨790⟩, ⟨790⟩] }
    , { oid := ⟨893⟩, proname := "cash_ge", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨790⟩, ⟨790⟩] }
    , { oid := ⟨894⟩, proname := "cash_pl", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨790⟩, proargtypes := [⟨790⟩, ⟨790⟩] }
    , { oid := ⟨895⟩, proname := "cash_mi", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨790⟩, proargtypes := [⟨790⟩, ⟨790⟩] }
    , { oid := ⟨896⟩, proname := "cash_mul_flt8", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨790⟩, proargtypes := [⟨790⟩, ⟨701⟩] }
    , { oid := ⟨897⟩, proname := "cash_div_flt8", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨790⟩, proargtypes := [⟨790⟩, ⟨701⟩] }
    , { oid := ⟨898⟩, proname := "cashlarger", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨790⟩, proargtypes := [⟨790⟩, ⟨790⟩] }
    , { oid := ⟨899⟩, proname := "cashsmaller", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨790⟩, proargtypes := [⟨790⟩, ⟨790⟩] }
    , { oid := ⟨919⟩, proname := "flt8_mul_cash", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨790⟩, proargtypes := [⟨701⟩, ⟨790⟩] }
    , { oid := ⟨935⟩, proname := "cash_words", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨25⟩, proargtypes := [⟨790⟩] }
    , { oid := ⟨3822⟩, proname := "cash_div_cash", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨701⟩, proargtypes := [⟨790⟩, ⟨790⟩] }
    , { oid := ⟨3823⟩, proname := "numeric", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨1700⟩, proargtypes := [⟨790⟩] }
    , { oid := ⟨3824⟩, proname := "money", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨790⟩, proargtypes := [⟨1700⟩] }
    , { oid := ⟨3811⟩, proname := "money", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨790⟩, proargtypes := [⟨23⟩] }
    , { oid := ⟨3812⟩, proname := "money", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨790⟩, proargtypes := [⟨20⟩] }
    , { oid := ⟨940⟩, proname := "mod", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨21⟩, proargtypes := [⟨21⟩, ⟨21⟩] }
    , { oid := ⟨941⟩, proname := "mod", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨23⟩, proargtypes := [⟨23⟩, ⟨23⟩] }
    , { oid := ⟨945⟩, proname := "int8mod", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨20⟩, proargtypes := [⟨20⟩, ⟨20⟩] }
    , { oid := ⟨947⟩, proname := "mod", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨20⟩, proargtypes := [⟨20⟩, ⟨20⟩] }
    , { oid := ⟨5044⟩, proname := "gcd", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨23⟩, proargtypes := [⟨23⟩, ⟨23⟩] }
    , { oid := ⟨5045⟩, proname := "gcd", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨20⟩, proargtypes := [⟨20⟩, ⟨20⟩] }
    , { oid := ⟨5046⟩, proname := "lcm", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨23⟩, proargtypes := [⟨23⟩, ⟨23⟩] }
    , { oid := ⟨5047⟩, proname := "lcm", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨20⟩, proargtypes := [⟨20⟩, ⟨20⟩] }
    , { oid := ⟨944⟩, proname := "char", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨18⟩, proargtypes := [⟨25⟩] }
    , { oid := ⟨946⟩, proname := "text", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨25⟩, proargtypes := [⟨18⟩] }
    , { oid := ⟨952⟩, proname := "lo_open", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨23⟩, proargtypes := [⟨26⟩, ⟨23⟩] }
    , { oid := ⟨953⟩, proname := "lo_close", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨23⟩, proargtypes := [⟨23⟩] }
    , { oid := ⟨954⟩, proname := "loread", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨17⟩, proargtypes := [⟨23⟩, ⟨23⟩] }
    , { oid := ⟨955⟩, proname := "lowrite", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨23⟩, proargtypes := [⟨23⟩, ⟨17⟩] }
    , { oid := ⟨956⟩, proname := "lo_lseek", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨23⟩, proargtypes := [⟨23⟩, ⟨23⟩, ⟨23⟩] }
    , { oid := ⟨3170⟩, proname := "lo_lseek64", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨20⟩, proargtypes := [⟨23⟩, ⟨20⟩, ⟨23⟩] }
    , { oid := ⟨957⟩, proname := "lo_creat", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨26⟩, proargtypes := [⟨23⟩] }
    , { oid := ⟨715⟩, proname := "lo_create", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨26⟩, proargtypes := [⟨26⟩] }
    , { oid := ⟨958⟩, proname := "lo_tell", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨23⟩, proargtypes := [⟨23⟩] }
    , { oid := ⟨3171⟩, proname := "lo_tell64", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨20⟩, proargtypes := [⟨23⟩] }
    , { oid := ⟨1004⟩, proname := "lo_truncate", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨23⟩, proargtypes := [⟨23⟩, ⟨23⟩] }
    , { oid := ⟨3172⟩, proname := "lo_truncate64", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨23⟩, proargtypes := [⟨23⟩, ⟨20⟩] }
    , { oid := ⟨3457⟩, proname := "lo_from_bytea", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨26⟩, proargtypes := [⟨26⟩, ⟨17⟩] }
    , { oid := ⟨3458⟩, proname := "lo_get", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨17⟩, proargtypes := [⟨26⟩] }
    , { oid := ⟨3459⟩, proname := "lo_get", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨17⟩, proargtypes := [⟨26⟩, ⟨20⟩, ⟨23⟩] }
    , { oid := ⟨3460⟩, proname := "lo_put", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨2278⟩, proargtypes := [⟨26⟩, ⟨20⟩, ⟨17⟩] }
    , { oid := ⟨959⟩, proname := "on_pl", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨600⟩, ⟨628⟩] }
    , { oid := ⟨960⟩, proname := "on_sl", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨601⟩, ⟨628⟩] }
    , { oid := ⟨961⟩, proname := "close_pl", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨600⟩, proargtypes := [⟨600⟩, ⟨628⟩] }
    , { oid := ⟨964⟩, proname := "lo_unlink", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨23⟩, proargtypes := [⟨26⟩] }
    , { oid := ⟨973⟩, proname := "path_inter", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨602⟩, ⟨602⟩] }
    , { oid := ⟨975⟩, proname := "area", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨701⟩, proargtypes := [⟨603⟩] }
    , { oid := ⟨976⟩, proname := "width", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨701⟩, proargtypes := [⟨603⟩] }
    , { oid := ⟨977⟩, proname := "height", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨701⟩, proargtypes := [⟨603⟩] }
    , { oid := ⟨978⟩, proname := "box_distance", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨701⟩, proargtypes := [⟨603⟩, ⟨603⟩] }
    , { oid := ⟨979⟩, proname := "area", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨701⟩, proargtypes := [⟨602⟩] }
    , { oid := ⟨980⟩, proname := "box_intersect", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨603⟩, proargtypes := [⟨603⟩, ⟨603⟩] }
    , { oid := ⟨4067⟩, proname := "bound_box", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨603⟩, proargtypes := [⟨603⟩, ⟨603⟩] }
    , { oid := ⟨981⟩, proname := "diagonal", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨601⟩, proargtypes := [⟨603⟩] }
    , { oid := ⟨982⟩, proname := "path_n_lt", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨602⟩, ⟨602⟩] }
    , { oid := ⟨983⟩, proname := "path_n_gt", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨602⟩, ⟨602⟩] }
    , { oid := ⟨984⟩, proname := "path_n_eq", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨602⟩, ⟨602⟩] }
    , { oid := ⟨985⟩, proname := "path_n_le", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨602⟩, ⟨602⟩] }
    , { oid := ⟨986⟩, proname := "path_n_ge", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨602⟩, ⟨602⟩] }
    , { oid := ⟨987⟩, proname := "path_length", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨701⟩, proargtypes := [⟨602⟩] }
    , { oid := ⟨988⟩, proname := "point_ne", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨600⟩, ⟨600⟩] }
    , { oid := ⟨989⟩, proname := "point_vert", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨600⟩, ⟨600⟩] }
    , { oid := ⟨990⟩, proname := "point_horiz", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨600⟩, ⟨600⟩] }
    , { oid := ⟨991⟩, proname := "point_distance", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨701⟩, proargtypes := [⟨600⟩, ⟨600⟩] }
    , { oid := ⟨992⟩, proname := "slope", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨701⟩, proargtypes := [⟨600⟩, ⟨600⟩] }
    , { oid := ⟨993⟩, proname := "lseg", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨601⟩, proargtypes := [⟨600⟩, ⟨600⟩] }
    , { oid := ⟨994⟩, proname := "lseg_intersect", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨601⟩, ⟨601⟩] }
    , { oid := ⟨995⟩, proname := "lseg_parallel", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨601⟩, ⟨601⟩] }
    , { oid := ⟨996⟩, proname := "lseg_perp", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨601⟩, ⟨601⟩] }
    , { oid := ⟨997⟩, proname := "lseg_vertical", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨601⟩] }
    , { oid := ⟨998⟩, proname := "lseg_horizontal", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨601⟩] }
    , { oid := ⟨999⟩, proname := "lseg_eq", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨601⟩, ⟨601⟩] }
    , { oid := ⟨1026⟩, proname := "timezone", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨1114⟩, proargtypes := [⟨1186⟩, ⟨1184⟩] }
    , { oid := ⟨1031⟩, proname := "aclitemin", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨1033⟩, proargtypes := [⟨2275⟩] }
    , { oid := ⟨1032⟩, proname := "aclitemout", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨2275⟩, proargtypes := [⟨1033⟩] }
    , { oid := ⟨1035⟩, proname := "aclinsert", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨1034⟩, proargtypes := [⟨1034⟩, ⟨1033⟩] }
    , { oid := ⟨1036⟩, proname := "aclremove", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨1034⟩, proargtypes := [⟨1034⟩, ⟨1033⟩] }
    , { oid := ⟨1037⟩, proname := "aclcontains", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨1034⟩, ⟨1033⟩] }
    , { oid := ⟨1062⟩, proname := "aclitemeq", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨1033⟩, ⟨1033⟩] }
    , { oid := ⟨1365⟩, proname := "makeaclitem", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨1033⟩, proargtypes := [⟨26⟩, ⟨26⟩, ⟨25⟩, ⟨16⟩] }
    , { oid := ⟨3943⟩, proname := "acldefault", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨1034⟩, proargtypes := [⟨18⟩, ⟨26⟩] }
    , { oid := ⟨1689⟩, proname := "aclexplode", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨2249⟩, proargtypes := [⟨1034⟩] }
    , { oid := ⟨1044⟩, proname := "bpcharin", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨1042⟩, proargtypes := [⟨2275⟩, ⟨26⟩, ⟨23⟩] }
    , { oid := ⟨1045⟩, proname := "bpcharout", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨2275⟩, proargtypes := [⟨1042⟩] }
    , { oid := ⟨2913⟩, proname := "bpchartypmodin", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨23⟩, proargtypes := [⟨1263⟩] }
    , { oid := ⟨2914⟩, proname := "bpchartypmodout", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨2275⟩, proargtypes := [⟨23⟩] }
    , { oid := ⟨1046⟩, proname := "varcharin", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨1043⟩, proargtypes := [⟨2275⟩, ⟨26⟩, ⟨23⟩] }
    , { oid := ⟨1047⟩, proname := "varcharout", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨2275⟩, proargtypes := [⟨1043⟩] }
    , { oid := ⟨2915⟩, proname := "varchartypmodin", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨23⟩, proargtypes := [⟨1263⟩] }
    , { oid := ⟨2916⟩, proname := "varchartypmodout", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨2275⟩, proargtypes := [⟨23⟩] }
    , { oid := ⟨1048⟩, proname := "bpchareq", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨1042⟩, ⟨1042⟩] }
    , { oid := ⟨1049⟩, proname := "bpcharlt", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨1042⟩, ⟨1042⟩] }
    , { oid := ⟨1050⟩, proname := "bpcharle", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨1042⟩, ⟨1042⟩] }
    , { oid := ⟨1051⟩, proname := "bpchargt", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨1042⟩, ⟨1042⟩] }
    , { oid := ⟨1052⟩, proname := "bpcharge", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨1042⟩, ⟨1042⟩] }
    , { oid := ⟨1053⟩, proname := "bpcharne", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨1042⟩, ⟨1042⟩] }
    , { oid := ⟨1063⟩, proname := "bpchar_larger", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨1042⟩, proargtypes := [⟨1042⟩, ⟨1042⟩] }
    , { oid := ⟨1064⟩, proname := "bpchar_smaller", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨1042⟩, proargtypes := [⟨1042⟩, ⟨1042⟩] }
    , { oid := ⟨1078⟩, proname := "bpcharcmp", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨23⟩, proargtypes := [⟨1042⟩, ⟨1042⟩] }
    , { oid := ⟨3328⟩, proname := "bpchar_sortsupport", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨2278⟩, proargtypes := [⟨2281⟩] }
    , { oid := ⟨1080⟩, proname := "hashbpchar", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨23⟩, proargtypes := [⟨1042⟩] }
    , { oid := ⟨972⟩, proname := "hashbpcharextended", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨20⟩, proargtypes := [⟨1042⟩, ⟨20⟩] }
    , { oid := ⟨1081⟩, proname := "format_type", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨25⟩, proargtypes := [⟨26⟩, ⟨23⟩] }
    , { oid := ⟨1084⟩, proname := "date_in", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨1082⟩, proargtypes := [⟨2275⟩] }
    , { oid := ⟨1085⟩, proname := "date_out", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨2275⟩, proargtypes := [⟨1082⟩] }
    , { oid := ⟨1086⟩, proname := "date_eq", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨1082⟩, ⟨1082⟩] }
    , { oid := ⟨1087⟩, proname := "date_lt", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨1082⟩, ⟨1082⟩] }
    , { oid := ⟨1088⟩, proname := "date_le", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨1082⟩, ⟨1082⟩] }
    , { oid := ⟨1089⟩, proname := "date_gt", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨1082⟩, ⟨1082⟩] }
    , { oid := ⟨1090⟩, proname := "date_ge", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨1082⟩, ⟨1082⟩] }
    , { oid := ⟨1091⟩, proname := "date_ne", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨1082⟩, ⟨1082⟩] }
    , { oid := ⟨1092⟩, proname := "date_cmp", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨23⟩, proargtypes := [⟨1082⟩, ⟨1082⟩] }
    , { oid := ⟨3136⟩, proname := "date_sortsupport", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨2278⟩, proargtypes := [⟨2281⟩] }
    , { oid := ⟨4133⟩, proname := "in_range", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨1082⟩, ⟨1082⟩, ⟨1186⟩, ⟨16⟩, ⟨16⟩] }
    , { oid := ⟨1102⟩, proname := "time_lt", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨1083⟩, ⟨1083⟩] }
    , { oid := ⟨1103⟩, proname := "time_le", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨1083⟩, ⟨1083⟩] }
    , { oid := ⟨1104⟩, proname := "time_gt", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨1083⟩, ⟨1083⟩] }
    , { oid := ⟨1105⟩, proname := "time_ge", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨1083⟩, ⟨1083⟩] }
    , { oid := ⟨1106⟩, proname := "time_ne", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨1083⟩, ⟨1083⟩] }
    , { oid := ⟨1107⟩, proname := "time_cmp", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨23⟩, proargtypes := [⟨1083⟩, ⟨1083⟩] }
    , { oid := ⟨1138⟩, proname := "date_larger", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨1082⟩, proargtypes := [⟨1082⟩, ⟨1082⟩] }
    , { oid := ⟨1139⟩, proname := "date_smaller", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨1082⟩, proargtypes := [⟨1082⟩, ⟨1082⟩] }
    , { oid := ⟨1140⟩, proname := "date_mi", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨23⟩, proargtypes := [⟨1082⟩, ⟨1082⟩] }
    , { oid := ⟨1141⟩, proname := "date_pli", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨1082⟩, proargtypes := [⟨1082⟩, ⟨23⟩] }
    , { oid := ⟨1142⟩, proname := "date_mii", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨1082⟩, proargtypes := [⟨1082⟩, ⟨23⟩] }
    , { oid := ⟨1143⟩, proname := "time_in", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨1083⟩, proargtypes := [⟨2275⟩, ⟨26⟩, ⟨23⟩] }
    , { oid := ⟨1144⟩, proname := "time_out", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨2275⟩, proargtypes := [⟨1083⟩] }
    , { oid := ⟨2909⟩, proname := "timetypmodin", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨23⟩, proargtypes := [⟨1263⟩] }
    , { oid := ⟨2910⟩, proname := "timetypmodout", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨2275⟩, proargtypes := [⟨23⟩] }
    , { oid := ⟨1145⟩, proname := "time_eq", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨1083⟩, ⟨1083⟩] }
    , { oid := ⟨1146⟩, proname := "circle_add_pt", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨718⟩, proargtypes := [⟨718⟩, ⟨600⟩] }
    , { oid := ⟨1147⟩, proname := "circle_sub_pt", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨718⟩, proargtypes := [⟨718⟩, ⟨600⟩] }
    , { oid := ⟨1148⟩, proname := "circle_mul_pt", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨718⟩, proargtypes := [⟨718⟩, ⟨600⟩] }
    , { oid := ⟨1149⟩, proname := "circle_div_pt", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨718⟩, proargtypes := [⟨718⟩, ⟨600⟩] }
    , { oid := ⟨1150⟩, proname := "timestamptz_in", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨1184⟩, proargtypes := [⟨2275⟩, ⟨26⟩, ⟨23⟩] }
    , { oid := ⟨1151⟩, proname := "timestamptz_out", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨2275⟩, proargtypes := [⟨1184⟩] }
    , { oid := ⟨2907⟩, proname := "timestamptztypmodin", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨23⟩, proargtypes := [⟨1263⟩] }
    , { oid := ⟨2908⟩, proname := "timestamptztypmodout", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨2275⟩, proargtypes := [⟨23⟩] }
    , { oid := ⟨1152⟩, proname := "timestamptz_eq", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨1184⟩, ⟨1184⟩] }
    , { oid := ⟨1153⟩, proname := "timestamptz_ne", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨1184⟩, ⟨1184⟩] }
    , { oid := ⟨1154⟩, proname := "timestamptz_lt", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨1184⟩, ⟨1184⟩] }
    , { oid := ⟨1155⟩, proname := "timestamptz_le", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨1184⟩, ⟨1184⟩] }
    , { oid := ⟨1156⟩, proname := "timestamptz_ge", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨1184⟩, ⟨1184⟩] }
    , { oid := ⟨1157⟩, proname := "timestamptz_gt", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨1184⟩, ⟨1184⟩] }
    , { oid := ⟨1158⟩, proname := "to_timestamp", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨1184⟩, proargtypes := [⟨701⟩] }
    , { oid := ⟨1159⟩, proname := "timezone", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨1114⟩, proargtypes := [⟨25⟩, ⟨1184⟩] }
    , { oid := ⟨6334⟩, proname := "timezone", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨1114⟩, proargtypes := [⟨1184⟩] }
    , { oid := ⟨1160⟩, proname := "interval_in", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨1186⟩, proargtypes := [⟨2275⟩, ⟨26⟩, ⟨23⟩] }
    , { oid := ⟨1161⟩, proname := "interval_out", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨2275⟩, proargtypes := [⟨1186⟩] }
    , { oid := ⟨2903⟩, proname := "intervaltypmodin", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨23⟩, proargtypes := [⟨1263⟩] }
    , { oid := ⟨2904⟩, proname := "intervaltypmodout", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨2275⟩, proargtypes := [⟨23⟩] }
    , { oid := ⟨1162⟩, proname := "interval_eq", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨1186⟩, ⟨1186⟩] }
    , { oid := ⟨1163⟩, proname := "interval_ne", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨1186⟩, ⟨1186⟩] }
    , { oid := ⟨1164⟩, proname := "interval_lt", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨1186⟩, ⟨1186⟩] }
    , { oid := ⟨1165⟩, proname := "interval_le", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨1186⟩, ⟨1186⟩] }
    , { oid := ⟨1166⟩, proname := "interval_ge", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨1186⟩, ⟨1186⟩] }
    , { oid := ⟨1167⟩, proname := "interval_gt", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨1186⟩, ⟨1186⟩] }
    , { oid := ⟨1168⟩, proname := "interval_um", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨1186⟩, proargtypes := [⟨1186⟩] }
    , { oid := ⟨1169⟩, proname := "interval_pl", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨1186⟩, proargtypes := [⟨1186⟩, ⟨1186⟩] }
    , { oid := ⟨1170⟩, proname := "interval_mi", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨1186⟩, proargtypes := [⟨1186⟩, ⟨1186⟩] }
    , { oid := ⟨1171⟩, proname := "date_part", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨701⟩, proargtypes := [⟨25⟩, ⟨1184⟩] }
    , { oid := ⟨6203⟩, proname := "extract", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨1700⟩, proargtypes := [⟨25⟩, ⟨1184⟩] }
    , { oid := ⟨1172⟩, proname := "date_part", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨701⟩, proargtypes := [⟨25⟩, ⟨1186⟩] }
    , { oid := ⟨6204⟩, proname := "extract", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨1700⟩, proargtypes := [⟨25⟩, ⟨1186⟩] }
    , { oid := ⟨1174⟩, proname := "timestamptz", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨1184⟩, proargtypes := [⟨1082⟩] }
    , { oid := ⟨2711⟩, proname := "justify_interval", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨1186⟩, proargtypes := [⟨1186⟩] }
    , { oid := ⟨1175⟩, proname := "justify_hours", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨1186⟩, proargtypes := [⟨1186⟩] }
    , { oid := ⟨1295⟩, proname := "justify_days", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨1186⟩, proargtypes := [⟨1186⟩] }
    , { oid := ⟨1176⟩, proname := "timestamptz", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨1184⟩, proargtypes := [⟨1082⟩, ⟨1083⟩] }
    , { oid := ⟨1178⟩, proname := "date", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨1082⟩, proargtypes := [⟨1184⟩] }
    , { oid := ⟨1181⟩, proname := "age", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨23⟩, proargtypes := [⟨28⟩] }
    , { oid := ⟨3939⟩, proname := "mxid_age", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨23⟩, proargtypes := [⟨28⟩] }
    , { oid := ⟨1188⟩, proname := "timestamptz_mi", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨1186⟩, proargtypes := [⟨1184⟩, ⟨1184⟩] }
    , { oid := ⟨1189⟩, proname := "timestamptz_pl_interval", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨1184⟩, proargtypes := [⟨1184⟩, ⟨1186⟩] }
    , { oid := ⟨6221⟩, proname := "date_add", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨1184⟩, proargtypes := [⟨1184⟩, ⟨1186⟩] }
    , { oid := ⟨6222⟩, proname := "date_add", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨1184⟩, proargtypes := [⟨1184⟩, ⟨1186⟩, ⟨25⟩] }
    , { oid := ⟨1190⟩, proname := "timestamptz_mi_interval", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨1184⟩, proargtypes := [⟨1184⟩, ⟨1186⟩] }
    , { oid := ⟨6223⟩, proname := "date_subtract", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨1184⟩, proargtypes := [⟨1184⟩, ⟨1186⟩] }
    , { oid := ⟨6273⟩, proname := "date_subtract", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨1184⟩, proargtypes := [⟨1184⟩, ⟨1186⟩, ⟨25⟩] }
    , { oid := ⟨1195⟩, proname := "timestamptz_smaller", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨1184⟩, proargtypes := [⟨1184⟩, ⟨1184⟩] }
    , { oid := ⟨1196⟩, proname := "timestamptz_larger", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨1184⟩, proargtypes := [⟨1184⟩, ⟨1184⟩] }
    , { oid := ⟨1197⟩, proname := "interval_smaller", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨1186⟩, proargtypes := [⟨1186⟩, ⟨1186⟩] }
    , { oid := ⟨1198⟩, proname := "interval_larger", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨1186⟩, proargtypes := [⟨1186⟩, ⟨1186⟩] }
    , { oid := ⟨1199⟩, proname := "age", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨1186⟩, proargtypes := [⟨1184⟩, ⟨1184⟩] }
    , { oid := ⟨3918⟩, proname := "interval_support", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨2281⟩, proargtypes := [⟨2281⟩] }
    , { oid := ⟨1200⟩, proname := "interval", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨1186⟩, proargtypes := [⟨1186⟩, ⟨23⟩] }
    , { oid := ⟨1215⟩, proname := "obj_description", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨25⟩, proargtypes := [⟨26⟩, ⟨19⟩] }
    , { oid := ⟨1216⟩, proname := "col_description", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨25⟩, proargtypes := [⟨26⟩, ⟨23⟩] }
    , { oid := ⟨1993⟩, proname := "shobj_description", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨25⟩, proargtypes := [⟨26⟩, ⟨19⟩] }
    , { oid := ⟨1217⟩, proname := "date_trunc", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨1184⟩, proargtypes := [⟨25⟩, ⟨1184⟩] }
    , { oid := ⟨1284⟩, proname := "date_trunc", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨1184⟩, proargtypes := [⟨25⟩, ⟨1184⟩, ⟨25⟩] }
    , { oid := ⟨1218⟩, proname := "date_trunc", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨1186⟩, proargtypes := [⟨25⟩, ⟨1186⟩] }
    , { oid := ⟨1219⟩, proname := "int8inc", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨20⟩, proargtypes := [⟨20⟩] }
    , { oid := ⟨3546⟩, proname := "int8dec", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨20⟩, proargtypes := [⟨20⟩] }
    , { oid := ⟨2804⟩, proname := "int8inc_any", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨20⟩, proargtypes := [⟨20⟩, ⟨2276⟩] }
    , { oid := ⟨3547⟩, proname := "int8dec_any", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨20⟩, proargtypes := [⟨20⟩, ⟨2276⟩] }
    , { oid := ⟨1230⟩, proname := "int8abs", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨20⟩, proargtypes := [⟨20⟩] }
    , { oid := ⟨1236⟩, proname := "int8larger", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨20⟩, proargtypes := [⟨20⟩, ⟨20⟩] }
    , { oid := ⟨1237⟩, proname := "int8smaller", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨20⟩, proargtypes := [⟨20⟩, ⟨20⟩] }
    , { oid := ⟨1238⟩, proname := "texticregexeq", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨25⟩, ⟨25⟩] }
    , { oid := ⟨1024⟩, proname := "texticregexeq_support", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨2281⟩, proargtypes := [⟨2281⟩] }
    , { oid := ⟨1239⟩, proname := "texticregexne", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨25⟩, ⟨25⟩] }
    , { oid := ⟨1240⟩, proname := "nameicregexeq", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨19⟩, ⟨25⟩] }
    , { oid := ⟨1241⟩, proname := "nameicregexne", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨19⟩, ⟨25⟩] }
    , { oid := ⟨1251⟩, proname := "int4abs", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨23⟩, proargtypes := [⟨23⟩] }
    , { oid := ⟨1253⟩, proname := "int2abs", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨21⟩, proargtypes := [⟨21⟩] }
    , { oid := ⟨1271⟩, proname := "overlaps", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨1266⟩, ⟨1266⟩, ⟨1266⟩, ⟨1266⟩] }
    , { oid := ⟨1272⟩, proname := "datetime_pl", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨1114⟩, proargtypes := [⟨1082⟩, ⟨1083⟩] }
    , { oid := ⟨1273⟩, proname := "date_part", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨701⟩, proargtypes := [⟨25⟩, ⟨1266⟩] }
    , { oid := ⟨6201⟩, proname := "extract", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨1700⟩, proargtypes := [⟨25⟩, ⟨1266⟩] }
    , { oid := ⟨1274⟩, proname := "int84pl", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨20⟩, proargtypes := [⟨20⟩, ⟨23⟩] }
    , { oid := ⟨1275⟩, proname := "int84mi", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨20⟩, proargtypes := [⟨20⟩, ⟨23⟩] }
    , { oid := ⟨1276⟩, proname := "int84mul", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨20⟩, proargtypes := [⟨20⟩, ⟨23⟩] }
    , { oid := ⟨1277⟩, proname := "int84div", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨20⟩, proargtypes := [⟨20⟩, ⟨23⟩] }
    , { oid := ⟨1278⟩, proname := "int48pl", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨20⟩, proargtypes := [⟨23⟩, ⟨20⟩] }
    , { oid := ⟨1279⟩, proname := "int48mi", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨20⟩, proargtypes := [⟨23⟩, ⟨20⟩] }
    , { oid := ⟨1280⟩, proname := "int48mul", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨20⟩, proargtypes := [⟨23⟩, ⟨20⟩] }
    , { oid := ⟨1281⟩, proname := "int48div", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨20⟩, proargtypes := [⟨23⟩, ⟨20⟩] }
    , { oid := ⟨837⟩, proname := "int82pl", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨20⟩, proargtypes := [⟨20⟩, ⟨21⟩] }
    , { oid := ⟨838⟩, proname := "int82mi", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨20⟩, proargtypes := [⟨20⟩, ⟨21⟩] }
    , { oid := ⟨839⟩, proname := "int82mul", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨20⟩, proargtypes := [⟨20⟩, ⟨21⟩] }
    , { oid := ⟨840⟩, proname := "int82div", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨20⟩, proargtypes := [⟨20⟩, ⟨21⟩] }
    , { oid := ⟨841⟩, proname := "int28pl", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨20⟩, proargtypes := [⟨21⟩, ⟨20⟩] }
    , { oid := ⟨942⟩, proname := "int28mi", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨20⟩, proargtypes := [⟨21⟩, ⟨20⟩] }
    , { oid := ⟨943⟩, proname := "int28mul", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨20⟩, proargtypes := [⟨21⟩, ⟨20⟩] }
    , { oid := ⟨948⟩, proname := "int28div", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨20⟩, proargtypes := [⟨21⟩, ⟨20⟩] }
    , { oid := ⟨1287⟩, proname := "oid", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨26⟩, proargtypes := [⟨20⟩] }
    , { oid := ⟨1288⟩, proname := "int8", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨20⟩, proargtypes := [⟨26⟩] }
    , { oid := ⟨1291⟩, proname := "suppress_redundant_updates_trigger", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨2279⟩, proargtypes := [] }
    , { oid := ⟨1292⟩, proname := "tideq", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨27⟩, ⟨27⟩] }
    , { oid := ⟨1294⟩, proname := "currtid2", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨27⟩, proargtypes := [⟨25⟩, ⟨27⟩] }
    , { oid := ⟨1265⟩, proname := "tidne", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨27⟩, ⟨27⟩] }
    , { oid := ⟨2790⟩, proname := "tidgt", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨27⟩, ⟨27⟩] }
    , { oid := ⟨2791⟩, proname := "tidlt", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨27⟩, ⟨27⟩] }
    , { oid := ⟨2792⟩, proname := "tidge", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨27⟩, ⟨27⟩] }
    , { oid := ⟨2793⟩, proname := "tidle", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨27⟩, ⟨27⟩] }
    , { oid := ⟨2794⟩, proname := "bttidcmp", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨23⟩, proargtypes := [⟨27⟩, ⟨27⟩] }
    , { oid := ⟨2795⟩, proname := "tidlarger", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨27⟩, proargtypes := [⟨27⟩, ⟨27⟩] }
    , { oid := ⟨2796⟩, proname := "tidsmaller", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨27⟩, proargtypes := [⟨27⟩, ⟨27⟩] }
    , { oid := ⟨2233⟩, proname := "hashtid", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨23⟩, proargtypes := [⟨27⟩] }
    , { oid := ⟨2234⟩, proname := "hashtidextended", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨20⟩, proargtypes := [⟨27⟩, ⟨20⟩] }
    , { oid := ⟨1296⟩, proname := "timedate_pl", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨1114⟩, proargtypes := [⟨1083⟩, ⟨1082⟩] }
    , { oid := ⟨1297⟩, proname := "datetimetz_pl", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨1184⟩, proargtypes := [⟨1082⟩, ⟨1266⟩] }
    , { oid := ⟨1298⟩, proname := "timetzdate_pl", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨1184⟩, proargtypes := [⟨1266⟩, ⟨1082⟩] }
    , { oid := ⟨1299⟩, proname := "now", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨1184⟩, proargtypes := [] }
    , { oid := ⟨2647⟩, proname := "transaction_timestamp", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨1184⟩, proargtypes := [] }
    , { oid := ⟨2648⟩, proname := "statement_timestamp", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨1184⟩, proargtypes := [] }
    , { oid := ⟨2649⟩, proname := "clock_timestamp", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨1184⟩, proargtypes := [] }
    , { oid := ⟨1300⟩, proname := "positionsel", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨701⟩, proargtypes := [⟨2281⟩, ⟨26⟩, ⟨2281⟩, ⟨23⟩] }
    , { oid := ⟨1301⟩, proname := "positionjoinsel", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨701⟩, proargtypes := [⟨2281⟩, ⟨26⟩, ⟨2281⟩, ⟨21⟩, ⟨2281⟩] }
    , { oid := ⟨1302⟩, proname := "contsel", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨701⟩, proargtypes := [⟨2281⟩, ⟨26⟩, ⟨2281⟩, ⟨23⟩] }
    , { oid := ⟨1303⟩, proname := "contjoinsel", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨701⟩, proargtypes := [⟨2281⟩, ⟨26⟩, ⟨2281⟩, ⟨21⟩, ⟨2281⟩] }
    , { oid := ⟨1304⟩, proname := "overlaps", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨1184⟩, ⟨1184⟩, ⟨1184⟩, ⟨1184⟩] }
    , { oid := ⟨1305⟩, proname := "overlaps", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨16⟩, proargtypes := [⟨1184⟩, ⟨1186⟩, ⟨1184⟩, ⟨1186⟩] }
    , { oid := ⟨1306⟩, proname := "overlaps", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨16⟩, proargtypes := [⟨1184⟩, ⟨1184⟩, ⟨1184⟩, ⟨1186⟩] }
    , { oid := ⟨1307⟩, proname := "overlaps", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨16⟩, proargtypes := [⟨1184⟩, ⟨1186⟩, ⟨1184⟩, ⟨1184⟩] }
    , { oid := ⟨1308⟩, proname := "overlaps", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨1083⟩, ⟨1083⟩, ⟨1083⟩, ⟨1083⟩] }
    , { oid := ⟨1309⟩, proname := "overlaps", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨1083⟩, ⟨1186⟩, ⟨1083⟩, ⟨1186⟩] }
    , { oid := ⟨1310⟩, proname := "overlaps", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨1083⟩, ⟨1083⟩, ⟨1083⟩, ⟨1186⟩] }
    , { oid := ⟨1311⟩, proname := "overlaps", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨1083⟩, ⟨1186⟩, ⟨1083⟩, ⟨1083⟩] }
    , { oid := ⟨1312⟩, proname := "timestamp_in", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨1114⟩, proargtypes := [⟨2275⟩, ⟨26⟩, ⟨23⟩] }
    , { oid := ⟨1313⟩, proname := "timestamp_out", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨2275⟩, proargtypes := [⟨1114⟩] }
    , { oid := ⟨2905⟩, proname := "timestamptypmodin", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨23⟩, proargtypes := [⟨1263⟩] }
    , { oid := ⟨2906⟩, proname := "timestamptypmodout", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨2275⟩, proargtypes := [⟨23⟩] }
    , { oid := ⟨1314⟩, proname := "timestamptz_cmp", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨23⟩, proargtypes := [⟨1184⟩, ⟨1184⟩] }
    , { oid := ⟨1315⟩, proname := "interval_cmp", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨23⟩, proargtypes := [⟨1186⟩, ⟨1186⟩] }
    , { oid := ⟨1316⟩, proname := "time", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨1083⟩, proargtypes := [⟨1114⟩] }
    , { oid := ⟨1317⟩, proname := "length", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨23⟩, proargtypes := [⟨25⟩] }
    , { oid := ⟨1318⟩, proname := "length", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨23⟩, proargtypes := [⟨1042⟩] }
    , { oid := ⟨1319⟩, proname := "xideqint4", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨28⟩, ⟨23⟩] }
    , { oid := ⟨3309⟩, proname := "xidneqint4", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨28⟩, ⟨23⟩] }
    , { oid := ⟨1326⟩, proname := "interval_div", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨1186⟩, proargtypes := [⟨1186⟩, ⟨701⟩] }
    , { oid := ⟨1339⟩, proname := "dlog10", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨701⟩, proargtypes := [⟨701⟩] }
    , { oid := ⟨1340⟩, proname := "log", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨701⟩, proargtypes := [⟨701⟩] }
    , { oid := ⟨1194⟩, proname := "log10", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨701⟩, proargtypes := [⟨701⟩] }
    , { oid := ⟨1341⟩, proname := "ln", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨701⟩, proargtypes := [⟨701⟩] }
    , { oid := ⟨1342⟩, proname := "round", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨701⟩, proargtypes := [⟨701⟩] }
    , { oid := ⟨1343⟩, proname := "trunc", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨701⟩, proargtypes := [⟨701⟩] }
    , { oid := ⟨1344⟩, proname := "sqrt", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨701⟩, proargtypes := [⟨701⟩] }
    , { oid := ⟨1345⟩, proname := "cbrt", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨701⟩, proargtypes := [⟨701⟩] }
    , { oid := ⟨1346⟩, proname := "pow", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨701⟩, proargtypes := [⟨701⟩, ⟨701⟩] }
    , { oid := ⟨1368⟩, proname := "power", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨701⟩, proargtypes := [⟨701⟩, ⟨701⟩] }
    , { oid := ⟨1347⟩, proname := "exp", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨701⟩, proargtypes := [⟨701⟩] }
    , { oid := ⟨1348⟩, proname := "obj_description", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨25⟩, proargtypes := [⟨26⟩] }
    , { oid := ⟨1349⟩, proname := "oidvectortypes", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨25⟩, proargtypes := [⟨30⟩] }
    , { oid := ⟨1350⟩, proname := "timetz_in", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨1266⟩, proargtypes := [⟨2275⟩, ⟨26⟩, ⟨23⟩] }
    , { oid := ⟨1351⟩, proname := "timetz_out", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨2275⟩, proargtypes := [⟨1266⟩] }
    , { oid := ⟨2911⟩, proname := "timetztypmodin", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨23⟩, proargtypes := [⟨1263⟩] }
    , { oid := ⟨2912⟩, proname := "timetztypmodout", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨2275⟩, proargtypes := [⟨23⟩] }
    , { oid := ⟨1352⟩, proname := "timetz_eq", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨1266⟩, ⟨1266⟩] }
    , { oid := ⟨1353⟩, proname := "timetz_ne", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨1266⟩, ⟨1266⟩] }
    , { oid := ⟨1354⟩, proname := "timetz_lt", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨1266⟩, ⟨1266⟩] }
    , { oid := ⟨1355⟩, proname := "timetz_le", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨1266⟩, ⟨1266⟩] }
    , { oid := ⟨1356⟩, proname := "timetz_ge", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨1266⟩, ⟨1266⟩] }
    , { oid := ⟨1357⟩, proname := "timetz_gt", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨1266⟩, ⟨1266⟩] }
    , { oid := ⟨1358⟩, proname := "timetz_cmp", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨23⟩, proargtypes := [⟨1266⟩, ⟨1266⟩] }
    , { oid := ⟨1359⟩, proname := "timestamptz", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨1184⟩, proargtypes := [⟨1082⟩, ⟨1266⟩] }
    , { oid := ⟨1367⟩, proname := "character_length", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨23⟩, proargtypes := [⟨1042⟩] }
    , { oid := ⟨1369⟩, proname := "character_length", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨23⟩, proargtypes := [⟨25⟩] }
    , { oid := ⟨1370⟩, proname := "interval", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨1186⟩, proargtypes := [⟨1083⟩] }
    , { oid := ⟨1372⟩, proname := "char_length", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨23⟩, proargtypes := [⟨1042⟩] }
    , { oid := ⟨1374⟩, proname := "octet_length", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨23⟩, proargtypes := [⟨25⟩] }
    , { oid := ⟨1375⟩, proname := "octet_length", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨23⟩, proargtypes := [⟨1042⟩] }
    , { oid := ⟨1377⟩, proname := "time_larger", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨1083⟩, proargtypes := [⟨1083⟩, ⟨1083⟩] }
    , { oid := ⟨1378⟩, proname := "time_smaller", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨1083⟩, proargtypes := [⟨1083⟩, ⟨1083⟩] }
    , { oid := ⟨1379⟩, proname := "timetz_larger", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨1266⟩, proargtypes := [⟨1266⟩, ⟨1266⟩] }
    , { oid := ⟨1380⟩, proname := "timetz_smaller", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨1266⟩, proargtypes := [⟨1266⟩, ⟨1266⟩] }
    , { oid := ⟨1381⟩, proname := "char_length", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨23⟩, proargtypes := [⟨25⟩] }
    , { oid := ⟨1384⟩, proname := "date_part", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨701⟩, proargtypes := [⟨25⟩, ⟨1082⟩] }
    , { oid := ⟨6199⟩, proname := "extract", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨1700⟩, proargtypes := [⟨25⟩, ⟨1082⟩] }
    , { oid := ⟨1385⟩, proname := "date_part", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨701⟩, proargtypes := [⟨25⟩, ⟨1083⟩] }
    , { oid := ⟨6200⟩, proname := "extract", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨1700⟩, proargtypes := [⟨25⟩, ⟨1083⟩] }
    , { oid := ⟨1386⟩, proname := "age", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨1186⟩, proargtypes := [⟨1184⟩] }
    , { oid := ⟨1388⟩, proname := "timetz", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨1266⟩, proargtypes := [⟨1184⟩] }
    , { oid := ⟨1373⟩, proname := "isfinite", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨1082⟩] }
    , { oid := ⟨1389⟩, proname := "isfinite", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨1184⟩] }
    , { oid := ⟨1390⟩, proname := "isfinite", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨1186⟩] }
    , { oid := ⟨1376⟩, proname := "factorial", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨1700⟩, proargtypes := [⟨20⟩] }
    , { oid := ⟨1394⟩, proname := "abs", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨700⟩, proargtypes := [⟨700⟩] }
    , { oid := ⟨1395⟩, proname := "abs", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨701⟩, proargtypes := [⟨701⟩] }
    , { oid := ⟨1396⟩, proname := "abs", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨20⟩, proargtypes := [⟨20⟩] }
    , { oid := ⟨1397⟩, proname := "abs", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨23⟩, proargtypes := [⟨23⟩] }
    , { oid := ⟨1398⟩, proname := "abs", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨21⟩, proargtypes := [⟨21⟩] }
    , { oid := ⟨1400⟩, proname := "name", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨19⟩, proargtypes := [⟨1043⟩] }
    , { oid := ⟨1401⟩, proname := "varchar", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨1043⟩, proargtypes := [⟨19⟩] }
    , { oid := ⟨1402⟩, proname := "current_schema", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨19⟩, proargtypes := [] }
    , { oid := ⟨1403⟩, proname := "current_schemas", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨1003⟩, proargtypes := [⟨16⟩] }
    , { oid := ⟨1404⟩, proname := "overlay", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨25⟩, proargtypes := [⟨25⟩, ⟨25⟩, ⟨23⟩, ⟨23⟩] }
    , { oid := ⟨1405⟩, proname := "overlay", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨25⟩, proargtypes := [⟨25⟩, ⟨25⟩, ⟨23⟩] }
    , { oid := ⟨1406⟩, proname := "isvertical", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨600⟩, ⟨600⟩] }
    , { oid := ⟨1407⟩, proname := "ishorizontal", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨600⟩, ⟨600⟩] }
    , { oid := ⟨1408⟩, proname := "isparallel", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨601⟩, ⟨601⟩] }
    , { oid := ⟨1409⟩, proname := "isperp", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨601⟩, ⟨601⟩] }
    , { oid := ⟨1410⟩, proname := "isvertical", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨601⟩] }
    , { oid := ⟨1411⟩, proname := "ishorizontal", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨601⟩] }
    , { oid := ⟨1412⟩, proname := "isparallel", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨628⟩, ⟨628⟩] }
    , { oid := ⟨1413⟩, proname := "isperp", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨628⟩, ⟨628⟩] }
    , { oid := ⟨1414⟩, proname := "isvertical", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨628⟩] }
    , { oid := ⟨1415⟩, proname := "ishorizontal", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨628⟩] }
    , { oid := ⟨1416⟩, proname := "point", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨600⟩, proargtypes := [⟨718⟩] }
    , { oid := ⟨1419⟩, proname := "time", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨1083⟩, proargtypes := [⟨1186⟩] }
    , { oid := ⟨1421⟩, proname := "box", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨603⟩, proargtypes := [⟨600⟩, ⟨600⟩] }
    , { oid := ⟨1422⟩, proname := "box_add", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨603⟩, proargtypes := [⟨603⟩, ⟨600⟩] }
    , { oid := ⟨1423⟩, proname := "box_sub", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨603⟩, proargtypes := [⟨603⟩, ⟨600⟩] }
    , { oid := ⟨1424⟩, proname := "box_mul", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨603⟩, proargtypes := [⟨603⟩, ⟨600⟩] }
    , { oid := ⟨1425⟩, proname := "box_div", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨603⟩, proargtypes := [⟨603⟩, ⟨600⟩] }
    , { oid := ⟨1426⟩, proname := "path_contain_pt", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨602⟩, ⟨600⟩] }
    , { oid := ⟨1428⟩, proname := "poly_contain_pt", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨604⟩, ⟨600⟩] }
    , { oid := ⟨1429⟩, proname := "pt_contained_poly", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨600⟩, ⟨604⟩] }
    , { oid := ⟨1430⟩, proname := "isclosed", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨602⟩] }
    , { oid := ⟨1431⟩, proname := "isopen", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨602⟩] }
    , { oid := ⟨1432⟩, proname := "path_npoints", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨23⟩, proargtypes := [⟨602⟩] }
    , { oid := ⟨1433⟩, proname := "pclose", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨602⟩, proargtypes := [⟨602⟩] }
    , { oid := ⟨1434⟩, proname := "popen", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨602⟩, proargtypes := [⟨602⟩] }
    , { oid := ⟨1435⟩, proname := "path_add", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨602⟩, proargtypes := [⟨602⟩, ⟨602⟩] }
    , { oid := ⟨1436⟩, proname := "path_add_pt", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨602⟩, proargtypes := [⟨602⟩, ⟨600⟩] }
    , { oid := ⟨1437⟩, proname := "path_sub_pt", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨602⟩, proargtypes := [⟨602⟩, ⟨600⟩] }
    , { oid := ⟨1438⟩, proname := "path_mul_pt", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨602⟩, proargtypes := [⟨602⟩, ⟨600⟩] }
    , { oid := ⟨1439⟩, proname := "path_div_pt", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨602⟩, proargtypes := [⟨602⟩, ⟨600⟩] }
    , { oid := ⟨1440⟩, proname := "point", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨600⟩, proargtypes := [⟨701⟩, ⟨701⟩] }
    , { oid := ⟨1441⟩, proname := "point_add", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨600⟩, proargtypes := [⟨600⟩, ⟨600⟩] }
    , { oid := ⟨1442⟩, proname := "point_sub", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨600⟩, proargtypes := [⟨600⟩, ⟨600⟩] }
    , { oid := ⟨1443⟩, proname := "point_mul", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨600⟩, proargtypes := [⟨600⟩, ⟨600⟩] }
    , { oid := ⟨1444⟩, proname := "point_div", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨600⟩, proargtypes := [⟨600⟩, ⟨600⟩] }
    , { oid := ⟨1445⟩, proname := "poly_npoints", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨23⟩, proargtypes := [⟨604⟩] }
    , { oid := ⟨1446⟩, proname := "box", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨603⟩, proargtypes := [⟨604⟩] }
    , { oid := ⟨1447⟩, proname := "path", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨602⟩, proargtypes := [⟨604⟩] }
    , { oid := ⟨1448⟩, proname := "polygon", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨604⟩, proargtypes := [⟨603⟩] }
    , { oid := ⟨1449⟩, proname := "polygon", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨604⟩, proargtypes := [⟨602⟩] }
    , { oid := ⟨1450⟩, proname := "circle_in", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨718⟩, proargtypes := [⟨2275⟩] }
    , { oid := ⟨1451⟩, proname := "circle_out", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨2275⟩, proargtypes := [⟨718⟩] }
    , { oid := ⟨1452⟩, proname := "circle_same", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨718⟩, ⟨718⟩] }
    , { oid := ⟨1453⟩, proname := "circle_contain", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨718⟩, ⟨718⟩] }
    , { oid := ⟨1454⟩, proname := "circle_left", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨718⟩, ⟨718⟩] }
    , { oid := ⟨1455⟩, proname := "circle_overleft", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨718⟩, ⟨718⟩] }
    , { oid := ⟨1456⟩, proname := "circle_overright", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨718⟩, ⟨718⟩] }
    , { oid := ⟨1457⟩, proname := "circle_right", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨718⟩, ⟨718⟩] }
    , { oid := ⟨1458⟩, proname := "circle_contained", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨718⟩, ⟨718⟩] }
    , { oid := ⟨1459⟩, proname := "circle_overlap", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨718⟩, ⟨718⟩] }
    , { oid := ⟨1460⟩, proname := "circle_below", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨718⟩, ⟨718⟩] }
    , { oid := ⟨1461⟩, proname := "circle_above", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨718⟩, ⟨718⟩] }
    , { oid := ⟨1462⟩, proname := "circle_eq", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨718⟩, ⟨718⟩] }
    , { oid := ⟨1463⟩, proname := "circle_ne", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨718⟩, ⟨718⟩] }
    , { oid := ⟨1464⟩, proname := "circle_lt", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨718⟩, ⟨718⟩] }
    , { oid := ⟨1465⟩, proname := "circle_gt", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨718⟩, ⟨718⟩] }
    , { oid := ⟨1466⟩, proname := "circle_le", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨718⟩, ⟨718⟩] }
    , { oid := ⟨1467⟩, proname := "circle_ge", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨718⟩, ⟨718⟩] }
    , { oid := ⟨1468⟩, proname := "area", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨701⟩, proargtypes := [⟨718⟩] }
    , { oid := ⟨1469⟩, proname := "diameter", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨701⟩, proargtypes := [⟨718⟩] }
    , { oid := ⟨1470⟩, proname := "radius", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨701⟩, proargtypes := [⟨718⟩] }
    , { oid := ⟨1471⟩, proname := "circle_distance", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨701⟩, proargtypes := [⟨718⟩, ⟨718⟩] }
    , { oid := ⟨1472⟩, proname := "circle_center", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨600⟩, proargtypes := [⟨718⟩] }
    , { oid := ⟨1473⟩, proname := "circle", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨718⟩, proargtypes := [⟨600⟩, ⟨701⟩] }
    , { oid := ⟨1474⟩, proname := "circle", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨718⟩, proargtypes := [⟨604⟩] }
    , { oid := ⟨1475⟩, proname := "polygon", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨604⟩, proargtypes := [⟨23⟩, ⟨718⟩] }
    , { oid := ⟨1476⟩, proname := "dist_pc", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨701⟩, proargtypes := [⟨600⟩, ⟨718⟩] }
    , { oid := ⟨1477⟩, proname := "circle_contain_pt", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨718⟩, ⟨600⟩] }
    , { oid := ⟨1478⟩, proname := "pt_contained_circle", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨600⟩, ⟨718⟩] }
    , { oid := ⟨4091⟩, proname := "box", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨603⟩, proargtypes := [⟨600⟩] }
    , { oid := ⟨1479⟩, proname := "circle", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨718⟩, proargtypes := [⟨603⟩] }
    , { oid := ⟨1480⟩, proname := "box", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨603⟩, proargtypes := [⟨718⟩] }
    , { oid := ⟨1482⟩, proname := "lseg_ne", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨601⟩, ⟨601⟩] }
    , { oid := ⟨1483⟩, proname := "lseg_lt", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨601⟩, ⟨601⟩] }
    , { oid := ⟨1484⟩, proname := "lseg_le", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨601⟩, ⟨601⟩] }
    , { oid := ⟨1485⟩, proname := "lseg_gt", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨601⟩, ⟨601⟩] }
    , { oid := ⟨1486⟩, proname := "lseg_ge", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨601⟩, ⟨601⟩] }
    , { oid := ⟨1487⟩, proname := "lseg_length", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨701⟩, proargtypes := [⟨601⟩] }
    , { oid := ⟨1488⟩, proname := "close_ls", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨600⟩, proargtypes := [⟨628⟩, ⟨601⟩] }
    , { oid := ⟨1489⟩, proname := "close_lseg", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨600⟩, proargtypes := [⟨601⟩, ⟨601⟩] }
    , { oid := ⟨1490⟩, proname := "line_in", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨628⟩, proargtypes := [⟨2275⟩] }
    , { oid := ⟨1491⟩, proname := "line_out", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨2275⟩, proargtypes := [⟨628⟩] }
    , { oid := ⟨1492⟩, proname := "line_eq", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨628⟩, ⟨628⟩] }
    , { oid := ⟨1493⟩, proname := "line", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨628⟩, proargtypes := [⟨600⟩, ⟨600⟩] }
    , { oid := ⟨1494⟩, proname := "line_interpt", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨600⟩, proargtypes := [⟨628⟩, ⟨628⟩] }
    , { oid := ⟨1495⟩, proname := "line_intersect", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨628⟩, ⟨628⟩] }
    , { oid := ⟨1496⟩, proname := "line_parallel", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨628⟩, ⟨628⟩] }
    , { oid := ⟨1497⟩, proname := "line_perp", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨628⟩, ⟨628⟩] }
    , { oid := ⟨1498⟩, proname := "line_vertical", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨628⟩] }
    , { oid := ⟨1499⟩, proname := "line_horizontal", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨628⟩] }
    , { oid := ⟨1530⟩, proname := "length", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨701⟩, proargtypes := [⟨601⟩] }
    , { oid := ⟨1531⟩, proname := "length", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨701⟩, proargtypes := [⟨602⟩] }
    , { oid := ⟨1532⟩, proname := "point", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨600⟩, proargtypes := [⟨601⟩] }
    , { oid := ⟨1534⟩, proname := "point", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨600⟩, proargtypes := [⟨603⟩] }
    , { oid := ⟨1540⟩, proname := "point", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨600⟩, proargtypes := [⟨604⟩] }
    , { oid := ⟨1541⟩, proname := "lseg", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨601⟩, proargtypes := [⟨603⟩] }
    , { oid := ⟨1542⟩, proname := "center", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨600⟩, proargtypes := [⟨603⟩] }
    , { oid := ⟨1543⟩, proname := "center", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨600⟩, proargtypes := [⟨718⟩] }
    , { oid := ⟨1544⟩, proname := "polygon", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨604⟩, proargtypes := [⟨718⟩] }
    , { oid := ⟨1545⟩, proname := "npoints", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨23⟩, proargtypes := [⟨602⟩] }
    , { oid := ⟨1556⟩, proname := "npoints", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨23⟩, proargtypes := [⟨604⟩] }
    , { oid := ⟨1564⟩, proname := "bit_in", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨1560⟩, proargtypes := [⟨2275⟩, ⟨26⟩, ⟨23⟩] }
    , { oid := ⟨1565⟩, proname := "bit_out", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨2275⟩, proargtypes := [⟨1560⟩] }
    , { oid := ⟨2919⟩, proname := "bittypmodin", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨23⟩, proargtypes := [⟨1263⟩] }
    , { oid := ⟨2920⟩, proname := "bittypmodout", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨2275⟩, proargtypes := [⟨23⟩] }
    , { oid := ⟨1569⟩, proname := "like", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨25⟩, ⟨25⟩] }
    , { oid := ⟨1570⟩, proname := "notlike", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨25⟩, ⟨25⟩] }
    , { oid := ⟨1571⟩, proname := "like", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨19⟩, ⟨25⟩] }
    , { oid := ⟨1572⟩, proname := "notlike", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨19⟩, ⟨25⟩] }
    , { oid := ⟨1574⟩, proname := "nextval", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨20⟩, proargtypes := [⟨2205⟩] }
    , { oid := ⟨1575⟩, proname := "currval", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨20⟩, proargtypes := [⟨2205⟩] }
    , { oid := ⟨1576⟩, proname := "setval", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨20⟩, proargtypes := [⟨2205⟩, ⟨20⟩] }
    , { oid := ⟨1765⟩, proname := "setval", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨20⟩, proargtypes := [⟨2205⟩, ⟨20⟩, ⟨16⟩] }
    , { oid := ⟨3078⟩, proname := "pg_sequence_parameters", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨2249⟩, proargtypes := [⟨26⟩] }
    , { oid := ⟨4032⟩, proname := "pg_sequence_last_value", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨20⟩, proargtypes := [⟨2205⟩] }
    , { oid := ⟨275⟩, proname := "pg_nextoid", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨26⟩, proargtypes := [⟨2205⟩, ⟨19⟩, ⟨2205⟩] }
    , { oid := ⟨6241⟩, proname := "pg_stop_making_pinned_objects", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨2278⟩, proargtypes := [] }
    , { oid := ⟨1579⟩, proname := "varbit_in", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨1562⟩, proargtypes := [⟨2275⟩, ⟨26⟩, ⟨23⟩] }
    , { oid := ⟨1580⟩, proname := "varbit_out", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨2275⟩, proargtypes := [⟨1562⟩] }
    , { oid := ⟨2902⟩, proname := "varbittypmodin", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨23⟩, proargtypes := [⟨1263⟩] }
    , { oid := ⟨2921⟩, proname := "varbittypmodout", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨2275⟩, proargtypes := [⟨23⟩] }
    , { oid := ⟨1581⟩, proname := "biteq", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨1560⟩, ⟨1560⟩] }
    , { oid := ⟨1582⟩, proname := "bitne", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨1560⟩, ⟨1560⟩] }
    , { oid := ⟨1592⟩, proname := "bitge", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨1560⟩, ⟨1560⟩] }
    , { oid := ⟨1593⟩, proname := "bitgt", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨1560⟩, ⟨1560⟩] }
    , { oid := ⟨1594⟩, proname := "bitle", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨1560⟩, ⟨1560⟩] }
    , { oid := ⟨1595⟩, proname := "bitlt", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨1560⟩, ⟨1560⟩] }
    , { oid := ⟨1596⟩, proname := "bitcmp", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨23⟩, proargtypes := [⟨1560⟩, ⟨1560⟩] }
    , { oid := ⟨1598⟩, proname := "random", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨701⟩, proargtypes := [] }
    , { oid := ⟨6212⟩, proname := "random_normal", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨701⟩, proargtypes := [⟨701⟩, ⟨701⟩] }
    , { oid := ⟨6339⟩, proname := "random", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨23⟩, proargtypes := [⟨23⟩, ⟨23⟩] }
    , { oid := ⟨6340⟩, proname := "random", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨20⟩, proargtypes := [⟨20⟩, ⟨20⟩] }
    , { oid := ⟨6341⟩, proname := "random", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨1700⟩, proargtypes := [⟨1700⟩, ⟨1700⟩] }
    , { oid := ⟨1599⟩, proname := "setseed", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨2278⟩, proargtypes := [⟨701⟩] }
    , { oid := ⟨1600⟩, proname := "asin", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨701⟩, proargtypes := [⟨701⟩] }
    , { oid := ⟨1601⟩, proname := "acos", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨701⟩, proargtypes := [⟨701⟩] }
    , { oid := ⟨1602⟩, proname := "atan", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨701⟩, proargtypes := [⟨701⟩] }
    , { oid := ⟨1603⟩, proname := "atan2", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨701⟩, proargtypes := [⟨701⟩, ⟨701⟩] }
    , { oid := ⟨1604⟩, proname := "sin", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨701⟩, proargtypes := [⟨701⟩] }
    , { oid := ⟨1605⟩, proname := "cos", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨701⟩, proargtypes := [⟨701⟩] }
    , { oid := ⟨1606⟩, proname := "tan", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨701⟩, proargtypes := [⟨701⟩] }
    , { oid := ⟨1607⟩, proname := "cot", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨701⟩, proargtypes := [⟨701⟩] }
    , { oid := ⟨2731⟩, proname := "asind", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨701⟩, proargtypes := [⟨701⟩] }
    , { oid := ⟨2732⟩, proname := "acosd", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨701⟩, proargtypes := [⟨701⟩] }
    , { oid := ⟨2733⟩, proname := "atand", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨701⟩, proargtypes := [⟨701⟩] }
    , { oid := ⟨2734⟩, proname := "atan2d", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨701⟩, proargtypes := [⟨701⟩, ⟨701⟩] }
    , { oid := ⟨2735⟩, proname := "sind", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨701⟩, proargtypes := [⟨701⟩] }
    , { oid := ⟨2736⟩, proname := "cosd", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨701⟩, proargtypes := [⟨701⟩] }
    , { oid := ⟨2737⟩, proname := "tand", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨701⟩, proargtypes := [⟨701⟩] }
    , { oid := ⟨2738⟩, proname := "cotd", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨701⟩, proargtypes := [⟨701⟩] }
    , { oid := ⟨1608⟩, proname := "degrees", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨701⟩, proargtypes := [⟨701⟩] }
    , { oid := ⟨1609⟩, proname := "radians", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨701⟩, proargtypes := [⟨701⟩] }
    , { oid := ⟨1610⟩, proname := "pi", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨701⟩, proargtypes := [] }
    , { oid := ⟨2462⟩, proname := "sinh", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨701⟩, proargtypes := [⟨701⟩] }
    , { oid := ⟨2463⟩, proname := "cosh", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨701⟩, proargtypes := [⟨701⟩] }
    , { oid := ⟨2464⟩, proname := "tanh", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨701⟩, proargtypes := [⟨701⟩] }
    , { oid := ⟨2465⟩, proname := "asinh", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨701⟩, proargtypes := [⟨701⟩] }
    , { oid := ⟨2466⟩, proname := "acosh", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨701⟩, proargtypes := [⟨701⟩] }
    , { oid := ⟨2467⟩, proname := "atanh", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨701⟩, proargtypes := [⟨701⟩] }
    , { oid := ⟨6219⟩, proname := "erf", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨701⟩, proargtypes := [⟨701⟩] }
    , { oid := ⟨6220⟩, proname := "erfc", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨701⟩, proargtypes := [⟨701⟩] }
    , { oid := ⟨1618⟩, proname := "interval_mul", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨1186⟩, proargtypes := [⟨1186⟩, ⟨701⟩] }
    , { oid := ⟨1620⟩, proname := "ascii", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨23⟩, proargtypes := [⟨25⟩] }
    , { oid := ⟨1621⟩, proname := "chr", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨25⟩, proargtypes := [⟨23⟩] }
    , { oid := ⟨1622⟩, proname := "repeat", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨25⟩, proargtypes := [⟨25⟩, ⟨23⟩] }
    , { oid := ⟨1623⟩, proname := "similar_escape", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨25⟩, proargtypes := [⟨25⟩, ⟨25⟩] }
    , { oid := ⟨1986⟩, proname := "similar_to_escape", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨25⟩, proargtypes := [⟨25⟩, ⟨25⟩] }
    , { oid := ⟨1987⟩, proname := "similar_to_escape", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨25⟩, proargtypes := [⟨25⟩] }
    , { oid := ⟨1624⟩, proname := "mul_d_interval", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨1186⟩, proargtypes := [⟨701⟩, ⟨1186⟩] }
    , { oid := ⟨1631⟩, proname := "bpcharlike", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨1042⟩, ⟨25⟩] }
    , { oid := ⟨1632⟩, proname := "bpcharnlike", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨1042⟩, ⟨25⟩] }
    , { oid := ⟨1633⟩, proname := "texticlike", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨25⟩, ⟨25⟩] }
    , { oid := ⟨1025⟩, proname := "texticlike_support", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨2281⟩, proargtypes := [⟨2281⟩] }
    , { oid := ⟨1634⟩, proname := "texticnlike", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨25⟩, ⟨25⟩] }
    , { oid := ⟨1635⟩, proname := "nameiclike", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨19⟩, ⟨25⟩] }
    , { oid := ⟨1636⟩, proname := "nameicnlike", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨19⟩, ⟨25⟩] }
    , { oid := ⟨1637⟩, proname := "like_escape", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨25⟩, proargtypes := [⟨25⟩, ⟨25⟩] }
    , { oid := ⟨1656⟩, proname := "bpcharicregexeq", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨1042⟩, ⟨25⟩] }
    , { oid := ⟨1657⟩, proname := "bpcharicregexne", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨1042⟩, ⟨25⟩] }
    , { oid := ⟨1658⟩, proname := "bpcharregexeq", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨1042⟩, ⟨25⟩] }
    , { oid := ⟨1659⟩, proname := "bpcharregexne", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨1042⟩, ⟨25⟩] }
    , { oid := ⟨1660⟩, proname := "bpchariclike", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨1042⟩, ⟨25⟩] }
    , { oid := ⟨1661⟩, proname := "bpcharicnlike", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨1042⟩, ⟨25⟩] }
    , { oid := ⟨868⟩, proname := "strpos", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨23⟩, proargtypes := [⟨25⟩, ⟨25⟩] }
    , { oid := ⟨870⟩, proname := "lower", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨25⟩, proargtypes := [⟨25⟩] }
    , { oid := ⟨871⟩, proname := "upper", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨25⟩, proargtypes := [⟨25⟩] }
    , { oid := ⟨872⟩, proname := "initcap", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨25⟩, proargtypes := [⟨25⟩] }
    , { oid := ⟨873⟩, proname := "lpad", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨25⟩, proargtypes := [⟨25⟩, ⟨23⟩, ⟨25⟩] }
    , { oid := ⟨874⟩, proname := "rpad", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨25⟩, proargtypes := [⟨25⟩, ⟨23⟩, ⟨25⟩] }
    , { oid := ⟨875⟩, proname := "ltrim", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨25⟩, proargtypes := [⟨25⟩, ⟨25⟩] }
    , { oid := ⟨876⟩, proname := "rtrim", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨25⟩, proargtypes := [⟨25⟩, ⟨25⟩] }
    , { oid := ⟨877⟩, proname := "substr", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨25⟩, proargtypes := [⟨25⟩, ⟨23⟩, ⟨23⟩] }
    , { oid := ⟨878⟩, proname := "translate", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨25⟩, proargtypes := [⟨25⟩, ⟨25⟩, ⟨25⟩] }
    , { oid := ⟨879⟩, proname := "lpad", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨25⟩, proargtypes := [⟨25⟩, ⟨23⟩] }
    , { oid := ⟨880⟩, proname := "rpad", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨25⟩, proargtypes := [⟨25⟩, ⟨23⟩] }
    , { oid := ⟨881⟩, proname := "ltrim", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨25⟩, proargtypes := [⟨25⟩] }
    , { oid := ⟨882⟩, proname := "rtrim", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨25⟩, proargtypes := [⟨25⟩] }
    , { oid := ⟨883⟩, proname := "substr", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨25⟩, proargtypes := [⟨25⟩, ⟨23⟩] }
    , { oid := ⟨884⟩, proname := "btrim", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨25⟩, proargtypes := [⟨25⟩, ⟨25⟩] }
    , { oid := ⟨885⟩, proname := "btrim", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨25⟩, proargtypes := [⟨25⟩] }
    , { oid := ⟨936⟩, proname := "substring", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨25⟩, proargtypes := [⟨25⟩, ⟨23⟩, ⟨23⟩] }
    , { oid := ⟨937⟩, proname := "substring", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨25⟩, proargtypes := [⟨25⟩, ⟨23⟩] }
    , { oid := ⟨2087⟩, proname := "replace", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨25⟩, proargtypes := [⟨25⟩, ⟨25⟩, ⟨25⟩] }
    , { oid := ⟨2284⟩, proname := "regexp_replace", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨25⟩, proargtypes := [⟨25⟩, ⟨25⟩, ⟨25⟩] }
    , { oid := ⟨2285⟩, proname := "regexp_replace", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨25⟩, proargtypes := [⟨25⟩, ⟨25⟩, ⟨25⟩, ⟨25⟩] }
    , { oid := ⟨6251⟩, proname := "regexp_replace", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨25⟩, proargtypes := [⟨25⟩, ⟨25⟩, ⟨25⟩, ⟨23⟩, ⟨23⟩, ⟨25⟩] }
    , { oid := ⟨6252⟩, proname := "regexp_replace", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨25⟩, proargtypes := [⟨25⟩, ⟨25⟩, ⟨25⟩, ⟨23⟩, ⟨23⟩] }
    , { oid := ⟨6253⟩, proname := "regexp_replace", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨25⟩, proargtypes := [⟨25⟩, ⟨25⟩, ⟨25⟩, ⟨23⟩] }
    , { oid := ⟨3396⟩, proname := "regexp_match", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨1009⟩, proargtypes := [⟨25⟩, ⟨25⟩] }
    , { oid := ⟨3397⟩, proname := "regexp_match", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨1009⟩, proargtypes := [⟨25⟩, ⟨25⟩, ⟨25⟩] }
    , { oid := ⟨2763⟩, proname := "regexp_matches", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨1009⟩, proargtypes := [⟨25⟩, ⟨25⟩] }
    , { oid := ⟨2764⟩, proname := "regexp_matches", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨1009⟩, proargtypes := [⟨25⟩, ⟨25⟩, ⟨25⟩] }
    , { oid := ⟨6254⟩, proname := "regexp_count", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨23⟩, proargtypes := [⟨25⟩, ⟨25⟩] }
    , { oid := ⟨6255⟩, proname := "regexp_count", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨23⟩, proargtypes := [⟨25⟩, ⟨25⟩, ⟨23⟩] }
    , { oid := ⟨6256⟩, proname := "regexp_count", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨23⟩, proargtypes := [⟨25⟩, ⟨25⟩, ⟨23⟩, ⟨25⟩] }
    , { oid := ⟨6257⟩, proname := "regexp_instr", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨23⟩, proargtypes := [⟨25⟩, ⟨25⟩] }
    , { oid := ⟨6258⟩, proname := "regexp_instr", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨23⟩, proargtypes := [⟨25⟩, ⟨25⟩, ⟨23⟩] }
    , { oid := ⟨6259⟩, proname := "regexp_instr", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨23⟩, proargtypes := [⟨25⟩, ⟨25⟩, ⟨23⟩, ⟨23⟩] }
    , { oid := ⟨6260⟩, proname := "regexp_instr", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨23⟩, proargtypes := [⟨25⟩, ⟨25⟩, ⟨23⟩, ⟨23⟩, ⟨23⟩] }
    , { oid := ⟨6261⟩, proname := "regexp_instr", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨23⟩, proargtypes := [⟨25⟩, ⟨25⟩, ⟨23⟩, ⟨23⟩, ⟨23⟩, ⟨25⟩] }
    , { oid := ⟨6262⟩, proname := "regexp_instr", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨23⟩, proargtypes := [⟨25⟩, ⟨25⟩, ⟨23⟩, ⟨23⟩, ⟨23⟩, ⟨25⟩, ⟨23⟩] }
    , { oid := ⟨6263⟩, proname := "regexp_like", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨25⟩, ⟨25⟩] }
    , { oid := ⟨6264⟩, proname := "regexp_like", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨25⟩, ⟨25⟩, ⟨25⟩] }
    , { oid := ⟨6265⟩, proname := "regexp_substr", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨25⟩, proargtypes := [⟨25⟩, ⟨25⟩] }
    , { oid := ⟨6266⟩, proname := "regexp_substr", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨25⟩, proargtypes := [⟨25⟩, ⟨25⟩, ⟨23⟩] }
    , { oid := ⟨6267⟩, proname := "regexp_substr", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨25⟩, proargtypes := [⟨25⟩, ⟨25⟩, ⟨23⟩, ⟨23⟩] }
    , { oid := ⟨6268⟩, proname := "regexp_substr", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨25⟩, proargtypes := [⟨25⟩, ⟨25⟩, ⟨23⟩, ⟨23⟩, ⟨25⟩] }
    , { oid := ⟨6269⟩, proname := "regexp_substr", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨25⟩, proargtypes := [⟨25⟩, ⟨25⟩, ⟨23⟩, ⟨23⟩, ⟨25⟩, ⟨23⟩] }
    , { oid := ⟨2088⟩, proname := "split_part", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨25⟩, proargtypes := [⟨25⟩, ⟨25⟩, ⟨23⟩] }
    , { oid := ⟨2765⟩, proname := "regexp_split_to_table", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨25⟩, proargtypes := [⟨25⟩, ⟨25⟩] }
    , { oid := ⟨2766⟩, proname := "regexp_split_to_table", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨25⟩, proargtypes := [⟨25⟩, ⟨25⟩, ⟨25⟩] }
    , { oid := ⟨2767⟩, proname := "regexp_split_to_array", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨1009⟩, proargtypes := [⟨25⟩, ⟨25⟩] }
    , { oid := ⟨2768⟩, proname := "regexp_split_to_array", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨1009⟩, proargtypes := [⟨25⟩, ⟨25⟩, ⟨25⟩] }
    , { oid := ⟨6330⟩, proname := "to_bin", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨25⟩, proargtypes := [⟨23⟩] }
    , { oid := ⟨6331⟩, proname := "to_bin", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨25⟩, proargtypes := [⟨20⟩] }
    , { oid := ⟨6332⟩, proname := "to_oct", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨25⟩, proargtypes := [⟨23⟩] }
    , { oid := ⟨6333⟩, proname := "to_oct", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨25⟩, proargtypes := [⟨20⟩] }
    , { oid := ⟨2089⟩, proname := "to_hex", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨25⟩, proargtypes := [⟨23⟩] }
    , { oid := ⟨2090⟩, proname := "to_hex", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨25⟩, proargtypes := [⟨20⟩] }
    , { oid := ⟨1039⟩, proname := "getdatabaseencoding", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨19⟩, proargtypes := [] }
    , { oid := ⟨810⟩, proname := "pg_client_encoding", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨19⟩, proargtypes := [] }
    , { oid := ⟨1713⟩, proname := "length", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨23⟩, proargtypes := [⟨17⟩, ⟨19⟩] }
    , { oid := ⟨1714⟩, proname := "convert_from", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨25⟩, proargtypes := [⟨17⟩, ⟨19⟩] }
    , { oid := ⟨1717⟩, proname := "convert_to", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨17⟩, proargtypes := [⟨25⟩, ⟨19⟩] }
    , { oid := ⟨1813⟩, proname := "convert", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨17⟩, proargtypes := [⟨17⟩, ⟨19⟩, ⟨19⟩] }
    , { oid := ⟨1264⟩, proname := "pg_char_to_encoding", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨23⟩, proargtypes := [⟨19⟩] }
    , { oid := ⟨1597⟩, proname := "pg_encoding_to_char", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨19⟩, proargtypes := [⟨23⟩] }
    , { oid := ⟨2319⟩, proname := "pg_encoding_max_length", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨23⟩, proargtypes := [⟨23⟩] }
    , { oid := ⟨1638⟩, proname := "oidgt", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨26⟩, ⟨26⟩] }
    , { oid := ⟨1639⟩, proname := "oidge", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨26⟩, ⟨26⟩] }
    , { oid := ⟨1573⟩, proname := "pg_get_ruledef", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨25⟩, proargtypes := [⟨26⟩] }
    , { oid := ⟨1640⟩, proname := "pg_get_viewdef", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨25⟩, proargtypes := [⟨25⟩] }
    , { oid := ⟨1641⟩, proname := "pg_get_viewdef", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨25⟩, proargtypes := [⟨26⟩] }
    , { oid := ⟨1642⟩, proname := "pg_get_userbyid", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨19⟩, proargtypes := [⟨26⟩] }
    , { oid := ⟨1643⟩, proname := "pg_get_indexdef", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨25⟩, proargtypes := [⟨26⟩] }
    , { oid := ⟨3415⟩, proname := "pg_get_statisticsobjdef", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨25⟩, proargtypes := [⟨26⟩] }
    , { oid := ⟨6174⟩, proname := "pg_get_statisticsobjdef_columns", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨25⟩, proargtypes := [⟨26⟩] }
    , { oid := ⟨6173⟩, proname := "pg_get_statisticsobjdef_expressions", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨1009⟩, proargtypes := [⟨26⟩] }
    , { oid := ⟨3352⟩, proname := "pg_get_partkeydef", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨25⟩, proargtypes := [⟨26⟩] }
    , { oid := ⟨3408⟩, proname := "pg_get_partition_constraintdef", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨25⟩, proargtypes := [⟨26⟩] }
    , { oid := ⟨1662⟩, proname := "pg_get_triggerdef", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨25⟩, proargtypes := [⟨26⟩] }
    , { oid := ⟨1387⟩, proname := "pg_get_constraintdef", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨25⟩, proargtypes := [⟨26⟩] }
    , { oid := ⟨1716⟩, proname := "pg_get_expr", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨25⟩, proargtypes := [⟨194⟩, ⟨26⟩] }
    , { oid := ⟨1665⟩, proname := "pg_get_serial_sequence", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨25⟩, proargtypes := [⟨25⟩, ⟨25⟩] }
    , { oid := ⟨2098⟩, proname := "pg_get_functiondef", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨25⟩, proargtypes := [⟨26⟩] }
    , { oid := ⟨2162⟩, proname := "pg_get_function_arguments", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨25⟩, proargtypes := [⟨26⟩] }
    , { oid := ⟨2232⟩, proname := "pg_get_function_identity_arguments", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨25⟩, proargtypes := [⟨26⟩] }
    , { oid := ⟨2165⟩, proname := "pg_get_function_result", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨25⟩, proargtypes := [⟨26⟩] }
    , { oid := ⟨3808⟩, proname := "pg_get_function_arg_default", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨25⟩, proargtypes := [⟨26⟩, ⟨23⟩] }
    , { oid := ⟨6197⟩, proname := "pg_get_function_sqlbody", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨25⟩, proargtypes := [⟨26⟩] }
    , { oid := ⟨1686⟩, proname := "pg_get_keywords", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨2249⟩, proargtypes := [] }
    , { oid := ⟨6159⟩, proname := "pg_get_catalog_foreign_keys", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨2249⟩, proargtypes := [] }
    , { oid := ⟨2289⟩, proname := "pg_options_to_table", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨2249⟩, proargtypes := [⟨1009⟩] }
    , { oid := ⟨1619⟩, proname := "pg_typeof", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨2206⟩, proargtypes := [⟨2276⟩] }
    , { oid := ⟨6315⟩, proname := "pg_basetype", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨2206⟩, proargtypes := [⟨2206⟩] }
    , { oid := ⟨3162⟩, proname := "pg_collation_for", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨25⟩, proargtypes := [⟨2276⟩] }
    , { oid := ⟨3842⟩, proname := "pg_relation_is_updatable", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨23⟩, proargtypes := [⟨2205⟩, ⟨16⟩] }
    , { oid := ⟨3843⟩, proname := "pg_column_is_updatable", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨16⟩, proargtypes := [⟨2205⟩, ⟨21⟩, ⟨16⟩] }
    , { oid := ⟨6120⟩, proname := "pg_get_replica_identity_index", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨2205⟩, proargtypes := [⟨2205⟩] }
    , { oid := ⟨1250⟩, proname := "unique_key_recheck", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨2279⟩, proargtypes := [] }
    , { oid := ⟨1644⟩, proname := "RI_FKey_check_ins", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨2279⟩, proargtypes := [] }
    , { oid := ⟨1645⟩, proname := "RI_FKey_check_upd", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨2279⟩, proargtypes := [] }
    , { oid := ⟨1646⟩, proname := "RI_FKey_cascade_del", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨2279⟩, proargtypes := [] }
    , { oid := ⟨1647⟩, proname := "RI_FKey_cascade_upd", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨2279⟩, proargtypes := [] }
    , { oid := ⟨1648⟩, proname := "RI_FKey_restrict_del", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨2279⟩, proargtypes := [] }
    , { oid := ⟨1649⟩, proname := "RI_FKey_restrict_upd", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨2279⟩, proargtypes := [] }
    , { oid := ⟨1650⟩, proname := "RI_FKey_setnull_del", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨2279⟩, proargtypes := [] }
    , { oid := ⟨1651⟩, proname := "RI_FKey_setnull_upd", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨2279⟩, proargtypes := [] }
    , { oid := ⟨1652⟩, proname := "RI_FKey_setdefault_del", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨2279⟩, proargtypes := [] }
    , { oid := ⟨1653⟩, proname := "RI_FKey_setdefault_upd", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨2279⟩, proargtypes := [] }
    , { oid := ⟨1654⟩, proname := "RI_FKey_noaction_del", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨2279⟩, proargtypes := [] }
    , { oid := ⟨1655⟩, proname := "RI_FKey_noaction_upd", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨2279⟩, proargtypes := [] }
    , { oid := ⟨1666⟩, proname := "varbiteq", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨1562⟩, ⟨1562⟩] }
    , { oid := ⟨1667⟩, proname := "varbitne", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨1562⟩, ⟨1562⟩] }
    , { oid := ⟨1668⟩, proname := "varbitge", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨1562⟩, ⟨1562⟩] }
    , { oid := ⟨1669⟩, proname := "varbitgt", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨1562⟩, ⟨1562⟩] }
    , { oid := ⟨1670⟩, proname := "varbitle", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨1562⟩, ⟨1562⟩] }
    , { oid := ⟨1671⟩, proname := "varbitlt", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨1562⟩, ⟨1562⟩] }
    , { oid := ⟨1672⟩, proname := "varbitcmp", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨23⟩, proargtypes := [⟨1562⟩, ⟨1562⟩] }
    , { oid := ⟨1673⟩, proname := "bitand", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨1560⟩, proargtypes := [⟨1560⟩, ⟨1560⟩] }
    , { oid := ⟨1674⟩, proname := "bitor", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨1560⟩, proargtypes := [⟨1560⟩, ⟨1560⟩] }
    , { oid := ⟨1675⟩, proname := "bitxor", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨1560⟩, proargtypes := [⟨1560⟩, ⟨1560⟩] }
    , { oid := ⟨1676⟩, proname := "bitnot", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨1560⟩, proargtypes := [⟨1560⟩] }
    , { oid := ⟨1677⟩, proname := "bitshiftleft", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨1560⟩, proargtypes := [⟨1560⟩, ⟨23⟩] }
    , { oid := ⟨1678⟩, proname := "bitshiftright", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨1560⟩, proargtypes := [⟨1560⟩, ⟨23⟩] }
    , { oid := ⟨1679⟩, proname := "bitcat", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨1562⟩, proargtypes := [⟨1562⟩, ⟨1562⟩] }
    , { oid := ⟨1680⟩, proname := "substring", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨1560⟩, proargtypes := [⟨1560⟩, ⟨23⟩, ⟨23⟩] }
    , { oid := ⟨1681⟩, proname := "length", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨23⟩, proargtypes := [⟨1560⟩] }
    , { oid := ⟨1682⟩, proname := "octet_length", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨23⟩, proargtypes := [⟨1560⟩] }
    , { oid := ⟨1683⟩, proname := "bit", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨1560⟩, proargtypes := [⟨23⟩, ⟨23⟩] }
    , { oid := ⟨1684⟩, proname := "int4", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨23⟩, proargtypes := [⟨1560⟩] }
    , { oid := ⟨1685⟩, proname := "bit", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨1560⟩, proargtypes := [⟨1560⟩, ⟨23⟩, ⟨16⟩] }
    , { oid := ⟨3158⟩, proname := "varbit_support", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨2281⟩, proargtypes := [⟨2281⟩] }
    , { oid := ⟨1687⟩, proname := "varbit", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨1562⟩, proargtypes := [⟨1562⟩, ⟨23⟩, ⟨16⟩] }
    , { oid := ⟨1698⟩, proname := "position", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨23⟩, proargtypes := [⟨1560⟩, ⟨1560⟩] }
    , { oid := ⟨1699⟩, proname := "substring", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨1560⟩, proargtypes := [⟨1560⟩, ⟨23⟩] }
    , { oid := ⟨3030⟩, proname := "overlay", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨1560⟩, proargtypes := [⟨1560⟩, ⟨1560⟩, ⟨23⟩, ⟨23⟩] }
    , { oid := ⟨3031⟩, proname := "overlay", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨1560⟩, proargtypes := [⟨1560⟩, ⟨1560⟩, ⟨23⟩] }
    , { oid := ⟨3032⟩, proname := "get_bit", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨23⟩, proargtypes := [⟨1560⟩, ⟨23⟩] }
    , { oid := ⟨3033⟩, proname := "set_bit", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨1560⟩, proargtypes := [⟨1560⟩, ⟨23⟩, ⟨23⟩] }
    , { oid := ⟨6162⟩, proname := "bit_count", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨20⟩, proargtypes := [⟨1560⟩] }
    , { oid := ⟨436⟩, proname := "macaddr_in", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨829⟩, proargtypes := [⟨2275⟩] }
    , { oid := ⟨437⟩, proname := "macaddr_out", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨2275⟩, proargtypes := [⟨829⟩] }
    , { oid := ⟨753⟩, proname := "trunc", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨829⟩, proargtypes := [⟨829⟩] }
    , { oid := ⟨830⟩, proname := "macaddr_eq", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨829⟩, ⟨829⟩] }
    , { oid := ⟨831⟩, proname := "macaddr_lt", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨829⟩, ⟨829⟩] }
    , { oid := ⟨832⟩, proname := "macaddr_le", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨829⟩, ⟨829⟩] }
    , { oid := ⟨833⟩, proname := "macaddr_gt", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨829⟩, ⟨829⟩] }
    , { oid := ⟨834⟩, proname := "macaddr_ge", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨829⟩, ⟨829⟩] }
    , { oid := ⟨835⟩, proname := "macaddr_ne", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨829⟩, ⟨829⟩] }
    , { oid := ⟨836⟩, proname := "macaddr_cmp", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨23⟩, proargtypes := [⟨829⟩, ⟨829⟩] }
    , { oid := ⟨3144⟩, proname := "macaddr_not", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨829⟩, proargtypes := [⟨829⟩] }
    , { oid := ⟨3145⟩, proname := "macaddr_and", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨829⟩, proargtypes := [⟨829⟩, ⟨829⟩] }
    , { oid := ⟨3146⟩, proname := "macaddr_or", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨829⟩, proargtypes := [⟨829⟩, ⟨829⟩] }
    , { oid := ⟨3359⟩, proname := "macaddr_sortsupport", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨2278⟩, proargtypes := [⟨2281⟩] }
    , { oid := ⟨4110⟩, proname := "macaddr8_in", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨774⟩, proargtypes := [⟨2275⟩] }
    , { oid := ⟨4111⟩, proname := "macaddr8_out", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨2275⟩, proargtypes := [⟨774⟩] }
    , { oid := ⟨4112⟩, proname := "trunc", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨774⟩, proargtypes := [⟨774⟩] }
    , { oid := ⟨4113⟩, proname := "macaddr8_eq", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨774⟩, ⟨774⟩] }
    , { oid := ⟨4114⟩, proname := "macaddr8_lt", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨774⟩, ⟨774⟩] }
    , { oid := ⟨4115⟩, proname := "macaddr8_le", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨774⟩, ⟨774⟩] }
    , { oid := ⟨4116⟩, proname := "macaddr8_gt", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨774⟩, ⟨774⟩] }
    , { oid := ⟨4117⟩, proname := "macaddr8_ge", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨774⟩, ⟨774⟩] }
    , { oid := ⟨4118⟩, proname := "macaddr8_ne", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨774⟩, ⟨774⟩] }
    , { oid := ⟨4119⟩, proname := "macaddr8_cmp", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨23⟩, proargtypes := [⟨774⟩, ⟨774⟩] }
    , { oid := ⟨4120⟩, proname := "macaddr8_not", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨774⟩, proargtypes := [⟨774⟩] }
    , { oid := ⟨4121⟩, proname := "macaddr8_and", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨774⟩, proargtypes := [⟨774⟩, ⟨774⟩] }
    , { oid := ⟨4122⟩, proname := "macaddr8_or", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨774⟩, proargtypes := [⟨774⟩, ⟨774⟩] }
    , { oid := ⟨4123⟩, proname := "macaddr8", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨774⟩, proargtypes := [⟨829⟩] }
    , { oid := ⟨4124⟩, proname := "macaddr", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨829⟩, proargtypes := [⟨774⟩] }
    , { oid := ⟨4125⟩, proname := "macaddr8_set7bit", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨774⟩, proargtypes := [⟨774⟩] }
    , { oid := ⟨910⟩, proname := "inet_in", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨869⟩, proargtypes := [⟨2275⟩] }
    , { oid := ⟨911⟩, proname := "inet_out", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨2275⟩, proargtypes := [⟨869⟩] }
    , { oid := ⟨1267⟩, proname := "cidr_in", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨650⟩, proargtypes := [⟨2275⟩] }
    , { oid := ⟨1427⟩, proname := "cidr_out", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨2275⟩, proargtypes := [⟨650⟩] }
    , { oid := ⟨920⟩, proname := "network_eq", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨869⟩, ⟨869⟩] }
    , { oid := ⟨921⟩, proname := "network_lt", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨869⟩, ⟨869⟩] }
    , { oid := ⟨922⟩, proname := "network_le", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨869⟩, ⟨869⟩] }
    , { oid := ⟨923⟩, proname := "network_gt", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨869⟩, ⟨869⟩] }
    , { oid := ⟨924⟩, proname := "network_ge", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨869⟩, ⟨869⟩] }
    , { oid := ⟨925⟩, proname := "network_ne", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨869⟩, ⟨869⟩] }
    , { oid := ⟨3562⟩, proname := "network_larger", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨869⟩, proargtypes := [⟨869⟩, ⟨869⟩] }
    , { oid := ⟨3563⟩, proname := "network_smaller", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨869⟩, proargtypes := [⟨869⟩, ⟨869⟩] }
    , { oid := ⟨926⟩, proname := "network_cmp", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨23⟩, proargtypes := [⟨869⟩, ⟨869⟩] }
    , { oid := ⟨927⟩, proname := "network_sub", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨869⟩, ⟨869⟩] }
    , { oid := ⟨928⟩, proname := "network_subeq", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨869⟩, ⟨869⟩] }
    , { oid := ⟨929⟩, proname := "network_sup", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨869⟩, ⟨869⟩] }
    , { oid := ⟨930⟩, proname := "network_supeq", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨869⟩, ⟨869⟩] }
    , { oid := ⟨1173⟩, proname := "network_subset_support", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨2281⟩, proargtypes := [⟨2281⟩] }
    , { oid := ⟨3551⟩, proname := "network_overlap", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨869⟩, ⟨869⟩] }
    , { oid := ⟨5033⟩, proname := "network_sortsupport", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨2278⟩, proargtypes := [⟨2281⟩] }
    , { oid := ⟨598⟩, proname := "abbrev", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨25⟩, proargtypes := [⟨869⟩] }
    , { oid := ⟨599⟩, proname := "abbrev", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨25⟩, proargtypes := [⟨650⟩] }
    , { oid := ⟨605⟩, proname := "set_masklen", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨869⟩, proargtypes := [⟨869⟩, ⟨23⟩] }
    , { oid := ⟨635⟩, proname := "set_masklen", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨650⟩, proargtypes := [⟨650⟩, ⟨23⟩] }
    , { oid := ⟨711⟩, proname := "family", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨23⟩, proargtypes := [⟨869⟩] }
    , { oid := ⟨683⟩, proname := "network", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨650⟩, proargtypes := [⟨869⟩] }
    , { oid := ⟨696⟩, proname := "netmask", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨869⟩, proargtypes := [⟨869⟩] }
    , { oid := ⟨697⟩, proname := "masklen", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨23⟩, proargtypes := [⟨869⟩] }
    , { oid := ⟨698⟩, proname := "broadcast", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨869⟩, proargtypes := [⟨869⟩] }
    , { oid := ⟨699⟩, proname := "host", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨25⟩, proargtypes := [⟨869⟩] }
    , { oid := ⟨730⟩, proname := "text", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨25⟩, proargtypes := [⟨869⟩] }
    , { oid := ⟨1362⟩, proname := "hostmask", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨869⟩, proargtypes := [⟨869⟩] }
    , { oid := ⟨1715⟩, proname := "cidr", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨650⟩, proargtypes := [⟨869⟩] }
    , { oid := ⟨2196⟩, proname := "inet_client_addr", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨869⟩, proargtypes := [] }
    , { oid := ⟨2197⟩, proname := "inet_client_port", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨23⟩, proargtypes := [] }
    , { oid := ⟨2198⟩, proname := "inet_server_addr", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨869⟩, proargtypes := [] }
    , { oid := ⟨2199⟩, proname := "inet_server_port", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨23⟩, proargtypes := [] }
    , { oid := ⟨2627⟩, proname := "inetnot", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨869⟩, proargtypes := [⟨869⟩] }
    , { oid := ⟨2628⟩, proname := "inetand", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨869⟩, proargtypes := [⟨869⟩, ⟨869⟩] }
    , { oid := ⟨2629⟩, proname := "inetor", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨869⟩, proargtypes := [⟨869⟩, ⟨869⟩] }
    , { oid := ⟨2630⟩, proname := "inetpl", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨869⟩, proargtypes := [⟨869⟩, ⟨20⟩] }
    , { oid := ⟨2631⟩, proname := "int8pl_inet", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨869⟩, proargtypes := [⟨20⟩, ⟨869⟩] }
    , { oid := ⟨2632⟩, proname := "inetmi_int8", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨869⟩, proargtypes := [⟨869⟩, ⟨20⟩] }
    , { oid := ⟨2633⟩, proname := "inetmi", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨20⟩, proargtypes := [⟨869⟩, ⟨869⟩] }
    , { oid := ⟨4071⟩, proname := "inet_same_family", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨869⟩, ⟨869⟩] }
    , { oid := ⟨4063⟩, proname := "inet_merge", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨650⟩, proargtypes := [⟨869⟩, ⟨869⟩] }
    , { oid := ⟨3553⟩, proname := "inet_gist_consistent", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨2281⟩, ⟨869⟩, ⟨21⟩, ⟨26⟩, ⟨2281⟩] }
    , { oid := ⟨3554⟩, proname := "inet_gist_union", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨869⟩, proargtypes := [⟨2281⟩, ⟨2281⟩] }
    , { oid := ⟨3555⟩, proname := "inet_gist_compress", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨2281⟩, proargtypes := [⟨2281⟩] }
    , { oid := ⟨3573⟩, proname := "inet_gist_fetch", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨2281⟩, proargtypes := [⟨2281⟩] }
    , { oid := ⟨3557⟩, proname := "inet_gist_penalty", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨2281⟩, proargtypes := [⟨2281⟩, ⟨2281⟩, ⟨2281⟩] }
    , { oid := ⟨3558⟩, proname := "inet_gist_picksplit", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨2281⟩, proargtypes := [⟨2281⟩, ⟨2281⟩] }
    , { oid := ⟨3559⟩, proname := "inet_gist_same", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨2281⟩, proargtypes := [⟨869⟩, ⟨869⟩, ⟨2281⟩] }
    , { oid := ⟨3795⟩, proname := "inet_spg_config", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨2278⟩, proargtypes := [⟨2281⟩, ⟨2281⟩] }
    , { oid := ⟨3796⟩, proname := "inet_spg_choose", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨2278⟩, proargtypes := [⟨2281⟩, ⟨2281⟩] }
    , { oid := ⟨3797⟩, proname := "inet_spg_picksplit", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨2278⟩, proargtypes := [⟨2281⟩, ⟨2281⟩] }
    , { oid := ⟨3798⟩, proname := "inet_spg_inner_consistent", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨2278⟩, proargtypes := [⟨2281⟩, ⟨2281⟩] }
    , { oid := ⟨3799⟩, proname := "inet_spg_leaf_consistent", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨2281⟩, ⟨2281⟩] }
    , { oid := ⟨3560⟩, proname := "networksel", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨701⟩, proargtypes := [⟨2281⟩, ⟨26⟩, ⟨2281⟩, ⟨23⟩] }
    , { oid := ⟨3561⟩, proname := "networkjoinsel", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨701⟩, proargtypes := [⟨2281⟩, ⟨26⟩, ⟨2281⟩, ⟨21⟩, ⟨2281⟩] }
    , { oid := ⟨1690⟩, proname := "time_mi_time", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨1186⟩, proargtypes := [⟨1083⟩, ⟨1083⟩] }
    , { oid := ⟨1691⟩, proname := "boolle", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨16⟩, ⟨16⟩] }
    , { oid := ⟨1692⟩, proname := "boolge", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨16⟩, ⟨16⟩] }
    , { oid := ⟨1693⟩, proname := "btboolcmp", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨23⟩, proargtypes := [⟨16⟩, ⟨16⟩] }
    , { oid := ⟨1688⟩, proname := "time_hash", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨23⟩, proargtypes := [⟨1083⟩] }
    , { oid := ⟨3409⟩, proname := "time_hash_extended", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨20⟩, proargtypes := [⟨1083⟩, ⟨20⟩] }
    , { oid := ⟨1696⟩, proname := "timetz_hash", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨23⟩, proargtypes := [⟨1266⟩] }
    , { oid := ⟨3410⟩, proname := "timetz_hash_extended", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨20⟩, proargtypes := [⟨1266⟩, ⟨20⟩] }
    , { oid := ⟨1697⟩, proname := "interval_hash", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨23⟩, proargtypes := [⟨1186⟩] }
    , { oid := ⟨3418⟩, proname := "interval_hash_extended", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨20⟩, proargtypes := [⟨1186⟩, ⟨20⟩] }
    , { oid := ⟨1701⟩, proname := "numeric_in", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨1700⟩, proargtypes := [⟨2275⟩, ⟨26⟩, ⟨23⟩] }
    , { oid := ⟨1702⟩, proname := "numeric_out", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨2275⟩, proargtypes := [⟨1700⟩] }
    , { oid := ⟨2917⟩, proname := "numerictypmodin", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨23⟩, proargtypes := [⟨1263⟩] }
    , { oid := ⟨2918⟩, proname := "numerictypmodout", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨2275⟩, proargtypes := [⟨23⟩] }
    , { oid := ⟨3157⟩, proname := "numeric_support", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨2281⟩, proargtypes := [⟨2281⟩] }
    , { oid := ⟨1703⟩, proname := "numeric", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨1700⟩, proargtypes := [⟨1700⟩, ⟨23⟩] }
    , { oid := ⟨1704⟩, proname := "numeric_abs", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨1700⟩, proargtypes := [⟨1700⟩] }
    , { oid := ⟨1705⟩, proname := "abs", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨1700⟩, proargtypes := [⟨1700⟩] }
    , { oid := ⟨1706⟩, proname := "sign", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨1700⟩, proargtypes := [⟨1700⟩] }
    , { oid := ⟨1707⟩, proname := "round", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨1700⟩, proargtypes := [⟨1700⟩, ⟨23⟩] }
    , { oid := ⟨1708⟩, proname := "round", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨1700⟩, proargtypes := [⟨1700⟩] }
    , { oid := ⟨1709⟩, proname := "trunc", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨1700⟩, proargtypes := [⟨1700⟩, ⟨23⟩] }
    , { oid := ⟨1710⟩, proname := "trunc", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨1700⟩, proargtypes := [⟨1700⟩] }
    , { oid := ⟨1711⟩, proname := "ceil", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨1700⟩, proargtypes := [⟨1700⟩] }
    , { oid := ⟨2167⟩, proname := "ceiling", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨1700⟩, proargtypes := [⟨1700⟩] }
    , { oid := ⟨1712⟩, proname := "floor", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨1700⟩, proargtypes := [⟨1700⟩] }
    , { oid := ⟨1718⟩, proname := "numeric_eq", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨1700⟩, ⟨1700⟩] }
    , { oid := ⟨1719⟩, proname := "numeric_ne", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨1700⟩, ⟨1700⟩] }
    , { oid := ⟨1720⟩, proname := "numeric_gt", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨1700⟩, ⟨1700⟩] }
    , { oid := ⟨1721⟩, proname := "numeric_ge", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨1700⟩, ⟨1700⟩] }
    , { oid := ⟨1722⟩, proname := "numeric_lt", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨1700⟩, ⟨1700⟩] }
    , { oid := ⟨1723⟩, proname := "numeric_le", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨1700⟩, ⟨1700⟩] }
    , { oid := ⟨1724⟩, proname := "numeric_add", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨1700⟩, proargtypes := [⟨1700⟩, ⟨1700⟩] }
    , { oid := ⟨1725⟩, proname := "numeric_sub", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨1700⟩, proargtypes := [⟨1700⟩, ⟨1700⟩] }
    , { oid := ⟨1726⟩, proname := "numeric_mul", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨1700⟩, proargtypes := [⟨1700⟩, ⟨1700⟩] }
    , { oid := ⟨1727⟩, proname := "numeric_div", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨1700⟩, proargtypes := [⟨1700⟩, ⟨1700⟩] }
    , { oid := ⟨1728⟩, proname := "mod", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨1700⟩, proargtypes := [⟨1700⟩, ⟨1700⟩] }
    , { oid := ⟨1729⟩, proname := "numeric_mod", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨1700⟩, proargtypes := [⟨1700⟩, ⟨1700⟩] }
    , { oid := ⟨5048⟩, proname := "gcd", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨1700⟩, proargtypes := [⟨1700⟩, ⟨1700⟩] }
    , { oid := ⟨5049⟩, proname := "lcm", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨1700⟩, proargtypes := [⟨1700⟩, ⟨1700⟩] }
    , { oid := ⟨1730⟩, proname := "sqrt", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨1700⟩, proargtypes := [⟨1700⟩] }
    , { oid := ⟨1731⟩, proname := "numeric_sqrt", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨1700⟩, proargtypes := [⟨1700⟩] }
    , { oid := ⟨1732⟩, proname := "exp", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨1700⟩, proargtypes := [⟨1700⟩] }
    , { oid := ⟨1733⟩, proname := "numeric_exp", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨1700⟩, proargtypes := [⟨1700⟩] }
    , { oid := ⟨1734⟩, proname := "ln", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨1700⟩, proargtypes := [⟨1700⟩] }
    , { oid := ⟨1735⟩, proname := "numeric_ln", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨1700⟩, proargtypes := [⟨1700⟩] }
    , { oid := ⟨1736⟩, proname := "log", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨1700⟩, proargtypes := [⟨1700⟩, ⟨1700⟩] }
    , { oid := ⟨1737⟩, proname := "numeric_log", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨1700⟩, proargtypes := [⟨1700⟩, ⟨1700⟩] }
    , { oid := ⟨1738⟩, proname := "pow", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨1700⟩, proargtypes := [⟨1700⟩, ⟨1700⟩] }
    , { oid := ⟨2169⟩, proname := "power", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨1700⟩, proargtypes := [⟨1700⟩, ⟨1700⟩] }
    , { oid := ⟨1739⟩, proname := "numeric_power", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨1700⟩, proargtypes := [⟨1700⟩, ⟨1700⟩] }
    , { oid := ⟨3281⟩, proname := "scale", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨23⟩, proargtypes := [⟨1700⟩] }
    , { oid := ⟨5042⟩, proname := "min_scale", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨23⟩, proargtypes := [⟨1700⟩] }
    , { oid := ⟨5043⟩, proname := "trim_scale", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨1700⟩, proargtypes := [⟨1700⟩] }
    , { oid := ⟨1740⟩, proname := "numeric", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨1700⟩, proargtypes := [⟨23⟩] }
    , { oid := ⟨1741⟩, proname := "log", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨1700⟩, proargtypes := [⟨1700⟩] }
    , { oid := ⟨1481⟩, proname := "log10", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨1700⟩, proargtypes := [⟨1700⟩] }
    , { oid := ⟨1742⟩, proname := "numeric", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨1700⟩, proargtypes := [⟨700⟩] }
    , { oid := ⟨1743⟩, proname := "numeric", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨1700⟩, proargtypes := [⟨701⟩] }
    , { oid := ⟨1744⟩, proname := "int4", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨23⟩, proargtypes := [⟨1700⟩] }
    , { oid := ⟨1745⟩, proname := "float4", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨700⟩, proargtypes := [⟨1700⟩] }
    , { oid := ⟨1746⟩, proname := "float8", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨701⟩, proargtypes := [⟨1700⟩] }
    , { oid := ⟨1973⟩, proname := "div", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨1700⟩, proargtypes := [⟨1700⟩, ⟨1700⟩] }
    , { oid := ⟨1980⟩, proname := "numeric_div_trunc", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨1700⟩, proargtypes := [⟨1700⟩, ⟨1700⟩] }
    , { oid := ⟨2170⟩, proname := "width_bucket", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨23⟩, proargtypes := [⟨1700⟩, ⟨1700⟩, ⟨1700⟩, ⟨23⟩] }
    , { oid := ⟨1747⟩, proname := "time_pl_interval", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨1083⟩, proargtypes := [⟨1083⟩, ⟨1186⟩] }
    , { oid := ⟨1748⟩, proname := "time_mi_interval", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨1083⟩, proargtypes := [⟨1083⟩, ⟨1186⟩] }
    , { oid := ⟨1749⟩, proname := "timetz_pl_interval", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨1266⟩, proargtypes := [⟨1266⟩, ⟨1186⟩] }
    , { oid := ⟨1750⟩, proname := "timetz_mi_interval", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨1266⟩, proargtypes := [⟨1266⟩, ⟨1186⟩] }
    , { oid := ⟨1764⟩, proname := "numeric_inc", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨1700⟩, proargtypes := [⟨1700⟩] }
    , { oid := ⟨1766⟩, proname := "numeric_smaller", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨1700⟩, proargtypes := [⟨1700⟩, ⟨1700⟩] }
    , { oid := ⟨1767⟩, proname := "numeric_larger", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨1700⟩, proargtypes := [⟨1700⟩, ⟨1700⟩] }
    , { oid := ⟨1769⟩, proname := "numeric_cmp", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨23⟩, proargtypes := [⟨1700⟩, ⟨1700⟩] }
    , { oid := ⟨3283⟩, proname := "numeric_sortsupport", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨2278⟩, proargtypes := [⟨2281⟩] }
    , { oid := ⟨1771⟩, proname := "numeric_uminus", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨1700⟩, proargtypes := [⟨1700⟩] }
    , { oid := ⟨1779⟩, proname := "int8", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨20⟩, proargtypes := [⟨1700⟩] }
    , { oid := ⟨1781⟩, proname := "numeric", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨1700⟩, proargtypes := [⟨20⟩] }
    , { oid := ⟨1782⟩, proname := "numeric", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨1700⟩, proargtypes := [⟨21⟩] }
    , { oid := ⟨1783⟩, proname := "int2", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨21⟩, proargtypes := [⟨1700⟩] }
    , { oid := ⟨6103⟩, proname := "pg_lsn", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨3220⟩, proargtypes := [⟨1700⟩] }
    , { oid := ⟨3556⟩, proname := "bool", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨3802⟩] }
    , { oid := ⟨3449⟩, proname := "numeric", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨1700⟩, proargtypes := [⟨3802⟩] }
    , { oid := ⟨3450⟩, proname := "int2", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨21⟩, proargtypes := [⟨3802⟩] }
    , { oid := ⟨3451⟩, proname := "int4", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨23⟩, proargtypes := [⟨3802⟩] }
    , { oid := ⟨3452⟩, proname := "int8", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨20⟩, proargtypes := [⟨3802⟩] }
    , { oid := ⟨3453⟩, proname := "float4", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨700⟩, proargtypes := [⟨3802⟩] }
    , { oid := ⟨2580⟩, proname := "float8", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨701⟩, proargtypes := [⟨3802⟩] }
    , { oid := ⟨1770⟩, proname := "to_char", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨25⟩, proargtypes := [⟨1184⟩, ⟨25⟩] }
    , { oid := ⟨1772⟩, proname := "to_char", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨25⟩, proargtypes := [⟨1700⟩, ⟨25⟩] }
    , { oid := ⟨1773⟩, proname := "to_char", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨25⟩, proargtypes := [⟨23⟩, ⟨25⟩] }
    , { oid := ⟨1774⟩, proname := "to_char", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨25⟩, proargtypes := [⟨20⟩, ⟨25⟩] }
    , { oid := ⟨1775⟩, proname := "to_char", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨25⟩, proargtypes := [⟨700⟩, ⟨25⟩] }
    , { oid := ⟨1776⟩, proname := "to_char", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨25⟩, proargtypes := [⟨701⟩, ⟨25⟩] }
    , { oid := ⟨1777⟩, proname := "to_number", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨1700⟩, proargtypes := [⟨25⟩, ⟨25⟩] }
    , { oid := ⟨1778⟩, proname := "to_timestamp", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨1184⟩, proargtypes := [⟨25⟩, ⟨25⟩] }
    , { oid := ⟨1780⟩, proname := "to_date", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨1082⟩, proargtypes := [⟨25⟩, ⟨25⟩] }
    , { oid := ⟨1768⟩, proname := "to_char", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨25⟩, proargtypes := [⟨1186⟩, ⟨25⟩] }
    , { oid := ⟨1282⟩, proname := "quote_ident", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨25⟩, proargtypes := [⟨25⟩] }
    , { oid := ⟨1283⟩, proname := "quote_literal", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨25⟩, proargtypes := [⟨25⟩] }
    , { oid := ⟨1285⟩, proname := "quote_literal", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨25⟩, proargtypes := [⟨2283⟩] }
    , { oid := ⟨1289⟩, proname := "quote_nullable", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨25⟩, proargtypes := [⟨25⟩] }
    , { oid := ⟨1290⟩, proname := "quote_nullable", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨25⟩, proargtypes := [⟨2283⟩] }
    , { oid := ⟨1798⟩, proname := "oidin", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨26⟩, proargtypes := [⟨2275⟩] }
    , { oid := ⟨1799⟩, proname := "oidout", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨2275⟩, proargtypes := [⟨26⟩] }
    , { oid := ⟨3058⟩, proname := "concat", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨25⟩, proargtypes := [⟨2276⟩] }
    , { oid := ⟨3059⟩, proname := "concat_ws", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨25⟩, proargtypes := [⟨25⟩, ⟨2276⟩] }
    , { oid := ⟨3060⟩, proname := "left", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨25⟩, proargtypes := [⟨25⟩, ⟨23⟩] }
    , { oid := ⟨3061⟩, proname := "right", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨25⟩, proargtypes := [⟨25⟩, ⟨23⟩] }
    , { oid := ⟨3062⟩, proname := "reverse", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨25⟩, proargtypes := [⟨25⟩] }
    , { oid := ⟨3539⟩, proname := "format", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨25⟩, proargtypes := [⟨25⟩, ⟨2276⟩] }
    , { oid := ⟨3540⟩, proname := "format", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨25⟩, proargtypes := [⟨25⟩] }
    , { oid := ⟨1810⟩, proname := "bit_length", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨23⟩, proargtypes := [⟨17⟩] }
    , { oid := ⟨1811⟩, proname := "bit_length", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨23⟩, proargtypes := [⟨25⟩] }
    , { oid := ⟨1812⟩, proname := "bit_length", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨23⟩, proargtypes := [⟨1560⟩] }
    , { oid := ⟨1814⟩, proname := "iclikesel", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨701⟩, proargtypes := [⟨2281⟩, ⟨26⟩, ⟨2281⟩, ⟨23⟩] }
    , { oid := ⟨1815⟩, proname := "icnlikesel", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨701⟩, proargtypes := [⟨2281⟩, ⟨26⟩, ⟨2281⟩, ⟨23⟩] }
    , { oid := ⟨1816⟩, proname := "iclikejoinsel", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨701⟩, proargtypes := [⟨2281⟩, ⟨26⟩, ⟨2281⟩, ⟨21⟩, ⟨2281⟩] }
    , { oid := ⟨1817⟩, proname := "icnlikejoinsel", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨701⟩, proargtypes := [⟨2281⟩, ⟨26⟩, ⟨2281⟩, ⟨21⟩, ⟨2281⟩] }
    , { oid := ⟨1818⟩, proname := "regexeqsel", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨701⟩, proargtypes := [⟨2281⟩, ⟨26⟩, ⟨2281⟩, ⟨23⟩] }
    , { oid := ⟨1819⟩, proname := "likesel", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨701⟩, proargtypes := [⟨2281⟩, ⟨26⟩, ⟨2281⟩, ⟨23⟩] }
    , { oid := ⟨1820⟩, proname := "icregexeqsel", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨701⟩, proargtypes := [⟨2281⟩, ⟨26⟩, ⟨2281⟩, ⟨23⟩] }
    , { oid := ⟨1821⟩, proname := "regexnesel", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨701⟩, proargtypes := [⟨2281⟩, ⟨26⟩, ⟨2281⟩, ⟨23⟩] }
    , { oid := ⟨1822⟩, proname := "nlikesel", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨701⟩, proargtypes := [⟨2281⟩, ⟨26⟩, ⟨2281⟩, ⟨23⟩] }
    , { oid := ⟨1823⟩, proname := "icregexnesel", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨701⟩, proargtypes := [⟨2281⟩, ⟨26⟩, ⟨2281⟩, ⟨23⟩] }
    , { oid := ⟨1824⟩, proname := "regexeqjoinsel", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨701⟩, proargtypes := [⟨2281⟩, ⟨26⟩, ⟨2281⟩, ⟨21⟩, ⟨2281⟩] }
    , { oid := ⟨1825⟩, proname := "likejoinsel", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨701⟩, proargtypes := [⟨2281⟩, ⟨26⟩, ⟨2281⟩, ⟨21⟩, ⟨2281⟩] }
    , { oid := ⟨1826⟩, proname := "icregexeqjoinsel", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨701⟩, proargtypes := [⟨2281⟩, ⟨26⟩, ⟨2281⟩, ⟨21⟩, ⟨2281⟩] }
    , { oid := ⟨1827⟩, proname := "regexnejoinsel", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨701⟩, proargtypes := [⟨2281⟩, ⟨26⟩, ⟨2281⟩, ⟨21⟩, ⟨2281⟩] }
    , { oid := ⟨1828⟩, proname := "nlikejoinsel", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨701⟩, proargtypes := [⟨2281⟩, ⟨26⟩, ⟨2281⟩, ⟨21⟩, ⟨2281⟩] }
    , { oid := ⟨1829⟩, proname := "icregexnejoinsel", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨701⟩, proargtypes := [⟨2281⟩, ⟨26⟩, ⟨2281⟩, ⟨21⟩, ⟨2281⟩] }
    , { oid := ⟨3437⟩, proname := "prefixsel", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨701⟩, proargtypes := [⟨2281⟩, ⟨26⟩, ⟨2281⟩, ⟨23⟩] }
    , { oid := ⟨3438⟩, proname := "prefixjoinsel", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨701⟩, proargtypes := [⟨2281⟩, ⟨26⟩, ⟨2281⟩, ⟨21⟩, ⟨2281⟩] }
    , { oid := ⟨1830⟩, proname := "float8_avg", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨701⟩, proargtypes := [⟨1022⟩] }
    , { oid := ⟨2512⟩, proname := "float8_var_pop", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨701⟩, proargtypes := [⟨1022⟩] }
    , { oid := ⟨1831⟩, proname := "float8_var_samp", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨701⟩, proargtypes := [⟨1022⟩] }
    , { oid := ⟨2513⟩, proname := "float8_stddev_pop", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨701⟩, proargtypes := [⟨1022⟩] }
    , { oid := ⟨1832⟩, proname := "float8_stddev_samp", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨701⟩, proargtypes := [⟨1022⟩] }
    , { oid := ⟨1833⟩, proname := "numeric_accum", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨2281⟩, proargtypes := [⟨2281⟩, ⟨1700⟩] }
    , { oid := ⟨3341⟩, proname := "numeric_combine", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨2281⟩, proargtypes := [⟨2281⟩, ⟨2281⟩] }
    , { oid := ⟨2858⟩, proname := "numeric_avg_accum", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨2281⟩, proargtypes := [⟨2281⟩, ⟨1700⟩] }
    , { oid := ⟨3337⟩, proname := "numeric_avg_combine", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨2281⟩, proargtypes := [⟨2281⟩, ⟨2281⟩] }
    , { oid := ⟨2740⟩, proname := "numeric_avg_serialize", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨17⟩, proargtypes := [⟨2281⟩] }
    , { oid := ⟨2741⟩, proname := "numeric_avg_deserialize", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨2281⟩, proargtypes := [⟨17⟩, ⟨2281⟩] }
    , { oid := ⟨3335⟩, proname := "numeric_serialize", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨17⟩, proargtypes := [⟨2281⟩] }
    , { oid := ⟨3336⟩, proname := "numeric_deserialize", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨2281⟩, proargtypes := [⟨17⟩, ⟨2281⟩] }
    , { oid := ⟨3548⟩, proname := "numeric_accum_inv", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨2281⟩, proargtypes := [⟨2281⟩, ⟨1700⟩] }
    , { oid := ⟨1834⟩, proname := "int2_accum", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨2281⟩, proargtypes := [⟨2281⟩, ⟨21⟩] }
    , { oid := ⟨1835⟩, proname := "int4_accum", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨2281⟩, proargtypes := [⟨2281⟩, ⟨23⟩] }
    , { oid := ⟨1836⟩, proname := "int8_accum", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨2281⟩, proargtypes := [⟨2281⟩, ⟨20⟩] }
    , { oid := ⟨3338⟩, proname := "numeric_poly_combine", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨2281⟩, proargtypes := [⟨2281⟩, ⟨2281⟩] }
    , { oid := ⟨3339⟩, proname := "numeric_poly_serialize", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨17⟩, proargtypes := [⟨2281⟩] }
    , { oid := ⟨3340⟩, proname := "numeric_poly_deserialize", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨2281⟩, proargtypes := [⟨17⟩, ⟨2281⟩] }
    , { oid := ⟨2746⟩, proname := "int8_avg_accum", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨2281⟩, proargtypes := [⟨2281⟩, ⟨20⟩] }
    , { oid := ⟨3567⟩, proname := "int2_accum_inv", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨2281⟩, proargtypes := [⟨2281⟩, ⟨21⟩] }
    , { oid := ⟨3568⟩, proname := "int4_accum_inv", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨2281⟩, proargtypes := [⟨2281⟩, ⟨23⟩] }
    , { oid := ⟨3569⟩, proname := "int8_accum_inv", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨2281⟩, proargtypes := [⟨2281⟩, ⟨20⟩] }
    , { oid := ⟨3387⟩, proname := "int8_avg_accum_inv", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨2281⟩, proargtypes := [⟨2281⟩, ⟨20⟩] }
    , { oid := ⟨2785⟩, proname := "int8_avg_combine", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨2281⟩, proargtypes := [⟨2281⟩, ⟨2281⟩] }
    , { oid := ⟨2786⟩, proname := "int8_avg_serialize", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨17⟩, proargtypes := [⟨2281⟩] }
    , { oid := ⟨2787⟩, proname := "int8_avg_deserialize", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨2281⟩, proargtypes := [⟨17⟩, ⟨2281⟩] }
    , { oid := ⟨3324⟩, proname := "int4_avg_combine", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨1016⟩, proargtypes := [⟨1016⟩, ⟨1016⟩] }
    , { oid := ⟨3178⟩, proname := "numeric_sum", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨1700⟩, proargtypes := [⟨2281⟩] }
    , { oid := ⟨1837⟩, proname := "numeric_avg", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨1700⟩, proargtypes := [⟨2281⟩] }
    , { oid := ⟨2514⟩, proname := "numeric_var_pop", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨1700⟩, proargtypes := [⟨2281⟩] }
    , { oid := ⟨1838⟩, proname := "numeric_var_samp", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨1700⟩, proargtypes := [⟨2281⟩] }
    , { oid := ⟨2596⟩, proname := "numeric_stddev_pop", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨1700⟩, proargtypes := [⟨2281⟩] }
    , { oid := ⟨1839⟩, proname := "numeric_stddev_samp", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨1700⟩, proargtypes := [⟨2281⟩] }
    , { oid := ⟨1840⟩, proname := "int2_sum", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨20⟩, proargtypes := [⟨20⟩, ⟨21⟩] }
    , { oid := ⟨1841⟩, proname := "int4_sum", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨20⟩, proargtypes := [⟨20⟩, ⟨23⟩] }
    , { oid := ⟨1842⟩, proname := "int8_sum", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨1700⟩, proargtypes := [⟨1700⟩, ⟨20⟩] }
    , { oid := ⟨3388⟩, proname := "numeric_poly_sum", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨1700⟩, proargtypes := [⟨2281⟩] }
    , { oid := ⟨3389⟩, proname := "numeric_poly_avg", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨1700⟩, proargtypes := [⟨2281⟩] }
    , { oid := ⟨3390⟩, proname := "numeric_poly_var_pop", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨1700⟩, proargtypes := [⟨2281⟩] }
    , { oid := ⟨3391⟩, proname := "numeric_poly_var_samp", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨1700⟩, proargtypes := [⟨2281⟩] }
    , { oid := ⟨3392⟩, proname := "numeric_poly_stddev_pop", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨1700⟩, proargtypes := [⟨2281⟩] }
    , { oid := ⟨3393⟩, proname := "numeric_poly_stddev_samp", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨1700⟩, proargtypes := [⟨2281⟩] }
    , { oid := ⟨1843⟩, proname := "interval_avg_accum", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨2281⟩, proargtypes := [⟨2281⟩, ⟨1186⟩] }
    , { oid := ⟨3325⟩, proname := "interval_avg_combine", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨2281⟩, proargtypes := [⟨2281⟩, ⟨2281⟩] }
    , { oid := ⟨3549⟩, proname := "interval_avg_accum_inv", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨2281⟩, proargtypes := [⟨2281⟩, ⟨1186⟩] }
    , { oid := ⟨6324⟩, proname := "interval_avg_serialize", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨17⟩, proargtypes := [⟨2281⟩] }
    , { oid := ⟨6325⟩, proname := "interval_avg_deserialize", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨2281⟩, proargtypes := [⟨17⟩, ⟨2281⟩] }
    , { oid := ⟨1844⟩, proname := "interval_avg", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨1186⟩, proargtypes := [⟨2281⟩] }
    , { oid := ⟨6326⟩, proname := "interval_sum", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨1186⟩, proargtypes := [⟨2281⟩] }
    , { oid := ⟨1962⟩, proname := "int2_avg_accum", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨1016⟩, proargtypes := [⟨1016⟩, ⟨21⟩] }
    , { oid := ⟨1963⟩, proname := "int4_avg_accum", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨1016⟩, proargtypes := [⟨1016⟩, ⟨23⟩] }
    , { oid := ⟨3570⟩, proname := "int2_avg_accum_inv", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨1016⟩, proargtypes := [⟨1016⟩, ⟨21⟩] }
    , { oid := ⟨3571⟩, proname := "int4_avg_accum_inv", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨1016⟩, proargtypes := [⟨1016⟩, ⟨23⟩] }
    , { oid := ⟨1964⟩, proname := "int8_avg", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨1700⟩, proargtypes := [⟨1016⟩] }
    , { oid := ⟨3572⟩, proname := "int2int4_sum", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨20⟩, proargtypes := [⟨1016⟩] }
    , { oid := ⟨2805⟩, proname := "int8inc_float8_float8", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨20⟩, proargtypes := [⟨20⟩, ⟨701⟩, ⟨701⟩] }
    , { oid := ⟨2806⟩, proname := "float8_regr_accum", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨1022⟩, proargtypes := [⟨1022⟩, ⟨701⟩, ⟨701⟩] }
    , { oid := ⟨3342⟩, proname := "float8_regr_combine", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨1022⟩, proargtypes := [⟨1022⟩, ⟨1022⟩] }
    , { oid := ⟨2807⟩, proname := "float8_regr_sxx", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨701⟩, proargtypes := [⟨1022⟩] }
    , { oid := ⟨2808⟩, proname := "float8_regr_syy", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨701⟩, proargtypes := [⟨1022⟩] }
    , { oid := ⟨2809⟩, proname := "float8_regr_sxy", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨701⟩, proargtypes := [⟨1022⟩] }
    , { oid := ⟨2810⟩, proname := "float8_regr_avgx", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨701⟩, proargtypes := [⟨1022⟩] }
    , { oid := ⟨2811⟩, proname := "float8_regr_avgy", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨701⟩, proargtypes := [⟨1022⟩] }
    , { oid := ⟨2812⟩, proname := "float8_regr_r2", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨701⟩, proargtypes := [⟨1022⟩] }
    , { oid := ⟨2813⟩, proname := "float8_regr_slope", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨701⟩, proargtypes := [⟨1022⟩] }
    , { oid := ⟨2814⟩, proname := "float8_regr_intercept", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨701⟩, proargtypes := [⟨1022⟩] }
    , { oid := ⟨2815⟩, proname := "float8_covar_pop", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨701⟩, proargtypes := [⟨1022⟩] }
    , { oid := ⟨2816⟩, proname := "float8_covar_samp", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨701⟩, proargtypes := [⟨1022⟩] }
    , { oid := ⟨2817⟩, proname := "float8_corr", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨701⟩, proargtypes := [⟨1022⟩] }
    , { oid := ⟨3535⟩, proname := "string_agg_transfn", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨2281⟩, proargtypes := [⟨2281⟩, ⟨25⟩, ⟨25⟩] }
    , { oid := ⟨6299⟩, proname := "string_agg_combine", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨2281⟩, proargtypes := [⟨2281⟩, ⟨2281⟩] }
    , { oid := ⟨6300⟩, proname := "string_agg_serialize", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨17⟩, proargtypes := [⟨2281⟩] }
    , { oid := ⟨6301⟩, proname := "string_agg_deserialize", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨2281⟩, proargtypes := [⟨17⟩, ⟨2281⟩] }
    , { oid := ⟨3536⟩, proname := "string_agg_finalfn", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨25⟩, proargtypes := [⟨2281⟩] }
    , { oid := ⟨3538⟩, proname := "string_agg", pronamespace := pgCatalogNamespace.oid, prokind := .aggregate, prosecdef := false, provolatile := .volatile, prorettype := ⟨25⟩, proargtypes := [⟨25⟩, ⟨25⟩] }
    , { oid := ⟨3543⟩, proname := "bytea_string_agg_transfn", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨2281⟩, proargtypes := [⟨2281⟩, ⟨17⟩, ⟨17⟩] }
    , { oid := ⟨3544⟩, proname := "bytea_string_agg_finalfn", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨17⟩, proargtypes := [⟨2281⟩] }
    , { oid := ⟨3545⟩, proname := "string_agg", pronamespace := pgCatalogNamespace.oid, prokind := .aggregate, prosecdef := false, provolatile := .volatile, prorettype := ⟨17⟩, proargtypes := [⟨17⟩, ⟨17⟩] }
    , { oid := ⟨1845⟩, proname := "to_ascii", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨25⟩, proargtypes := [⟨25⟩] }
    , { oid := ⟨1846⟩, proname := "to_ascii", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨25⟩, proargtypes := [⟨25⟩, ⟨23⟩] }
    , { oid := ⟨1847⟩, proname := "to_ascii", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨25⟩, proargtypes := [⟨25⟩, ⟨19⟩] }
    , { oid := ⟨1848⟩, proname := "interval_pl_time", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨1083⟩, proargtypes := [⟨1186⟩, ⟨1083⟩] }
    , { oid := ⟨1850⟩, proname := "int28eq", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨21⟩, ⟨20⟩] }
    , { oid := ⟨1851⟩, proname := "int28ne", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨21⟩, ⟨20⟩] }
    , { oid := ⟨1852⟩, proname := "int28lt", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨21⟩, ⟨20⟩] }
    , { oid := ⟨1853⟩, proname := "int28gt", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨21⟩, ⟨20⟩] }
    , { oid := ⟨1854⟩, proname := "int28le", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨21⟩, ⟨20⟩] }
    , { oid := ⟨1855⟩, proname := "int28ge", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨21⟩, ⟨20⟩] }
    , { oid := ⟨1856⟩, proname := "int82eq", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨20⟩, ⟨21⟩] }
    , { oid := ⟨1857⟩, proname := "int82ne", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨20⟩, ⟨21⟩] }
    , { oid := ⟨1858⟩, proname := "int82lt", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨20⟩, ⟨21⟩] }
    , { oid := ⟨1859⟩, proname := "int82gt", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨20⟩, ⟨21⟩] }
    , { oid := ⟨1860⟩, proname := "int82le", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨20⟩, ⟨21⟩] }
    , { oid := ⟨1861⟩, proname := "int82ge", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨20⟩, ⟨21⟩] }
    , { oid := ⟨1892⟩, proname := "int2and", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨21⟩, proargtypes := [⟨21⟩, ⟨21⟩] }
    , { oid := ⟨1893⟩, proname := "int2or", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨21⟩, proargtypes := [⟨21⟩, ⟨21⟩] }
    , { oid := ⟨1894⟩, proname := "int2xor", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨21⟩, proargtypes := [⟨21⟩, ⟨21⟩] }
    , { oid := ⟨1895⟩, proname := "int2not", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨21⟩, proargtypes := [⟨21⟩] }
    , { oid := ⟨1896⟩, proname := "int2shl", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨21⟩, proargtypes := [⟨21⟩, ⟨23⟩] }
    , { oid := ⟨1897⟩, proname := "int2shr", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨21⟩, proargtypes := [⟨21⟩, ⟨23⟩] }
    , { oid := ⟨1898⟩, proname := "int4and", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨23⟩, proargtypes := [⟨23⟩, ⟨23⟩] }
    , { oid := ⟨1899⟩, proname := "int4or", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨23⟩, proargtypes := [⟨23⟩, ⟨23⟩] }
    , { oid := ⟨1900⟩, proname := "int4xor", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨23⟩, proargtypes := [⟨23⟩, ⟨23⟩] }
    , { oid := ⟨1901⟩, proname := "int4not", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨23⟩, proargtypes := [⟨23⟩] }
    , { oid := ⟨1902⟩, proname := "int4shl", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨23⟩, proargtypes := [⟨23⟩, ⟨23⟩] }
    , { oid := ⟨1903⟩, proname := "int4shr", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨23⟩, proargtypes := [⟨23⟩, ⟨23⟩] }
    , { oid := ⟨1904⟩, proname := "int8and", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨20⟩, proargtypes := [⟨20⟩, ⟨20⟩] }
    , { oid := ⟨1905⟩, proname := "int8or", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨20⟩, proargtypes := [⟨20⟩, ⟨20⟩] }
    , { oid := ⟨1906⟩, proname := "int8xor", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨20⟩, proargtypes := [⟨20⟩, ⟨20⟩] }
    , { oid := ⟨1907⟩, proname := "int8not", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨20⟩, proargtypes := [⟨20⟩] }
    , { oid := ⟨1908⟩, proname := "int8shl", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨20⟩, proargtypes := [⟨20⟩, ⟨23⟩] }
    , { oid := ⟨1909⟩, proname := "int8shr", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨20⟩, proargtypes := [⟨20⟩, ⟨23⟩] }
    , { oid := ⟨1910⟩, proname := "int8up", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨20⟩, proargtypes := [⟨20⟩] }
    , { oid := ⟨1911⟩, proname := "int2up", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨21⟩, proargtypes := [⟨21⟩] }
    , { oid := ⟨1912⟩, proname := "int4up", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨23⟩, proargtypes := [⟨23⟩] }
    , { oid := ⟨1913⟩, proname := "float4up", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨700⟩, proargtypes := [⟨700⟩] }
    , { oid := ⟨1914⟩, proname := "float8up", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨701⟩, proargtypes := [⟨701⟩] }
    , { oid := ⟨1915⟩, proname := "numeric_uplus", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨1700⟩, proargtypes := [⟨1700⟩] }
    , { oid := ⟨1922⟩, proname := "has_table_privilege", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨16⟩, proargtypes := [⟨19⟩, ⟨25⟩, ⟨25⟩] }
    , { oid := ⟨1923⟩, proname := "has_table_privilege", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨16⟩, proargtypes := [⟨19⟩, ⟨26⟩, ⟨25⟩] }
    , { oid := ⟨1924⟩, proname := "has_table_privilege", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨16⟩, proargtypes := [⟨26⟩, ⟨25⟩, ⟨25⟩] }
    , { oid := ⟨1925⟩, proname := "has_table_privilege", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨16⟩, proargtypes := [⟨26⟩, ⟨26⟩, ⟨25⟩] }
    , { oid := ⟨1926⟩, proname := "has_table_privilege", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨16⟩, proargtypes := [⟨25⟩, ⟨25⟩] }
    , { oid := ⟨1927⟩, proname := "has_table_privilege", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨16⟩, proargtypes := [⟨26⟩, ⟨25⟩] }
    , { oid := ⟨2181⟩, proname := "has_sequence_privilege", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨16⟩, proargtypes := [⟨19⟩, ⟨25⟩, ⟨25⟩] }
    , { oid := ⟨2182⟩, proname := "has_sequence_privilege", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨16⟩, proargtypes := [⟨19⟩, ⟨26⟩, ⟨25⟩] }
    , { oid := ⟨2183⟩, proname := "has_sequence_privilege", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨16⟩, proargtypes := [⟨26⟩, ⟨25⟩, ⟨25⟩] }
    , { oid := ⟨2184⟩, proname := "has_sequence_privilege", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨16⟩, proargtypes := [⟨26⟩, ⟨26⟩, ⟨25⟩] }
    , { oid := ⟨2185⟩, proname := "has_sequence_privilege", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨16⟩, proargtypes := [⟨25⟩, ⟨25⟩] }
    , { oid := ⟨2186⟩, proname := "has_sequence_privilege", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨16⟩, proargtypes := [⟨26⟩, ⟨25⟩] }
    , { oid := ⟨3012⟩, proname := "has_column_privilege", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨16⟩, proargtypes := [⟨19⟩, ⟨25⟩, ⟨25⟩, ⟨25⟩] }
    , { oid := ⟨3013⟩, proname := "has_column_privilege", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨16⟩, proargtypes := [⟨19⟩, ⟨25⟩, ⟨21⟩, ⟨25⟩] }
    , { oid := ⟨3014⟩, proname := "has_column_privilege", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨16⟩, proargtypes := [⟨19⟩, ⟨26⟩, ⟨25⟩, ⟨25⟩] }
    , { oid := ⟨3015⟩, proname := "has_column_privilege", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨16⟩, proargtypes := [⟨19⟩, ⟨26⟩, ⟨21⟩, ⟨25⟩] }
    , { oid := ⟨3016⟩, proname := "has_column_privilege", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨16⟩, proargtypes := [⟨26⟩, ⟨25⟩, ⟨25⟩, ⟨25⟩] }
    , { oid := ⟨3017⟩, proname := "has_column_privilege", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨16⟩, proargtypes := [⟨26⟩, ⟨25⟩, ⟨21⟩, ⟨25⟩] }
    , { oid := ⟨3018⟩, proname := "has_column_privilege", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨16⟩, proargtypes := [⟨26⟩, ⟨26⟩, ⟨25⟩, ⟨25⟩] }
    , { oid := ⟨3019⟩, proname := "has_column_privilege", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨16⟩, proargtypes := [⟨26⟩, ⟨26⟩, ⟨21⟩, ⟨25⟩] }
    , { oid := ⟨3020⟩, proname := "has_column_privilege", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨16⟩, proargtypes := [⟨25⟩, ⟨25⟩, ⟨25⟩] }
    , { oid := ⟨3021⟩, proname := "has_column_privilege", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨16⟩, proargtypes := [⟨25⟩, ⟨21⟩, ⟨25⟩] }
    , { oid := ⟨3022⟩, proname := "has_column_privilege", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨16⟩, proargtypes := [⟨26⟩, ⟨25⟩, ⟨25⟩] }
    , { oid := ⟨3023⟩, proname := "has_column_privilege", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨16⟩, proargtypes := [⟨26⟩, ⟨21⟩, ⟨25⟩] }
    , { oid := ⟨3024⟩, proname := "has_any_column_privilege", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨16⟩, proargtypes := [⟨19⟩, ⟨25⟩, ⟨25⟩] }
    , { oid := ⟨3025⟩, proname := "has_any_column_privilege", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨16⟩, proargtypes := [⟨19⟩, ⟨26⟩, ⟨25⟩] }
    , { oid := ⟨3026⟩, proname := "has_any_column_privilege", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨16⟩, proargtypes := [⟨26⟩, ⟨25⟩, ⟨25⟩] }
    , { oid := ⟨3027⟩, proname := "has_any_column_privilege", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨16⟩, proargtypes := [⟨26⟩, ⟨26⟩, ⟨25⟩] }
    , { oid := ⟨3028⟩, proname := "has_any_column_privilege", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨16⟩, proargtypes := [⟨25⟩, ⟨25⟩] }
    , { oid := ⟨3029⟩, proname := "has_any_column_privilege", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨16⟩, proargtypes := [⟨26⟩, ⟨25⟩] }
    , { oid := ⟨3355⟩, proname := "pg_ndistinct_in", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨3361⟩, proargtypes := [⟨2275⟩] }
    , { oid := ⟨3356⟩, proname := "pg_ndistinct_out", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨2275⟩, proargtypes := [⟨3361⟩] }
    , { oid := ⟨3357⟩, proname := "pg_ndistinct_recv", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨3361⟩, proargtypes := [⟨2281⟩] }
    , { oid := ⟨3358⟩, proname := "pg_ndistinct_send", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨17⟩, proargtypes := [⟨3361⟩] }
    , { oid := ⟨3404⟩, proname := "pg_dependencies_in", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨3402⟩, proargtypes := [⟨2275⟩] }
    , { oid := ⟨3405⟩, proname := "pg_dependencies_out", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨2275⟩, proargtypes := [⟨3402⟩] }
    , { oid := ⟨3406⟩, proname := "pg_dependencies_recv", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨3402⟩, proargtypes := [⟨2281⟩] }
    , { oid := ⟨3407⟩, proname := "pg_dependencies_send", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨17⟩, proargtypes := [⟨3402⟩] }
    , { oid := ⟨5018⟩, proname := "pg_mcv_list_in", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨5017⟩, proargtypes := [⟨2275⟩] }
    , { oid := ⟨5019⟩, proname := "pg_mcv_list_out", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨2275⟩, proargtypes := [⟨5017⟩] }
    , { oid := ⟨5020⟩, proname := "pg_mcv_list_recv", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨5017⟩, proargtypes := [⟨2281⟩] }
    , { oid := ⟨5021⟩, proname := "pg_mcv_list_send", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨17⟩, proargtypes := [⟨5017⟩] }
    , { oid := ⟨3427⟩, proname := "pg_mcv_list_items", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨2249⟩, proargtypes := [⟨5017⟩] }
    , { oid := ⟨1928⟩, proname := "pg_stat_get_numscans", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨20⟩, proargtypes := [⟨26⟩] }
    , { oid := ⟨6310⟩, proname := "pg_stat_get_lastscan", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨1184⟩, proargtypes := [⟨26⟩] }
    , { oid := ⟨1929⟩, proname := "pg_stat_get_tuples_returned", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨20⟩, proargtypes := [⟨26⟩] }
    , { oid := ⟨1930⟩, proname := "pg_stat_get_tuples_fetched", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨20⟩, proargtypes := [⟨26⟩] }
    , { oid := ⟨1931⟩, proname := "pg_stat_get_tuples_inserted", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨20⟩, proargtypes := [⟨26⟩] }
    , { oid := ⟨1932⟩, proname := "pg_stat_get_tuples_updated", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨20⟩, proargtypes := [⟨26⟩] }
    , { oid := ⟨1933⟩, proname := "pg_stat_get_tuples_deleted", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨20⟩, proargtypes := [⟨26⟩] }
    , { oid := ⟨1972⟩, proname := "pg_stat_get_tuples_hot_updated", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨20⟩, proargtypes := [⟨26⟩] }
    , { oid := ⟨6217⟩, proname := "pg_stat_get_tuples_newpage_updated", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨20⟩, proargtypes := [⟨26⟩] }
    , { oid := ⟨2878⟩, proname := "pg_stat_get_live_tuples", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨20⟩, proargtypes := [⟨26⟩] }
    , { oid := ⟨2879⟩, proname := "pg_stat_get_dead_tuples", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨20⟩, proargtypes := [⟨26⟩] }
    , { oid := ⟨3177⟩, proname := "pg_stat_get_mod_since_analyze", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨20⟩, proargtypes := [⟨26⟩] }
    , { oid := ⟨5053⟩, proname := "pg_stat_get_ins_since_vacuum", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨20⟩, proargtypes := [⟨26⟩] }
    , { oid := ⟨1934⟩, proname := "pg_stat_get_blocks_fetched", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨20⟩, proargtypes := [⟨26⟩] }
    , { oid := ⟨1935⟩, proname := "pg_stat_get_blocks_hit", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨20⟩, proargtypes := [⟨26⟩] }
    , { oid := ⟨2781⟩, proname := "pg_stat_get_last_vacuum_time", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨1184⟩, proargtypes := [⟨26⟩] }
    , { oid := ⟨2782⟩, proname := "pg_stat_get_last_autovacuum_time", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨1184⟩, proargtypes := [⟨26⟩] }
    , { oid := ⟨2783⟩, proname := "pg_stat_get_last_analyze_time", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨1184⟩, proargtypes := [⟨26⟩] }
    , { oid := ⟨2784⟩, proname := "pg_stat_get_last_autoanalyze_time", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨1184⟩, proargtypes := [⟨26⟩] }
    , { oid := ⟨3054⟩, proname := "pg_stat_get_vacuum_count", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨20⟩, proargtypes := [⟨26⟩] }
    , { oid := ⟨3055⟩, proname := "pg_stat_get_autovacuum_count", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨20⟩, proargtypes := [⟨26⟩] }
    , { oid := ⟨3056⟩, proname := "pg_stat_get_analyze_count", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨20⟩, proargtypes := [⟨26⟩] }
    , { oid := ⟨3057⟩, proname := "pg_stat_get_autoanalyze_count", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨20⟩, proargtypes := [⟨26⟩] }
    , { oid := ⟨1936⟩, proname := "pg_stat_get_backend_idset", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨23⟩, proargtypes := [] }
    , { oid := ⟨2022⟩, proname := "pg_stat_get_activity", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨2249⟩, proargtypes := [⟨23⟩] }
    , { oid := ⟨6318⟩, proname := "pg_get_wait_events", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨2249⟩, proargtypes := [] }
    , { oid := ⟨3318⟩, proname := "pg_stat_get_progress_info", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨2249⟩, proargtypes := [⟨25⟩] }
    , { oid := ⟨3099⟩, proname := "pg_stat_get_wal_senders", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨2249⟩, proargtypes := [] }
    , { oid := ⟨3317⟩, proname := "pg_stat_get_wal_receiver", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨2249⟩, proargtypes := [] }
    , { oid := ⟨6169⟩, proname := "pg_stat_get_replication_slot", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨2249⟩, proargtypes := [⟨25⟩] }
    , { oid := ⟨6230⟩, proname := "pg_stat_have_stats", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨25⟩, ⟨26⟩, ⟨26⟩] }
    , { oid := ⟨6231⟩, proname := "pg_stat_get_subscription_stats", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨2249⟩, proargtypes := [⟨26⟩] }
    , { oid := ⟨6118⟩, proname := "pg_stat_get_subscription", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨2249⟩, proargtypes := [⟨26⟩] }
    , { oid := ⟨2026⟩, proname := "pg_backend_pid", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨23⟩, proargtypes := [] }
    , { oid := ⟨1937⟩, proname := "pg_stat_get_backend_pid", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨23⟩, proargtypes := [⟨23⟩] }
    , { oid := ⟨1938⟩, proname := "pg_stat_get_backend_dbid", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨26⟩, proargtypes := [⟨23⟩] }
    , { oid := ⟨6107⟩, proname := "pg_stat_get_backend_subxact", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨2249⟩, proargtypes := [⟨23⟩] }
    , { oid := ⟨1939⟩, proname := "pg_stat_get_backend_userid", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨26⟩, proargtypes := [⟨23⟩] }
    , { oid := ⟨1940⟩, proname := "pg_stat_get_backend_activity", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨25⟩, proargtypes := [⟨23⟩] }
    , { oid := ⟨2788⟩, proname := "pg_stat_get_backend_wait_event_type", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨25⟩, proargtypes := [⟨23⟩] }
    , { oid := ⟨2853⟩, proname := "pg_stat_get_backend_wait_event", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨25⟩, proargtypes := [⟨23⟩] }
    , { oid := ⟨2094⟩, proname := "pg_stat_get_backend_activity_start", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨1184⟩, proargtypes := [⟨23⟩] }
    , { oid := ⟨2857⟩, proname := "pg_stat_get_backend_xact_start", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨1184⟩, proargtypes := [⟨23⟩] }
    , { oid := ⟨1391⟩, proname := "pg_stat_get_backend_start", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨1184⟩, proargtypes := [⟨23⟩] }
    , { oid := ⟨1392⟩, proname := "pg_stat_get_backend_client_addr", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨869⟩, proargtypes := [⟨23⟩] }
    , { oid := ⟨1393⟩, proname := "pg_stat_get_backend_client_port", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨23⟩, proargtypes := [⟨23⟩] }
    , { oid := ⟨1941⟩, proname := "pg_stat_get_db_numbackends", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨23⟩, proargtypes := [⟨26⟩] }
    , { oid := ⟨1942⟩, proname := "pg_stat_get_db_xact_commit", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨20⟩, proargtypes := [⟨26⟩] }
    , { oid := ⟨1943⟩, proname := "pg_stat_get_db_xact_rollback", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨20⟩, proargtypes := [⟨26⟩] }
    , { oid := ⟨1944⟩, proname := "pg_stat_get_db_blocks_fetched", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨20⟩, proargtypes := [⟨26⟩] }
    , { oid := ⟨1945⟩, proname := "pg_stat_get_db_blocks_hit", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨20⟩, proargtypes := [⟨26⟩] }
    , { oid := ⟨2758⟩, proname := "pg_stat_get_db_tuples_returned", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨20⟩, proargtypes := [⟨26⟩] }
    , { oid := ⟨2759⟩, proname := "pg_stat_get_db_tuples_fetched", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨20⟩, proargtypes := [⟨26⟩] }
    , { oid := ⟨2760⟩, proname := "pg_stat_get_db_tuples_inserted", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨20⟩, proargtypes := [⟨26⟩] }
    , { oid := ⟨2761⟩, proname := "pg_stat_get_db_tuples_updated", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨20⟩, proargtypes := [⟨26⟩] }
    , { oid := ⟨2762⟩, proname := "pg_stat_get_db_tuples_deleted", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨20⟩, proargtypes := [⟨26⟩] }
    , { oid := ⟨3065⟩, proname := "pg_stat_get_db_conflict_tablespace", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨20⟩, proargtypes := [⟨26⟩] }
    , { oid := ⟨3066⟩, proname := "pg_stat_get_db_conflict_lock", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨20⟩, proargtypes := [⟨26⟩] }
    , { oid := ⟨3067⟩, proname := "pg_stat_get_db_conflict_snapshot", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨20⟩, proargtypes := [⟨26⟩] }
    , { oid := ⟨6309⟩, proname := "pg_stat_get_db_conflict_logicalslot", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨20⟩, proargtypes := [⟨26⟩] }
    , { oid := ⟨3068⟩, proname := "pg_stat_get_db_conflict_bufferpin", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨20⟩, proargtypes := [⟨26⟩] }
    , { oid := ⟨3069⟩, proname := "pg_stat_get_db_conflict_startup_deadlock", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨20⟩, proargtypes := [⟨26⟩] }
    , { oid := ⟨3070⟩, proname := "pg_stat_get_db_conflict_all", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨20⟩, proargtypes := [⟨26⟩] }
    , { oid := ⟨3152⟩, proname := "pg_stat_get_db_deadlocks", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨20⟩, proargtypes := [⟨26⟩] }
    , { oid := ⟨3426⟩, proname := "pg_stat_get_db_checksum_failures", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨20⟩, proargtypes := [⟨26⟩] }
    , { oid := ⟨3428⟩, proname := "pg_stat_get_db_checksum_last_failure", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨1184⟩, proargtypes := [⟨26⟩] }
    , { oid := ⟨3074⟩, proname := "pg_stat_get_db_stat_reset_time", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨1184⟩, proargtypes := [⟨26⟩] }
    , { oid := ⟨3150⟩, proname := "pg_stat_get_db_temp_files", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨20⟩, proargtypes := [⟨26⟩] }
    , { oid := ⟨3151⟩, proname := "pg_stat_get_db_temp_bytes", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨20⟩, proargtypes := [⟨26⟩] }
    , { oid := ⟨2844⟩, proname := "pg_stat_get_db_blk_read_time", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨701⟩, proargtypes := [⟨26⟩] }
    , { oid := ⟨2845⟩, proname := "pg_stat_get_db_blk_write_time", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨701⟩, proargtypes := [⟨26⟩] }
    , { oid := ⟨6185⟩, proname := "pg_stat_get_db_session_time", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨701⟩, proargtypes := [⟨26⟩] }
    , { oid := ⟨6186⟩, proname := "pg_stat_get_db_active_time", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨701⟩, proargtypes := [⟨26⟩] }
    , { oid := ⟨6187⟩, proname := "pg_stat_get_db_idle_in_transaction_time", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨701⟩, proargtypes := [⟨26⟩] }
    , { oid := ⟨6188⟩, proname := "pg_stat_get_db_sessions", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨20⟩, proargtypes := [⟨26⟩] }
    , { oid := ⟨6189⟩, proname := "pg_stat_get_db_sessions_abandoned", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨20⟩, proargtypes := [⟨26⟩] }
    , { oid := ⟨6190⟩, proname := "pg_stat_get_db_sessions_fatal", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨20⟩, proargtypes := [⟨26⟩] }
    , { oid := ⟨6191⟩, proname := "pg_stat_get_db_sessions_killed", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨20⟩, proargtypes := [⟨26⟩] }
    , { oid := ⟨3195⟩, proname := "pg_stat_get_archiver", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨2249⟩, proargtypes := [] }
    , { oid := ⟨2769⟩, proname := "pg_stat_get_checkpointer_num_timed", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨20⟩, proargtypes := [] }
    , { oid := ⟨2770⟩, proname := "pg_stat_get_checkpointer_num_requested", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨20⟩, proargtypes := [] }
    , { oid := ⟨6327⟩, proname := "pg_stat_get_checkpointer_restartpoints_timed", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨20⟩, proargtypes := [] }
    , { oid := ⟨6328⟩, proname := "pg_stat_get_checkpointer_restartpoints_requested", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨20⟩, proargtypes := [] }
    , { oid := ⟨6329⟩, proname := "pg_stat_get_checkpointer_restartpoints_performed", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨20⟩, proargtypes := [] }
    , { oid := ⟨2771⟩, proname := "pg_stat_get_checkpointer_buffers_written", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨20⟩, proargtypes := [] }
    , { oid := ⟨6314⟩, proname := "pg_stat_get_checkpointer_stat_reset_time", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨1184⟩, proargtypes := [] }
    , { oid := ⟨2772⟩, proname := "pg_stat_get_bgwriter_buf_written_clean", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨20⟩, proargtypes := [] }
    , { oid := ⟨2773⟩, proname := "pg_stat_get_bgwriter_maxwritten_clean", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨20⟩, proargtypes := [] }
    , { oid := ⟨3075⟩, proname := "pg_stat_get_bgwriter_stat_reset_time", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨1184⟩, proargtypes := [] }
    , { oid := ⟨3160⟩, proname := "pg_stat_get_checkpointer_write_time", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨701⟩, proargtypes := [] }
    , { oid := ⟨3161⟩, proname := "pg_stat_get_checkpointer_sync_time", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨701⟩, proargtypes := [] }
    , { oid := ⟨2859⟩, proname := "pg_stat_get_buf_alloc", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨20⟩, proargtypes := [] }
    , { oid := ⟨6214⟩, proname := "pg_stat_get_io", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨2249⟩, proargtypes := [] }
    , { oid := ⟨1136⟩, proname := "pg_stat_get_wal", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨2249⟩, proargtypes := [] }
    , { oid := ⟨6248⟩, proname := "pg_stat_get_recovery_prefetch", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨2249⟩, proargtypes := [] }
    , { oid := ⟨2306⟩, proname := "pg_stat_get_slru", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨2249⟩, proargtypes := [] }
    , { oid := ⟨2978⟩, proname := "pg_stat_get_function_calls", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨20⟩, proargtypes := [⟨26⟩] }
    , { oid := ⟨2979⟩, proname := "pg_stat_get_function_total_time", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨701⟩, proargtypes := [⟨26⟩] }
    , { oid := ⟨2980⟩, proname := "pg_stat_get_function_self_time", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨701⟩, proargtypes := [⟨26⟩] }
    , { oid := ⟨3037⟩, proname := "pg_stat_get_xact_numscans", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨20⟩, proargtypes := [⟨26⟩] }
    , { oid := ⟨3038⟩, proname := "pg_stat_get_xact_tuples_returned", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨20⟩, proargtypes := [⟨26⟩] }
    , { oid := ⟨3039⟩, proname := "pg_stat_get_xact_tuples_fetched", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨20⟩, proargtypes := [⟨26⟩] }
    , { oid := ⟨3040⟩, proname := "pg_stat_get_xact_tuples_inserted", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨20⟩, proargtypes := [⟨26⟩] }
    , { oid := ⟨3041⟩, proname := "pg_stat_get_xact_tuples_updated", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨20⟩, proargtypes := [⟨26⟩] }
    , { oid := ⟨3042⟩, proname := "pg_stat_get_xact_tuples_deleted", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨20⟩, proargtypes := [⟨26⟩] }
    , { oid := ⟨3043⟩, proname := "pg_stat_get_xact_tuples_hot_updated", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨20⟩, proargtypes := [⟨26⟩] }
    , { oid := ⟨6218⟩, proname := "pg_stat_get_xact_tuples_newpage_updated", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨20⟩, proargtypes := [⟨26⟩] }
    , { oid := ⟨3044⟩, proname := "pg_stat_get_xact_blocks_fetched", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨20⟩, proargtypes := [⟨26⟩] }
    , { oid := ⟨3045⟩, proname := "pg_stat_get_xact_blocks_hit", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨20⟩, proargtypes := [⟨26⟩] }
    , { oid := ⟨3046⟩, proname := "pg_stat_get_xact_function_calls", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨20⟩, proargtypes := [⟨26⟩] }
    , { oid := ⟨3047⟩, proname := "pg_stat_get_xact_function_total_time", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨701⟩, proargtypes := [⟨26⟩] }
    , { oid := ⟨3048⟩, proname := "pg_stat_get_xact_function_self_time", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨701⟩, proargtypes := [⟨26⟩] }
    , { oid := ⟨3788⟩, proname := "pg_stat_get_snapshot_timestamp", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨1184⟩, proargtypes := [] }
    , { oid := ⟨2230⟩, proname := "pg_stat_clear_snapshot", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨2278⟩, proargtypes := [] }
    , { oid := ⟨2137⟩, proname := "pg_stat_force_next_flush", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨2278⟩, proargtypes := [] }
    , { oid := ⟨2274⟩, proname := "pg_stat_reset", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨2278⟩, proargtypes := [] }
    , { oid := ⟨3775⟩, proname := "pg_stat_reset_shared", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨2278⟩, proargtypes := [⟨25⟩] }
    , { oid := ⟨3776⟩, proname := "pg_stat_reset_single_table_counters", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨2278⟩, proargtypes := [⟨26⟩] }
    , { oid := ⟨3777⟩, proname := "pg_stat_reset_single_function_counters", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨2278⟩, proargtypes := [⟨26⟩] }
    , { oid := ⟨2307⟩, proname := "pg_stat_reset_slru", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨2278⟩, proargtypes := [⟨25⟩] }
    , { oid := ⟨6170⟩, proname := "pg_stat_reset_replication_slot", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨2278⟩, proargtypes := [⟨25⟩] }
    , { oid := ⟨6232⟩, proname := "pg_stat_reset_subscription_stats", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨2278⟩, proargtypes := [⟨26⟩] }
    , { oid := ⟨3163⟩, proname := "pg_trigger_depth", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨23⟩, proargtypes := [] }
    , { oid := ⟨3778⟩, proname := "pg_tablespace_location", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨25⟩, proargtypes := [⟨26⟩] }
    , { oid := ⟨1946⟩, proname := "encode", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨25⟩, proargtypes := [⟨17⟩, ⟨25⟩] }
    , { oid := ⟨1947⟩, proname := "decode", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨17⟩, proargtypes := [⟨25⟩, ⟨25⟩] }
    , { oid := ⟨1948⟩, proname := "byteaeq", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨17⟩, ⟨17⟩] }
    , { oid := ⟨1949⟩, proname := "bytealt", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨17⟩, ⟨17⟩] }
    , { oid := ⟨1950⟩, proname := "byteale", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨17⟩, ⟨17⟩] }
    , { oid := ⟨1951⟩, proname := "byteagt", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨17⟩, ⟨17⟩] }
    , { oid := ⟨1952⟩, proname := "byteage", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨17⟩, ⟨17⟩] }
    , { oid := ⟨1953⟩, proname := "byteane", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨17⟩, ⟨17⟩] }
    , { oid := ⟨1954⟩, proname := "byteacmp", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨23⟩, proargtypes := [⟨17⟩, ⟨17⟩] }
    , { oid := ⟨3331⟩, proname := "bytea_sortsupport", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨2278⟩, proargtypes := [⟨2281⟩] }
    , { oid := ⟨3917⟩, proname := "timestamp_support", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨2281⟩, proargtypes := [⟨2281⟩] }
    , { oid := ⟨3944⟩, proname := "time_support", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨2281⟩, proargtypes := [⟨2281⟩] }
    , { oid := ⟨1961⟩, proname := "timestamp", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨1114⟩, proargtypes := [⟨1114⟩, ⟨23⟩] }
    , { oid := ⟨1965⟩, proname := "oidlarger", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨26⟩, proargtypes := [⟨26⟩, ⟨26⟩] }
    , { oid := ⟨1966⟩, proname := "oidsmaller", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨26⟩, proargtypes := [⟨26⟩, ⟨26⟩] }
    , { oid := ⟨1967⟩, proname := "timestamptz", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨1184⟩, proargtypes := [⟨1184⟩, ⟨23⟩] }
    , { oid := ⟨1968⟩, proname := "time", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨1083⟩, proargtypes := [⟨1083⟩, ⟨23⟩] }
    , { oid := ⟨1969⟩, proname := "timetz", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨1266⟩, proargtypes := [⟨1266⟩, ⟨23⟩] }
    , { oid := ⟨2003⟩, proname := "textanycat", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨25⟩, proargtypes := [⟨25⟩, ⟨2776⟩] }
    , { oid := ⟨2004⟩, proname := "anytextcat", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨25⟩, proargtypes := [⟨2776⟩, ⟨25⟩] }
    , { oid := ⟨2005⟩, proname := "bytealike", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨17⟩, ⟨17⟩] }
    , { oid := ⟨2006⟩, proname := "byteanlike", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨17⟩, ⟨17⟩] }
    , { oid := ⟨2007⟩, proname := "like", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨17⟩, ⟨17⟩] }
    , { oid := ⟨2008⟩, proname := "notlike", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨17⟩, ⟨17⟩] }
    , { oid := ⟨2009⟩, proname := "like_escape", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨17⟩, proargtypes := [⟨17⟩, ⟨17⟩] }
    , { oid := ⟨2010⟩, proname := "length", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨23⟩, proargtypes := [⟨17⟩] }
    , { oid := ⟨2011⟩, proname := "byteacat", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨17⟩, proargtypes := [⟨17⟩, ⟨17⟩] }
    , { oid := ⟨2012⟩, proname := "substring", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨17⟩, proargtypes := [⟨17⟩, ⟨23⟩, ⟨23⟩] }
    , { oid := ⟨2013⟩, proname := "substring", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨17⟩, proargtypes := [⟨17⟩, ⟨23⟩] }
    , { oid := ⟨2085⟩, proname := "substr", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨17⟩, proargtypes := [⟨17⟩, ⟨23⟩, ⟨23⟩] }
    , { oid := ⟨2086⟩, proname := "substr", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨17⟩, proargtypes := [⟨17⟩, ⟨23⟩] }
    , { oid := ⟨2014⟩, proname := "position", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨23⟩, proargtypes := [⟨17⟩, ⟨17⟩] }
    , { oid := ⟨2015⟩, proname := "btrim", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨17⟩, proargtypes := [⟨17⟩, ⟨17⟩] }
    , { oid := ⟨6195⟩, proname := "ltrim", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨17⟩, proargtypes := [⟨17⟩, ⟨17⟩] }
    , { oid := ⟨6196⟩, proname := "rtrim", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨17⟩, proargtypes := [⟨17⟩, ⟨17⟩] }
    , { oid := ⟨2019⟩, proname := "time", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨1083⟩, proargtypes := [⟨1184⟩] }
    , { oid := ⟨2020⟩, proname := "date_trunc", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨1114⟩, proargtypes := [⟨25⟩, ⟨1114⟩] }
    , { oid := ⟨6177⟩, proname := "date_bin", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨1114⟩, proargtypes := [⟨1186⟩, ⟨1114⟩, ⟨1114⟩] }
    , { oid := ⟨6178⟩, proname := "date_bin", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨1184⟩, proargtypes := [⟨1186⟩, ⟨1184⟩, ⟨1184⟩] }
    , { oid := ⟨2021⟩, proname := "date_part", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨701⟩, proargtypes := [⟨25⟩, ⟨1114⟩] }
    , { oid := ⟨6202⟩, proname := "extract", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨1700⟩, proargtypes := [⟨25⟩, ⟨1114⟩] }
    , { oid := ⟨2024⟩, proname := "timestamp", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨1114⟩, proargtypes := [⟨1082⟩] }
    , { oid := ⟨2025⟩, proname := "timestamp", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨1114⟩, proargtypes := [⟨1082⟩, ⟨1083⟩] }
    , { oid := ⟨2027⟩, proname := "timestamp", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨1114⟩, proargtypes := [⟨1184⟩] }
    , { oid := ⟨2028⟩, proname := "timestamptz", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨1184⟩, proargtypes := [⟨1114⟩] }
    , { oid := ⟨2029⟩, proname := "date", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨1082⟩, proargtypes := [⟨1114⟩] }
    , { oid := ⟨2031⟩, proname := "timestamp_mi", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨1186⟩, proargtypes := [⟨1114⟩, ⟨1114⟩] }
    , { oid := ⟨2032⟩, proname := "timestamp_pl_interval", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨1114⟩, proargtypes := [⟨1114⟩, ⟨1186⟩] }
    , { oid := ⟨2033⟩, proname := "timestamp_mi_interval", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨1114⟩, proargtypes := [⟨1114⟩, ⟨1186⟩] }
    , { oid := ⟨2035⟩, proname := "timestamp_smaller", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨1114⟩, proargtypes := [⟨1114⟩, ⟨1114⟩] }
    , { oid := ⟨2036⟩, proname := "timestamp_larger", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨1114⟩, proargtypes := [⟨1114⟩, ⟨1114⟩] }
    , { oid := ⟨2037⟩, proname := "timezone", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨1266⟩, proargtypes := [⟨25⟩, ⟨1266⟩] }
    , { oid := ⟨2038⟩, proname := "timezone", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨1266⟩, proargtypes := [⟨1186⟩, ⟨1266⟩] }
    , { oid := ⟨6336⟩, proname := "timezone", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨1266⟩, proargtypes := [⟨1266⟩] }
    , { oid := ⟨2039⟩, proname := "timestamp_hash", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨23⟩, proargtypes := [⟨1114⟩] }
    , { oid := ⟨3411⟩, proname := "timestamp_hash_extended", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨20⟩, proargtypes := [⟨1114⟩, ⟨20⟩] }
    , { oid := ⟨2041⟩, proname := "overlaps", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨1114⟩, ⟨1114⟩, ⟨1114⟩, ⟨1114⟩] }
    , { oid := ⟨2042⟩, proname := "overlaps", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨1114⟩, ⟨1186⟩, ⟨1114⟩, ⟨1186⟩] }
    , { oid := ⟨2043⟩, proname := "overlaps", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨1114⟩, ⟨1114⟩, ⟨1114⟩, ⟨1186⟩] }
    , { oid := ⟨2044⟩, proname := "overlaps", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨1114⟩, ⟨1186⟩, ⟨1114⟩, ⟨1114⟩] }
    , { oid := ⟨2045⟩, proname := "timestamp_cmp", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨23⟩, proargtypes := [⟨1114⟩, ⟨1114⟩] }
    , { oid := ⟨3137⟩, proname := "timestamp_sortsupport", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨2278⟩, proargtypes := [⟨2281⟩] }
    , { oid := ⟨4134⟩, proname := "in_range", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨1114⟩, ⟨1114⟩, ⟨1186⟩, ⟨16⟩, ⟨16⟩] }
    , { oid := ⟨4135⟩, proname := "in_range", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨16⟩, proargtypes := [⟨1184⟩, ⟨1184⟩, ⟨1186⟩, ⟨16⟩, ⟨16⟩] }
    , { oid := ⟨4136⟩, proname := "in_range", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨1186⟩, ⟨1186⟩, ⟨1186⟩, ⟨16⟩, ⟨16⟩] }
    , { oid := ⟨4137⟩, proname := "in_range", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨1083⟩, ⟨1083⟩, ⟨1186⟩, ⟨16⟩, ⟨16⟩] }
    , { oid := ⟨4138⟩, proname := "in_range", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨1266⟩, ⟨1266⟩, ⟨1186⟩, ⟨16⟩, ⟨16⟩] }
    , { oid := ⟨2046⟩, proname := "time", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨1083⟩, proargtypes := [⟨1266⟩] }
    , { oid := ⟨2047⟩, proname := "timetz", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨1266⟩, proargtypes := [⟨1083⟩] }
    , { oid := ⟨2048⟩, proname := "isfinite", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨1114⟩] }
    , { oid := ⟨2049⟩, proname := "to_char", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨25⟩, proargtypes := [⟨1114⟩, ⟨25⟩] }
    , { oid := ⟨2052⟩, proname := "timestamp_eq", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨1114⟩, ⟨1114⟩] }
    , { oid := ⟨2053⟩, proname := "timestamp_ne", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨1114⟩, ⟨1114⟩] }
    , { oid := ⟨2054⟩, proname := "timestamp_lt", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨1114⟩, ⟨1114⟩] }
    , { oid := ⟨2055⟩, proname := "timestamp_le", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨1114⟩, ⟨1114⟩] }
    , { oid := ⟨2056⟩, proname := "timestamp_ge", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨1114⟩, ⟨1114⟩] }
    , { oid := ⟨2057⟩, proname := "timestamp_gt", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨1114⟩, ⟨1114⟩] }
    , { oid := ⟨2058⟩, proname := "age", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨1186⟩, proargtypes := [⟨1114⟩, ⟨1114⟩] }
    , { oid := ⟨2059⟩, proname := "age", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨1186⟩, proargtypes := [⟨1114⟩] }
    , { oid := ⟨2069⟩, proname := "timezone", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨1184⟩, proargtypes := [⟨25⟩, ⟨1114⟩] }
    , { oid := ⟨2070⟩, proname := "timezone", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨1184⟩, proargtypes := [⟨1186⟩, ⟨1114⟩] }
    , { oid := ⟨6335⟩, proname := "timezone", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨1184⟩, proargtypes := [⟨1114⟩] }
    , { oid := ⟨2071⟩, proname := "date_pl_interval", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨1114⟩, proargtypes := [⟨1082⟩, ⟨1186⟩] }
    , { oid := ⟨2072⟩, proname := "date_mi_interval", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨1114⟩, proargtypes := [⟨1082⟩, ⟨1186⟩] }
    , { oid := ⟨2073⟩, proname := "substring", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨25⟩, proargtypes := [⟨25⟩, ⟨25⟩] }
    , { oid := ⟨2074⟩, proname := "substring", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨25⟩, proargtypes := [⟨25⟩, ⟨25⟩, ⟨25⟩] }
    , { oid := ⟨2075⟩, proname := "bit", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨1560⟩, proargtypes := [⟨20⟩, ⟨23⟩] }
    , { oid := ⟨2076⟩, proname := "int8", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨20⟩, proargtypes := [⟨1560⟩] }
    , { oid := ⟨2077⟩, proname := "current_setting", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨25⟩, proargtypes := [⟨25⟩] }
    , { oid := ⟨3294⟩, proname := "current_setting", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨25⟩, proargtypes := [⟨25⟩, ⟨16⟩] }
    , { oid := ⟨2078⟩, proname := "set_config", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨25⟩, proargtypes := [⟨25⟩, ⟨25⟩, ⟨16⟩] }
    , { oid := ⟨2084⟩, proname := "pg_show_all_settings", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨2249⟩, proargtypes := [] }
    , { oid := ⟨6240⟩, proname := "pg_settings_get_flags", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨1009⟩, proargtypes := [⟨25⟩] }
    , { oid := ⟨3329⟩, proname := "pg_show_all_file_settings", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨2249⟩, proargtypes := [] }
    , { oid := ⟨3401⟩, proname := "pg_hba_file_rules", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨2249⟩, proargtypes := [] }
    , { oid := ⟨6250⟩, proname := "pg_ident_file_mappings", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨2249⟩, proargtypes := [] }
    , { oid := ⟨1371⟩, proname := "pg_lock_status", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨2249⟩, proargtypes := [] }
    , { oid := ⟨2561⟩, proname := "pg_blocking_pids", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨1007⟩, proargtypes := [⟨23⟩] }
    , { oid := ⟨3376⟩, proname := "pg_safe_snapshot_blocking_pids", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨1007⟩, proargtypes := [⟨23⟩] }
    , { oid := ⟨3378⟩, proname := "pg_isolation_test_session_is_blocked", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨23⟩, ⟨1007⟩] }
    , { oid := ⟨1065⟩, proname := "pg_prepared_xact", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨2249⟩, proargtypes := [] }
    , { oid := ⟨3819⟩, proname := "pg_get_multixact_members", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨2249⟩, proargtypes := [⟨28⟩] }
    , { oid := ⟨3581⟩, proname := "pg_xact_commit_timestamp", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨1184⟩, proargtypes := [⟨28⟩] }
    , { oid := ⟨6168⟩, proname := "pg_xact_commit_timestamp_origin", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨2249⟩, proargtypes := [⟨28⟩] }
    , { oid := ⟨3583⟩, proname := "pg_last_committed_xact", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨2249⟩, proargtypes := [] }
    , { oid := ⟨3537⟩, proname := "pg_describe_object", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨25⟩, proargtypes := [⟨26⟩, ⟨26⟩, ⟨23⟩] }
    , { oid := ⟨3839⟩, proname := "pg_identify_object", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨2249⟩, proargtypes := [⟨26⟩, ⟨26⟩, ⟨23⟩] }
    , { oid := ⟨3382⟩, proname := "pg_identify_object_as_address", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨2249⟩, proargtypes := [⟨26⟩, ⟨26⟩, ⟨23⟩] }
    , { oid := ⟨3954⟩, proname := "pg_get_object_address", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨2249⟩, proargtypes := [⟨25⟩, ⟨1009⟩, ⟨1009⟩] }
    , { oid := ⟨2079⟩, proname := "pg_table_is_visible", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨16⟩, proargtypes := [⟨26⟩] }
    , { oid := ⟨2080⟩, proname := "pg_type_is_visible", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨16⟩, proargtypes := [⟨26⟩] }
    , { oid := ⟨2081⟩, proname := "pg_function_is_visible", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨16⟩, proargtypes := [⟨26⟩] }
    , { oid := ⟨2082⟩, proname := "pg_operator_is_visible", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨16⟩, proargtypes := [⟨26⟩] }
    , { oid := ⟨2083⟩, proname := "pg_opclass_is_visible", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨16⟩, proargtypes := [⟨26⟩] }
    , { oid := ⟨3829⟩, proname := "pg_opfamily_is_visible", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨16⟩, proargtypes := [⟨26⟩] }
    , { oid := ⟨2093⟩, proname := "pg_conversion_is_visible", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨16⟩, proargtypes := [⟨26⟩] }
    , { oid := ⟨3403⟩, proname := "pg_statistics_obj_is_visible", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨16⟩, proargtypes := [⟨26⟩] }
    , { oid := ⟨3756⟩, proname := "pg_ts_parser_is_visible", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨16⟩, proargtypes := [⟨26⟩] }
    , { oid := ⟨3757⟩, proname := "pg_ts_dict_is_visible", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨16⟩, proargtypes := [⟨26⟩] }
    , { oid := ⟨3768⟩, proname := "pg_ts_template_is_visible", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨16⟩, proargtypes := [⟨26⟩] }
    , { oid := ⟨3758⟩, proname := "pg_ts_config_is_visible", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨16⟩, proargtypes := [⟨26⟩] }
    , { oid := ⟨3815⟩, proname := "pg_collation_is_visible", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨16⟩, proargtypes := [⟨26⟩] }
    , { oid := ⟨2854⟩, proname := "pg_my_temp_schema", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨26⟩, proargtypes := [] }
    , { oid := ⟨2855⟩, proname := "pg_is_other_temp_schema", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨16⟩, proargtypes := [⟨26⟩] }
    , { oid := ⟨2171⟩, proname := "pg_cancel_backend", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨23⟩] }
    , { oid := ⟨2096⟩, proname := "pg_terminate_backend", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨23⟩, ⟨20⟩] }
    , { oid := ⟨2172⟩, proname := "pg_backup_start", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨3220⟩, proargtypes := [⟨25⟩, ⟨16⟩] }
    , { oid := ⟨2739⟩, proname := "pg_backup_stop", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨2249⟩, proargtypes := [⟨16⟩] }
    , { oid := ⟨3436⟩, proname := "pg_promote", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨16⟩, ⟨23⟩] }
    , { oid := ⟨2848⟩, proname := "pg_switch_wal", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨3220⟩, proargtypes := [] }
    , { oid := ⟨6305⟩, proname := "pg_log_standby_snapshot", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨3220⟩, proargtypes := [] }
    , { oid := ⟨3098⟩, proname := "pg_create_restore_point", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨3220⟩, proargtypes := [⟨25⟩] }
    , { oid := ⟨2849⟩, proname := "pg_current_wal_lsn", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨3220⟩, proargtypes := [] }
    , { oid := ⟨2852⟩, proname := "pg_current_wal_insert_lsn", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨3220⟩, proargtypes := [] }
    , { oid := ⟨3330⟩, proname := "pg_current_wal_flush_lsn", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨3220⟩, proargtypes := [] }
    , { oid := ⟨2850⟩, proname := "pg_walfile_name_offset", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨2249⟩, proargtypes := [⟨3220⟩] }
    , { oid := ⟨2851⟩, proname := "pg_walfile_name", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨25⟩, proargtypes := [⟨3220⟩] }
    , { oid := ⟨6213⟩, proname := "pg_split_walfile_name", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨2249⟩, proargtypes := [⟨25⟩] }
    , { oid := ⟨3165⟩, proname := "pg_wal_lsn_diff", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨1700⟩, proargtypes := [⟨3220⟩, ⟨3220⟩] }
    , { oid := ⟨3809⟩, proname := "pg_export_snapshot", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨25⟩, proargtypes := [] }
    , { oid := ⟨3810⟩, proname := "pg_is_in_recovery", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [] }
    , { oid := ⟨3820⟩, proname := "pg_last_wal_receive_lsn", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨3220⟩, proargtypes := [] }
    , { oid := ⟨3821⟩, proname := "pg_last_wal_replay_lsn", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨3220⟩, proargtypes := [] }
    , { oid := ⟨3830⟩, proname := "pg_last_xact_replay_timestamp", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨1184⟩, proargtypes := [] }
    , { oid := ⟨3071⟩, proname := "pg_wal_replay_pause", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨2278⟩, proargtypes := [] }
    , { oid := ⟨3072⟩, proname := "pg_wal_replay_resume", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨2278⟩, proargtypes := [] }
    , { oid := ⟨3073⟩, proname := "pg_is_wal_replay_paused", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [] }
    , { oid := ⟨1137⟩, proname := "pg_get_wal_replay_pause_state", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨25⟩, proargtypes := [] }
    , { oid := ⟨6224⟩, proname := "pg_get_wal_resource_managers", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨2249⟩, proargtypes := [] }
    , { oid := ⟨2621⟩, proname := "pg_reload_conf", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [] }
    , { oid := ⟨2622⟩, proname := "pg_rotate_logfile", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [] }
    , { oid := ⟨3800⟩, proname := "pg_current_logfile", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨25⟩, proargtypes := [] }
    , { oid := ⟨3801⟩, proname := "pg_current_logfile", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨25⟩, proargtypes := [⟨25⟩] }
    , { oid := ⟨2623⟩, proname := "pg_stat_file", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨2249⟩, proargtypes := [⟨25⟩] }
    , { oid := ⟨3307⟩, proname := "pg_stat_file", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨2249⟩, proargtypes := [⟨25⟩, ⟨16⟩] }
    , { oid := ⟨2624⟩, proname := "pg_read_file", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨25⟩, proargtypes := [⟨25⟩, ⟨20⟩, ⟨20⟩] }
    , { oid := ⟨3293⟩, proname := "pg_read_file", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨25⟩, proargtypes := [⟨25⟩, ⟨20⟩, ⟨20⟩, ⟨16⟩] }
    , { oid := ⟨3826⟩, proname := "pg_read_file", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨25⟩, proargtypes := [⟨25⟩] }
    , { oid := ⟨6208⟩, proname := "pg_read_file", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨25⟩, proargtypes := [⟨25⟩, ⟨16⟩] }
    , { oid := ⟨3827⟩, proname := "pg_read_binary_file", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨17⟩, proargtypes := [⟨25⟩, ⟨20⟩, ⟨20⟩] }
    , { oid := ⟨3295⟩, proname := "pg_read_binary_file", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨17⟩, proargtypes := [⟨25⟩, ⟨20⟩, ⟨20⟩, ⟨16⟩] }
    , { oid := ⟨3828⟩, proname := "pg_read_binary_file", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨17⟩, proargtypes := [⟨25⟩] }
    , { oid := ⟨6209⟩, proname := "pg_read_binary_file", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨17⟩, proargtypes := [⟨25⟩, ⟨16⟩] }
    , { oid := ⟨2625⟩, proname := "pg_ls_dir", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨25⟩, proargtypes := [⟨25⟩] }
    , { oid := ⟨3297⟩, proname := "pg_ls_dir", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨25⟩, proargtypes := [⟨25⟩, ⟨16⟩, ⟨16⟩] }
    , { oid := ⟨2626⟩, proname := "pg_sleep", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨2278⟩, proargtypes := [⟨701⟩] }
    , { oid := ⟨3935⟩, proname := "pg_sleep_for", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨2278⟩, proargtypes := [⟨1186⟩] }
    , { oid := ⟨3936⟩, proname := "pg_sleep_until", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨2278⟩, proargtypes := [⟨1184⟩] }
    , { oid := ⟨315⟩, proname := "pg_jit_available", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [] }
    , { oid := ⟨2971⟩, proname := "text", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨25⟩, proargtypes := [⟨16⟩] }
    , { oid := ⟨2100⟩, proname := "avg", pronamespace := pgCatalogNamespace.oid, prokind := .aggregate, prosecdef := false, provolatile := .volatile, prorettype := ⟨1700⟩, proargtypes := [⟨20⟩] }
    , { oid := ⟨2101⟩, proname := "avg", pronamespace := pgCatalogNamespace.oid, prokind := .aggregate, prosecdef := false, provolatile := .volatile, prorettype := ⟨1700⟩, proargtypes := [⟨23⟩] }
    , { oid := ⟨2102⟩, proname := "avg", pronamespace := pgCatalogNamespace.oid, prokind := .aggregate, prosecdef := false, provolatile := .volatile, prorettype := ⟨1700⟩, proargtypes := [⟨21⟩] }
    , { oid := ⟨2103⟩, proname := "avg", pronamespace := pgCatalogNamespace.oid, prokind := .aggregate, prosecdef := false, provolatile := .volatile, prorettype := ⟨1700⟩, proargtypes := [⟨1700⟩] }
    , { oid := ⟨2104⟩, proname := "avg", pronamespace := pgCatalogNamespace.oid, prokind := .aggregate, prosecdef := false, provolatile := .volatile, prorettype := ⟨701⟩, proargtypes := [⟨700⟩] }
    , { oid := ⟨2105⟩, proname := "avg", pronamespace := pgCatalogNamespace.oid, prokind := .aggregate, prosecdef := false, provolatile := .volatile, prorettype := ⟨701⟩, proargtypes := [⟨701⟩] }
    , { oid := ⟨2106⟩, proname := "avg", pronamespace := pgCatalogNamespace.oid, prokind := .aggregate, prosecdef := false, provolatile := .volatile, prorettype := ⟨1186⟩, proargtypes := [⟨1186⟩] }
    , { oid := ⟨2107⟩, proname := "sum", pronamespace := pgCatalogNamespace.oid, prokind := .aggregate, prosecdef := false, provolatile := .volatile, prorettype := ⟨1700⟩, proargtypes := [⟨20⟩] }
    , { oid := ⟨2108⟩, proname := "sum", pronamespace := pgCatalogNamespace.oid, prokind := .aggregate, prosecdef := false, provolatile := .volatile, prorettype := ⟨20⟩, proargtypes := [⟨23⟩] }
    , { oid := ⟨2109⟩, proname := "sum", pronamespace := pgCatalogNamespace.oid, prokind := .aggregate, prosecdef := false, provolatile := .volatile, prorettype := ⟨20⟩, proargtypes := [⟨21⟩] }
    , { oid := ⟨2110⟩, proname := "sum", pronamespace := pgCatalogNamespace.oid, prokind := .aggregate, prosecdef := false, provolatile := .volatile, prorettype := ⟨700⟩, proargtypes := [⟨700⟩] }
    , { oid := ⟨2111⟩, proname := "sum", pronamespace := pgCatalogNamespace.oid, prokind := .aggregate, prosecdef := false, provolatile := .volatile, prorettype := ⟨701⟩, proargtypes := [⟨701⟩] }
    , { oid := ⟨2112⟩, proname := "sum", pronamespace := pgCatalogNamespace.oid, prokind := .aggregate, prosecdef := false, provolatile := .volatile, prorettype := ⟨790⟩, proargtypes := [⟨790⟩] }
    , { oid := ⟨2113⟩, proname := "sum", pronamespace := pgCatalogNamespace.oid, prokind := .aggregate, prosecdef := false, provolatile := .volatile, prorettype := ⟨1186⟩, proargtypes := [⟨1186⟩] }
    , { oid := ⟨2114⟩, proname := "sum", pronamespace := pgCatalogNamespace.oid, prokind := .aggregate, prosecdef := false, provolatile := .volatile, prorettype := ⟨1700⟩, proargtypes := [⟨1700⟩] }
    , { oid := ⟨2115⟩, proname := "max", pronamespace := pgCatalogNamespace.oid, prokind := .aggregate, prosecdef := false, provolatile := .volatile, prorettype := ⟨20⟩, proargtypes := [⟨20⟩] }
    , { oid := ⟨2116⟩, proname := "max", pronamespace := pgCatalogNamespace.oid, prokind := .aggregate, prosecdef := false, provolatile := .volatile, prorettype := ⟨23⟩, proargtypes := [⟨23⟩] }
    , { oid := ⟨2117⟩, proname := "max", pronamespace := pgCatalogNamespace.oid, prokind := .aggregate, prosecdef := false, provolatile := .volatile, prorettype := ⟨21⟩, proargtypes := [⟨21⟩] }
    , { oid := ⟨2118⟩, proname := "max", pronamespace := pgCatalogNamespace.oid, prokind := .aggregate, prosecdef := false, provolatile := .volatile, prorettype := ⟨26⟩, proargtypes := [⟨26⟩] }
    , { oid := ⟨2119⟩, proname := "max", pronamespace := pgCatalogNamespace.oid, prokind := .aggregate, prosecdef := false, provolatile := .volatile, prorettype := ⟨700⟩, proargtypes := [⟨700⟩] }
    , { oid := ⟨2120⟩, proname := "max", pronamespace := pgCatalogNamespace.oid, prokind := .aggregate, prosecdef := false, provolatile := .volatile, prorettype := ⟨701⟩, proargtypes := [⟨701⟩] }
    , { oid := ⟨2122⟩, proname := "max", pronamespace := pgCatalogNamespace.oid, prokind := .aggregate, prosecdef := false, provolatile := .volatile, prorettype := ⟨1082⟩, proargtypes := [⟨1082⟩] }
    , { oid := ⟨2123⟩, proname := "max", pronamespace := pgCatalogNamespace.oid, prokind := .aggregate, prosecdef := false, provolatile := .volatile, prorettype := ⟨1083⟩, proargtypes := [⟨1083⟩] }
    , { oid := ⟨2124⟩, proname := "max", pronamespace := pgCatalogNamespace.oid, prokind := .aggregate, prosecdef := false, provolatile := .volatile, prorettype := ⟨1266⟩, proargtypes := [⟨1266⟩] }
    , { oid := ⟨2125⟩, proname := "max", pronamespace := pgCatalogNamespace.oid, prokind := .aggregate, prosecdef := false, provolatile := .volatile, prorettype := ⟨790⟩, proargtypes := [⟨790⟩] }
    , { oid := ⟨2126⟩, proname := "max", pronamespace := pgCatalogNamespace.oid, prokind := .aggregate, prosecdef := false, provolatile := .volatile, prorettype := ⟨1114⟩, proargtypes := [⟨1114⟩] }
    , { oid := ⟨2127⟩, proname := "max", pronamespace := pgCatalogNamespace.oid, prokind := .aggregate, prosecdef := false, provolatile := .volatile, prorettype := ⟨1184⟩, proargtypes := [⟨1184⟩] }
    , { oid := ⟨2128⟩, proname := "max", pronamespace := pgCatalogNamespace.oid, prokind := .aggregate, prosecdef := false, provolatile := .volatile, prorettype := ⟨1186⟩, proargtypes := [⟨1186⟩] }
    , { oid := ⟨2129⟩, proname := "max", pronamespace := pgCatalogNamespace.oid, prokind := .aggregate, prosecdef := false, provolatile := .volatile, prorettype := ⟨25⟩, proargtypes := [⟨25⟩] }
    , { oid := ⟨2130⟩, proname := "max", pronamespace := pgCatalogNamespace.oid, prokind := .aggregate, prosecdef := false, provolatile := .volatile, prorettype := ⟨1700⟩, proargtypes := [⟨1700⟩] }
    , { oid := ⟨2050⟩, proname := "max", pronamespace := pgCatalogNamespace.oid, prokind := .aggregate, prosecdef := false, provolatile := .volatile, prorettype := ⟨2277⟩, proargtypes := [⟨2277⟩] }
    , { oid := ⟨2244⟩, proname := "max", pronamespace := pgCatalogNamespace.oid, prokind := .aggregate, prosecdef := false, provolatile := .volatile, prorettype := ⟨1042⟩, proargtypes := [⟨1042⟩] }
    , { oid := ⟨2797⟩, proname := "max", pronamespace := pgCatalogNamespace.oid, prokind := .aggregate, prosecdef := false, provolatile := .volatile, prorettype := ⟨27⟩, proargtypes := [⟨27⟩] }
    , { oid := ⟨3564⟩, proname := "max", pronamespace := pgCatalogNamespace.oid, prokind := .aggregate, prosecdef := false, provolatile := .volatile, prorettype := ⟨869⟩, proargtypes := [⟨869⟩] }
    , { oid := ⟨4189⟩, proname := "max", pronamespace := pgCatalogNamespace.oid, prokind := .aggregate, prosecdef := false, provolatile := .volatile, prorettype := ⟨3220⟩, proargtypes := [⟨3220⟩] }
    , { oid := ⟨5099⟩, proname := "max", pronamespace := pgCatalogNamespace.oid, prokind := .aggregate, prosecdef := false, provolatile := .volatile, prorettype := ⟨5069⟩, proargtypes := [⟨5069⟩] }
    , { oid := ⟨2131⟩, proname := "min", pronamespace := pgCatalogNamespace.oid, prokind := .aggregate, prosecdef := false, provolatile := .volatile, prorettype := ⟨20⟩, proargtypes := [⟨20⟩] }
    , { oid := ⟨2132⟩, proname := "min", pronamespace := pgCatalogNamespace.oid, prokind := .aggregate, prosecdef := false, provolatile := .volatile, prorettype := ⟨23⟩, proargtypes := [⟨23⟩] }
    , { oid := ⟨2133⟩, proname := "min", pronamespace := pgCatalogNamespace.oid, prokind := .aggregate, prosecdef := false, provolatile := .volatile, prorettype := ⟨21⟩, proargtypes := [⟨21⟩] }
    , { oid := ⟨2134⟩, proname := "min", pronamespace := pgCatalogNamespace.oid, prokind := .aggregate, prosecdef := false, provolatile := .volatile, prorettype := ⟨26⟩, proargtypes := [⟨26⟩] }
    , { oid := ⟨2135⟩, proname := "min", pronamespace := pgCatalogNamespace.oid, prokind := .aggregate, prosecdef := false, provolatile := .volatile, prorettype := ⟨700⟩, proargtypes := [⟨700⟩] }
    , { oid := ⟨2136⟩, proname := "min", pronamespace := pgCatalogNamespace.oid, prokind := .aggregate, prosecdef := false, provolatile := .volatile, prorettype := ⟨701⟩, proargtypes := [⟨701⟩] }
    , { oid := ⟨2138⟩, proname := "min", pronamespace := pgCatalogNamespace.oid, prokind := .aggregate, prosecdef := false, provolatile := .volatile, prorettype := ⟨1082⟩, proargtypes := [⟨1082⟩] }
    , { oid := ⟨2139⟩, proname := "min", pronamespace := pgCatalogNamespace.oid, prokind := .aggregate, prosecdef := false, provolatile := .volatile, prorettype := ⟨1083⟩, proargtypes := [⟨1083⟩] }
    , { oid := ⟨2140⟩, proname := "min", pronamespace := pgCatalogNamespace.oid, prokind := .aggregate, prosecdef := false, provolatile := .volatile, prorettype := ⟨1266⟩, proargtypes := [⟨1266⟩] }
    , { oid := ⟨2141⟩, proname := "min", pronamespace := pgCatalogNamespace.oid, prokind := .aggregate, prosecdef := false, provolatile := .volatile, prorettype := ⟨790⟩, proargtypes := [⟨790⟩] }
    , { oid := ⟨2142⟩, proname := "min", pronamespace := pgCatalogNamespace.oid, prokind := .aggregate, prosecdef := false, provolatile := .volatile, prorettype := ⟨1114⟩, proargtypes := [⟨1114⟩] }
    , { oid := ⟨2143⟩, proname := "min", pronamespace := pgCatalogNamespace.oid, prokind := .aggregate, prosecdef := false, provolatile := .volatile, prorettype := ⟨1184⟩, proargtypes := [⟨1184⟩] }
    , { oid := ⟨2144⟩, proname := "min", pronamespace := pgCatalogNamespace.oid, prokind := .aggregate, prosecdef := false, provolatile := .volatile, prorettype := ⟨1186⟩, proargtypes := [⟨1186⟩] }
    , { oid := ⟨2145⟩, proname := "min", pronamespace := pgCatalogNamespace.oid, prokind := .aggregate, prosecdef := false, provolatile := .volatile, prorettype := ⟨25⟩, proargtypes := [⟨25⟩] }
    , { oid := ⟨2146⟩, proname := "min", pronamespace := pgCatalogNamespace.oid, prokind := .aggregate, prosecdef := false, provolatile := .volatile, prorettype := ⟨1700⟩, proargtypes := [⟨1700⟩] }
    , { oid := ⟨2051⟩, proname := "min", pronamespace := pgCatalogNamespace.oid, prokind := .aggregate, prosecdef := false, provolatile := .volatile, prorettype := ⟨2277⟩, proargtypes := [⟨2277⟩] }
    , { oid := ⟨2245⟩, proname := "min", pronamespace := pgCatalogNamespace.oid, prokind := .aggregate, prosecdef := false, provolatile := .volatile, prorettype := ⟨1042⟩, proargtypes := [⟨1042⟩] }
    , { oid := ⟨2798⟩, proname := "min", pronamespace := pgCatalogNamespace.oid, prokind := .aggregate, prosecdef := false, provolatile := .volatile, prorettype := ⟨27⟩, proargtypes := [⟨27⟩] }
    , { oid := ⟨3565⟩, proname := "min", pronamespace := pgCatalogNamespace.oid, prokind := .aggregate, prosecdef := false, provolatile := .volatile, prorettype := ⟨869⟩, proargtypes := [⟨869⟩] }
    , { oid := ⟨4190⟩, proname := "min", pronamespace := pgCatalogNamespace.oid, prokind := .aggregate, prosecdef := false, provolatile := .volatile, prorettype := ⟨3220⟩, proargtypes := [⟨3220⟩] }
    , { oid := ⟨5100⟩, proname := "min", pronamespace := pgCatalogNamespace.oid, prokind := .aggregate, prosecdef := false, provolatile := .volatile, prorettype := ⟨5069⟩, proargtypes := [⟨5069⟩] }
    , { oid := ⟨2147⟩, proname := "count", pronamespace := pgCatalogNamespace.oid, prokind := .aggregate, prosecdef := false, provolatile := .volatile, prorettype := ⟨20⟩, proargtypes := [⟨2276⟩] }
    , { oid := ⟨2803⟩, proname := "count", pronamespace := pgCatalogNamespace.oid, prokind := .aggregate, prosecdef := false, provolatile := .volatile, prorettype := ⟨20⟩, proargtypes := [] }
    , { oid := ⟨6236⟩, proname := "int8inc_support", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨2281⟩, proargtypes := [⟨2281⟩] }
    , { oid := ⟨2718⟩, proname := "var_pop", pronamespace := pgCatalogNamespace.oid, prokind := .aggregate, prosecdef := false, provolatile := .volatile, prorettype := ⟨1700⟩, proargtypes := [⟨20⟩] }
    , { oid := ⟨2719⟩, proname := "var_pop", pronamespace := pgCatalogNamespace.oid, prokind := .aggregate, prosecdef := false, provolatile := .volatile, prorettype := ⟨1700⟩, proargtypes := [⟨23⟩] }
    , { oid := ⟨2720⟩, proname := "var_pop", pronamespace := pgCatalogNamespace.oid, prokind := .aggregate, prosecdef := false, provolatile := .volatile, prorettype := ⟨1700⟩, proargtypes := [⟨21⟩] }
    , { oid := ⟨2721⟩, proname := "var_pop", pronamespace := pgCatalogNamespace.oid, prokind := .aggregate, prosecdef := false, provolatile := .volatile, prorettype := ⟨701⟩, proargtypes := [⟨700⟩] }
    , { oid := ⟨2722⟩, proname := "var_pop", pronamespace := pgCatalogNamespace.oid, prokind := .aggregate, prosecdef := false, provolatile := .volatile, prorettype := ⟨701⟩, proargtypes := [⟨701⟩] }
    , { oid := ⟨2723⟩, proname := "var_pop", pronamespace := pgCatalogNamespace.oid, prokind := .aggregate, prosecdef := false, provolatile := .volatile, prorettype := ⟨1700⟩, proargtypes := [⟨1700⟩] }
    , { oid := ⟨2641⟩, proname := "var_samp", pronamespace := pgCatalogNamespace.oid, prokind := .aggregate, prosecdef := false, provolatile := .volatile, prorettype := ⟨1700⟩, proargtypes := [⟨20⟩] }
    , { oid := ⟨2642⟩, proname := "var_samp", pronamespace := pgCatalogNamespace.oid, prokind := .aggregate, prosecdef := false, provolatile := .volatile, prorettype := ⟨1700⟩, proargtypes := [⟨23⟩] }
    , { oid := ⟨2643⟩, proname := "var_samp", pronamespace := pgCatalogNamespace.oid, prokind := .aggregate, prosecdef := false, provolatile := .volatile, prorettype := ⟨1700⟩, proargtypes := [⟨21⟩] }
    , { oid := ⟨2644⟩, proname := "var_samp", pronamespace := pgCatalogNamespace.oid, prokind := .aggregate, prosecdef := false, provolatile := .volatile, prorettype := ⟨701⟩, proargtypes := [⟨700⟩] }
    , { oid := ⟨2645⟩, proname := "var_samp", pronamespace := pgCatalogNamespace.oid, prokind := .aggregate, prosecdef := false, provolatile := .volatile, prorettype := ⟨701⟩, proargtypes := [⟨701⟩] }
    , { oid := ⟨2646⟩, proname := "var_samp", pronamespace := pgCatalogNamespace.oid, prokind := .aggregate, prosecdef := false, provolatile := .volatile, prorettype := ⟨1700⟩, proargtypes := [⟨1700⟩] }
    , { oid := ⟨2148⟩, proname := "variance", pronamespace := pgCatalogNamespace.oid, prokind := .aggregate, prosecdef := false, provolatile := .volatile, prorettype := ⟨1700⟩, proargtypes := [⟨20⟩] }
    , { oid := ⟨2149⟩, proname := "variance", pronamespace := pgCatalogNamespace.oid, prokind := .aggregate, prosecdef := false, provolatile := .volatile, prorettype := ⟨1700⟩, proargtypes := [⟨23⟩] }
    , { oid := ⟨2150⟩, proname := "variance", pronamespace := pgCatalogNamespace.oid, prokind := .aggregate, prosecdef := false, provolatile := .volatile, prorettype := ⟨1700⟩, proargtypes := [⟨21⟩] }
    , { oid := ⟨2151⟩, proname := "variance", pronamespace := pgCatalogNamespace.oid, prokind := .aggregate, prosecdef := false, provolatile := .volatile, prorettype := ⟨701⟩, proargtypes := [⟨700⟩] }
    , { oid := ⟨2152⟩, proname := "variance", pronamespace := pgCatalogNamespace.oid, prokind := .aggregate, prosecdef := false, provolatile := .volatile, prorettype := ⟨701⟩, proargtypes := [⟨701⟩] }
    , { oid := ⟨2153⟩, proname := "variance", pronamespace := pgCatalogNamespace.oid, prokind := .aggregate, prosecdef := false, provolatile := .volatile, prorettype := ⟨1700⟩, proargtypes := [⟨1700⟩] }
    , { oid := ⟨2724⟩, proname := "stddev_pop", pronamespace := pgCatalogNamespace.oid, prokind := .aggregate, prosecdef := false, provolatile := .volatile, prorettype := ⟨1700⟩, proargtypes := [⟨20⟩] }
    , { oid := ⟨2725⟩, proname := "stddev_pop", pronamespace := pgCatalogNamespace.oid, prokind := .aggregate, prosecdef := false, provolatile := .volatile, prorettype := ⟨1700⟩, proargtypes := [⟨23⟩] }
    , { oid := ⟨2726⟩, proname := "stddev_pop", pronamespace := pgCatalogNamespace.oid, prokind := .aggregate, prosecdef := false, provolatile := .volatile, prorettype := ⟨1700⟩, proargtypes := [⟨21⟩] }
    , { oid := ⟨2727⟩, proname := "stddev_pop", pronamespace := pgCatalogNamespace.oid, prokind := .aggregate, prosecdef := false, provolatile := .volatile, prorettype := ⟨701⟩, proargtypes := [⟨700⟩] }
    , { oid := ⟨2728⟩, proname := "stddev_pop", pronamespace := pgCatalogNamespace.oid, prokind := .aggregate, prosecdef := false, provolatile := .volatile, prorettype := ⟨701⟩, proargtypes := [⟨701⟩] }
    , { oid := ⟨2729⟩, proname := "stddev_pop", pronamespace := pgCatalogNamespace.oid, prokind := .aggregate, prosecdef := false, provolatile := .volatile, prorettype := ⟨1700⟩, proargtypes := [⟨1700⟩] }
    , { oid := ⟨2712⟩, proname := "stddev_samp", pronamespace := pgCatalogNamespace.oid, prokind := .aggregate, prosecdef := false, provolatile := .volatile, prorettype := ⟨1700⟩, proargtypes := [⟨20⟩] }
    , { oid := ⟨2713⟩, proname := "stddev_samp", pronamespace := pgCatalogNamespace.oid, prokind := .aggregate, prosecdef := false, provolatile := .volatile, prorettype := ⟨1700⟩, proargtypes := [⟨23⟩] }
    , { oid := ⟨2714⟩, proname := "stddev_samp", pronamespace := pgCatalogNamespace.oid, prokind := .aggregate, prosecdef := false, provolatile := .volatile, prorettype := ⟨1700⟩, proargtypes := [⟨21⟩] }
    , { oid := ⟨2715⟩, proname := "stddev_samp", pronamespace := pgCatalogNamespace.oid, prokind := .aggregate, prosecdef := false, provolatile := .volatile, prorettype := ⟨701⟩, proargtypes := [⟨700⟩] }
    , { oid := ⟨2716⟩, proname := "stddev_samp", pronamespace := pgCatalogNamespace.oid, prokind := .aggregate, prosecdef := false, provolatile := .volatile, prorettype := ⟨701⟩, proargtypes := [⟨701⟩] }
    , { oid := ⟨2717⟩, proname := "stddev_samp", pronamespace := pgCatalogNamespace.oid, prokind := .aggregate, prosecdef := false, provolatile := .volatile, prorettype := ⟨1700⟩, proargtypes := [⟨1700⟩] }
    , { oid := ⟨2154⟩, proname := "stddev", pronamespace := pgCatalogNamespace.oid, prokind := .aggregate, prosecdef := false, provolatile := .volatile, prorettype := ⟨1700⟩, proargtypes := [⟨20⟩] }
    , { oid := ⟨2155⟩, proname := "stddev", pronamespace := pgCatalogNamespace.oid, prokind := .aggregate, prosecdef := false, provolatile := .volatile, prorettype := ⟨1700⟩, proargtypes := [⟨23⟩] }
    , { oid := ⟨2156⟩, proname := "stddev", pronamespace := pgCatalogNamespace.oid, prokind := .aggregate, prosecdef := false, provolatile := .volatile, prorettype := ⟨1700⟩, proargtypes := [⟨21⟩] }
    , { oid := ⟨2157⟩, proname := "stddev", pronamespace := pgCatalogNamespace.oid, prokind := .aggregate, prosecdef := false, provolatile := .volatile, prorettype := ⟨701⟩, proargtypes := [⟨700⟩] }
    , { oid := ⟨2158⟩, proname := "stddev", pronamespace := pgCatalogNamespace.oid, prokind := .aggregate, prosecdef := false, provolatile := .volatile, prorettype := ⟨701⟩, proargtypes := [⟨701⟩] }
    , { oid := ⟨2159⟩, proname := "stddev", pronamespace := pgCatalogNamespace.oid, prokind := .aggregate, prosecdef := false, provolatile := .volatile, prorettype := ⟨1700⟩, proargtypes := [⟨1700⟩] }
    , { oid := ⟨2818⟩, proname := "regr_count", pronamespace := pgCatalogNamespace.oid, prokind := .aggregate, prosecdef := false, provolatile := .volatile, prorettype := ⟨20⟩, proargtypes := [⟨701⟩, ⟨701⟩] }
    , { oid := ⟨2819⟩, proname := "regr_sxx", pronamespace := pgCatalogNamespace.oid, prokind := .aggregate, prosecdef := false, provolatile := .volatile, prorettype := ⟨701⟩, proargtypes := [⟨701⟩, ⟨701⟩] }
    , { oid := ⟨2820⟩, proname := "regr_syy", pronamespace := pgCatalogNamespace.oid, prokind := .aggregate, prosecdef := false, provolatile := .volatile, prorettype := ⟨701⟩, proargtypes := [⟨701⟩, ⟨701⟩] }
    , { oid := ⟨2821⟩, proname := "regr_sxy", pronamespace := pgCatalogNamespace.oid, prokind := .aggregate, prosecdef := false, provolatile := .volatile, prorettype := ⟨701⟩, proargtypes := [⟨701⟩, ⟨701⟩] }
    , { oid := ⟨2822⟩, proname := "regr_avgx", pronamespace := pgCatalogNamespace.oid, prokind := .aggregate, prosecdef := false, provolatile := .volatile, prorettype := ⟨701⟩, proargtypes := [⟨701⟩, ⟨701⟩] }
    , { oid := ⟨2823⟩, proname := "regr_avgy", pronamespace := pgCatalogNamespace.oid, prokind := .aggregate, prosecdef := false, provolatile := .volatile, prorettype := ⟨701⟩, proargtypes := [⟨701⟩, ⟨701⟩] }
    , { oid := ⟨2824⟩, proname := "regr_r2", pronamespace := pgCatalogNamespace.oid, prokind := .aggregate, prosecdef := false, provolatile := .volatile, prorettype := ⟨701⟩, proargtypes := [⟨701⟩, ⟨701⟩] }
    , { oid := ⟨2825⟩, proname := "regr_slope", pronamespace := pgCatalogNamespace.oid, prokind := .aggregate, prosecdef := false, provolatile := .volatile, prorettype := ⟨701⟩, proargtypes := [⟨701⟩, ⟨701⟩] }
    , { oid := ⟨2826⟩, proname := "regr_intercept", pronamespace := pgCatalogNamespace.oid, prokind := .aggregate, prosecdef := false, provolatile := .volatile, prorettype := ⟨701⟩, proargtypes := [⟨701⟩, ⟨701⟩] }
    , { oid := ⟨2827⟩, proname := "covar_pop", pronamespace := pgCatalogNamespace.oid, prokind := .aggregate, prosecdef := false, provolatile := .volatile, prorettype := ⟨701⟩, proargtypes := [⟨701⟩, ⟨701⟩] }
    , { oid := ⟨2828⟩, proname := "covar_samp", pronamespace := pgCatalogNamespace.oid, prokind := .aggregate, prosecdef := false, provolatile := .volatile, prorettype := ⟨701⟩, proargtypes := [⟨701⟩, ⟨701⟩] }
    , { oid := ⟨2829⟩, proname := "corr", pronamespace := pgCatalogNamespace.oid, prokind := .aggregate, prosecdef := false, provolatile := .volatile, prorettype := ⟨701⟩, proargtypes := [⟨701⟩, ⟨701⟩] }
    , { oid := ⟨2160⟩, proname := "text_pattern_lt", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨25⟩, ⟨25⟩] }
    , { oid := ⟨2161⟩, proname := "text_pattern_le", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨25⟩, ⟨25⟩] }
    , { oid := ⟨2163⟩, proname := "text_pattern_ge", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨25⟩, ⟨25⟩] }
    , { oid := ⟨2164⟩, proname := "text_pattern_gt", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨25⟩, ⟨25⟩] }
    , { oid := ⟨2166⟩, proname := "bttext_pattern_cmp", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨23⟩, proargtypes := [⟨25⟩, ⟨25⟩] }
    , { oid := ⟨3332⟩, proname := "bttext_pattern_sortsupport", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨2278⟩, proargtypes := [⟨2281⟩] }
    , { oid := ⟨2174⟩, proname := "bpchar_pattern_lt", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨1042⟩, ⟨1042⟩] }
    , { oid := ⟨2175⟩, proname := "bpchar_pattern_le", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨1042⟩, ⟨1042⟩] }
    , { oid := ⟨2177⟩, proname := "bpchar_pattern_ge", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨1042⟩, ⟨1042⟩] }
    , { oid := ⟨2178⟩, proname := "bpchar_pattern_gt", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨1042⟩, ⟨1042⟩] }
    , { oid := ⟨2180⟩, proname := "btbpchar_pattern_cmp", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨23⟩, proargtypes := [⟨1042⟩, ⟨1042⟩] }
    , { oid := ⟨3333⟩, proname := "btbpchar_pattern_sortsupport", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨2278⟩, proargtypes := [⟨2281⟩] }
    , { oid := ⟨2188⟩, proname := "btint48cmp", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨23⟩, proargtypes := [⟨23⟩, ⟨20⟩] }
    , { oid := ⟨2189⟩, proname := "btint84cmp", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨23⟩, proargtypes := [⟨20⟩, ⟨23⟩] }
    , { oid := ⟨2190⟩, proname := "btint24cmp", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨23⟩, proargtypes := [⟨21⟩, ⟨23⟩] }
    , { oid := ⟨2191⟩, proname := "btint42cmp", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨23⟩, proargtypes := [⟨23⟩, ⟨21⟩] }
    , { oid := ⟨2192⟩, proname := "btint28cmp", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨23⟩, proargtypes := [⟨21⟩, ⟨20⟩] }
    , { oid := ⟨2193⟩, proname := "btint82cmp", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨23⟩, proargtypes := [⟨20⟩, ⟨21⟩] }
    , { oid := ⟨2194⟩, proname := "btfloat48cmp", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨23⟩, proargtypes := [⟨700⟩, ⟨701⟩] }
    , { oid := ⟨2195⟩, proname := "btfloat84cmp", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨23⟩, proargtypes := [⟨701⟩, ⟨700⟩] }
    , { oid := ⟨2212⟩, proname := "regprocedurein", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨2202⟩, proargtypes := [⟨2275⟩] }
    , { oid := ⟨2213⟩, proname := "regprocedureout", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨2275⟩, proargtypes := [⟨2202⟩] }
    , { oid := ⟨2214⟩, proname := "regoperin", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨2203⟩, proargtypes := [⟨2275⟩] }
    , { oid := ⟨2215⟩, proname := "regoperout", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨2275⟩, proargtypes := [⟨2203⟩] }
    , { oid := ⟨3492⟩, proname := "to_regoper", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨2203⟩, proargtypes := [⟨25⟩] }
    , { oid := ⟨3476⟩, proname := "to_regoperator", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨2204⟩, proargtypes := [⟨25⟩] }
    , { oid := ⟨2216⟩, proname := "regoperatorin", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨2204⟩, proargtypes := [⟨2275⟩] }
    , { oid := ⟨2217⟩, proname := "regoperatorout", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨2275⟩, proargtypes := [⟨2204⟩] }
    , { oid := ⟨2218⟩, proname := "regclassin", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨2205⟩, proargtypes := [⟨2275⟩] }
    , { oid := ⟨2219⟩, proname := "regclassout", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨2275⟩, proargtypes := [⟨2205⟩] }
    , { oid := ⟨3495⟩, proname := "to_regclass", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨2205⟩, proargtypes := [⟨25⟩] }
    , { oid := ⟨4193⟩, proname := "regcollationin", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨4191⟩, proargtypes := [⟨2275⟩] }
    , { oid := ⟨4194⟩, proname := "regcollationout", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨2275⟩, proargtypes := [⟨4191⟩] }
    , { oid := ⟨4195⟩, proname := "to_regcollation", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨4191⟩, proargtypes := [⟨25⟩] }
    , { oid := ⟨2220⟩, proname := "regtypein", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨2206⟩, proargtypes := [⟨2275⟩] }
    , { oid := ⟨2221⟩, proname := "regtypeout", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨2275⟩, proargtypes := [⟨2206⟩] }
    , { oid := ⟨3493⟩, proname := "to_regtype", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨2206⟩, proargtypes := [⟨25⟩] }
    , { oid := ⟨6317⟩, proname := "to_regtypemod", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨23⟩, proargtypes := [⟨25⟩] }
    , { oid := ⟨1079⟩, proname := "regclass", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨2205⟩, proargtypes := [⟨25⟩] }
    , { oid := ⟨4098⟩, proname := "regrolein", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨4096⟩, proargtypes := [⟨2275⟩] }
    , { oid := ⟨4092⟩, proname := "regroleout", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨2275⟩, proargtypes := [⟨4096⟩] }
    , { oid := ⟨4093⟩, proname := "to_regrole", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨4096⟩, proargtypes := [⟨25⟩] }
    , { oid := ⟨4084⟩, proname := "regnamespacein", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨4089⟩, proargtypes := [⟨2275⟩] }
    , { oid := ⟨4085⟩, proname := "regnamespaceout", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨2275⟩, proargtypes := [⟨4089⟩] }
    , { oid := ⟨4086⟩, proname := "to_regnamespace", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨4089⟩, proargtypes := [⟨25⟩] }
    , { oid := ⟨6210⟩, proname := "pg_input_is_valid", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨16⟩, proargtypes := [⟨25⟩, ⟨25⟩] }
    , { oid := ⟨6211⟩, proname := "pg_input_error_info", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨2249⟩, proargtypes := [⟨25⟩, ⟨25⟩] }
    , { oid := ⟨1268⟩, proname := "parse_ident", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨1009⟩, proargtypes := [⟨25⟩, ⟨16⟩] }
    , { oid := ⟨2246⟩, proname := "fmgr_internal_validator", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨2278⟩, proargtypes := [⟨26⟩] }
    , { oid := ⟨2247⟩, proname := "fmgr_c_validator", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨2278⟩, proargtypes := [⟨26⟩] }
    , { oid := ⟨2248⟩, proname := "fmgr_sql_validator", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨2278⟩, proargtypes := [⟨26⟩] }
    , { oid := ⟨2250⟩, proname := "has_database_privilege", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨16⟩, proargtypes := [⟨19⟩, ⟨25⟩, ⟨25⟩] }
    , { oid := ⟨2251⟩, proname := "has_database_privilege", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨16⟩, proargtypes := [⟨19⟩, ⟨26⟩, ⟨25⟩] }
    , { oid := ⟨2252⟩, proname := "has_database_privilege", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨16⟩, proargtypes := [⟨26⟩, ⟨25⟩, ⟨25⟩] }
    , { oid := ⟨2253⟩, proname := "has_database_privilege", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨16⟩, proargtypes := [⟨26⟩, ⟨26⟩, ⟨25⟩] }
    , { oid := ⟨2254⟩, proname := "has_database_privilege", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨16⟩, proargtypes := [⟨25⟩, ⟨25⟩] }
    , { oid := ⟨2255⟩, proname := "has_database_privilege", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨16⟩, proargtypes := [⟨26⟩, ⟨25⟩] }
    , { oid := ⟨2256⟩, proname := "has_function_privilege", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨16⟩, proargtypes := [⟨19⟩, ⟨25⟩, ⟨25⟩] }
    , { oid := ⟨2257⟩, proname := "has_function_privilege", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨16⟩, proargtypes := [⟨19⟩, ⟨26⟩, ⟨25⟩] }
    , { oid := ⟨2258⟩, proname := "has_function_privilege", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨16⟩, proargtypes := [⟨26⟩, ⟨25⟩, ⟨25⟩] }
    , { oid := ⟨2259⟩, proname := "has_function_privilege", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨16⟩, proargtypes := [⟨26⟩, ⟨26⟩, ⟨25⟩] }
    , { oid := ⟨2260⟩, proname := "has_function_privilege", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨16⟩, proargtypes := [⟨25⟩, ⟨25⟩] }
    , { oid := ⟨2261⟩, proname := "has_function_privilege", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨16⟩, proargtypes := [⟨26⟩, ⟨25⟩] }
    , { oid := ⟨2262⟩, proname := "has_language_privilege", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨16⟩, proargtypes := [⟨19⟩, ⟨25⟩, ⟨25⟩] }
    , { oid := ⟨2263⟩, proname := "has_language_privilege", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨16⟩, proargtypes := [⟨19⟩, ⟨26⟩, ⟨25⟩] }
    , { oid := ⟨2264⟩, proname := "has_language_privilege", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨16⟩, proargtypes := [⟨26⟩, ⟨25⟩, ⟨25⟩] }
    , { oid := ⟨2265⟩, proname := "has_language_privilege", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨16⟩, proargtypes := [⟨26⟩, ⟨26⟩, ⟨25⟩] }
    , { oid := ⟨2266⟩, proname := "has_language_privilege", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨16⟩, proargtypes := [⟨25⟩, ⟨25⟩] }
    , { oid := ⟨2267⟩, proname := "has_language_privilege", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨16⟩, proargtypes := [⟨26⟩, ⟨25⟩] }
    , { oid := ⟨2268⟩, proname := "has_schema_privilege", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨16⟩, proargtypes := [⟨19⟩, ⟨25⟩, ⟨25⟩] }
    , { oid := ⟨2269⟩, proname := "has_schema_privilege", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨16⟩, proargtypes := [⟨19⟩, ⟨26⟩, ⟨25⟩] }
    , { oid := ⟨2270⟩, proname := "has_schema_privilege", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨16⟩, proargtypes := [⟨26⟩, ⟨25⟩, ⟨25⟩] }
    , { oid := ⟨2271⟩, proname := "has_schema_privilege", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨16⟩, proargtypes := [⟨26⟩, ⟨26⟩, ⟨25⟩] }
    , { oid := ⟨2272⟩, proname := "has_schema_privilege", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨16⟩, proargtypes := [⟨25⟩, ⟨25⟩] }
    , { oid := ⟨2273⟩, proname := "has_schema_privilege", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨16⟩, proargtypes := [⟨26⟩, ⟨25⟩] }
    , { oid := ⟨2390⟩, proname := "has_tablespace_privilege", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨16⟩, proargtypes := [⟨19⟩, ⟨25⟩, ⟨25⟩] }
    , { oid := ⟨2391⟩, proname := "has_tablespace_privilege", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨16⟩, proargtypes := [⟨19⟩, ⟨26⟩, ⟨25⟩] }
    , { oid := ⟨2392⟩, proname := "has_tablespace_privilege", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨16⟩, proargtypes := [⟨26⟩, ⟨25⟩, ⟨25⟩] }
    , { oid := ⟨2393⟩, proname := "has_tablespace_privilege", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨16⟩, proargtypes := [⟨26⟩, ⟨26⟩, ⟨25⟩] }
    , { oid := ⟨2394⟩, proname := "has_tablespace_privilege", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨16⟩, proargtypes := [⟨25⟩, ⟨25⟩] }
    , { oid := ⟨2395⟩, proname := "has_tablespace_privilege", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨16⟩, proargtypes := [⟨26⟩, ⟨25⟩] }
    , { oid := ⟨3000⟩, proname := "has_foreign_data_wrapper_privilege", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨16⟩, proargtypes := [⟨19⟩, ⟨25⟩, ⟨25⟩] }
    , { oid := ⟨3001⟩, proname := "has_foreign_data_wrapper_privilege", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨16⟩, proargtypes := [⟨19⟩, ⟨26⟩, ⟨25⟩] }
    , { oid := ⟨3002⟩, proname := "has_foreign_data_wrapper_privilege", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨16⟩, proargtypes := [⟨26⟩, ⟨25⟩, ⟨25⟩] }
    , { oid := ⟨3003⟩, proname := "has_foreign_data_wrapper_privilege", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨16⟩, proargtypes := [⟨26⟩, ⟨26⟩, ⟨25⟩] }
    , { oid := ⟨3004⟩, proname := "has_foreign_data_wrapper_privilege", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨16⟩, proargtypes := [⟨25⟩, ⟨25⟩] }
    , { oid := ⟨3005⟩, proname := "has_foreign_data_wrapper_privilege", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨16⟩, proargtypes := [⟨26⟩, ⟨25⟩] }
    , { oid := ⟨3006⟩, proname := "has_server_privilege", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨16⟩, proargtypes := [⟨19⟩, ⟨25⟩, ⟨25⟩] }
    , { oid := ⟨3007⟩, proname := "has_server_privilege", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨16⟩, proargtypes := [⟨19⟩, ⟨26⟩, ⟨25⟩] }
    , { oid := ⟨3008⟩, proname := "has_server_privilege", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨16⟩, proargtypes := [⟨26⟩, ⟨25⟩, ⟨25⟩] }
    , { oid := ⟨3009⟩, proname := "has_server_privilege", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨16⟩, proargtypes := [⟨26⟩, ⟨26⟩, ⟨25⟩] }
    , { oid := ⟨3010⟩, proname := "has_server_privilege", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨16⟩, proargtypes := [⟨25⟩, ⟨25⟩] }
    , { oid := ⟨3011⟩, proname := "has_server_privilege", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨16⟩, proargtypes := [⟨26⟩, ⟨25⟩] }
    , { oid := ⟨3138⟩, proname := "has_type_privilege", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨16⟩, proargtypes := [⟨19⟩, ⟨25⟩, ⟨25⟩] }
    , { oid := ⟨3139⟩, proname := "has_type_privilege", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨16⟩, proargtypes := [⟨19⟩, ⟨26⟩, ⟨25⟩] }
    , { oid := ⟨3140⟩, proname := "has_type_privilege", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨16⟩, proargtypes := [⟨26⟩, ⟨25⟩, ⟨25⟩] }
    , { oid := ⟨3141⟩, proname := "has_type_privilege", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨16⟩, proargtypes := [⟨26⟩, ⟨26⟩, ⟨25⟩] }
    , { oid := ⟨3142⟩, proname := "has_type_privilege", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨16⟩, proargtypes := [⟨25⟩, ⟨25⟩] }
    , { oid := ⟨3143⟩, proname := "has_type_privilege", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨16⟩, proargtypes := [⟨26⟩, ⟨25⟩] }
    , { oid := ⟨6205⟩, proname := "has_parameter_privilege", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨16⟩, proargtypes := [⟨19⟩, ⟨25⟩, ⟨25⟩] }
    , { oid := ⟨6206⟩, proname := "has_parameter_privilege", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨16⟩, proargtypes := [⟨26⟩, ⟨25⟩, ⟨25⟩] }
    , { oid := ⟨6207⟩, proname := "has_parameter_privilege", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨16⟩, proargtypes := [⟨25⟩, ⟨25⟩] }
    , { oid := ⟨2705⟩, proname := "pg_has_role", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨16⟩, proargtypes := [⟨19⟩, ⟨19⟩, ⟨25⟩] }
    , { oid := ⟨2706⟩, proname := "pg_has_role", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨16⟩, proargtypes := [⟨19⟩, ⟨26⟩, ⟨25⟩] }
    , { oid := ⟨2707⟩, proname := "pg_has_role", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨16⟩, proargtypes := [⟨26⟩, ⟨19⟩, ⟨25⟩] }
    , { oid := ⟨2708⟩, proname := "pg_has_role", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨16⟩, proargtypes := [⟨26⟩, ⟨26⟩, ⟨25⟩] }
    , { oid := ⟨2709⟩, proname := "pg_has_role", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨16⟩, proargtypes := [⟨19⟩, ⟨25⟩] }
    , { oid := ⟨2710⟩, proname := "pg_has_role", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨16⟩, proargtypes := [⟨26⟩, ⟨25⟩] }
    , { oid := ⟨1269⟩, proname := "pg_column_size", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨23⟩, proargtypes := [⟨2276⟩] }
    , { oid := ⟨2121⟩, proname := "pg_column_compression", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨25⟩, proargtypes := [⟨2276⟩] }
    , { oid := ⟨6316⟩, proname := "pg_column_toast_chunk_id", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨26⟩, proargtypes := [⟨2276⟩] }
    , { oid := ⟨2322⟩, proname := "pg_tablespace_size", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨20⟩, proargtypes := [⟨26⟩] }
    , { oid := ⟨2323⟩, proname := "pg_tablespace_size", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨20⟩, proargtypes := [⟨19⟩] }
    , { oid := ⟨2324⟩, proname := "pg_database_size", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨20⟩, proargtypes := [⟨26⟩] }
    , { oid := ⟨2168⟩, proname := "pg_database_size", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨20⟩, proargtypes := [⟨19⟩] }
    , { oid := ⟨2325⟩, proname := "pg_relation_size", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨20⟩, proargtypes := [⟨2205⟩] }
    , { oid := ⟨2332⟩, proname := "pg_relation_size", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨20⟩, proargtypes := [⟨2205⟩, ⟨25⟩] }
    , { oid := ⟨2286⟩, proname := "pg_total_relation_size", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨20⟩, proargtypes := [⟨2205⟩] }
    , { oid := ⟨2288⟩, proname := "pg_size_pretty", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨25⟩, proargtypes := [⟨20⟩] }
    , { oid := ⟨3166⟩, proname := "pg_size_pretty", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨25⟩, proargtypes := [⟨1700⟩] }
    , { oid := ⟨3334⟩, proname := "pg_size_bytes", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨20⟩, proargtypes := [⟨25⟩] }
    , { oid := ⟨2997⟩, proname := "pg_table_size", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨20⟩, proargtypes := [⟨2205⟩] }
    , { oid := ⟨2998⟩, proname := "pg_indexes_size", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨20⟩, proargtypes := [⟨2205⟩] }
    , { oid := ⟨2999⟩, proname := "pg_relation_filenode", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨26⟩, proargtypes := [⟨2205⟩] }
    , { oid := ⟨3454⟩, proname := "pg_filenode_relation", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨2205⟩, proargtypes := [⟨26⟩, ⟨26⟩] }
    , { oid := ⟨3034⟩, proname := "pg_relation_filepath", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨25⟩, proargtypes := [⟨2205⟩] }
    , { oid := ⟨2316⟩, proname := "postgresql_fdw_validator", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨1009⟩, ⟨26⟩] }
    , { oid := ⟨2290⟩, proname := "record_in", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨2249⟩, proargtypes := [⟨2275⟩, ⟨26⟩, ⟨23⟩] }
    , { oid := ⟨2291⟩, proname := "record_out", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨2275⟩, proargtypes := [⟨2249⟩] }
    , { oid := ⟨2292⟩, proname := "cstring_in", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨2275⟩, proargtypes := [⟨2275⟩] }
    , { oid := ⟨2293⟩, proname := "cstring_out", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨2275⟩, proargtypes := [⟨2275⟩] }
    , { oid := ⟨2294⟩, proname := "any_in", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨2276⟩, proargtypes := [⟨2275⟩] }
    , { oid := ⟨2295⟩, proname := "any_out", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨2275⟩, proargtypes := [⟨2276⟩] }
    , { oid := ⟨2296⟩, proname := "anyarray_in", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨2277⟩, proargtypes := [⟨2275⟩] }
    , { oid := ⟨2297⟩, proname := "anyarray_out", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨2275⟩, proargtypes := [⟨2277⟩] }
    , { oid := ⟨2298⟩, proname := "void_in", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨2278⟩, proargtypes := [⟨2275⟩] }
    , { oid := ⟨2299⟩, proname := "void_out", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨2275⟩, proargtypes := [⟨2278⟩] }
    , { oid := ⟨2300⟩, proname := "trigger_in", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨2279⟩, proargtypes := [⟨2275⟩] }
    , { oid := ⟨2301⟩, proname := "trigger_out", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨2275⟩, proargtypes := [⟨2279⟩] }
    , { oid := ⟨3594⟩, proname := "event_trigger_in", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨3838⟩, proargtypes := [⟨2275⟩] }
    , { oid := ⟨3595⟩, proname := "event_trigger_out", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨2275⟩, proargtypes := [⟨3838⟩] }
    , { oid := ⟨2302⟩, proname := "language_handler_in", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨2280⟩, proargtypes := [⟨2275⟩] }
    , { oid := ⟨2303⟩, proname := "language_handler_out", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨2275⟩, proargtypes := [⟨2280⟩] }
    , { oid := ⟨2304⟩, proname := "internal_in", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨2281⟩, proargtypes := [⟨2275⟩] }
    , { oid := ⟨2305⟩, proname := "internal_out", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨2275⟩, proargtypes := [⟨2281⟩] }
    , { oid := ⟨2312⟩, proname := "anyelement_in", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨2283⟩, proargtypes := [⟨2275⟩] }
    , { oid := ⟨2313⟩, proname := "anyelement_out", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨2275⟩, proargtypes := [⟨2283⟩] }
    , { oid := ⟨2398⟩, proname := "shell_in", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨2278⟩, proargtypes := [⟨2275⟩] }
    , { oid := ⟨2399⟩, proname := "shell_out", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨2275⟩, proargtypes := [⟨2278⟩] }
    , { oid := ⟨2597⟩, proname := "domain_in", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨2276⟩, proargtypes := [⟨2275⟩, ⟨26⟩, ⟨23⟩] }
    , { oid := ⟨2598⟩, proname := "domain_recv", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨2276⟩, proargtypes := [⟨2281⟩, ⟨26⟩, ⟨23⟩] }
    , { oid := ⟨2777⟩, proname := "anynonarray_in", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨2776⟩, proargtypes := [⟨2275⟩] }
    , { oid := ⟨2778⟩, proname := "anynonarray_out", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨2275⟩, proargtypes := [⟨2776⟩] }
    , { oid := ⟨3116⟩, proname := "fdw_handler_in", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨3115⟩, proargtypes := [⟨2275⟩] }
    , { oid := ⟨3117⟩, proname := "fdw_handler_out", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨2275⟩, proargtypes := [⟨3115⟩] }
    , { oid := ⟨326⟩, proname := "index_am_handler_in", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨325⟩, proargtypes := [⟨2275⟩] }
    , { oid := ⟨327⟩, proname := "index_am_handler_out", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨2275⟩, proargtypes := [⟨325⟩] }
    , { oid := ⟨3311⟩, proname := "tsm_handler_in", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨3310⟩, proargtypes := [⟨2275⟩] }
    , { oid := ⟨3312⟩, proname := "tsm_handler_out", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨2275⟩, proargtypes := [⟨3310⟩] }
    , { oid := ⟨267⟩, proname := "table_am_handler_in", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨269⟩, proargtypes := [⟨2275⟩] }
    , { oid := ⟨268⟩, proname := "table_am_handler_out", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨2275⟩, proargtypes := [⟨269⟩] }
    , { oid := ⟨5086⟩, proname := "anycompatible_in", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨5077⟩, proargtypes := [⟨2275⟩] }
    , { oid := ⟨5087⟩, proname := "anycompatible_out", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨2275⟩, proargtypes := [⟨5077⟩] }
    , { oid := ⟨5088⟩, proname := "anycompatiblearray_in", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨5078⟩, proargtypes := [⟨2275⟩] }
    , { oid := ⟨5089⟩, proname := "anycompatiblearray_out", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨2275⟩, proargtypes := [⟨5078⟩] }
    , { oid := ⟨5090⟩, proname := "anycompatiblearray_recv", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨5078⟩, proargtypes := [⟨2281⟩] }
    , { oid := ⟨5091⟩, proname := "anycompatiblearray_send", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨17⟩, proargtypes := [⟨5078⟩] }
    , { oid := ⟨5092⟩, proname := "anycompatiblenonarray_in", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨5079⟩, proargtypes := [⟨2275⟩] }
    , { oid := ⟨5093⟩, proname := "anycompatiblenonarray_out", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨2275⟩, proargtypes := [⟨5079⟩] }
    , { oid := ⟨5094⟩, proname := "anycompatiblerange_in", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨5080⟩, proargtypes := [⟨2275⟩, ⟨26⟩, ⟨23⟩] }
    , { oid := ⟨5095⟩, proname := "anycompatiblerange_out", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨2275⟩, proargtypes := [⟨5080⟩] }
    , { oid := ⟨4226⟩, proname := "anycompatiblemultirange_in", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨4538⟩, proargtypes := [⟨2275⟩, ⟨26⟩, ⟨23⟩] }
    , { oid := ⟨4227⟩, proname := "anycompatiblemultirange_out", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨2275⟩, proargtypes := [⟨4538⟩] }
    , { oid := ⟨3313⟩, proname := "bernoulli", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨3310⟩, proargtypes := [⟨2281⟩] }
    , { oid := ⟨3314⟩, proname := "system", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨3310⟩, proargtypes := [⟨2281⟩] }
    , { oid := ⟨2311⟩, proname := "md5", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨25⟩, proargtypes := [⟨25⟩] }
    , { oid := ⟨2321⟩, proname := "md5", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨25⟩, proargtypes := [⟨17⟩] }
    , { oid := ⟨3419⟩, proname := "sha224", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨17⟩, proargtypes := [⟨17⟩] }
    , { oid := ⟨3420⟩, proname := "sha256", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨17⟩, proargtypes := [⟨17⟩] }
    , { oid := ⟨3421⟩, proname := "sha384", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨17⟩, proargtypes := [⟨17⟩] }
    , { oid := ⟨3422⟩, proname := "sha512", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨17⟩, proargtypes := [⟨17⟩] }
    , { oid := ⟨2338⟩, proname := "date_lt_timestamp", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨1082⟩, ⟨1114⟩] }
    , { oid := ⟨2339⟩, proname := "date_le_timestamp", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨1082⟩, ⟨1114⟩] }
    , { oid := ⟨2340⟩, proname := "date_eq_timestamp", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨1082⟩, ⟨1114⟩] }
    , { oid := ⟨2341⟩, proname := "date_gt_timestamp", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨1082⟩, ⟨1114⟩] }
    , { oid := ⟨2342⟩, proname := "date_ge_timestamp", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨1082⟩, ⟨1114⟩] }
    , { oid := ⟨2343⟩, proname := "date_ne_timestamp", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨1082⟩, ⟨1114⟩] }
    , { oid := ⟨2344⟩, proname := "date_cmp_timestamp", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨23⟩, proargtypes := [⟨1082⟩, ⟨1114⟩] }
    , { oid := ⟨2351⟩, proname := "date_lt_timestamptz", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨16⟩, proargtypes := [⟨1082⟩, ⟨1184⟩] }
    , { oid := ⟨2352⟩, proname := "date_le_timestamptz", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨16⟩, proargtypes := [⟨1082⟩, ⟨1184⟩] }
    , { oid := ⟨2353⟩, proname := "date_eq_timestamptz", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨16⟩, proargtypes := [⟨1082⟩, ⟨1184⟩] }
    , { oid := ⟨2354⟩, proname := "date_gt_timestamptz", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨16⟩, proargtypes := [⟨1082⟩, ⟨1184⟩] }
    , { oid := ⟨2355⟩, proname := "date_ge_timestamptz", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨16⟩, proargtypes := [⟨1082⟩, ⟨1184⟩] }
    , { oid := ⟨2356⟩, proname := "date_ne_timestamptz", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨16⟩, proargtypes := [⟨1082⟩, ⟨1184⟩] }
    , { oid := ⟨2357⟩, proname := "date_cmp_timestamptz", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨23⟩, proargtypes := [⟨1082⟩, ⟨1184⟩] }
    , { oid := ⟨2364⟩, proname := "timestamp_lt_date", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨1114⟩, ⟨1082⟩] }
    , { oid := ⟨2365⟩, proname := "timestamp_le_date", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨1114⟩, ⟨1082⟩] }
    , { oid := ⟨2366⟩, proname := "timestamp_eq_date", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨1114⟩, ⟨1082⟩] }
    , { oid := ⟨2367⟩, proname := "timestamp_gt_date", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨1114⟩, ⟨1082⟩] }
    , { oid := ⟨2368⟩, proname := "timestamp_ge_date", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨1114⟩, ⟨1082⟩] }
    , { oid := ⟨2369⟩, proname := "timestamp_ne_date", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨1114⟩, ⟨1082⟩] }
    , { oid := ⟨2370⟩, proname := "timestamp_cmp_date", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨23⟩, proargtypes := [⟨1114⟩, ⟨1082⟩] }
    , { oid := ⟨2377⟩, proname := "timestamptz_lt_date", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨16⟩, proargtypes := [⟨1184⟩, ⟨1082⟩] }
    , { oid := ⟨2378⟩, proname := "timestamptz_le_date", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨16⟩, proargtypes := [⟨1184⟩, ⟨1082⟩] }
    , { oid := ⟨2379⟩, proname := "timestamptz_eq_date", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨16⟩, proargtypes := [⟨1184⟩, ⟨1082⟩] }
    , { oid := ⟨2380⟩, proname := "timestamptz_gt_date", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨16⟩, proargtypes := [⟨1184⟩, ⟨1082⟩] }
    , { oid := ⟨2381⟩, proname := "timestamptz_ge_date", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨16⟩, proargtypes := [⟨1184⟩, ⟨1082⟩] }
    , { oid := ⟨2382⟩, proname := "timestamptz_ne_date", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨16⟩, proargtypes := [⟨1184⟩, ⟨1082⟩] }
    , { oid := ⟨2383⟩, proname := "timestamptz_cmp_date", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨23⟩, proargtypes := [⟨1184⟩, ⟨1082⟩] }
    , { oid := ⟨2520⟩, proname := "timestamp_lt_timestamptz", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨16⟩, proargtypes := [⟨1114⟩, ⟨1184⟩] }
    , { oid := ⟨2521⟩, proname := "timestamp_le_timestamptz", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨16⟩, proargtypes := [⟨1114⟩, ⟨1184⟩] }
    , { oid := ⟨2522⟩, proname := "timestamp_eq_timestamptz", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨16⟩, proargtypes := [⟨1114⟩, ⟨1184⟩] }
    , { oid := ⟨2523⟩, proname := "timestamp_gt_timestamptz", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨16⟩, proargtypes := [⟨1114⟩, ⟨1184⟩] }
    , { oid := ⟨2524⟩, proname := "timestamp_ge_timestamptz", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨16⟩, proargtypes := [⟨1114⟩, ⟨1184⟩] }
    , { oid := ⟨2525⟩, proname := "timestamp_ne_timestamptz", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨16⟩, proargtypes := [⟨1114⟩, ⟨1184⟩] }
    , { oid := ⟨2526⟩, proname := "timestamp_cmp_timestamptz", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨23⟩, proargtypes := [⟨1114⟩, ⟨1184⟩] }
    , { oid := ⟨2527⟩, proname := "timestamptz_lt_timestamp", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨16⟩, proargtypes := [⟨1184⟩, ⟨1114⟩] }
    , { oid := ⟨2528⟩, proname := "timestamptz_le_timestamp", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨16⟩, proargtypes := [⟨1184⟩, ⟨1114⟩] }
    , { oid := ⟨2529⟩, proname := "timestamptz_eq_timestamp", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨16⟩, proargtypes := [⟨1184⟩, ⟨1114⟩] }
    , { oid := ⟨2530⟩, proname := "timestamptz_gt_timestamp", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨16⟩, proargtypes := [⟨1184⟩, ⟨1114⟩] }
    , { oid := ⟨2531⟩, proname := "timestamptz_ge_timestamp", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨16⟩, proargtypes := [⟨1184⟩, ⟨1114⟩] }
    , { oid := ⟨2532⟩, proname := "timestamptz_ne_timestamp", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨16⟩, proargtypes := [⟨1184⟩, ⟨1114⟩] }
    , { oid := ⟨2533⟩, proname := "timestamptz_cmp_timestamp", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨23⟩, proargtypes := [⟨1184⟩, ⟨1114⟩] }
    , { oid := ⟨2400⟩, proname := "array_recv", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨2277⟩, proargtypes := [⟨2281⟩, ⟨26⟩, ⟨23⟩] }
    , { oid := ⟨2401⟩, proname := "array_send", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨17⟩, proargtypes := [⟨2277⟩] }
    , { oid := ⟨2402⟩, proname := "record_recv", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨2249⟩, proargtypes := [⟨2281⟩, ⟨26⟩, ⟨23⟩] }
    , { oid := ⟨2403⟩, proname := "record_send", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨17⟩, proargtypes := [⟨2249⟩] }
    , { oid := ⟨2404⟩, proname := "int2recv", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨21⟩, proargtypes := [⟨2281⟩] }
    , { oid := ⟨2405⟩, proname := "int2send", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨17⟩, proargtypes := [⟨21⟩] }
    , { oid := ⟨2406⟩, proname := "int4recv", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨23⟩, proargtypes := [⟨2281⟩] }
    , { oid := ⟨2407⟩, proname := "int4send", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨17⟩, proargtypes := [⟨23⟩] }
    , { oid := ⟨2408⟩, proname := "int8recv", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨20⟩, proargtypes := [⟨2281⟩] }
    , { oid := ⟨2409⟩, proname := "int8send", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨17⟩, proargtypes := [⟨20⟩] }
    , { oid := ⟨2410⟩, proname := "int2vectorrecv", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨22⟩, proargtypes := [⟨2281⟩] }
    , { oid := ⟨2411⟩, proname := "int2vectorsend", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨17⟩, proargtypes := [⟨22⟩] }
    , { oid := ⟨2412⟩, proname := "bytearecv", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨17⟩, proargtypes := [⟨2281⟩] }
    , { oid := ⟨2413⟩, proname := "byteasend", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨17⟩, proargtypes := [⟨17⟩] }
    , { oid := ⟨2414⟩, proname := "textrecv", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨25⟩, proargtypes := [⟨2281⟩] }
    , { oid := ⟨2415⟩, proname := "textsend", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨17⟩, proargtypes := [⟨25⟩] }
    , { oid := ⟨2416⟩, proname := "unknownrecv", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨705⟩, proargtypes := [⟨2281⟩] }
    , { oid := ⟨2417⟩, proname := "unknownsend", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨17⟩, proargtypes := [⟨705⟩] }
    , { oid := ⟨2418⟩, proname := "oidrecv", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨26⟩, proargtypes := [⟨2281⟩] }
    , { oid := ⟨2419⟩, proname := "oidsend", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨17⟩, proargtypes := [⟨26⟩] }
    , { oid := ⟨2420⟩, proname := "oidvectorrecv", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨30⟩, proargtypes := [⟨2281⟩] }
    , { oid := ⟨2421⟩, proname := "oidvectorsend", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨17⟩, proargtypes := [⟨30⟩] }
    , { oid := ⟨2422⟩, proname := "namerecv", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨19⟩, proargtypes := [⟨2281⟩] }
    , { oid := ⟨2423⟩, proname := "namesend", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨17⟩, proargtypes := [⟨19⟩] }
    , { oid := ⟨2424⟩, proname := "float4recv", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨700⟩, proargtypes := [⟨2281⟩] }
    , { oid := ⟨2425⟩, proname := "float4send", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨17⟩, proargtypes := [⟨700⟩] }
    , { oid := ⟨2426⟩, proname := "float8recv", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨701⟩, proargtypes := [⟨2281⟩] }
    , { oid := ⟨2427⟩, proname := "float8send", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨17⟩, proargtypes := [⟨701⟩] }
    , { oid := ⟨2428⟩, proname := "point_recv", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨600⟩, proargtypes := [⟨2281⟩] }
    , { oid := ⟨2429⟩, proname := "point_send", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨17⟩, proargtypes := [⟨600⟩] }
    , { oid := ⟨2430⟩, proname := "bpcharrecv", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨1042⟩, proargtypes := [⟨2281⟩, ⟨26⟩, ⟨23⟩] }
    , { oid := ⟨2431⟩, proname := "bpcharsend", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨17⟩, proargtypes := [⟨1042⟩] }
    , { oid := ⟨2432⟩, proname := "varcharrecv", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨1043⟩, proargtypes := [⟨2281⟩, ⟨26⟩, ⟨23⟩] }
    , { oid := ⟨2433⟩, proname := "varcharsend", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨17⟩, proargtypes := [⟨1043⟩] }
    , { oid := ⟨2434⟩, proname := "charrecv", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨18⟩, proargtypes := [⟨2281⟩] }
    , { oid := ⟨2435⟩, proname := "charsend", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨17⟩, proargtypes := [⟨18⟩] }
    , { oid := ⟨2436⟩, proname := "boolrecv", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨2281⟩] }
    , { oid := ⟨2437⟩, proname := "boolsend", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨17⟩, proargtypes := [⟨16⟩] }
    , { oid := ⟨2438⟩, proname := "tidrecv", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨27⟩, proargtypes := [⟨2281⟩] }
    , { oid := ⟨2439⟩, proname := "tidsend", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨17⟩, proargtypes := [⟨27⟩] }
    , { oid := ⟨2440⟩, proname := "xidrecv", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨28⟩, proargtypes := [⟨2281⟩] }
    , { oid := ⟨2441⟩, proname := "xidsend", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨17⟩, proargtypes := [⟨28⟩] }
    , { oid := ⟨2442⟩, proname := "cidrecv", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨29⟩, proargtypes := [⟨2281⟩] }
    , { oid := ⟨2443⟩, proname := "cidsend", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨17⟩, proargtypes := [⟨29⟩] }
    , { oid := ⟨2444⟩, proname := "regprocrecv", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨24⟩, proargtypes := [⟨2281⟩] }
    , { oid := ⟨2445⟩, proname := "regprocsend", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨17⟩, proargtypes := [⟨24⟩] }
    , { oid := ⟨2446⟩, proname := "regprocedurerecv", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨2202⟩, proargtypes := [⟨2281⟩] }
    , { oid := ⟨2447⟩, proname := "regproceduresend", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨17⟩, proargtypes := [⟨2202⟩] }
    , { oid := ⟨2448⟩, proname := "regoperrecv", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨2203⟩, proargtypes := [⟨2281⟩] }
    , { oid := ⟨2449⟩, proname := "regopersend", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨17⟩, proargtypes := [⟨2203⟩] }
    , { oid := ⟨2450⟩, proname := "regoperatorrecv", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨2204⟩, proargtypes := [⟨2281⟩] }
    , { oid := ⟨2451⟩, proname := "regoperatorsend", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨17⟩, proargtypes := [⟨2204⟩] }
    , { oid := ⟨2452⟩, proname := "regclassrecv", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨2205⟩, proargtypes := [⟨2281⟩] }
    , { oid := ⟨2453⟩, proname := "regclasssend", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨17⟩, proargtypes := [⟨2205⟩] }
    , { oid := ⟨4196⟩, proname := "regcollationrecv", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨4191⟩, proargtypes := [⟨2281⟩] }
    , { oid := ⟨4197⟩, proname := "regcollationsend", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨17⟩, proargtypes := [⟨4191⟩] }
    , { oid := ⟨2454⟩, proname := "regtyperecv", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨2206⟩, proargtypes := [⟨2281⟩] }
    , { oid := ⟨2455⟩, proname := "regtypesend", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨17⟩, proargtypes := [⟨2206⟩] }
    , { oid := ⟨4094⟩, proname := "regrolerecv", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨4096⟩, proargtypes := [⟨2281⟩] }
    , { oid := ⟨4095⟩, proname := "regrolesend", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨17⟩, proargtypes := [⟨4096⟩] }
    , { oid := ⟨4087⟩, proname := "regnamespacerecv", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨4089⟩, proargtypes := [⟨2281⟩] }
    , { oid := ⟨4088⟩, proname := "regnamespacesend", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨17⟩, proargtypes := [⟨4089⟩] }
    , { oid := ⟨2456⟩, proname := "bit_recv", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨1560⟩, proargtypes := [⟨2281⟩, ⟨26⟩, ⟨23⟩] }
    , { oid := ⟨2457⟩, proname := "bit_send", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨17⟩, proargtypes := [⟨1560⟩] }
    , { oid := ⟨2458⟩, proname := "varbit_recv", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨1562⟩, proargtypes := [⟨2281⟩, ⟨26⟩, ⟨23⟩] }
    , { oid := ⟨2459⟩, proname := "varbit_send", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨17⟩, proargtypes := [⟨1562⟩] }
    , { oid := ⟨2460⟩, proname := "numeric_recv", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨1700⟩, proargtypes := [⟨2281⟩, ⟨26⟩, ⟨23⟩] }
    , { oid := ⟨2461⟩, proname := "numeric_send", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨17⟩, proargtypes := [⟨1700⟩] }
    , { oid := ⟨2468⟩, proname := "date_recv", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨1082⟩, proargtypes := [⟨2281⟩] }
    , { oid := ⟨2469⟩, proname := "date_send", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨17⟩, proargtypes := [⟨1082⟩] }
    , { oid := ⟨2470⟩, proname := "time_recv", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨1083⟩, proargtypes := [⟨2281⟩, ⟨26⟩, ⟨23⟩] }
    , { oid := ⟨2471⟩, proname := "time_send", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨17⟩, proargtypes := [⟨1083⟩] }
    , { oid := ⟨2472⟩, proname := "timetz_recv", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨1266⟩, proargtypes := [⟨2281⟩, ⟨26⟩, ⟨23⟩] }
    , { oid := ⟨2473⟩, proname := "timetz_send", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨17⟩, proargtypes := [⟨1266⟩] }
    , { oid := ⟨2474⟩, proname := "timestamp_recv", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨1114⟩, proargtypes := [⟨2281⟩, ⟨26⟩, ⟨23⟩] }
    , { oid := ⟨2475⟩, proname := "timestamp_send", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨17⟩, proargtypes := [⟨1114⟩] }
    , { oid := ⟨2476⟩, proname := "timestamptz_recv", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨1184⟩, proargtypes := [⟨2281⟩, ⟨26⟩, ⟨23⟩] }
    , { oid := ⟨2477⟩, proname := "timestamptz_send", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨17⟩, proargtypes := [⟨1184⟩] }
    , { oid := ⟨2478⟩, proname := "interval_recv", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨1186⟩, proargtypes := [⟨2281⟩, ⟨26⟩, ⟨23⟩] }
    , { oid := ⟨2479⟩, proname := "interval_send", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨17⟩, proargtypes := [⟨1186⟩] }
    , { oid := ⟨2480⟩, proname := "lseg_recv", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨601⟩, proargtypes := [⟨2281⟩] }
    , { oid := ⟨2481⟩, proname := "lseg_send", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨17⟩, proargtypes := [⟨601⟩] }
    , { oid := ⟨2482⟩, proname := "path_recv", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨602⟩, proargtypes := [⟨2281⟩] }
    , { oid := ⟨2483⟩, proname := "path_send", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨17⟩, proargtypes := [⟨602⟩] }
    , { oid := ⟨2484⟩, proname := "box_recv", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨603⟩, proargtypes := [⟨2281⟩] }
    , { oid := ⟨2485⟩, proname := "box_send", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨17⟩, proargtypes := [⟨603⟩] }
    , { oid := ⟨2486⟩, proname := "poly_recv", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨604⟩, proargtypes := [⟨2281⟩] }
    , { oid := ⟨2487⟩, proname := "poly_send", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨17⟩, proargtypes := [⟨604⟩] }
    , { oid := ⟨2488⟩, proname := "line_recv", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨628⟩, proargtypes := [⟨2281⟩] }
    , { oid := ⟨2489⟩, proname := "line_send", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨17⟩, proargtypes := [⟨628⟩] }
    , { oid := ⟨2490⟩, proname := "circle_recv", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨718⟩, proargtypes := [⟨2281⟩] }
    , { oid := ⟨2491⟩, proname := "circle_send", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨17⟩, proargtypes := [⟨718⟩] }
    , { oid := ⟨2492⟩, proname := "cash_recv", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨790⟩, proargtypes := [⟨2281⟩] }
    , { oid := ⟨2493⟩, proname := "cash_send", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨17⟩, proargtypes := [⟨790⟩] }
    , { oid := ⟨2494⟩, proname := "macaddr_recv", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨829⟩, proargtypes := [⟨2281⟩] }
    , { oid := ⟨2495⟩, proname := "macaddr_send", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨17⟩, proargtypes := [⟨829⟩] }
    , { oid := ⟨2496⟩, proname := "inet_recv", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨869⟩, proargtypes := [⟨2281⟩] }
    , { oid := ⟨2497⟩, proname := "inet_send", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨17⟩, proargtypes := [⟨869⟩] }
    , { oid := ⟨2498⟩, proname := "cidr_recv", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨650⟩, proargtypes := [⟨2281⟩] }
    , { oid := ⟨2499⟩, proname := "cidr_send", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨17⟩, proargtypes := [⟨650⟩] }
    , { oid := ⟨2500⟩, proname := "cstring_recv", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨2275⟩, proargtypes := [⟨2281⟩] }
    , { oid := ⟨2501⟩, proname := "cstring_send", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨17⟩, proargtypes := [⟨2275⟩] }
    , { oid := ⟨2502⟩, proname := "anyarray_recv", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨2277⟩, proargtypes := [⟨2281⟩] }
    , { oid := ⟨2503⟩, proname := "anyarray_send", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨17⟩, proargtypes := [⟨2277⟩] }
    , { oid := ⟨3120⟩, proname := "void_recv", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨2278⟩, proargtypes := [⟨2281⟩] }
    , { oid := ⟨3121⟩, proname := "void_send", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨17⟩, proargtypes := [⟨2278⟩] }
    , { oid := ⟨3446⟩, proname := "macaddr8_recv", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨774⟩, proargtypes := [⟨2281⟩] }
    , { oid := ⟨3447⟩, proname := "macaddr8_send", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨17⟩, proargtypes := [⟨774⟩] }
    , { oid := ⟨2504⟩, proname := "pg_get_ruledef", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨25⟩, proargtypes := [⟨26⟩, ⟨16⟩] }
    , { oid := ⟨2505⟩, proname := "pg_get_viewdef", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨25⟩, proargtypes := [⟨25⟩, ⟨16⟩] }
    , { oid := ⟨2506⟩, proname := "pg_get_viewdef", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨25⟩, proargtypes := [⟨26⟩, ⟨16⟩] }
    , { oid := ⟨3159⟩, proname := "pg_get_viewdef", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨25⟩, proargtypes := [⟨26⟩, ⟨23⟩] }
    , { oid := ⟨2507⟩, proname := "pg_get_indexdef", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨25⟩, proargtypes := [⟨26⟩, ⟨23⟩, ⟨16⟩] }
    , { oid := ⟨2508⟩, proname := "pg_get_constraintdef", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨25⟩, proargtypes := [⟨26⟩, ⟨16⟩] }
    , { oid := ⟨2509⟩, proname := "pg_get_expr", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨25⟩, proargtypes := [⟨194⟩, ⟨26⟩, ⟨16⟩] }
    , { oid := ⟨2510⟩, proname := "pg_prepared_statement", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨2249⟩, proargtypes := [] }
    , { oid := ⟨2511⟩, proname := "pg_cursor", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨2249⟩, proargtypes := [] }
    , { oid := ⟨2599⟩, proname := "pg_timezone_abbrevs", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨2249⟩, proargtypes := [] }
    , { oid := ⟨2856⟩, proname := "pg_timezone_names", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨2249⟩, proargtypes := [] }
    , { oid := ⟨2730⟩, proname := "pg_get_triggerdef", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨25⟩, proargtypes := [⟨26⟩, ⟨16⟩] }
    , { oid := ⟨3035⟩, proname := "pg_listening_channels", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨25⟩, proargtypes := [] }
    , { oid := ⟨3036⟩, proname := "pg_notify", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨2278⟩, proargtypes := [⟨25⟩, ⟨25⟩] }
    , { oid := ⟨3296⟩, proname := "pg_notification_queue_usage", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨701⟩, proargtypes := [] }
    , { oid := ⟨5052⟩, proname := "pg_get_shmem_allocations", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨2249⟩, proargtypes := [] }
    , { oid := ⟨2282⟩, proname := "pg_get_backend_memory_contexts", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨2249⟩, proargtypes := [] }
    , { oid := ⟨4543⟩, proname := "pg_log_backend_memory_contexts", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨23⟩] }
    , { oid := ⟨1066⟩, proname := "generate_series", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨23⟩, proargtypes := [⟨23⟩, ⟨23⟩, ⟨23⟩] }
    , { oid := ⟨1067⟩, proname := "generate_series", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨23⟩, proargtypes := [⟨23⟩, ⟨23⟩] }
    , { oid := ⟨3994⟩, proname := "generate_series_int4_support", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨2281⟩, proargtypes := [⟨2281⟩] }
    , { oid := ⟨1068⟩, proname := "generate_series", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨20⟩, proargtypes := [⟨20⟩, ⟨20⟩, ⟨20⟩] }
    , { oid := ⟨1069⟩, proname := "generate_series", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨20⟩, proargtypes := [⟨20⟩, ⟨20⟩] }
    , { oid := ⟨3995⟩, proname := "generate_series_int8_support", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨2281⟩, proargtypes := [⟨2281⟩] }
    , { oid := ⟨3259⟩, proname := "generate_series", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨1700⟩, proargtypes := [⟨1700⟩, ⟨1700⟩, ⟨1700⟩] }
    , { oid := ⟨3260⟩, proname := "generate_series", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨1700⟩, proargtypes := [⟨1700⟩, ⟨1700⟩] }
    , { oid := ⟨938⟩, proname := "generate_series", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨1114⟩, proargtypes := [⟨1114⟩, ⟨1114⟩, ⟨1186⟩] }
    , { oid := ⟨939⟩, proname := "generate_series", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨1184⟩, proargtypes := [⟨1184⟩, ⟨1184⟩, ⟨1186⟩] }
    , { oid := ⟨6274⟩, proname := "generate_series", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨1184⟩, proargtypes := [⟨1184⟩, ⟨1184⟩, ⟨1186⟩, ⟨25⟩] }
    , { oid := ⟨2515⟩, proname := "booland_statefunc", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨16⟩, ⟨16⟩] }
    , { oid := ⟨2516⟩, proname := "boolor_statefunc", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨16⟩, ⟨16⟩] }
    , { oid := ⟨3496⟩, proname := "bool_accum", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨2281⟩, proargtypes := [⟨2281⟩, ⟨16⟩] }
    , { oid := ⟨3497⟩, proname := "bool_accum_inv", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨2281⟩, proargtypes := [⟨2281⟩, ⟨16⟩] }
    , { oid := ⟨3498⟩, proname := "bool_alltrue", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨2281⟩] }
    , { oid := ⟨3499⟩, proname := "bool_anytrue", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨2281⟩] }
    , { oid := ⟨2517⟩, proname := "bool_and", pronamespace := pgCatalogNamespace.oid, prokind := .aggregate, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨16⟩] }
    , { oid := ⟨2518⟩, proname := "bool_or", pronamespace := pgCatalogNamespace.oid, prokind := .aggregate, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨16⟩] }
    , { oid := ⟨2519⟩, proname := "every", pronamespace := pgCatalogNamespace.oid, prokind := .aggregate, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨16⟩] }
    , { oid := ⟨2236⟩, proname := "bit_and", pronamespace := pgCatalogNamespace.oid, prokind := .aggregate, prosecdef := false, provolatile := .volatile, prorettype := ⟨21⟩, proargtypes := [⟨21⟩] }
    , { oid := ⟨2237⟩, proname := "bit_or", pronamespace := pgCatalogNamespace.oid, prokind := .aggregate, prosecdef := false, provolatile := .volatile, prorettype := ⟨21⟩, proargtypes := [⟨21⟩] }
    , { oid := ⟨6164⟩, proname := "bit_xor", pronamespace := pgCatalogNamespace.oid, prokind := .aggregate, prosecdef := false, provolatile := .volatile, prorettype := ⟨21⟩, proargtypes := [⟨21⟩] }
    , { oid := ⟨2238⟩, proname := "bit_and", pronamespace := pgCatalogNamespace.oid, prokind := .aggregate, prosecdef := false, provolatile := .volatile, prorettype := ⟨23⟩, proargtypes := [⟨23⟩] }
    , { oid := ⟨2239⟩, proname := "bit_or", pronamespace := pgCatalogNamespace.oid, prokind := .aggregate, prosecdef := false, provolatile := .volatile, prorettype := ⟨23⟩, proargtypes := [⟨23⟩] }
    , { oid := ⟨6165⟩, proname := "bit_xor", pronamespace := pgCatalogNamespace.oid, prokind := .aggregate, prosecdef := false, provolatile := .volatile, prorettype := ⟨23⟩, proargtypes := [⟨23⟩] }
    , { oid := ⟨2240⟩, proname := "bit_and", pronamespace := pgCatalogNamespace.oid, prokind := .aggregate, prosecdef := false, provolatile := .volatile, prorettype := ⟨20⟩, proargtypes := [⟨20⟩] }
    , { oid := ⟨2241⟩, proname := "bit_or", pronamespace := pgCatalogNamespace.oid, prokind := .aggregate, prosecdef := false, provolatile := .volatile, prorettype := ⟨20⟩, proargtypes := [⟨20⟩] }
    , { oid := ⟨6166⟩, proname := "bit_xor", pronamespace := pgCatalogNamespace.oid, prokind := .aggregate, prosecdef := false, provolatile := .volatile, prorettype := ⟨20⟩, proargtypes := [⟨20⟩] }
    , { oid := ⟨2242⟩, proname := "bit_and", pronamespace := pgCatalogNamespace.oid, prokind := .aggregate, prosecdef := false, provolatile := .volatile, prorettype := ⟨1560⟩, proargtypes := [⟨1560⟩] }
    , { oid := ⟨2243⟩, proname := "bit_or", pronamespace := pgCatalogNamespace.oid, prokind := .aggregate, prosecdef := false, provolatile := .volatile, prorettype := ⟨1560⟩, proargtypes := [⟨1560⟩] }
    , { oid := ⟨6167⟩, proname := "bit_xor", pronamespace := pgCatalogNamespace.oid, prokind := .aggregate, prosecdef := false, provolatile := .volatile, prorettype := ⟨1560⟩, proargtypes := [⟨1560⟩] }
    , { oid := ⟨2546⟩, proname := "interval_pl_date", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨1114⟩, proargtypes := [⟨1186⟩, ⟨1082⟩] }
    , { oid := ⟨2547⟩, proname := "interval_pl_timetz", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨1266⟩, proargtypes := [⟨1186⟩, ⟨1266⟩] }
    , { oid := ⟨2548⟩, proname := "interval_pl_timestamp", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨1114⟩, proargtypes := [⟨1186⟩, ⟨1114⟩] }
    , { oid := ⟨2549⟩, proname := "interval_pl_timestamptz", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨1184⟩, proargtypes := [⟨1186⟩, ⟨1184⟩] }
    , { oid := ⟨2550⟩, proname := "integer_pl_date", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨1082⟩, proargtypes := [⟨23⟩, ⟨1082⟩] }
    , { oid := ⟨2556⟩, proname := "pg_tablespace_databases", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨26⟩, proargtypes := [⟨26⟩] }
    , { oid := ⟨2557⟩, proname := "bool", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨23⟩] }
    , { oid := ⟨2558⟩, proname := "int4", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨23⟩, proargtypes := [⟨16⟩] }
    , { oid := ⟨2559⟩, proname := "lastval", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨20⟩, proargtypes := [] }
    , { oid := ⟨2560⟩, proname := "pg_postmaster_start_time", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨1184⟩, proargtypes := [] }
    , { oid := ⟨2034⟩, proname := "pg_conf_load_time", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨1184⟩, proargtypes := [] }
    , { oid := ⟨2562⟩, proname := "box_below", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨603⟩, ⟨603⟩] }
    , { oid := ⟨2563⟩, proname := "box_overbelow", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨603⟩, ⟨603⟩] }
    , { oid := ⟨2564⟩, proname := "box_overabove", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨603⟩, ⟨603⟩] }
    , { oid := ⟨2565⟩, proname := "box_above", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨603⟩, ⟨603⟩] }
    , { oid := ⟨2566⟩, proname := "poly_below", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨604⟩, ⟨604⟩] }
    , { oid := ⟨2567⟩, proname := "poly_overbelow", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨604⟩, ⟨604⟩] }
    , { oid := ⟨2568⟩, proname := "poly_overabove", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨604⟩, ⟨604⟩] }
    , { oid := ⟨2569⟩, proname := "poly_above", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨604⟩, ⟨604⟩] }
    , { oid := ⟨2587⟩, proname := "circle_overbelow", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨718⟩, ⟨718⟩] }
    , { oid := ⟨2588⟩, proname := "circle_overabove", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨718⟩, ⟨718⟩] }
    , { oid := ⟨2578⟩, proname := "gist_box_consistent", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨2281⟩, ⟨603⟩, ⟨21⟩, ⟨26⟩, ⟨2281⟩] }
    , { oid := ⟨2581⟩, proname := "gist_box_penalty", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨2281⟩, proargtypes := [⟨2281⟩, ⟨2281⟩, ⟨2281⟩] }
    , { oid := ⟨2582⟩, proname := "gist_box_picksplit", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨2281⟩, proargtypes := [⟨2281⟩, ⟨2281⟩] }
    , { oid := ⟨2583⟩, proname := "gist_box_union", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨603⟩, proargtypes := [⟨2281⟩, ⟨2281⟩] }
    , { oid := ⟨2584⟩, proname := "gist_box_same", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨2281⟩, proargtypes := [⟨603⟩, ⟨603⟩, ⟨2281⟩] }
    , { oid := ⟨3998⟩, proname := "gist_box_distance", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨701⟩, proargtypes := [⟨2281⟩, ⟨603⟩, ⟨21⟩, ⟨26⟩, ⟨2281⟩] }
    , { oid := ⟨2585⟩, proname := "gist_poly_consistent", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨2281⟩, ⟨604⟩, ⟨21⟩, ⟨26⟩, ⟨2281⟩] }
    , { oid := ⟨2586⟩, proname := "gist_poly_compress", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨2281⟩, proargtypes := [⟨2281⟩] }
    , { oid := ⟨2591⟩, proname := "gist_circle_consistent", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨2281⟩, ⟨718⟩, ⟨21⟩, ⟨26⟩, ⟨2281⟩] }
    , { oid := ⟨2592⟩, proname := "gist_circle_compress", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨2281⟩, proargtypes := [⟨2281⟩] }
    , { oid := ⟨1030⟩, proname := "gist_point_compress", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨2281⟩, proargtypes := [⟨2281⟩] }
    , { oid := ⟨3282⟩, proname := "gist_point_fetch", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨2281⟩, proargtypes := [⟨2281⟩] }
    , { oid := ⟨2179⟩, proname := "gist_point_consistent", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨2281⟩, ⟨600⟩, ⟨21⟩, ⟨26⟩, ⟨2281⟩] }
    , { oid := ⟨3064⟩, proname := "gist_point_distance", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨701⟩, proargtypes := [⟨2281⟩, ⟨600⟩, ⟨21⟩, ⟨26⟩, ⟨2281⟩] }
    , { oid := ⟨3280⟩, proname := "gist_circle_distance", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨701⟩, proargtypes := [⟨2281⟩, ⟨718⟩, ⟨21⟩, ⟨26⟩, ⟨2281⟩] }
    , { oid := ⟨3288⟩, proname := "gist_poly_distance", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨701⟩, proargtypes := [⟨2281⟩, ⟨604⟩, ⟨21⟩, ⟨26⟩, ⟨2281⟩] }
    , { oid := ⟨3435⟩, proname := "gist_point_sortsupport", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨2278⟩, proargtypes := [⟨2281⟩] }
    , { oid := ⟨2743⟩, proname := "ginarrayextract", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨2281⟩, proargtypes := [⟨2277⟩, ⟨2281⟩, ⟨2281⟩] }
    , { oid := ⟨2774⟩, proname := "ginqueryarrayextract", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨2281⟩, proargtypes := [⟨2277⟩, ⟨2281⟩, ⟨21⟩, ⟨2281⟩, ⟨2281⟩, ⟨2281⟩, ⟨2281⟩] }
    , { oid := ⟨2744⟩, proname := "ginarrayconsistent", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨2281⟩, ⟨21⟩, ⟨2277⟩, ⟨23⟩, ⟨2281⟩, ⟨2281⟩, ⟨2281⟩, ⟨2281⟩] }
    , { oid := ⟨3920⟩, proname := "ginarraytriconsistent", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨18⟩, proargtypes := [⟨2281⟩, ⟨21⟩, ⟨2277⟩, ⟨23⟩, ⟨2281⟩, ⟨2281⟩, ⟨2281⟩] }
    , { oid := ⟨3076⟩, proname := "ginarrayextract", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨2281⟩, proargtypes := [⟨2277⟩, ⟨2281⟩] }
    , { oid := ⟨2747⟩, proname := "arrayoverlap", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨2277⟩, ⟨2277⟩] }
    , { oid := ⟨2748⟩, proname := "arraycontains", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨2277⟩, ⟨2277⟩] }
    , { oid := ⟨2749⟩, proname := "arraycontained", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨2277⟩, ⟨2277⟩] }
    , { oid := ⟨3383⟩, proname := "brin_minmax_opcinfo", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨2281⟩, proargtypes := [⟨2281⟩] }
    , { oid := ⟨3384⟩, proname := "brin_minmax_add_value", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨2281⟩, ⟨2281⟩, ⟨2281⟩, ⟨2281⟩] }
    , { oid := ⟨3385⟩, proname := "brin_minmax_consistent", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨2281⟩, ⟨2281⟩, ⟨2281⟩] }
    , { oid := ⟨3386⟩, proname := "brin_minmax_union", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨2281⟩, ⟨2281⟩, ⟨2281⟩] }
    , { oid := ⟨4616⟩, proname := "brin_minmax_multi_opcinfo", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨2281⟩, proargtypes := [⟨2281⟩] }
    , { oid := ⟨4617⟩, proname := "brin_minmax_multi_add_value", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨2281⟩, ⟨2281⟩, ⟨2281⟩, ⟨2281⟩] }
    , { oid := ⟨4618⟩, proname := "brin_minmax_multi_consistent", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨2281⟩, ⟨2281⟩, ⟨2281⟩, ⟨23⟩] }
    , { oid := ⟨4619⟩, proname := "brin_minmax_multi_union", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨2281⟩, ⟨2281⟩, ⟨2281⟩] }
    , { oid := ⟨4620⟩, proname := "brin_minmax_multi_options", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨2278⟩, proargtypes := [⟨2281⟩] }
    , { oid := ⟨4621⟩, proname := "brin_minmax_multi_distance_int2", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨701⟩, proargtypes := [⟨2281⟩, ⟨2281⟩] }
    , { oid := ⟨4622⟩, proname := "brin_minmax_multi_distance_int4", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨701⟩, proargtypes := [⟨2281⟩, ⟨2281⟩] }
    , { oid := ⟨4623⟩, proname := "brin_minmax_multi_distance_int8", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨701⟩, proargtypes := [⟨2281⟩, ⟨2281⟩] }
    , { oid := ⟨4624⟩, proname := "brin_minmax_multi_distance_float4", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨701⟩, proargtypes := [⟨2281⟩, ⟨2281⟩] }
    , { oid := ⟨4625⟩, proname := "brin_minmax_multi_distance_float8", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨701⟩, proargtypes := [⟨2281⟩, ⟨2281⟩] }
    , { oid := ⟨4626⟩, proname := "brin_minmax_multi_distance_numeric", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨701⟩, proargtypes := [⟨2281⟩, ⟨2281⟩] }
    , { oid := ⟨4627⟩, proname := "brin_minmax_multi_distance_tid", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨701⟩, proargtypes := [⟨2281⟩, ⟨2281⟩] }
    , { oid := ⟨4628⟩, proname := "brin_minmax_multi_distance_uuid", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨701⟩, proargtypes := [⟨2281⟩, ⟨2281⟩] }
    , { oid := ⟨4629⟩, proname := "brin_minmax_multi_distance_date", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨701⟩, proargtypes := [⟨2281⟩, ⟨2281⟩] }
    , { oid := ⟨4630⟩, proname := "brin_minmax_multi_distance_time", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨701⟩, proargtypes := [⟨2281⟩, ⟨2281⟩] }
    , { oid := ⟨4631⟩, proname := "brin_minmax_multi_distance_interval", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨701⟩, proargtypes := [⟨2281⟩, ⟨2281⟩] }
    , { oid := ⟨4632⟩, proname := "brin_minmax_multi_distance_timetz", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨701⟩, proargtypes := [⟨2281⟩, ⟨2281⟩] }
    , { oid := ⟨4633⟩, proname := "brin_minmax_multi_distance_pg_lsn", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨701⟩, proargtypes := [⟨2281⟩, ⟨2281⟩] }
    , { oid := ⟨4634⟩, proname := "brin_minmax_multi_distance_macaddr", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨701⟩, proargtypes := [⟨2281⟩, ⟨2281⟩] }
    , { oid := ⟨4635⟩, proname := "brin_minmax_multi_distance_macaddr8", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨701⟩, proargtypes := [⟨2281⟩, ⟨2281⟩] }
    , { oid := ⟨4636⟩, proname := "brin_minmax_multi_distance_inet", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨701⟩, proargtypes := [⟨2281⟩, ⟨2281⟩] }
    , { oid := ⟨4637⟩, proname := "brin_minmax_multi_distance_timestamp", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨701⟩, proargtypes := [⟨2281⟩, ⟨2281⟩] }
    , { oid := ⟨4105⟩, proname := "brin_inclusion_opcinfo", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨2281⟩, proargtypes := [⟨2281⟩] }
    , { oid := ⟨4106⟩, proname := "brin_inclusion_add_value", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨2281⟩, ⟨2281⟩, ⟨2281⟩, ⟨2281⟩] }
    , { oid := ⟨4107⟩, proname := "brin_inclusion_consistent", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨2281⟩, ⟨2281⟩, ⟨2281⟩] }
    , { oid := ⟨4108⟩, proname := "brin_inclusion_union", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨2281⟩, ⟨2281⟩, ⟨2281⟩] }
    , { oid := ⟨4591⟩, proname := "brin_bloom_opcinfo", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨2281⟩, proargtypes := [⟨2281⟩] }
    , { oid := ⟨4592⟩, proname := "brin_bloom_add_value", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨2281⟩, ⟨2281⟩, ⟨2281⟩, ⟨2281⟩] }
    , { oid := ⟨4593⟩, proname := "brin_bloom_consistent", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨2281⟩, ⟨2281⟩, ⟨2281⟩, ⟨23⟩] }
    , { oid := ⟨4594⟩, proname := "brin_bloom_union", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨2281⟩, ⟨2281⟩, ⟨2281⟩] }
    , { oid := ⟨4595⟩, proname := "brin_bloom_options", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨2278⟩, proargtypes := [⟨2281⟩] }
    , { oid := ⟨2880⟩, proname := "pg_advisory_lock", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨2278⟩, proargtypes := [⟨20⟩] }
    , { oid := ⟨3089⟩, proname := "pg_advisory_xact_lock", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨2278⟩, proargtypes := [⟨20⟩] }
    , { oid := ⟨2881⟩, proname := "pg_advisory_lock_shared", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨2278⟩, proargtypes := [⟨20⟩] }
    , { oid := ⟨3090⟩, proname := "pg_advisory_xact_lock_shared", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨2278⟩, proargtypes := [⟨20⟩] }
    , { oid := ⟨2882⟩, proname := "pg_try_advisory_lock", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨20⟩] }
    , { oid := ⟨3091⟩, proname := "pg_try_advisory_xact_lock", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨20⟩] }
    , { oid := ⟨2883⟩, proname := "pg_try_advisory_lock_shared", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨20⟩] }
    , { oid := ⟨3092⟩, proname := "pg_try_advisory_xact_lock_shared", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨20⟩] }
    , { oid := ⟨2884⟩, proname := "pg_advisory_unlock", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨20⟩] }
    , { oid := ⟨2885⟩, proname := "pg_advisory_unlock_shared", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨20⟩] }
    , { oid := ⟨2886⟩, proname := "pg_advisory_lock", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨2278⟩, proargtypes := [⟨23⟩, ⟨23⟩] }
    , { oid := ⟨3093⟩, proname := "pg_advisory_xact_lock", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨2278⟩, proargtypes := [⟨23⟩, ⟨23⟩] }
    , { oid := ⟨2887⟩, proname := "pg_advisory_lock_shared", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨2278⟩, proargtypes := [⟨23⟩, ⟨23⟩] }
    , { oid := ⟨3094⟩, proname := "pg_advisory_xact_lock_shared", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨2278⟩, proargtypes := [⟨23⟩, ⟨23⟩] }
    , { oid := ⟨2888⟩, proname := "pg_try_advisory_lock", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨23⟩, ⟨23⟩] }
    , { oid := ⟨3095⟩, proname := "pg_try_advisory_xact_lock", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨23⟩, ⟨23⟩] }
    , { oid := ⟨2889⟩, proname := "pg_try_advisory_lock_shared", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨23⟩, ⟨23⟩] }
    , { oid := ⟨3096⟩, proname := "pg_try_advisory_xact_lock_shared", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨23⟩, ⟨23⟩] }
    , { oid := ⟨2890⟩, proname := "pg_advisory_unlock", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨23⟩, ⟨23⟩] }
    , { oid := ⟨2891⟩, proname := "pg_advisory_unlock_shared", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨23⟩, ⟨23⟩] }
    , { oid := ⟨2892⟩, proname := "pg_advisory_unlock_all", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨2278⟩, proargtypes := [] }
    , { oid := ⟨2893⟩, proname := "xml_in", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨142⟩, proargtypes := [⟨2275⟩] }
    , { oid := ⟨2894⟩, proname := "xml_out", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨2275⟩, proargtypes := [⟨142⟩] }
    , { oid := ⟨2895⟩, proname := "xmlcomment", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨142⟩, proargtypes := [⟨25⟩] }
    , { oid := ⟨2896⟩, proname := "xml", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨142⟩, proargtypes := [⟨25⟩] }
    , { oid := ⟨2897⟩, proname := "xmlvalidate", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨142⟩, ⟨25⟩] }
    , { oid := ⟨2898⟩, proname := "xml_recv", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨142⟩, proargtypes := [⟨2281⟩] }
    , { oid := ⟨2899⟩, proname := "xml_send", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨17⟩, proargtypes := [⟨142⟩] }
    , { oid := ⟨2900⟩, proname := "xmlconcat2", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨142⟩, proargtypes := [⟨142⟩, ⟨142⟩] }
    , { oid := ⟨2901⟩, proname := "xmlagg", pronamespace := pgCatalogNamespace.oid, prokind := .aggregate, prosecdef := false, provolatile := .volatile, prorettype := ⟨142⟩, proargtypes := [⟨142⟩] }
    , { oid := ⟨2922⟩, proname := "text", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨25⟩, proargtypes := [⟨142⟩] }
    , { oid := ⟨3813⟩, proname := "xmltext", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨142⟩, proargtypes := [⟨25⟩] }
    , { oid := ⟨2923⟩, proname := "table_to_xml", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨142⟩, proargtypes := [⟨2205⟩, ⟨16⟩, ⟨16⟩, ⟨25⟩] }
    , { oid := ⟨2924⟩, proname := "query_to_xml", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨142⟩, proargtypes := [⟨25⟩, ⟨16⟩, ⟨16⟩, ⟨25⟩] }
    , { oid := ⟨2925⟩, proname := "cursor_to_xml", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨142⟩, proargtypes := [⟨1790⟩, ⟨23⟩, ⟨16⟩, ⟨16⟩, ⟨25⟩] }
    , { oid := ⟨2926⟩, proname := "table_to_xmlschema", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨142⟩, proargtypes := [⟨2205⟩, ⟨16⟩, ⟨16⟩, ⟨25⟩] }
    , { oid := ⟨2927⟩, proname := "query_to_xmlschema", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨142⟩, proargtypes := [⟨25⟩, ⟨16⟩, ⟨16⟩, ⟨25⟩] }
    , { oid := ⟨2928⟩, proname := "cursor_to_xmlschema", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨142⟩, proargtypes := [⟨1790⟩, ⟨16⟩, ⟨16⟩, ⟨25⟩] }
    , { oid := ⟨2929⟩, proname := "table_to_xml_and_xmlschema", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨142⟩, proargtypes := [⟨2205⟩, ⟨16⟩, ⟨16⟩, ⟨25⟩] }
    , { oid := ⟨2930⟩, proname := "query_to_xml_and_xmlschema", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨142⟩, proargtypes := [⟨25⟩, ⟨16⟩, ⟨16⟩, ⟨25⟩] }
    , { oid := ⟨2933⟩, proname := "schema_to_xml", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨142⟩, proargtypes := [⟨19⟩, ⟨16⟩, ⟨16⟩, ⟨25⟩] }
    , { oid := ⟨2934⟩, proname := "schema_to_xmlschema", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨142⟩, proargtypes := [⟨19⟩, ⟨16⟩, ⟨16⟩, ⟨25⟩] }
    , { oid := ⟨2935⟩, proname := "schema_to_xml_and_xmlschema", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨142⟩, proargtypes := [⟨19⟩, ⟨16⟩, ⟨16⟩, ⟨25⟩] }
    , { oid := ⟨2936⟩, proname := "database_to_xml", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨142⟩, proargtypes := [⟨16⟩, ⟨16⟩, ⟨25⟩] }
    , { oid := ⟨2937⟩, proname := "database_to_xmlschema", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨142⟩, proargtypes := [⟨16⟩, ⟨16⟩, ⟨25⟩] }
    , { oid := ⟨2938⟩, proname := "database_to_xml_and_xmlschema", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨142⟩, proargtypes := [⟨16⟩, ⟨16⟩, ⟨25⟩] }
    , { oid := ⟨2931⟩, proname := "xpath", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨143⟩, proargtypes := [⟨25⟩, ⟨142⟩, ⟨1009⟩] }
    , { oid := ⟨2932⟩, proname := "xpath", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨143⟩, proargtypes := [⟨25⟩, ⟨142⟩] }
    , { oid := ⟨2614⟩, proname := "xmlexists", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨25⟩, ⟨142⟩] }
    , { oid := ⟨3049⟩, proname := "xpath_exists", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨25⟩, ⟨142⟩, ⟨1009⟩] }
    , { oid := ⟨3050⟩, proname := "xpath_exists", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨25⟩, ⟨142⟩] }
    , { oid := ⟨3051⟩, proname := "xml_is_well_formed", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨16⟩, proargtypes := [⟨25⟩] }
    , { oid := ⟨3052⟩, proname := "xml_is_well_formed_document", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨25⟩] }
    , { oid := ⟨3053⟩, proname := "xml_is_well_formed_content", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨25⟩] }
    , { oid := ⟨321⟩, proname := "json_in", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨114⟩, proargtypes := [⟨2275⟩] }
    , { oid := ⟨322⟩, proname := "json_out", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨2275⟩, proargtypes := [⟨114⟩] }
    , { oid := ⟨323⟩, proname := "json_recv", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨114⟩, proargtypes := [⟨2281⟩] }
    , { oid := ⟨324⟩, proname := "json_send", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨17⟩, proargtypes := [⟨114⟩] }
    , { oid := ⟨3153⟩, proname := "array_to_json", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨114⟩, proargtypes := [⟨2277⟩] }
    , { oid := ⟨3154⟩, proname := "array_to_json", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨114⟩, proargtypes := [⟨2277⟩, ⟨16⟩] }
    , { oid := ⟨3155⟩, proname := "row_to_json", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨114⟩, proargtypes := [⟨2249⟩] }
    , { oid := ⟨3156⟩, proname := "row_to_json", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨114⟩, proargtypes := [⟨2249⟩, ⟨16⟩] }
    , { oid := ⟨3173⟩, proname := "json_agg_transfn", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨2281⟩, proargtypes := [⟨2281⟩, ⟨2283⟩] }
    , { oid := ⟨6275⟩, proname := "json_agg_strict_transfn", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨2281⟩, proargtypes := [⟨2281⟩, ⟨2283⟩] }
    , { oid := ⟨3174⟩, proname := "json_agg_finalfn", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨114⟩, proargtypes := [⟨2281⟩] }
    , { oid := ⟨3175⟩, proname := "json_agg", pronamespace := pgCatalogNamespace.oid, prokind := .aggregate, prosecdef := false, provolatile := .stable, prorettype := ⟨114⟩, proargtypes := [⟨2283⟩] }
    , { oid := ⟨6276⟩, proname := "json_agg_strict", pronamespace := pgCatalogNamespace.oid, prokind := .aggregate, prosecdef := false, provolatile := .stable, prorettype := ⟨114⟩, proargtypes := [⟨2283⟩] }
    , { oid := ⟨3180⟩, proname := "json_object_agg_transfn", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨2281⟩, proargtypes := [⟨2281⟩, ⟨2276⟩, ⟨2276⟩] }
    , { oid := ⟨6277⟩, proname := "json_object_agg_strict_transfn", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨2281⟩, proargtypes := [⟨2281⟩, ⟨2276⟩, ⟨2276⟩] }
    , { oid := ⟨6278⟩, proname := "json_object_agg_unique_transfn", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨2281⟩, proargtypes := [⟨2281⟩, ⟨2276⟩, ⟨2276⟩] }
    , { oid := ⟨6279⟩, proname := "json_object_agg_unique_strict_transfn", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨2281⟩, proargtypes := [⟨2281⟩, ⟨2276⟩, ⟨2276⟩] }
    , { oid := ⟨3196⟩, proname := "json_object_agg_finalfn", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨114⟩, proargtypes := [⟨2281⟩] }
    , { oid := ⟨3197⟩, proname := "json_object_agg", pronamespace := pgCatalogNamespace.oid, prokind := .aggregate, prosecdef := false, provolatile := .stable, prorettype := ⟨114⟩, proargtypes := [⟨2276⟩, ⟨2276⟩] }
    , { oid := ⟨6280⟩, proname := "json_object_agg_strict", pronamespace := pgCatalogNamespace.oid, prokind := .aggregate, prosecdef := false, provolatile := .stable, prorettype := ⟨114⟩, proargtypes := [⟨2276⟩, ⟨2276⟩] }
    , { oid := ⟨6281⟩, proname := "json_object_agg_unique", pronamespace := pgCatalogNamespace.oid, prokind := .aggregate, prosecdef := false, provolatile := .stable, prorettype := ⟨114⟩, proargtypes := [⟨2276⟩, ⟨2276⟩] }
    , { oid := ⟨6282⟩, proname := "json_object_agg_unique_strict", pronamespace := pgCatalogNamespace.oid, prokind := .aggregate, prosecdef := false, provolatile := .stable, prorettype := ⟨114⟩, proargtypes := [⟨2276⟩, ⟨2276⟩] }
    , { oid := ⟨3198⟩, proname := "json_build_array", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨114⟩, proargtypes := [⟨2276⟩] }
    , { oid := ⟨3199⟩, proname := "json_build_array", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨114⟩, proargtypes := [] }
    , { oid := ⟨3200⟩, proname := "json_build_object", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨114⟩, proargtypes := [⟨2276⟩] }
    , { oid := ⟨3201⟩, proname := "json_build_object", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨114⟩, proargtypes := [] }
    , { oid := ⟨3202⟩, proname := "json_object", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨114⟩, proargtypes := [⟨1009⟩] }
    , { oid := ⟨3203⟩, proname := "json_object", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨114⟩, proargtypes := [⟨1009⟩, ⟨1009⟩] }
    , { oid := ⟨3176⟩, proname := "to_json", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨114⟩, proargtypes := [⟨2283⟩] }
    , { oid := ⟨3261⟩, proname := "json_strip_nulls", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨114⟩, proargtypes := [⟨114⟩] }
    , { oid := ⟨3947⟩, proname := "json_object_field", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨114⟩, proargtypes := [⟨114⟩, ⟨25⟩] }
    , { oid := ⟨3948⟩, proname := "json_object_field_text", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨25⟩, proargtypes := [⟨114⟩, ⟨25⟩] }
    , { oid := ⟨3949⟩, proname := "json_array_element", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨114⟩, proargtypes := [⟨114⟩, ⟨23⟩] }
    , { oid := ⟨3950⟩, proname := "json_array_element_text", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨25⟩, proargtypes := [⟨114⟩, ⟨23⟩] }
    , { oid := ⟨3951⟩, proname := "json_extract_path", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨114⟩, proargtypes := [⟨114⟩, ⟨1009⟩] }
    , { oid := ⟨3953⟩, proname := "json_extract_path_text", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨25⟩, proargtypes := [⟨114⟩, ⟨1009⟩] }
    , { oid := ⟨3955⟩, proname := "json_array_elements", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨114⟩, proargtypes := [⟨114⟩] }
    , { oid := ⟨3969⟩, proname := "json_array_elements_text", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨25⟩, proargtypes := [⟨114⟩] }
    , { oid := ⟨3956⟩, proname := "json_array_length", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨23⟩, proargtypes := [⟨114⟩] }
    , { oid := ⟨3957⟩, proname := "json_object_keys", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨25⟩, proargtypes := [⟨114⟩] }
    , { oid := ⟨3958⟩, proname := "json_each", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨2249⟩, proargtypes := [⟨114⟩] }
    , { oid := ⟨3959⟩, proname := "json_each_text", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨2249⟩, proargtypes := [⟨114⟩] }
    , { oid := ⟨3960⟩, proname := "json_populate_record", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨2283⟩, proargtypes := [⟨2283⟩, ⟨114⟩, ⟨16⟩] }
    , { oid := ⟨3961⟩, proname := "json_populate_recordset", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨2283⟩, proargtypes := [⟨2283⟩, ⟨114⟩, ⟨16⟩] }
    , { oid := ⟨3204⟩, proname := "json_to_record", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨2249⟩, proargtypes := [⟨114⟩] }
    , { oid := ⟨3205⟩, proname := "json_to_recordset", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨2249⟩, proargtypes := [⟨114⟩] }
    , { oid := ⟨3968⟩, proname := "json_typeof", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨25⟩, proargtypes := [⟨114⟩] }
    , { oid := ⟨2952⟩, proname := "uuid_in", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨2950⟩, proargtypes := [⟨2275⟩] }
    , { oid := ⟨2953⟩, proname := "uuid_out", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨2275⟩, proargtypes := [⟨2950⟩] }
    , { oid := ⟨2954⟩, proname := "uuid_lt", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨2950⟩, ⟨2950⟩] }
    , { oid := ⟨2955⟩, proname := "uuid_le", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨2950⟩, ⟨2950⟩] }
    , { oid := ⟨2956⟩, proname := "uuid_eq", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨2950⟩, ⟨2950⟩] }
    , { oid := ⟨2957⟩, proname := "uuid_ge", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨2950⟩, ⟨2950⟩] }
    , { oid := ⟨2958⟩, proname := "uuid_gt", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨2950⟩, ⟨2950⟩] }
    , { oid := ⟨2959⟩, proname := "uuid_ne", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨2950⟩, ⟨2950⟩] }
    , { oid := ⟨2960⟩, proname := "uuid_cmp", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨23⟩, proargtypes := [⟨2950⟩, ⟨2950⟩] }
    , { oid := ⟨3300⟩, proname := "uuid_sortsupport", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨2278⟩, proargtypes := [⟨2281⟩] }
    , { oid := ⟨2961⟩, proname := "uuid_recv", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨2950⟩, proargtypes := [⟨2281⟩] }
    , { oid := ⟨2962⟩, proname := "uuid_send", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨17⟩, proargtypes := [⟨2950⟩] }
    , { oid := ⟨2963⟩, proname := "uuid_hash", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨23⟩, proargtypes := [⟨2950⟩] }
    , { oid := ⟨3412⟩, proname := "uuid_hash_extended", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨20⟩, proargtypes := [⟨2950⟩, ⟨20⟩] }
    , { oid := ⟨3432⟩, proname := "gen_random_uuid", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨2950⟩, proargtypes := [] }
    , { oid := ⟨6342⟩, proname := "uuid_extract_timestamp", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨1184⟩, proargtypes := [⟨2950⟩] }
    , { oid := ⟨6343⟩, proname := "uuid_extract_version", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨21⟩, proargtypes := [⟨2950⟩] }
    , { oid := ⟨3229⟩, proname := "pg_lsn_in", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨3220⟩, proargtypes := [⟨2275⟩] }
    , { oid := ⟨3230⟩, proname := "pg_lsn_out", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨2275⟩, proargtypes := [⟨3220⟩] }
    , { oid := ⟨3231⟩, proname := "pg_lsn_lt", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨3220⟩, ⟨3220⟩] }
    , { oid := ⟨3232⟩, proname := "pg_lsn_le", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨3220⟩, ⟨3220⟩] }
    , { oid := ⟨3233⟩, proname := "pg_lsn_eq", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨3220⟩, ⟨3220⟩] }
    , { oid := ⟨3234⟩, proname := "pg_lsn_ge", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨3220⟩, ⟨3220⟩] }
    , { oid := ⟨3235⟩, proname := "pg_lsn_gt", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨3220⟩, ⟨3220⟩] }
    , { oid := ⟨3236⟩, proname := "pg_lsn_ne", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨3220⟩, ⟨3220⟩] }
    , { oid := ⟨3237⟩, proname := "pg_lsn_mi", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨1700⟩, proargtypes := [⟨3220⟩, ⟨3220⟩] }
    , { oid := ⟨3238⟩, proname := "pg_lsn_recv", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨3220⟩, proargtypes := [⟨2281⟩] }
    , { oid := ⟨3239⟩, proname := "pg_lsn_send", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨17⟩, proargtypes := [⟨3220⟩] }
    , { oid := ⟨3251⟩, proname := "pg_lsn_cmp", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨23⟩, proargtypes := [⟨3220⟩, ⟨3220⟩] }
    , { oid := ⟨3252⟩, proname := "pg_lsn_hash", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨23⟩, proargtypes := [⟨3220⟩] }
    , { oid := ⟨3413⟩, proname := "pg_lsn_hash_extended", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨20⟩, proargtypes := [⟨3220⟩, ⟨20⟩] }
    , { oid := ⟨4187⟩, proname := "pg_lsn_larger", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨3220⟩, proargtypes := [⟨3220⟩, ⟨3220⟩] }
    , { oid := ⟨4188⟩, proname := "pg_lsn_smaller", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨3220⟩, proargtypes := [⟨3220⟩, ⟨3220⟩] }
    , { oid := ⟨5022⟩, proname := "pg_lsn_pli", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨3220⟩, proargtypes := [⟨3220⟩, ⟨1700⟩] }
    , { oid := ⟨5023⟩, proname := "numeric_pl_pg_lsn", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨3220⟩, proargtypes := [⟨1700⟩, ⟨3220⟩] }
    , { oid := ⟨5024⟩, proname := "pg_lsn_mii", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨3220⟩, proargtypes := [⟨3220⟩, ⟨1700⟩] }
    , { oid := ⟨3504⟩, proname := "anyenum_in", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨3500⟩, proargtypes := [⟨2275⟩] }
    , { oid := ⟨3505⟩, proname := "anyenum_out", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨2275⟩, proargtypes := [⟨3500⟩] }
    , { oid := ⟨3506⟩, proname := "enum_in", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨3500⟩, proargtypes := [⟨2275⟩, ⟨26⟩] }
    , { oid := ⟨3507⟩, proname := "enum_out", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨2275⟩, proargtypes := [⟨3500⟩] }
    , { oid := ⟨3508⟩, proname := "enum_eq", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨3500⟩, ⟨3500⟩] }
    , { oid := ⟨3509⟩, proname := "enum_ne", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨3500⟩, ⟨3500⟩] }
    , { oid := ⟨3510⟩, proname := "enum_lt", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨3500⟩, ⟨3500⟩] }
    , { oid := ⟨3511⟩, proname := "enum_gt", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨3500⟩, ⟨3500⟩] }
    , { oid := ⟨3512⟩, proname := "enum_le", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨3500⟩, ⟨3500⟩] }
    , { oid := ⟨3513⟩, proname := "enum_ge", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨3500⟩, ⟨3500⟩] }
    , { oid := ⟨3514⟩, proname := "enum_cmp", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨23⟩, proargtypes := [⟨3500⟩, ⟨3500⟩] }
    , { oid := ⟨3515⟩, proname := "hashenum", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨23⟩, proargtypes := [⟨3500⟩] }
    , { oid := ⟨3414⟩, proname := "hashenumextended", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨20⟩, proargtypes := [⟨3500⟩, ⟨20⟩] }
    , { oid := ⟨3524⟩, proname := "enum_smaller", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨3500⟩, proargtypes := [⟨3500⟩, ⟨3500⟩] }
    , { oid := ⟨3525⟩, proname := "enum_larger", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨3500⟩, proargtypes := [⟨3500⟩, ⟨3500⟩] }
    , { oid := ⟨3526⟩, proname := "max", pronamespace := pgCatalogNamespace.oid, prokind := .aggregate, prosecdef := false, provolatile := .volatile, prorettype := ⟨3500⟩, proargtypes := [⟨3500⟩] }
    , { oid := ⟨3527⟩, proname := "min", pronamespace := pgCatalogNamespace.oid, prokind := .aggregate, prosecdef := false, provolatile := .volatile, prorettype := ⟨3500⟩, proargtypes := [⟨3500⟩] }
    , { oid := ⟨3528⟩, proname := "enum_first", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨3500⟩, proargtypes := [⟨3500⟩] }
    , { oid := ⟨3529⟩, proname := "enum_last", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨3500⟩, proargtypes := [⟨3500⟩] }
    , { oid := ⟨3530⟩, proname := "enum_range", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨2277⟩, proargtypes := [⟨3500⟩, ⟨3500⟩] }
    , { oid := ⟨3531⟩, proname := "enum_range", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨2277⟩, proargtypes := [⟨3500⟩] }
    , { oid := ⟨3532⟩, proname := "enum_recv", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨3500⟩, proargtypes := [⟨2281⟩, ⟨26⟩] }
    , { oid := ⟨3533⟩, proname := "enum_send", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨17⟩, proargtypes := [⟨3500⟩] }
    , { oid := ⟨3610⟩, proname := "tsvectorin", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨3614⟩, proargtypes := [⟨2275⟩] }
    , { oid := ⟨3639⟩, proname := "tsvectorrecv", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨3614⟩, proargtypes := [⟨2281⟩] }
    , { oid := ⟨3611⟩, proname := "tsvectorout", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨2275⟩, proargtypes := [⟨3614⟩] }
    , { oid := ⟨3638⟩, proname := "tsvectorsend", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨17⟩, proargtypes := [⟨3614⟩] }
    , { oid := ⟨3612⟩, proname := "tsqueryin", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨3615⟩, proargtypes := [⟨2275⟩] }
    , { oid := ⟨3641⟩, proname := "tsqueryrecv", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨3615⟩, proargtypes := [⟨2281⟩] }
    , { oid := ⟨3613⟩, proname := "tsqueryout", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨2275⟩, proargtypes := [⟨3615⟩] }
    , { oid := ⟨3640⟩, proname := "tsquerysend", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨17⟩, proargtypes := [⟨3615⟩] }
    , { oid := ⟨3646⟩, proname := "gtsvectorin", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨3642⟩, proargtypes := [⟨2275⟩] }
    , { oid := ⟨3647⟩, proname := "gtsvectorout", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨2275⟩, proargtypes := [⟨3642⟩] }
    , { oid := ⟨3616⟩, proname := "tsvector_lt", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨3614⟩, ⟨3614⟩] }
    , { oid := ⟨3617⟩, proname := "tsvector_le", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨3614⟩, ⟨3614⟩] }
    , { oid := ⟨3618⟩, proname := "tsvector_eq", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨3614⟩, ⟨3614⟩] }
    , { oid := ⟨3619⟩, proname := "tsvector_ne", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨3614⟩, ⟨3614⟩] }
    , { oid := ⟨3620⟩, proname := "tsvector_ge", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨3614⟩, ⟨3614⟩] }
    , { oid := ⟨3621⟩, proname := "tsvector_gt", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨3614⟩, ⟨3614⟩] }
    , { oid := ⟨3622⟩, proname := "tsvector_cmp", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨23⟩, proargtypes := [⟨3614⟩, ⟨3614⟩] }
    , { oid := ⟨3711⟩, proname := "length", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨23⟩, proargtypes := [⟨3614⟩] }
    , { oid := ⟨3623⟩, proname := "strip", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨3614⟩, proargtypes := [⟨3614⟩] }
    , { oid := ⟨3624⟩, proname := "setweight", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨3614⟩, proargtypes := [⟨3614⟩, ⟨18⟩] }
    , { oid := ⟨3320⟩, proname := "setweight", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨3614⟩, proargtypes := [⟨3614⟩, ⟨18⟩, ⟨1009⟩] }
    , { oid := ⟨3625⟩, proname := "tsvector_concat", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨3614⟩, proargtypes := [⟨3614⟩, ⟨3614⟩] }
    , { oid := ⟨3321⟩, proname := "ts_delete", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨3614⟩, proargtypes := [⟨3614⟩, ⟨25⟩] }
    , { oid := ⟨3323⟩, proname := "ts_delete", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨3614⟩, proargtypes := [⟨3614⟩, ⟨1009⟩] }
    , { oid := ⟨3322⟩, proname := "unnest", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨2249⟩, proargtypes := [⟨3614⟩] }
    , { oid := ⟨3326⟩, proname := "tsvector_to_array", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨1009⟩, proargtypes := [⟨3614⟩] }
    , { oid := ⟨3327⟩, proname := "array_to_tsvector", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨3614⟩, proargtypes := [⟨1009⟩] }
    , { oid := ⟨3319⟩, proname := "ts_filter", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨3614⟩, proargtypes := [⟨3614⟩, ⟨1002⟩] }
    , { oid := ⟨3634⟩, proname := "ts_match_vq", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨3614⟩, ⟨3615⟩] }
    , { oid := ⟨3635⟩, proname := "ts_match_qv", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨3615⟩, ⟨3614⟩] }
    , { oid := ⟨3760⟩, proname := "ts_match_tt", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨16⟩, proargtypes := [⟨25⟩, ⟨25⟩] }
    , { oid := ⟨3761⟩, proname := "ts_match_tq", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨16⟩, proargtypes := [⟨25⟩, ⟨3615⟩] }
    , { oid := ⟨3648⟩, proname := "gtsvector_compress", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨2281⟩, proargtypes := [⟨2281⟩] }
    , { oid := ⟨3649⟩, proname := "gtsvector_decompress", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨2281⟩, proargtypes := [⟨2281⟩] }
    , { oid := ⟨3650⟩, proname := "gtsvector_picksplit", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨2281⟩, proargtypes := [⟨2281⟩, ⟨2281⟩] }
    , { oid := ⟨3651⟩, proname := "gtsvector_union", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨3642⟩, proargtypes := [⟨2281⟩, ⟨2281⟩] }
    , { oid := ⟨3652⟩, proname := "gtsvector_same", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨2281⟩, proargtypes := [⟨3642⟩, ⟨3642⟩, ⟨2281⟩] }
    , { oid := ⟨3653⟩, proname := "gtsvector_penalty", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨2281⟩, proargtypes := [⟨2281⟩, ⟨2281⟩, ⟨2281⟩] }
    , { oid := ⟨3654⟩, proname := "gtsvector_consistent", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨2281⟩, ⟨3614⟩, ⟨21⟩, ⟨26⟩, ⟨2281⟩] }
    , { oid := ⟨3790⟩, proname := "gtsvector_consistent", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨2281⟩, ⟨3642⟩, ⟨23⟩, ⟨26⟩, ⟨2281⟩] }
    , { oid := ⟨3434⟩, proname := "gtsvector_options", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨2278⟩, proargtypes := [⟨2281⟩] }
    , { oid := ⟨3656⟩, proname := "gin_extract_tsvector", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨2281⟩, proargtypes := [⟨3614⟩, ⟨2281⟩, ⟨2281⟩] }
    , { oid := ⟨3657⟩, proname := "gin_extract_tsquery", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨2281⟩, proargtypes := [⟨3614⟩, ⟨2281⟩, ⟨21⟩, ⟨2281⟩, ⟨2281⟩, ⟨2281⟩, ⟨2281⟩] }
    , { oid := ⟨3658⟩, proname := "gin_tsquery_consistent", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨2281⟩, ⟨21⟩, ⟨3614⟩, ⟨23⟩, ⟨2281⟩, ⟨2281⟩, ⟨2281⟩, ⟨2281⟩] }
    , { oid := ⟨3921⟩, proname := "gin_tsquery_triconsistent", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨18⟩, proargtypes := [⟨2281⟩, ⟨21⟩, ⟨3614⟩, ⟨23⟩, ⟨2281⟩, ⟨2281⟩, ⟨2281⟩] }
    , { oid := ⟨3724⟩, proname := "gin_cmp_tslexeme", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨23⟩, proargtypes := [⟨25⟩, ⟨25⟩] }
    , { oid := ⟨2700⟩, proname := "gin_cmp_prefix", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨23⟩, proargtypes := [⟨25⟩, ⟨25⟩, ⟨21⟩, ⟨2281⟩] }
    , { oid := ⟨3077⟩, proname := "gin_extract_tsvector", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨2281⟩, proargtypes := [⟨3614⟩, ⟨2281⟩] }
    , { oid := ⟨3087⟩, proname := "gin_extract_tsquery", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨2281⟩, proargtypes := [⟨3615⟩, ⟨2281⟩, ⟨21⟩, ⟨2281⟩, ⟨2281⟩] }
    , { oid := ⟨3088⟩, proname := "gin_tsquery_consistent", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨2281⟩, ⟨21⟩, ⟨3615⟩, ⟨23⟩, ⟨2281⟩, ⟨2281⟩] }
    , { oid := ⟨3791⟩, proname := "gin_extract_tsquery", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨2281⟩, proargtypes := [⟨3615⟩, ⟨2281⟩, ⟨21⟩, ⟨2281⟩, ⟨2281⟩, ⟨2281⟩, ⟨2281⟩] }
    , { oid := ⟨3792⟩, proname := "gin_tsquery_consistent", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨2281⟩, ⟨21⟩, ⟨3615⟩, ⟨23⟩, ⟨2281⟩, ⟨2281⟩, ⟨2281⟩, ⟨2281⟩] }
    , { oid := ⟨3789⟩, proname := "gin_clean_pending_list", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨20⟩, proargtypes := [⟨2205⟩] }
    , { oid := ⟨3662⟩, proname := "tsquery_lt", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨3615⟩, ⟨3615⟩] }
    , { oid := ⟨3663⟩, proname := "tsquery_le", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨3615⟩, ⟨3615⟩] }
    , { oid := ⟨3664⟩, proname := "tsquery_eq", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨3615⟩, ⟨3615⟩] }
    , { oid := ⟨3665⟩, proname := "tsquery_ne", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨3615⟩, ⟨3615⟩] }
    , { oid := ⟨3666⟩, proname := "tsquery_ge", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨3615⟩, ⟨3615⟩] }
    , { oid := ⟨3667⟩, proname := "tsquery_gt", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨3615⟩, ⟨3615⟩] }
    , { oid := ⟨3668⟩, proname := "tsquery_cmp", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨23⟩, proargtypes := [⟨3615⟩, ⟨3615⟩] }
    , { oid := ⟨3669⟩, proname := "tsquery_and", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨3615⟩, proargtypes := [⟨3615⟩, ⟨3615⟩] }
    , { oid := ⟨3670⟩, proname := "tsquery_or", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨3615⟩, proargtypes := [⟨3615⟩, ⟨3615⟩] }
    , { oid := ⟨5003⟩, proname := "tsquery_phrase", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨3615⟩, proargtypes := [⟨3615⟩, ⟨3615⟩] }
    , { oid := ⟨5004⟩, proname := "tsquery_phrase", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨3615⟩, proargtypes := [⟨3615⟩, ⟨3615⟩, ⟨23⟩] }
    , { oid := ⟨3671⟩, proname := "tsquery_not", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨3615⟩, proargtypes := [⟨3615⟩] }
    , { oid := ⟨3691⟩, proname := "tsq_mcontains", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨3615⟩, ⟨3615⟩] }
    , { oid := ⟨3692⟩, proname := "tsq_mcontained", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨3615⟩, ⟨3615⟩] }
    , { oid := ⟨3672⟩, proname := "numnode", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨23⟩, proargtypes := [⟨3615⟩] }
    , { oid := ⟨3673⟩, proname := "querytree", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨25⟩, proargtypes := [⟨3615⟩] }
    , { oid := ⟨3684⟩, proname := "ts_rewrite", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨3615⟩, proargtypes := [⟨3615⟩, ⟨3615⟩, ⟨3615⟩] }
    , { oid := ⟨3685⟩, proname := "ts_rewrite", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨3615⟩, proargtypes := [⟨3615⟩, ⟨25⟩] }
    , { oid := ⟨3695⟩, proname := "gtsquery_compress", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨2281⟩, proargtypes := [⟨2281⟩] }
    , { oid := ⟨3697⟩, proname := "gtsquery_picksplit", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨2281⟩, proargtypes := [⟨2281⟩, ⟨2281⟩] }
    , { oid := ⟨3698⟩, proname := "gtsquery_union", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨20⟩, proargtypes := [⟨2281⟩, ⟨2281⟩] }
    , { oid := ⟨3699⟩, proname := "gtsquery_same", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨2281⟩, proargtypes := [⟨20⟩, ⟨20⟩, ⟨2281⟩] }
    , { oid := ⟨3700⟩, proname := "gtsquery_penalty", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨2281⟩, proargtypes := [⟨2281⟩, ⟨2281⟩, ⟨2281⟩] }
    , { oid := ⟨3701⟩, proname := "gtsquery_consistent", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨2281⟩, ⟨3615⟩, ⟨21⟩, ⟨26⟩, ⟨2281⟩] }
    , { oid := ⟨3793⟩, proname := "gtsquery_consistent", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨2281⟩, ⟨2281⟩, ⟨23⟩, ⟨26⟩, ⟨2281⟩] }
    , { oid := ⟨3686⟩, proname := "tsmatchsel", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨701⟩, proargtypes := [⟨2281⟩, ⟨26⟩, ⟨2281⟩, ⟨23⟩] }
    , { oid := ⟨3687⟩, proname := "tsmatchjoinsel", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨701⟩, proargtypes := [⟨2281⟩, ⟨26⟩, ⟨2281⟩, ⟨21⟩, ⟨2281⟩] }
    , { oid := ⟨3688⟩, proname := "ts_typanalyze", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨16⟩, proargtypes := [⟨2281⟩] }
    , { oid := ⟨3689⟩, proname := "ts_stat", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨2249⟩, proargtypes := [⟨25⟩] }
    , { oid := ⟨3690⟩, proname := "ts_stat", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨2249⟩, proargtypes := [⟨25⟩, ⟨25⟩] }
    , { oid := ⟨3703⟩, proname := "ts_rank", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨700⟩, proargtypes := [⟨1021⟩, ⟨3614⟩, ⟨3615⟩, ⟨23⟩] }
    , { oid := ⟨3704⟩, proname := "ts_rank", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨700⟩, proargtypes := [⟨1021⟩, ⟨3614⟩, ⟨3615⟩] }
    , { oid := ⟨3705⟩, proname := "ts_rank", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨700⟩, proargtypes := [⟨3614⟩, ⟨3615⟩, ⟨23⟩] }
    , { oid := ⟨3706⟩, proname := "ts_rank", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨700⟩, proargtypes := [⟨3614⟩, ⟨3615⟩] }
    , { oid := ⟨3707⟩, proname := "ts_rank_cd", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨700⟩, proargtypes := [⟨1021⟩, ⟨3614⟩, ⟨3615⟩, ⟨23⟩] }
    , { oid := ⟨3708⟩, proname := "ts_rank_cd", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨700⟩, proargtypes := [⟨1021⟩, ⟨3614⟩, ⟨3615⟩] }
    , { oid := ⟨3709⟩, proname := "ts_rank_cd", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨700⟩, proargtypes := [⟨3614⟩, ⟨3615⟩, ⟨23⟩] }
    , { oid := ⟨3710⟩, proname := "ts_rank_cd", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨700⟩, proargtypes := [⟨3614⟩, ⟨3615⟩] }
    , { oid := ⟨3713⟩, proname := "ts_token_type", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨2249⟩, proargtypes := [⟨26⟩] }
    , { oid := ⟨3714⟩, proname := "ts_token_type", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨2249⟩, proargtypes := [⟨25⟩] }
    , { oid := ⟨3715⟩, proname := "ts_parse", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨2249⟩, proargtypes := [⟨26⟩, ⟨25⟩] }
    , { oid := ⟨3716⟩, proname := "ts_parse", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨2249⟩, proargtypes := [⟨25⟩, ⟨25⟩] }
    , { oid := ⟨3717⟩, proname := "prsd_start", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨2281⟩, proargtypes := [⟨2281⟩, ⟨23⟩] }
    , { oid := ⟨3718⟩, proname := "prsd_nexttoken", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨2281⟩, proargtypes := [⟨2281⟩, ⟨2281⟩, ⟨2281⟩] }
    , { oid := ⟨3719⟩, proname := "prsd_end", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨2278⟩, proargtypes := [⟨2281⟩] }
    , { oid := ⟨3720⟩, proname := "prsd_headline", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨2281⟩, proargtypes := [⟨2281⟩, ⟨2281⟩, ⟨3615⟩] }
    , { oid := ⟨3721⟩, proname := "prsd_lextype", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨2281⟩, proargtypes := [⟨2281⟩] }
    , { oid := ⟨3723⟩, proname := "ts_lexize", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨1009⟩, proargtypes := [⟨3769⟩, ⟨25⟩] }
    , { oid := ⟨6183⟩, proname := "ts_debug", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨2249⟩, proargtypes := [⟨3734⟩, ⟨25⟩] }
    , { oid := ⟨6184⟩, proname := "ts_debug", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨2249⟩, proargtypes := [⟨25⟩] }
    , { oid := ⟨3725⟩, proname := "dsimple_init", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨2281⟩, proargtypes := [⟨2281⟩] }
    , { oid := ⟨3726⟩, proname := "dsimple_lexize", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨2281⟩, proargtypes := [⟨2281⟩, ⟨2281⟩, ⟨2281⟩, ⟨2281⟩] }
    , { oid := ⟨3728⟩, proname := "dsynonym_init", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨2281⟩, proargtypes := [⟨2281⟩] }
    , { oid := ⟨3729⟩, proname := "dsynonym_lexize", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨2281⟩, proargtypes := [⟨2281⟩, ⟨2281⟩, ⟨2281⟩, ⟨2281⟩] }
    , { oid := ⟨3731⟩, proname := "dispell_init", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨2281⟩, proargtypes := [⟨2281⟩] }
    , { oid := ⟨3732⟩, proname := "dispell_lexize", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨2281⟩, proargtypes := [⟨2281⟩, ⟨2281⟩, ⟨2281⟩, ⟨2281⟩] }
    , { oid := ⟨3740⟩, proname := "thesaurus_init", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨2281⟩, proargtypes := [⟨2281⟩] }
    , { oid := ⟨3741⟩, proname := "thesaurus_lexize", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨2281⟩, proargtypes := [⟨2281⟩, ⟨2281⟩, ⟨2281⟩, ⟨2281⟩] }
    , { oid := ⟨3743⟩, proname := "ts_headline", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨25⟩, proargtypes := [⟨3734⟩, ⟨25⟩, ⟨3615⟩, ⟨25⟩] }
    , { oid := ⟨3744⟩, proname := "ts_headline", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨25⟩, proargtypes := [⟨3734⟩, ⟨25⟩, ⟨3615⟩] }
    , { oid := ⟨3754⟩, proname := "ts_headline", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨25⟩, proargtypes := [⟨25⟩, ⟨3615⟩, ⟨25⟩] }
    , { oid := ⟨3755⟩, proname := "ts_headline", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨25⟩, proargtypes := [⟨25⟩, ⟨3615⟩] }
    , { oid := ⟨4201⟩, proname := "ts_headline", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨3802⟩, proargtypes := [⟨3734⟩, ⟨3802⟩, ⟨3615⟩, ⟨25⟩] }
    , { oid := ⟨4202⟩, proname := "ts_headline", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨3802⟩, proargtypes := [⟨3734⟩, ⟨3802⟩, ⟨3615⟩] }
    , { oid := ⟨4203⟩, proname := "ts_headline", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨3802⟩, proargtypes := [⟨3802⟩, ⟨3615⟩, ⟨25⟩] }
    , { oid := ⟨4204⟩, proname := "ts_headline", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨3802⟩, proargtypes := [⟨3802⟩, ⟨3615⟩] }
    , { oid := ⟨4205⟩, proname := "ts_headline", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨114⟩, proargtypes := [⟨3734⟩, ⟨114⟩, ⟨3615⟩, ⟨25⟩] }
    , { oid := ⟨4206⟩, proname := "ts_headline", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨114⟩, proargtypes := [⟨3734⟩, ⟨114⟩, ⟨3615⟩] }
    , { oid := ⟨4207⟩, proname := "ts_headline", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨114⟩, proargtypes := [⟨114⟩, ⟨3615⟩, ⟨25⟩] }
    , { oid := ⟨4208⟩, proname := "ts_headline", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨114⟩, proargtypes := [⟨114⟩, ⟨3615⟩] }
    , { oid := ⟨3745⟩, proname := "to_tsvector", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨3614⟩, proargtypes := [⟨3734⟩, ⟨25⟩] }
    , { oid := ⟨3746⟩, proname := "to_tsquery", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨3615⟩, proargtypes := [⟨3734⟩, ⟨25⟩] }
    , { oid := ⟨3747⟩, proname := "plainto_tsquery", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨3615⟩, proargtypes := [⟨3734⟩, ⟨25⟩] }
    , { oid := ⟨5006⟩, proname := "phraseto_tsquery", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨3615⟩, proargtypes := [⟨3734⟩, ⟨25⟩] }
    , { oid := ⟨5007⟩, proname := "websearch_to_tsquery", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨3615⟩, proargtypes := [⟨3734⟩, ⟨25⟩] }
    , { oid := ⟨3749⟩, proname := "to_tsvector", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨3614⟩, proargtypes := [⟨25⟩] }
    , { oid := ⟨3750⟩, proname := "to_tsquery", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨3615⟩, proargtypes := [⟨25⟩] }
    , { oid := ⟨3751⟩, proname := "plainto_tsquery", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨3615⟩, proargtypes := [⟨25⟩] }
    , { oid := ⟨5001⟩, proname := "phraseto_tsquery", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨3615⟩, proargtypes := [⟨25⟩] }
    , { oid := ⟨5009⟩, proname := "websearch_to_tsquery", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨3615⟩, proargtypes := [⟨25⟩] }
    , { oid := ⟨4209⟩, proname := "to_tsvector", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨3614⟩, proargtypes := [⟨3802⟩] }
    , { oid := ⟨4213⟩, proname := "jsonb_to_tsvector", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨3614⟩, proargtypes := [⟨3802⟩, ⟨3802⟩] }
    , { oid := ⟨4210⟩, proname := "to_tsvector", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨3614⟩, proargtypes := [⟨114⟩] }
    , { oid := ⟨4215⟩, proname := "json_to_tsvector", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨3614⟩, proargtypes := [⟨114⟩, ⟨3802⟩] }
    , { oid := ⟨4211⟩, proname := "to_tsvector", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨3614⟩, proargtypes := [⟨3734⟩, ⟨3802⟩] }
    , { oid := ⟨4214⟩, proname := "jsonb_to_tsvector", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨3614⟩, proargtypes := [⟨3734⟩, ⟨3802⟩, ⟨3802⟩] }
    , { oid := ⟨4212⟩, proname := "to_tsvector", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨3614⟩, proargtypes := [⟨3734⟩, ⟨114⟩] }
    , { oid := ⟨4216⟩, proname := "json_to_tsvector", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨3614⟩, proargtypes := [⟨3734⟩, ⟨114⟩, ⟨3802⟩] }
    , { oid := ⟨3752⟩, proname := "tsvector_update_trigger", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨2279⟩, proargtypes := [] }
    , { oid := ⟨3753⟩, proname := "tsvector_update_trigger_column", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨2279⟩, proargtypes := [] }
    , { oid := ⟨3759⟩, proname := "get_current_ts_config", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨3734⟩, proargtypes := [] }
    , { oid := ⟨3736⟩, proname := "regconfigin", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨3734⟩, proargtypes := [⟨2275⟩] }
    , { oid := ⟨3737⟩, proname := "regconfigout", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨2275⟩, proargtypes := [⟨3734⟩] }
    , { oid := ⟨3738⟩, proname := "regconfigrecv", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨3734⟩, proargtypes := [⟨2281⟩] }
    , { oid := ⟨3739⟩, proname := "regconfigsend", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨17⟩, proargtypes := [⟨3734⟩] }
    , { oid := ⟨3771⟩, proname := "regdictionaryin", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨3769⟩, proargtypes := [⟨2275⟩] }
    , { oid := ⟨3772⟩, proname := "regdictionaryout", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨2275⟩, proargtypes := [⟨3769⟩] }
    , { oid := ⟨3773⟩, proname := "regdictionaryrecv", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨3769⟩, proargtypes := [⟨2281⟩] }
    , { oid := ⟨3774⟩, proname := "regdictionarysend", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨17⟩, proargtypes := [⟨3769⟩] }
    , { oid := ⟨3806⟩, proname := "jsonb_in", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨3802⟩, proargtypes := [⟨2275⟩] }
    , { oid := ⟨3805⟩, proname := "jsonb_recv", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨3802⟩, proargtypes := [⟨2281⟩] }
    , { oid := ⟨3804⟩, proname := "jsonb_out", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨2275⟩, proargtypes := [⟨3802⟩] }
    , { oid := ⟨3803⟩, proname := "jsonb_send", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨17⟩, proargtypes := [⟨3802⟩] }
    , { oid := ⟨3263⟩, proname := "jsonb_object", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨3802⟩, proargtypes := [⟨1009⟩] }
    , { oid := ⟨3264⟩, proname := "jsonb_object", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨3802⟩, proargtypes := [⟨1009⟩, ⟨1009⟩] }
    , { oid := ⟨3787⟩, proname := "to_jsonb", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨3802⟩, proargtypes := [⟨2283⟩] }
    , { oid := ⟨3265⟩, proname := "jsonb_agg_transfn", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨2281⟩, proargtypes := [⟨2281⟩, ⟨2283⟩] }
    , { oid := ⟨6283⟩, proname := "jsonb_agg_strict_transfn", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨2281⟩, proargtypes := [⟨2281⟩, ⟨2283⟩] }
    , { oid := ⟨3266⟩, proname := "jsonb_agg_finalfn", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨3802⟩, proargtypes := [⟨2281⟩] }
    , { oid := ⟨3267⟩, proname := "jsonb_agg", pronamespace := pgCatalogNamespace.oid, prokind := .aggregate, prosecdef := false, provolatile := .stable, prorettype := ⟨3802⟩, proargtypes := [⟨2283⟩] }
    , { oid := ⟨6284⟩, proname := "jsonb_agg_strict", pronamespace := pgCatalogNamespace.oid, prokind := .aggregate, prosecdef := false, provolatile := .stable, prorettype := ⟨3802⟩, proargtypes := [⟨2283⟩] }
    , { oid := ⟨3268⟩, proname := "jsonb_object_agg_transfn", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨2281⟩, proargtypes := [⟨2281⟩, ⟨2276⟩, ⟨2276⟩] }
    , { oid := ⟨6285⟩, proname := "jsonb_object_agg_strict_transfn", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨2281⟩, proargtypes := [⟨2281⟩, ⟨2276⟩, ⟨2276⟩] }
    , { oid := ⟨6286⟩, proname := "jsonb_object_agg_unique_transfn", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨2281⟩, proargtypes := [⟨2281⟩, ⟨2276⟩, ⟨2276⟩] }
    , { oid := ⟨6287⟩, proname := "jsonb_object_agg_unique_strict_transfn", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨2281⟩, proargtypes := [⟨2281⟩, ⟨2276⟩, ⟨2276⟩] }
    , { oid := ⟨3269⟩, proname := "jsonb_object_agg_finalfn", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨3802⟩, proargtypes := [⟨2281⟩] }
    , { oid := ⟨3270⟩, proname := "jsonb_object_agg", pronamespace := pgCatalogNamespace.oid, prokind := .aggregate, prosecdef := false, provolatile := .volatile, prorettype := ⟨3802⟩, proargtypes := [⟨2276⟩, ⟨2276⟩] }
    , { oid := ⟨6288⟩, proname := "jsonb_object_agg_strict", pronamespace := pgCatalogNamespace.oid, prokind := .aggregate, prosecdef := false, provolatile := .volatile, prorettype := ⟨3802⟩, proargtypes := [⟨2276⟩, ⟨2276⟩] }
    , { oid := ⟨6289⟩, proname := "jsonb_object_agg_unique", pronamespace := pgCatalogNamespace.oid, prokind := .aggregate, prosecdef := false, provolatile := .volatile, prorettype := ⟨3802⟩, proargtypes := [⟨2276⟩, ⟨2276⟩] }
    , { oid := ⟨6290⟩, proname := "jsonb_object_agg_unique_strict", pronamespace := pgCatalogNamespace.oid, prokind := .aggregate, prosecdef := false, provolatile := .volatile, prorettype := ⟨3802⟩, proargtypes := [⟨2276⟩, ⟨2276⟩] }
    , { oid := ⟨3271⟩, proname := "jsonb_build_array", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨3802⟩, proargtypes := [⟨2276⟩] }
    , { oid := ⟨3272⟩, proname := "jsonb_build_array", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨3802⟩, proargtypes := [] }
    , { oid := ⟨3273⟩, proname := "jsonb_build_object", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨3802⟩, proargtypes := [⟨2276⟩] }
    , { oid := ⟨3274⟩, proname := "jsonb_build_object", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨3802⟩, proargtypes := [] }
    , { oid := ⟨3262⟩, proname := "jsonb_strip_nulls", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨3802⟩, proargtypes := [⟨3802⟩] }
    , { oid := ⟨3478⟩, proname := "jsonb_object_field", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨3802⟩, proargtypes := [⟨3802⟩, ⟨25⟩] }
    , { oid := ⟨3214⟩, proname := "jsonb_object_field_text", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨25⟩, proargtypes := [⟨3802⟩, ⟨25⟩] }
    , { oid := ⟨3215⟩, proname := "jsonb_array_element", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨3802⟩, proargtypes := [⟨3802⟩, ⟨23⟩] }
    , { oid := ⟨3216⟩, proname := "jsonb_array_element_text", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨25⟩, proargtypes := [⟨3802⟩, ⟨23⟩] }
    , { oid := ⟨3217⟩, proname := "jsonb_extract_path", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨3802⟩, proargtypes := [⟨3802⟩, ⟨1009⟩] }
    , { oid := ⟨3940⟩, proname := "jsonb_extract_path_text", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨25⟩, proargtypes := [⟨3802⟩, ⟨1009⟩] }
    , { oid := ⟨3219⟩, proname := "jsonb_array_elements", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨3802⟩, proargtypes := [⟨3802⟩] }
    , { oid := ⟨3465⟩, proname := "jsonb_array_elements_text", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨25⟩, proargtypes := [⟨3802⟩] }
    , { oid := ⟨3207⟩, proname := "jsonb_array_length", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨23⟩, proargtypes := [⟨3802⟩] }
    , { oid := ⟨3931⟩, proname := "jsonb_object_keys", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨25⟩, proargtypes := [⟨3802⟩] }
    , { oid := ⟨3208⟩, proname := "jsonb_each", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨2249⟩, proargtypes := [⟨3802⟩] }
    , { oid := ⟨3932⟩, proname := "jsonb_each_text", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨2249⟩, proargtypes := [⟨3802⟩] }
    , { oid := ⟨3209⟩, proname := "jsonb_populate_record", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨2283⟩, proargtypes := [⟨2283⟩, ⟨3802⟩] }
    , { oid := ⟨6338⟩, proname := "jsonb_populate_record_valid", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨16⟩, proargtypes := [⟨2283⟩, ⟨3802⟩] }
    , { oid := ⟨3475⟩, proname := "jsonb_populate_recordset", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨2283⟩, proargtypes := [⟨2283⟩, ⟨3802⟩] }
    , { oid := ⟨3490⟩, proname := "jsonb_to_record", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨2249⟩, proargtypes := [⟨3802⟩] }
    , { oid := ⟨3491⟩, proname := "jsonb_to_recordset", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨2249⟩, proargtypes := [⟨3802⟩] }
    , { oid := ⟨3210⟩, proname := "jsonb_typeof", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨25⟩, proargtypes := [⟨3802⟩] }
    , { oid := ⟨4038⟩, proname := "jsonb_ne", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨3802⟩, ⟨3802⟩] }
    , { oid := ⟨4039⟩, proname := "jsonb_lt", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨3802⟩, ⟨3802⟩] }
    , { oid := ⟨4040⟩, proname := "jsonb_gt", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨3802⟩, ⟨3802⟩] }
    , { oid := ⟨4041⟩, proname := "jsonb_le", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨3802⟩, ⟨3802⟩] }
    , { oid := ⟨4042⟩, proname := "jsonb_ge", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨3802⟩, ⟨3802⟩] }
    , { oid := ⟨4043⟩, proname := "jsonb_eq", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨3802⟩, ⟨3802⟩] }
    , { oid := ⟨4044⟩, proname := "jsonb_cmp", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨23⟩, proargtypes := [⟨3802⟩, ⟨3802⟩] }
    , { oid := ⟨4045⟩, proname := "jsonb_hash", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨23⟩, proargtypes := [⟨3802⟩] }
    , { oid := ⟨3416⟩, proname := "jsonb_hash_extended", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨20⟩, proargtypes := [⟨3802⟩, ⟨20⟩] }
    , { oid := ⟨4046⟩, proname := "jsonb_contains", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨3802⟩, ⟨3802⟩] }
    , { oid := ⟨4047⟩, proname := "jsonb_exists", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨3802⟩, ⟨25⟩] }
    , { oid := ⟨4048⟩, proname := "jsonb_exists_any", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨3802⟩, ⟨1009⟩] }
    , { oid := ⟨4049⟩, proname := "jsonb_exists_all", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨3802⟩, ⟨1009⟩] }
    , { oid := ⟨4050⟩, proname := "jsonb_contained", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨3802⟩, ⟨3802⟩] }
    , { oid := ⟨3480⟩, proname := "gin_compare_jsonb", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨23⟩, proargtypes := [⟨25⟩, ⟨25⟩] }
    , { oid := ⟨3482⟩, proname := "gin_extract_jsonb", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨2281⟩, proargtypes := [⟨3802⟩, ⟨2281⟩, ⟨2281⟩] }
    , { oid := ⟨3483⟩, proname := "gin_extract_jsonb_query", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨2281⟩, proargtypes := [⟨3802⟩, ⟨2281⟩, ⟨21⟩, ⟨2281⟩, ⟨2281⟩, ⟨2281⟩, ⟨2281⟩] }
    , { oid := ⟨3484⟩, proname := "gin_consistent_jsonb", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨2281⟩, ⟨21⟩, ⟨3802⟩, ⟨23⟩, ⟨2281⟩, ⟨2281⟩, ⟨2281⟩, ⟨2281⟩] }
    , { oid := ⟨3488⟩, proname := "gin_triconsistent_jsonb", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨18⟩, proargtypes := [⟨2281⟩, ⟨21⟩, ⟨3802⟩, ⟨23⟩, ⟨2281⟩, ⟨2281⟩, ⟨2281⟩] }
    , { oid := ⟨3485⟩, proname := "gin_extract_jsonb_path", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨2281⟩, proargtypes := [⟨3802⟩, ⟨2281⟩, ⟨2281⟩] }
    , { oid := ⟨3486⟩, proname := "gin_extract_jsonb_query_path", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨2281⟩, proargtypes := [⟨3802⟩, ⟨2281⟩, ⟨21⟩, ⟨2281⟩, ⟨2281⟩, ⟨2281⟩, ⟨2281⟩] }
    , { oid := ⟨3487⟩, proname := "gin_consistent_jsonb_path", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨2281⟩, ⟨21⟩, ⟨3802⟩, ⟨23⟩, ⟨2281⟩, ⟨2281⟩, ⟨2281⟩, ⟨2281⟩] }
    , { oid := ⟨3489⟩, proname := "gin_triconsistent_jsonb_path", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨18⟩, proargtypes := [⟨2281⟩, ⟨21⟩, ⟨3802⟩, ⟨23⟩, ⟨2281⟩, ⟨2281⟩, ⟨2281⟩] }
    , { oid := ⟨3301⟩, proname := "jsonb_concat", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨3802⟩, proargtypes := [⟨3802⟩, ⟨3802⟩] }
    , { oid := ⟨3302⟩, proname := "jsonb_delete", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨3802⟩, proargtypes := [⟨3802⟩, ⟨25⟩] }
    , { oid := ⟨3303⟩, proname := "jsonb_delete", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨3802⟩, proargtypes := [⟨3802⟩, ⟨23⟩] }
    , { oid := ⟨3343⟩, proname := "jsonb_delete", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨3802⟩, proargtypes := [⟨3802⟩, ⟨1009⟩] }
    , { oid := ⟨3304⟩, proname := "jsonb_delete_path", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨3802⟩, proargtypes := [⟨3802⟩, ⟨1009⟩] }
    , { oid := ⟨5054⟩, proname := "jsonb_set_lax", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨3802⟩, proargtypes := [⟨3802⟩, ⟨1009⟩, ⟨3802⟩, ⟨16⟩, ⟨25⟩] }
    , { oid := ⟨3305⟩, proname := "jsonb_set", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨3802⟩, proargtypes := [⟨3802⟩, ⟨1009⟩, ⟨3802⟩, ⟨16⟩] }
    , { oid := ⟨3306⟩, proname := "jsonb_pretty", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨25⟩, proargtypes := [⟨3802⟩] }
    , { oid := ⟨3579⟩, proname := "jsonb_insert", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨3802⟩, proargtypes := [⟨3802⟩, ⟨1009⟩, ⟨3802⟩, ⟨16⟩] }
    , { oid := ⟨4001⟩, proname := "jsonpath_in", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨4072⟩, proargtypes := [⟨2275⟩] }
    , { oid := ⟨4002⟩, proname := "jsonpath_recv", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨4072⟩, proargtypes := [⟨2281⟩] }
    , { oid := ⟨4003⟩, proname := "jsonpath_out", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨2275⟩, proargtypes := [⟨4072⟩] }
    , { oid := ⟨4004⟩, proname := "jsonpath_send", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨17⟩, proargtypes := [⟨4072⟩] }
    , { oid := ⟨4005⟩, proname := "jsonb_path_exists", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨3802⟩, ⟨4072⟩, ⟨3802⟩, ⟨16⟩] }
    , { oid := ⟨4006⟩, proname := "jsonb_path_query", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨3802⟩, proargtypes := [⟨3802⟩, ⟨4072⟩, ⟨3802⟩, ⟨16⟩] }
    , { oid := ⟨4007⟩, proname := "jsonb_path_query_array", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨3802⟩, proargtypes := [⟨3802⟩, ⟨4072⟩, ⟨3802⟩, ⟨16⟩] }
    , { oid := ⟨4008⟩, proname := "jsonb_path_query_first", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨3802⟩, proargtypes := [⟨3802⟩, ⟨4072⟩, ⟨3802⟩, ⟨16⟩] }
    , { oid := ⟨4009⟩, proname := "jsonb_path_match", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨3802⟩, ⟨4072⟩, ⟨3802⟩, ⟨16⟩] }
    , { oid := ⟨1177⟩, proname := "jsonb_path_exists_tz", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨16⟩, proargtypes := [⟨3802⟩, ⟨4072⟩, ⟨3802⟩, ⟨16⟩] }
    , { oid := ⟨1179⟩, proname := "jsonb_path_query_tz", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨3802⟩, proargtypes := [⟨3802⟩, ⟨4072⟩, ⟨3802⟩, ⟨16⟩] }
    , { oid := ⟨1180⟩, proname := "jsonb_path_query_array_tz", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨3802⟩, proargtypes := [⟨3802⟩, ⟨4072⟩, ⟨3802⟩, ⟨16⟩] }
    , { oid := ⟨2023⟩, proname := "jsonb_path_query_first_tz", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨3802⟩, proargtypes := [⟨3802⟩, ⟨4072⟩, ⟨3802⟩, ⟨16⟩] }
    , { oid := ⟨2030⟩, proname := "jsonb_path_match_tz", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨16⟩, proargtypes := [⟨3802⟩, ⟨4072⟩, ⟨3802⟩, ⟨16⟩] }
    , { oid := ⟨4010⟩, proname := "jsonb_path_exists_opr", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨3802⟩, ⟨4072⟩] }
    , { oid := ⟨4011⟩, proname := "jsonb_path_match_opr", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨3802⟩, ⟨4072⟩] }
    , { oid := ⟨2939⟩, proname := "txid_snapshot_in", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨2970⟩, proargtypes := [⟨2275⟩] }
    , { oid := ⟨2940⟩, proname := "txid_snapshot_out", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨2275⟩, proargtypes := [⟨2970⟩] }
    , { oid := ⟨2941⟩, proname := "txid_snapshot_recv", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨2970⟩, proargtypes := [⟨2281⟩] }
    , { oid := ⟨2942⟩, proname := "txid_snapshot_send", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨17⟩, proargtypes := [⟨2970⟩] }
    , { oid := ⟨2943⟩, proname := "txid_current", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨20⟩, proargtypes := [] }
    , { oid := ⟨3348⟩, proname := "txid_current_if_assigned", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨20⟩, proargtypes := [] }
    , { oid := ⟨2944⟩, proname := "txid_current_snapshot", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨2970⟩, proargtypes := [] }
    , { oid := ⟨2945⟩, proname := "txid_snapshot_xmin", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨20⟩, proargtypes := [⟨2970⟩] }
    , { oid := ⟨2946⟩, proname := "txid_snapshot_xmax", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨20⟩, proargtypes := [⟨2970⟩] }
    , { oid := ⟨2947⟩, proname := "txid_snapshot_xip", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨20⟩, proargtypes := [⟨2970⟩] }
    , { oid := ⟨2948⟩, proname := "txid_visible_in_snapshot", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨20⟩, ⟨2970⟩] }
    , { oid := ⟨3360⟩, proname := "txid_status", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨25⟩, proargtypes := [⟨20⟩] }
    , { oid := ⟨5055⟩, proname := "pg_snapshot_in", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨5038⟩, proargtypes := [⟨2275⟩] }
    , { oid := ⟨5056⟩, proname := "pg_snapshot_out", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨2275⟩, proargtypes := [⟨5038⟩] }
    , { oid := ⟨5057⟩, proname := "pg_snapshot_recv", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨5038⟩, proargtypes := [⟨2281⟩] }
    , { oid := ⟨5058⟩, proname := "pg_snapshot_send", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨17⟩, proargtypes := [⟨5038⟩] }
    , { oid := ⟨5061⟩, proname := "pg_current_snapshot", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨5038⟩, proargtypes := [] }
    , { oid := ⟨5062⟩, proname := "pg_snapshot_xmin", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨5069⟩, proargtypes := [⟨5038⟩] }
    , { oid := ⟨5063⟩, proname := "pg_snapshot_xmax", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨5069⟩, proargtypes := [⟨5038⟩] }
    , { oid := ⟨5064⟩, proname := "pg_snapshot_xip", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨5069⟩, proargtypes := [⟨5038⟩] }
    , { oid := ⟨5065⟩, proname := "pg_visible_in_snapshot", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨5069⟩, ⟨5038⟩] }
    , { oid := ⟨5059⟩, proname := "pg_current_xact_id", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨5069⟩, proargtypes := [] }
    , { oid := ⟨5060⟩, proname := "pg_current_xact_id_if_assigned", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨5069⟩, proargtypes := [] }
    , { oid := ⟨5066⟩, proname := "pg_xact_status", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨25⟩, proargtypes := [⟨5069⟩] }
    , { oid := ⟨2981⟩, proname := "record_eq", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨2249⟩, ⟨2249⟩] }
    , { oid := ⟨2982⟩, proname := "record_ne", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨2249⟩, ⟨2249⟩] }
    , { oid := ⟨2983⟩, proname := "record_lt", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨2249⟩, ⟨2249⟩] }
    , { oid := ⟨2984⟩, proname := "record_gt", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨2249⟩, ⟨2249⟩] }
    , { oid := ⟨2985⟩, proname := "record_le", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨2249⟩, ⟨2249⟩] }
    , { oid := ⟨2986⟩, proname := "record_ge", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨2249⟩, ⟨2249⟩] }
    , { oid := ⟨2987⟩, proname := "btrecordcmp", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨23⟩, proargtypes := [⟨2249⟩, ⟨2249⟩] }
    , { oid := ⟨6192⟩, proname := "hash_record", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨23⟩, proargtypes := [⟨2249⟩] }
    , { oid := ⟨6193⟩, proname := "hash_record_extended", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨20⟩, proargtypes := [⟨2249⟩, ⟨20⟩] }
    , { oid := ⟨3181⟩, proname := "record_image_eq", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨2249⟩, ⟨2249⟩] }
    , { oid := ⟨3182⟩, proname := "record_image_ne", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨2249⟩, ⟨2249⟩] }
    , { oid := ⟨3183⟩, proname := "record_image_lt", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨2249⟩, ⟨2249⟩] }
    , { oid := ⟨3184⟩, proname := "record_image_gt", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨2249⟩, ⟨2249⟩] }
    , { oid := ⟨3185⟩, proname := "record_image_le", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨2249⟩, ⟨2249⟩] }
    , { oid := ⟨3186⟩, proname := "record_image_ge", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨2249⟩, ⟨2249⟩] }
    , { oid := ⟨3187⟩, proname := "btrecordimagecmp", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨23⟩, proargtypes := [⟨2249⟩, ⟨2249⟩] }
    , { oid := ⟨5051⟩, proname := "btequalimage", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨26⟩] }
    , { oid := ⟨3082⟩, proname := "pg_available_extensions", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨2249⟩, proargtypes := [] }
    , { oid := ⟨3083⟩, proname := "pg_available_extension_versions", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨2249⟩, proargtypes := [] }
    , { oid := ⟨3084⟩, proname := "pg_extension_update_paths", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨2249⟩, proargtypes := [⟨19⟩] }
    , { oid := ⟨3086⟩, proname := "pg_extension_config_dump", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨2278⟩, proargtypes := [⟨2205⟩, ⟨25⟩] }
    , { oid := ⟨3100⟩, proname := "row_number", pronamespace := pgCatalogNamespace.oid, prokind := .window, prosecdef := false, provolatile := .volatile, prorettype := ⟨20⟩, proargtypes := [] }
    , { oid := ⟨6233⟩, proname := "window_row_number_support", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨2281⟩, proargtypes := [⟨2281⟩] }
    , { oid := ⟨3101⟩, proname := "rank", pronamespace := pgCatalogNamespace.oid, prokind := .window, prosecdef := false, provolatile := .volatile, prorettype := ⟨20⟩, proargtypes := [] }
    , { oid := ⟨6234⟩, proname := "window_rank_support", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨2281⟩, proargtypes := [⟨2281⟩] }
    , { oid := ⟨3102⟩, proname := "dense_rank", pronamespace := pgCatalogNamespace.oid, prokind := .window, prosecdef := false, provolatile := .volatile, prorettype := ⟨20⟩, proargtypes := [] }
    , { oid := ⟨6235⟩, proname := "window_dense_rank_support", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨2281⟩, proargtypes := [⟨2281⟩] }
    , { oid := ⟨3103⟩, proname := "percent_rank", pronamespace := pgCatalogNamespace.oid, prokind := .window, prosecdef := false, provolatile := .volatile, prorettype := ⟨701⟩, proargtypes := [] }
    , { oid := ⟨6306⟩, proname := "window_percent_rank_support", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨2281⟩, proargtypes := [⟨2281⟩] }
    , { oid := ⟨3104⟩, proname := "cume_dist", pronamespace := pgCatalogNamespace.oid, prokind := .window, prosecdef := false, provolatile := .volatile, prorettype := ⟨701⟩, proargtypes := [] }
    , { oid := ⟨6307⟩, proname := "window_cume_dist_support", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨2281⟩, proargtypes := [⟨2281⟩] }
    , { oid := ⟨3105⟩, proname := "ntile", pronamespace := pgCatalogNamespace.oid, prokind := .window, prosecdef := false, provolatile := .volatile, prorettype := ⟨23⟩, proargtypes := [⟨23⟩] }
    , { oid := ⟨6308⟩, proname := "window_ntile_support", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨2281⟩, proargtypes := [⟨2281⟩] }
    , { oid := ⟨3106⟩, proname := "lag", pronamespace := pgCatalogNamespace.oid, prokind := .window, prosecdef := false, provolatile := .volatile, prorettype := ⟨2283⟩, proargtypes := [⟨2283⟩] }
    , { oid := ⟨3107⟩, proname := "lag", pronamespace := pgCatalogNamespace.oid, prokind := .window, prosecdef := false, provolatile := .volatile, prorettype := ⟨2283⟩, proargtypes := [⟨2283⟩, ⟨23⟩] }
    , { oid := ⟨3108⟩, proname := "lag", pronamespace := pgCatalogNamespace.oid, prokind := .window, prosecdef := false, provolatile := .volatile, prorettype := ⟨5077⟩, proargtypes := [⟨5077⟩, ⟨23⟩, ⟨5077⟩] }
    , { oid := ⟨3109⟩, proname := "lead", pronamespace := pgCatalogNamespace.oid, prokind := .window, prosecdef := false, provolatile := .volatile, prorettype := ⟨2283⟩, proargtypes := [⟨2283⟩] }
    , { oid := ⟨3110⟩, proname := "lead", pronamespace := pgCatalogNamespace.oid, prokind := .window, prosecdef := false, provolatile := .volatile, prorettype := ⟨2283⟩, proargtypes := [⟨2283⟩, ⟨23⟩] }
    , { oid := ⟨3111⟩, proname := "lead", pronamespace := pgCatalogNamespace.oid, prokind := .window, prosecdef := false, provolatile := .volatile, prorettype := ⟨5077⟩, proargtypes := [⟨5077⟩, ⟨23⟩, ⟨5077⟩] }
    , { oid := ⟨3112⟩, proname := "first_value", pronamespace := pgCatalogNamespace.oid, prokind := .window, prosecdef := false, provolatile := .volatile, prorettype := ⟨2283⟩, proargtypes := [⟨2283⟩] }
    , { oid := ⟨3113⟩, proname := "last_value", pronamespace := pgCatalogNamespace.oid, prokind := .window, prosecdef := false, provolatile := .volatile, prorettype := ⟨2283⟩, proargtypes := [⟨2283⟩] }
    , { oid := ⟨3114⟩, proname := "nth_value", pronamespace := pgCatalogNamespace.oid, prokind := .window, prosecdef := false, provolatile := .volatile, prorettype := ⟨2283⟩, proargtypes := [⟨2283⟩, ⟨23⟩] }
    , { oid := ⟨3832⟩, proname := "anyrange_in", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨3831⟩, proargtypes := [⟨2275⟩, ⟨26⟩, ⟨23⟩] }
    , { oid := ⟨3833⟩, proname := "anyrange_out", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨2275⟩, proargtypes := [⟨3831⟩] }
    , { oid := ⟨3834⟩, proname := "range_in", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨3831⟩, proargtypes := [⟨2275⟩, ⟨26⟩, ⟨23⟩] }
    , { oid := ⟨3835⟩, proname := "range_out", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨2275⟩, proargtypes := [⟨3831⟩] }
    , { oid := ⟨3836⟩, proname := "range_recv", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨3831⟩, proargtypes := [⟨2281⟩, ⟨26⟩, ⟨23⟩] }
    , { oid := ⟨3837⟩, proname := "range_send", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨17⟩, proargtypes := [⟨3831⟩] }
    , { oid := ⟨3848⟩, proname := "lower", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨2283⟩, proargtypes := [⟨3831⟩] }
    , { oid := ⟨3849⟩, proname := "upper", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨2283⟩, proargtypes := [⟨3831⟩] }
    , { oid := ⟨3850⟩, proname := "isempty", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨3831⟩] }
    , { oid := ⟨3851⟩, proname := "lower_inc", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨3831⟩] }
    , { oid := ⟨3852⟩, proname := "upper_inc", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨3831⟩] }
    , { oid := ⟨3853⟩, proname := "lower_inf", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨3831⟩] }
    , { oid := ⟨3854⟩, proname := "upper_inf", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨3831⟩] }
    , { oid := ⟨3855⟩, proname := "range_eq", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨3831⟩, ⟨3831⟩] }
    , { oid := ⟨3856⟩, proname := "range_ne", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨3831⟩, ⟨3831⟩] }
    , { oid := ⟨3857⟩, proname := "range_overlaps", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨3831⟩, ⟨3831⟩] }
    , { oid := ⟨3858⟩, proname := "range_contains_elem", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨3831⟩, ⟨2283⟩] }
    , { oid := ⟨3859⟩, proname := "range_contains", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨3831⟩, ⟨3831⟩] }
    , { oid := ⟨3860⟩, proname := "elem_contained_by_range", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨2283⟩, ⟨3831⟩] }
    , { oid := ⟨3861⟩, proname := "range_contained_by", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨3831⟩, ⟨3831⟩] }
    , { oid := ⟨3862⟩, proname := "range_adjacent", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨3831⟩, ⟨3831⟩] }
    , { oid := ⟨3863⟩, proname := "range_before", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨3831⟩, ⟨3831⟩] }
    , { oid := ⟨3864⟩, proname := "range_after", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨3831⟩, ⟨3831⟩] }
    , { oid := ⟨3865⟩, proname := "range_overleft", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨3831⟩, ⟨3831⟩] }
    , { oid := ⟨3866⟩, proname := "range_overright", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨3831⟩, ⟨3831⟩] }
    , { oid := ⟨3867⟩, proname := "range_union", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨3831⟩, proargtypes := [⟨3831⟩, ⟨3831⟩] }
    , { oid := ⟨6345⟩, proname := "range_contains_elem_support", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨2281⟩, proargtypes := [⟨2281⟩] }
    , { oid := ⟨6346⟩, proname := "elem_contained_by_range_support", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨2281⟩, proargtypes := [⟨2281⟩] }
    , { oid := ⟨4057⟩, proname := "range_merge", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨3831⟩, proargtypes := [⟨3831⟩, ⟨3831⟩] }
    , { oid := ⟨4228⟩, proname := "range_merge", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨3831⟩, proargtypes := [⟨4537⟩] }
    , { oid := ⟨3868⟩, proname := "range_intersect", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨3831⟩, proargtypes := [⟨3831⟩, ⟨3831⟩] }
    , { oid := ⟨3869⟩, proname := "range_minus", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨3831⟩, proargtypes := [⟨3831⟩, ⟨3831⟩] }
    , { oid := ⟨3870⟩, proname := "range_cmp", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨23⟩, proargtypes := [⟨3831⟩, ⟨3831⟩] }
    , { oid := ⟨3871⟩, proname := "range_lt", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨3831⟩, ⟨3831⟩] }
    , { oid := ⟨3872⟩, proname := "range_le", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨3831⟩, ⟨3831⟩] }
    , { oid := ⟨3873⟩, proname := "range_ge", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨3831⟩, ⟨3831⟩] }
    , { oid := ⟨3874⟩, proname := "range_gt", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨3831⟩, ⟨3831⟩] }
    , { oid := ⟨3875⟩, proname := "range_gist_consistent", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨2281⟩, ⟨3831⟩, ⟨21⟩, ⟨26⟩, ⟨2281⟩] }
    , { oid := ⟨3876⟩, proname := "range_gist_union", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨3831⟩, proargtypes := [⟨2281⟩, ⟨2281⟩] }
    , { oid := ⟨3879⟩, proname := "range_gist_penalty", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨2281⟩, proargtypes := [⟨2281⟩, ⟨2281⟩, ⟨2281⟩] }
    , { oid := ⟨3880⟩, proname := "range_gist_picksplit", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨2281⟩, proargtypes := [⟨2281⟩, ⟨2281⟩] }
    , { oid := ⟨3881⟩, proname := "range_gist_same", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨2281⟩, proargtypes := [⟨3831⟩, ⟨3831⟩, ⟨2281⟩] }
    , { oid := ⟨6154⟩, proname := "multirange_gist_consistent", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨2281⟩, ⟨4537⟩, ⟨21⟩, ⟨26⟩, ⟨2281⟩] }
    , { oid := ⟨6156⟩, proname := "multirange_gist_compress", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨2281⟩, proargtypes := [⟨2281⟩] }
    , { oid := ⟨3902⟩, proname := "hash_range", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨23⟩, proargtypes := [⟨3831⟩] }
    , { oid := ⟨3417⟩, proname := "hash_range_extended", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨20⟩, proargtypes := [⟨3831⟩, ⟨20⟩] }
    , { oid := ⟨3916⟩, proname := "range_typanalyze", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨16⟩, proargtypes := [⟨2281⟩] }
    , { oid := ⟨3169⟩, proname := "rangesel", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨701⟩, proargtypes := [⟨2281⟩, ⟨26⟩, ⟨2281⟩, ⟨23⟩] }
    , { oid := ⟨4401⟩, proname := "range_intersect_agg_transfn", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨3831⟩, proargtypes := [⟨3831⟩, ⟨3831⟩] }
    , { oid := ⟨4450⟩, proname := "range_intersect_agg", pronamespace := pgCatalogNamespace.oid, prokind := .aggregate, prosecdef := false, provolatile := .volatile, prorettype := ⟨3831⟩, proargtypes := [⟨3831⟩] }
    , { oid := ⟨3914⟩, proname := "int4range_canonical", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨3904⟩, proargtypes := [⟨3904⟩] }
    , { oid := ⟨3928⟩, proname := "int8range_canonical", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨3926⟩, proargtypes := [⟨3926⟩] }
    , { oid := ⟨3915⟩, proname := "daterange_canonical", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨3912⟩, proargtypes := [⟨3912⟩] }
    , { oid := ⟨3922⟩, proname := "int4range_subdiff", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨701⟩, proargtypes := [⟨23⟩, ⟨23⟩] }
    , { oid := ⟨3923⟩, proname := "int8range_subdiff", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨701⟩, proargtypes := [⟨20⟩, ⟨20⟩] }
    , { oid := ⟨3924⟩, proname := "numrange_subdiff", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨701⟩, proargtypes := [⟨1700⟩, ⟨1700⟩] }
    , { oid := ⟨3925⟩, proname := "daterange_subdiff", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨701⟩, proargtypes := [⟨1082⟩, ⟨1082⟩] }
    , { oid := ⟨3929⟩, proname := "tsrange_subdiff", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨701⟩, proargtypes := [⟨1114⟩, ⟨1114⟩] }
    , { oid := ⟨3930⟩, proname := "tstzrange_subdiff", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨701⟩, proargtypes := [⟨1184⟩, ⟨1184⟩] }
    , { oid := ⟨3840⟩, proname := "int4range", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨3904⟩, proargtypes := [⟨23⟩, ⟨23⟩] }
    , { oid := ⟨3841⟩, proname := "int4range", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨3904⟩, proargtypes := [⟨23⟩, ⟨23⟩, ⟨25⟩] }
    , { oid := ⟨3844⟩, proname := "numrange", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨3906⟩, proargtypes := [⟨1700⟩, ⟨1700⟩] }
    , { oid := ⟨3845⟩, proname := "numrange", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨3906⟩, proargtypes := [⟨1700⟩, ⟨1700⟩, ⟨25⟩] }
    , { oid := ⟨3933⟩, proname := "tsrange", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨3908⟩, proargtypes := [⟨1114⟩, ⟨1114⟩] }
    , { oid := ⟨3934⟩, proname := "tsrange", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨3908⟩, proargtypes := [⟨1114⟩, ⟨1114⟩, ⟨25⟩] }
    , { oid := ⟨3937⟩, proname := "tstzrange", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨3910⟩, proargtypes := [⟨1184⟩, ⟨1184⟩] }
    , { oid := ⟨3938⟩, proname := "tstzrange", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨3910⟩, proargtypes := [⟨1184⟩, ⟨1184⟩, ⟨25⟩] }
    , { oid := ⟨3941⟩, proname := "daterange", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨3912⟩, proargtypes := [⟨1082⟩, ⟨1082⟩] }
    , { oid := ⟨3942⟩, proname := "daterange", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨3912⟩, proargtypes := [⟨1082⟩, ⟨1082⟩, ⟨25⟩] }
    , { oid := ⟨3945⟩, proname := "int8range", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨3926⟩, proargtypes := [⟨20⟩, ⟨20⟩] }
    , { oid := ⟨3946⟩, proname := "int8range", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨3926⟩, proargtypes := [⟨20⟩, ⟨20⟩, ⟨25⟩] }
    , { oid := ⟨4229⟩, proname := "anymultirange_in", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨4537⟩, proargtypes := [⟨2275⟩, ⟨26⟩, ⟨23⟩] }
    , { oid := ⟨4230⟩, proname := "anymultirange_out", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨2275⟩, proargtypes := [⟨4537⟩] }
    , { oid := ⟨4231⟩, proname := "multirange_in", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨4537⟩, proargtypes := [⟨2275⟩, ⟨26⟩, ⟨23⟩] }
    , { oid := ⟨4232⟩, proname := "multirange_out", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨2275⟩, proargtypes := [⟨4537⟩] }
    , { oid := ⟨4233⟩, proname := "multirange_recv", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨4537⟩, proargtypes := [⟨2281⟩, ⟨26⟩, ⟨23⟩] }
    , { oid := ⟨4234⟩, proname := "multirange_send", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨17⟩, proargtypes := [⟨4537⟩] }
    , { oid := ⟨4235⟩, proname := "lower", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨2283⟩, proargtypes := [⟨4537⟩] }
    , { oid := ⟨4236⟩, proname := "upper", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨2283⟩, proargtypes := [⟨4537⟩] }
    , { oid := ⟨4237⟩, proname := "isempty", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨4537⟩] }
    , { oid := ⟨4238⟩, proname := "lower_inc", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨4537⟩] }
    , { oid := ⟨4239⟩, proname := "upper_inc", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨4537⟩] }
    , { oid := ⟨4240⟩, proname := "lower_inf", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨4537⟩] }
    , { oid := ⟨4241⟩, proname := "upper_inf", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨4537⟩] }
    , { oid := ⟨4242⟩, proname := "multirange_typanalyze", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨16⟩, proargtypes := [⟨2281⟩] }
    , { oid := ⟨4243⟩, proname := "multirangesel", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨701⟩, proargtypes := [⟨2281⟩, ⟨26⟩, ⟨2281⟩, ⟨23⟩] }
    , { oid := ⟨4244⟩, proname := "multirange_eq", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨4537⟩, ⟨4537⟩] }
    , { oid := ⟨4245⟩, proname := "multirange_ne", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨4537⟩, ⟨4537⟩] }
    , { oid := ⟨4246⟩, proname := "range_overlaps_multirange", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨3831⟩, ⟨4537⟩] }
    , { oid := ⟨4247⟩, proname := "multirange_overlaps_range", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨4537⟩, ⟨3831⟩] }
    , { oid := ⟨4248⟩, proname := "multirange_overlaps_multirange", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨4537⟩, ⟨4537⟩] }
    , { oid := ⟨4249⟩, proname := "multirange_contains_elem", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨4537⟩, ⟨2283⟩] }
    , { oid := ⟨4250⟩, proname := "multirange_contains_range", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨4537⟩, ⟨3831⟩] }
    , { oid := ⟨4251⟩, proname := "multirange_contains_multirange", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨4537⟩, ⟨4537⟩] }
    , { oid := ⟨4252⟩, proname := "elem_contained_by_multirange", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨2283⟩, ⟨4537⟩] }
    , { oid := ⟨4253⟩, proname := "range_contained_by_multirange", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨3831⟩, ⟨4537⟩] }
    , { oid := ⟨4541⟩, proname := "range_contains_multirange", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨3831⟩, ⟨4537⟩] }
    , { oid := ⟨4542⟩, proname := "multirange_contained_by_range", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨4537⟩, ⟨3831⟩] }
    , { oid := ⟨4254⟩, proname := "multirange_contained_by_multirange", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨4537⟩, ⟨4537⟩] }
    , { oid := ⟨4255⟩, proname := "range_adjacent_multirange", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨3831⟩, ⟨4537⟩] }
    , { oid := ⟨4256⟩, proname := "multirange_adjacent_multirange", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨4537⟩, ⟨4537⟩] }
    , { oid := ⟨4257⟩, proname := "multirange_adjacent_range", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨4537⟩, ⟨3831⟩] }
    , { oid := ⟨4258⟩, proname := "range_before_multirange", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨3831⟩, ⟨4537⟩] }
    , { oid := ⟨4259⟩, proname := "multirange_before_range", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨4537⟩, ⟨3831⟩] }
    , { oid := ⟨4260⟩, proname := "multirange_before_multirange", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨4537⟩, ⟨4537⟩] }
    , { oid := ⟨4261⟩, proname := "range_after_multirange", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨3831⟩, ⟨4537⟩] }
    , { oid := ⟨4262⟩, proname := "multirange_after_range", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨4537⟩, ⟨3831⟩] }
    , { oid := ⟨4263⟩, proname := "multirange_after_multirange", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨4537⟩, ⟨4537⟩] }
    , { oid := ⟨4264⟩, proname := "range_overleft_multirange", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨3831⟩, ⟨4537⟩] }
    , { oid := ⟨4265⟩, proname := "multirange_overleft_range", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨4537⟩, ⟨3831⟩] }
    , { oid := ⟨4266⟩, proname := "multirange_overleft_multirange", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨4537⟩, ⟨4537⟩] }
    , { oid := ⟨4267⟩, proname := "range_overright_multirange", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨3831⟩, ⟨4537⟩] }
    , { oid := ⟨4268⟩, proname := "multirange_overright_range", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨4537⟩, ⟨3831⟩] }
    , { oid := ⟨4269⟩, proname := "multirange_overright_multirange", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨4537⟩, ⟨4537⟩] }
    , { oid := ⟨4270⟩, proname := "multirange_union", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨4537⟩, proargtypes := [⟨4537⟩, ⟨4537⟩] }
    , { oid := ⟨4271⟩, proname := "multirange_minus", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨4537⟩, proargtypes := [⟨4537⟩, ⟨4537⟩] }
    , { oid := ⟨4272⟩, proname := "multirange_intersect", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨4537⟩, proargtypes := [⟨4537⟩, ⟨4537⟩] }
    , { oid := ⟨4273⟩, proname := "multirange_cmp", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨23⟩, proargtypes := [⟨4537⟩, ⟨4537⟩] }
    , { oid := ⟨4274⟩, proname := "multirange_lt", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨4537⟩, ⟨4537⟩] }
    , { oid := ⟨4275⟩, proname := "multirange_le", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨4537⟩, ⟨4537⟩] }
    , { oid := ⟨4276⟩, proname := "multirange_ge", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨4537⟩, ⟨4537⟩] }
    , { oid := ⟨4277⟩, proname := "multirange_gt", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨4537⟩, ⟨4537⟩] }
    , { oid := ⟨4278⟩, proname := "hash_multirange", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨23⟩, proargtypes := [⟨4537⟩] }
    , { oid := ⟨4279⟩, proname := "hash_multirange_extended", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨20⟩, proargtypes := [⟨4537⟩, ⟨20⟩] }
    , { oid := ⟨4280⟩, proname := "int4multirange", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨4451⟩, proargtypes := [] }
    , { oid := ⟨4281⟩, proname := "int4multirange", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨4451⟩, proargtypes := [⟨3904⟩] }
    , { oid := ⟨4282⟩, proname := "int4multirange", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨4451⟩, proargtypes := [⟨3905⟩] }
    , { oid := ⟨4283⟩, proname := "nummultirange", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨4532⟩, proargtypes := [] }
    , { oid := ⟨4284⟩, proname := "nummultirange", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨4532⟩, proargtypes := [⟨3906⟩] }
    , { oid := ⟨4285⟩, proname := "nummultirange", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨4532⟩, proargtypes := [⟨3907⟩] }
    , { oid := ⟨4286⟩, proname := "tsmultirange", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨4533⟩, proargtypes := [] }
    , { oid := ⟨4287⟩, proname := "tsmultirange", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨4533⟩, proargtypes := [⟨3908⟩] }
    , { oid := ⟨4288⟩, proname := "tsmultirange", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨4533⟩, proargtypes := [⟨3909⟩] }
    , { oid := ⟨4289⟩, proname := "tstzmultirange", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨4534⟩, proargtypes := [] }
    , { oid := ⟨4290⟩, proname := "tstzmultirange", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨4534⟩, proargtypes := [⟨3910⟩] }
    , { oid := ⟨4291⟩, proname := "tstzmultirange", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨4534⟩, proargtypes := [⟨3911⟩] }
    , { oid := ⟨4292⟩, proname := "datemultirange", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨4535⟩, proargtypes := [] }
    , { oid := ⟨4293⟩, proname := "datemultirange", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨4535⟩, proargtypes := [⟨3912⟩] }
    , { oid := ⟨4294⟩, proname := "datemultirange", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨4535⟩, proargtypes := [⟨3913⟩] }
    , { oid := ⟨4295⟩, proname := "int8multirange", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨4536⟩, proargtypes := [] }
    , { oid := ⟨4296⟩, proname := "int8multirange", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨4536⟩, proargtypes := [⟨3926⟩] }
    , { oid := ⟨4297⟩, proname := "int8multirange", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨4536⟩, proargtypes := [⟨3927⟩] }
    , { oid := ⟨4298⟩, proname := "multirange", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨4537⟩, proargtypes := [⟨3831⟩] }
    , { oid := ⟨4299⟩, proname := "range_agg_transfn", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨2281⟩, proargtypes := [⟨2281⟩, ⟨3831⟩] }
    , { oid := ⟨4300⟩, proname := "range_agg_finalfn", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨4537⟩, proargtypes := [⟨2281⟩, ⟨3831⟩] }
    , { oid := ⟨4301⟩, proname := "range_agg", pronamespace := pgCatalogNamespace.oid, prokind := .aggregate, prosecdef := false, provolatile := .volatile, prorettype := ⟨4537⟩, proargtypes := [⟨3831⟩] }
    , { oid := ⟨6225⟩, proname := "multirange_agg_transfn", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨2281⟩, proargtypes := [⟨2281⟩, ⟨4537⟩] }
    , { oid := ⟨6226⟩, proname := "multirange_agg_finalfn", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨4537⟩, proargtypes := [⟨2281⟩, ⟨4537⟩] }
    , { oid := ⟨6227⟩, proname := "range_agg", pronamespace := pgCatalogNamespace.oid, prokind := .aggregate, prosecdef := false, provolatile := .volatile, prorettype := ⟨4537⟩, proargtypes := [⟨4537⟩] }
    , { oid := ⟨4388⟩, proname := "multirange_intersect_agg_transfn", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨4537⟩, proargtypes := [⟨4537⟩, ⟨4537⟩] }
    , { oid := ⟨4389⟩, proname := "range_intersect_agg", pronamespace := pgCatalogNamespace.oid, prokind := .aggregate, prosecdef := false, provolatile := .volatile, prorettype := ⟨4537⟩, proargtypes := [⟨4537⟩] }
    , { oid := ⟨1293⟩, proname := "unnest", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨3831⟩, proargtypes := [⟨4537⟩] }
    , { oid := ⟨3846⟩, proname := "make_date", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨1082⟩, proargtypes := [⟨23⟩, ⟨23⟩, ⟨23⟩] }
    , { oid := ⟨3847⟩, proname := "make_time", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨1083⟩, proargtypes := [⟨23⟩, ⟨23⟩, ⟨701⟩] }
    , { oid := ⟨3461⟩, proname := "make_timestamp", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨1114⟩, proargtypes := [⟨23⟩, ⟨23⟩, ⟨23⟩, ⟨23⟩, ⟨23⟩, ⟨701⟩] }
    , { oid := ⟨3462⟩, proname := "make_timestamptz", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨1184⟩, proargtypes := [⟨23⟩, ⟨23⟩, ⟨23⟩, ⟨23⟩, ⟨23⟩, ⟨701⟩] }
    , { oid := ⟨3463⟩, proname := "make_timestamptz", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨1184⟩, proargtypes := [⟨23⟩, ⟨23⟩, ⟨23⟩, ⟨23⟩, ⟨23⟩, ⟨701⟩, ⟨25⟩] }
    , { oid := ⟨3464⟩, proname := "make_interval", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨1186⟩, proargtypes := [⟨23⟩, ⟨23⟩, ⟨23⟩, ⟨23⟩, ⟨23⟩, ⟨23⟩, ⟨701⟩] }
    , { oid := ⟨4018⟩, proname := "spg_quad_config", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨2278⟩, proargtypes := [⟨2281⟩, ⟨2281⟩] }
    , { oid := ⟨4019⟩, proname := "spg_quad_choose", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨2278⟩, proargtypes := [⟨2281⟩, ⟨2281⟩] }
    , { oid := ⟨4020⟩, proname := "spg_quad_picksplit", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨2278⟩, proargtypes := [⟨2281⟩, ⟨2281⟩] }
    , { oid := ⟨4021⟩, proname := "spg_quad_inner_consistent", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨2278⟩, proargtypes := [⟨2281⟩, ⟨2281⟩] }
    , { oid := ⟨4022⟩, proname := "spg_quad_leaf_consistent", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨2281⟩, ⟨2281⟩] }
    , { oid := ⟨4023⟩, proname := "spg_kd_config", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨2278⟩, proargtypes := [⟨2281⟩, ⟨2281⟩] }
    , { oid := ⟨4024⟩, proname := "spg_kd_choose", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨2278⟩, proargtypes := [⟨2281⟩, ⟨2281⟩] }
    , { oid := ⟨4025⟩, proname := "spg_kd_picksplit", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨2278⟩, proargtypes := [⟨2281⟩, ⟨2281⟩] }
    , { oid := ⟨4026⟩, proname := "spg_kd_inner_consistent", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨2278⟩, proargtypes := [⟨2281⟩, ⟨2281⟩] }
    , { oid := ⟨4027⟩, proname := "spg_text_config", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨2278⟩, proargtypes := [⟨2281⟩, ⟨2281⟩] }
    , { oid := ⟨4028⟩, proname := "spg_text_choose", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨2278⟩, proargtypes := [⟨2281⟩, ⟨2281⟩] }
    , { oid := ⟨4029⟩, proname := "spg_text_picksplit", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨2278⟩, proargtypes := [⟨2281⟩, ⟨2281⟩] }
    , { oid := ⟨4030⟩, proname := "spg_text_inner_consistent", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨2278⟩, proargtypes := [⟨2281⟩, ⟨2281⟩] }
    , { oid := ⟨4031⟩, proname := "spg_text_leaf_consistent", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨2281⟩, ⟨2281⟩] }
    , { oid := ⟨3469⟩, proname := "spg_range_quad_config", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨2278⟩, proargtypes := [⟨2281⟩, ⟨2281⟩] }
    , { oid := ⟨3470⟩, proname := "spg_range_quad_choose", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨2278⟩, proargtypes := [⟨2281⟩, ⟨2281⟩] }
    , { oid := ⟨3471⟩, proname := "spg_range_quad_picksplit", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨2278⟩, proargtypes := [⟨2281⟩, ⟨2281⟩] }
    , { oid := ⟨3472⟩, proname := "spg_range_quad_inner_consistent", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨2278⟩, proargtypes := [⟨2281⟩, ⟨2281⟩] }
    , { oid := ⟨3473⟩, proname := "spg_range_quad_leaf_consistent", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨2281⟩, ⟨2281⟩] }
    , { oid := ⟨5012⟩, proname := "spg_box_quad_config", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨2278⟩, proargtypes := [⟨2281⟩, ⟨2281⟩] }
    , { oid := ⟨5013⟩, proname := "spg_box_quad_choose", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨2278⟩, proargtypes := [⟨2281⟩, ⟨2281⟩] }
    , { oid := ⟨5014⟩, proname := "spg_box_quad_picksplit", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨2278⟩, proargtypes := [⟨2281⟩, ⟨2281⟩] }
    , { oid := ⟨5015⟩, proname := "spg_box_quad_inner_consistent", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨2278⟩, proargtypes := [⟨2281⟩, ⟨2281⟩] }
    , { oid := ⟨5016⟩, proname := "spg_box_quad_leaf_consistent", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨2281⟩, ⟨2281⟩] }
    , { oid := ⟨5010⟩, proname := "spg_bbox_quad_config", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨2278⟩, proargtypes := [⟨2281⟩, ⟨2281⟩] }
    , { oid := ⟨5011⟩, proname := "spg_poly_quad_compress", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨603⟩, proargtypes := [⟨604⟩] }
    , { oid := ⟨3779⟩, proname := "pg_create_physical_replication_slot", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨2249⟩, proargtypes := [⟨19⟩, ⟨16⟩, ⟨16⟩] }
    , { oid := ⟨4220⟩, proname := "pg_copy_physical_replication_slot", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨2249⟩, proargtypes := [⟨19⟩, ⟨19⟩, ⟨16⟩] }
    , { oid := ⟨4221⟩, proname := "pg_copy_physical_replication_slot", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨2249⟩, proargtypes := [⟨19⟩, ⟨19⟩] }
    , { oid := ⟨3780⟩, proname := "pg_drop_replication_slot", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨2278⟩, proargtypes := [⟨19⟩] }
    , { oid := ⟨3781⟩, proname := "pg_get_replication_slots", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨2249⟩, proargtypes := [] }
    , { oid := ⟨3786⟩, proname := "pg_create_logical_replication_slot", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨2249⟩, proargtypes := [⟨19⟩, ⟨19⟩, ⟨16⟩, ⟨16⟩, ⟨16⟩] }
    , { oid := ⟨4222⟩, proname := "pg_copy_logical_replication_slot", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨2249⟩, proargtypes := [⟨19⟩, ⟨19⟩, ⟨16⟩, ⟨19⟩] }
    , { oid := ⟨4223⟩, proname := "pg_copy_logical_replication_slot", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨2249⟩, proargtypes := [⟨19⟩, ⟨19⟩, ⟨16⟩] }
    , { oid := ⟨4224⟩, proname := "pg_copy_logical_replication_slot", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨2249⟩, proargtypes := [⟨19⟩, ⟨19⟩] }
    , { oid := ⟨3782⟩, proname := "pg_logical_slot_get_changes", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨2249⟩, proargtypes := [⟨19⟩, ⟨3220⟩, ⟨23⟩, ⟨1009⟩] }
    , { oid := ⟨3783⟩, proname := "pg_logical_slot_get_binary_changes", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨2249⟩, proargtypes := [⟨19⟩, ⟨3220⟩, ⟨23⟩, ⟨1009⟩] }
    , { oid := ⟨3784⟩, proname := "pg_logical_slot_peek_changes", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨2249⟩, proargtypes := [⟨19⟩, ⟨3220⟩, ⟨23⟩, ⟨1009⟩] }
    , { oid := ⟨3785⟩, proname := "pg_logical_slot_peek_binary_changes", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨2249⟩, proargtypes := [⟨19⟩, ⟨3220⟩, ⟨23⟩, ⟨1009⟩] }
    , { oid := ⟨3878⟩, proname := "pg_replication_slot_advance", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨2249⟩, proargtypes := [⟨19⟩, ⟨3220⟩] }
    , { oid := ⟨3577⟩, proname := "pg_logical_emit_message", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨3220⟩, proargtypes := [⟨16⟩, ⟨25⟩, ⟨25⟩, ⟨16⟩] }
    , { oid := ⟨3578⟩, proname := "pg_logical_emit_message", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨3220⟩, proargtypes := [⟨16⟩, ⟨25⟩, ⟨17⟩, ⟨16⟩] }
    , { oid := ⟨6344⟩, proname := "pg_sync_replication_slots", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨2278⟩, proargtypes := [] }
    , { oid := ⟨3566⟩, proname := "pg_event_trigger_dropped_objects", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨2249⟩, proargtypes := [] }
    , { oid := ⟨4566⟩, proname := "pg_event_trigger_table_rewrite_oid", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨26⟩, proargtypes := [] }
    , { oid := ⟨4567⟩, proname := "pg_event_trigger_table_rewrite_reason", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨23⟩, proargtypes := [] }
    , { oid := ⟨4568⟩, proname := "pg_event_trigger_ddl_commands", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨2249⟩, proargtypes := [] }
    , { oid := ⟨3970⟩, proname := "ordered_set_transition", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨2281⟩, proargtypes := [⟨2281⟩, ⟨2276⟩] }
    , { oid := ⟨3971⟩, proname := "ordered_set_transition_multi", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨2281⟩, proargtypes := [⟨2281⟩, ⟨2276⟩] }
    , { oid := ⟨3972⟩, proname := "percentile_disc", pronamespace := pgCatalogNamespace.oid, prokind := .aggregate, prosecdef := false, provolatile := .volatile, prorettype := ⟨2283⟩, proargtypes := [⟨701⟩, ⟨2283⟩] }
    , { oid := ⟨3973⟩, proname := "percentile_disc_final", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨2283⟩, proargtypes := [⟨2281⟩, ⟨701⟩, ⟨2283⟩] }
    , { oid := ⟨3974⟩, proname := "percentile_cont", pronamespace := pgCatalogNamespace.oid, prokind := .aggregate, prosecdef := false, provolatile := .volatile, prorettype := ⟨701⟩, proargtypes := [⟨701⟩, ⟨701⟩] }
    , { oid := ⟨3975⟩, proname := "percentile_cont_float8_final", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨701⟩, proargtypes := [⟨2281⟩, ⟨701⟩] }
    , { oid := ⟨3976⟩, proname := "percentile_cont", pronamespace := pgCatalogNamespace.oid, prokind := .aggregate, prosecdef := false, provolatile := .volatile, prorettype := ⟨1186⟩, proargtypes := [⟨701⟩, ⟨1186⟩] }
    , { oid := ⟨3977⟩, proname := "percentile_cont_interval_final", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨1186⟩, proargtypes := [⟨2281⟩, ⟨701⟩] }
    , { oid := ⟨3978⟩, proname := "percentile_disc", pronamespace := pgCatalogNamespace.oid, prokind := .aggregate, prosecdef := false, provolatile := .volatile, prorettype := ⟨2277⟩, proargtypes := [⟨1022⟩, ⟨2283⟩] }
    , { oid := ⟨3979⟩, proname := "percentile_disc_multi_final", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨2277⟩, proargtypes := [⟨2281⟩, ⟨1022⟩, ⟨2283⟩] }
    , { oid := ⟨3980⟩, proname := "percentile_cont", pronamespace := pgCatalogNamespace.oid, prokind := .aggregate, prosecdef := false, provolatile := .volatile, prorettype := ⟨1022⟩, proargtypes := [⟨1022⟩, ⟨701⟩] }
    , { oid := ⟨3981⟩, proname := "percentile_cont_float8_multi_final", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨1022⟩, proargtypes := [⟨2281⟩, ⟨1022⟩] }
    , { oid := ⟨3982⟩, proname := "percentile_cont", pronamespace := pgCatalogNamespace.oid, prokind := .aggregate, prosecdef := false, provolatile := .volatile, prorettype := ⟨1187⟩, proargtypes := [⟨1022⟩, ⟨1186⟩] }
    , { oid := ⟨3983⟩, proname := "percentile_cont_interval_multi_final", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨1187⟩, proargtypes := [⟨2281⟩, ⟨1022⟩] }
    , { oid := ⟨3984⟩, proname := "mode", pronamespace := pgCatalogNamespace.oid, prokind := .aggregate, prosecdef := false, provolatile := .volatile, prorettype := ⟨2283⟩, proargtypes := [⟨2283⟩] }
    , { oid := ⟨3985⟩, proname := "mode_final", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨2283⟩, proargtypes := [⟨2281⟩, ⟨2283⟩] }
    , { oid := ⟨3986⟩, proname := "rank", pronamespace := pgCatalogNamespace.oid, prokind := .aggregate, prosecdef := false, provolatile := .volatile, prorettype := ⟨20⟩, proargtypes := [⟨2276⟩] }
    , { oid := ⟨3987⟩, proname := "rank_final", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨20⟩, proargtypes := [⟨2281⟩, ⟨2276⟩] }
    , { oid := ⟨3988⟩, proname := "percent_rank", pronamespace := pgCatalogNamespace.oid, prokind := .aggregate, prosecdef := false, provolatile := .volatile, prorettype := ⟨701⟩, proargtypes := [⟨2276⟩] }
    , { oid := ⟨3989⟩, proname := "percent_rank_final", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨701⟩, proargtypes := [⟨2281⟩, ⟨2276⟩] }
    , { oid := ⟨3990⟩, proname := "cume_dist", pronamespace := pgCatalogNamespace.oid, prokind := .aggregate, prosecdef := false, provolatile := .volatile, prorettype := ⟨701⟩, proargtypes := [⟨2276⟩] }
    , { oid := ⟨3991⟩, proname := "cume_dist_final", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨701⟩, proargtypes := [⟨2281⟩, ⟨2276⟩] }
    , { oid := ⟨3992⟩, proname := "dense_rank", pronamespace := pgCatalogNamespace.oid, prokind := .aggregate, prosecdef := false, provolatile := .volatile, prorettype := ⟨20⟩, proargtypes := [⟨2276⟩] }
    , { oid := ⟨3993⟩, proname := "dense_rank_final", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨20⟩, proargtypes := [⟨2281⟩, ⟨2276⟩] }
    , { oid := ⟨3582⟩, proname := "binary_upgrade_set_next_pg_type_oid", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨2278⟩, proargtypes := [⟨26⟩] }
    , { oid := ⟨3584⟩, proname := "binary_upgrade_set_next_array_pg_type_oid", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨2278⟩, proargtypes := [⟨26⟩] }
    , { oid := ⟨4390⟩, proname := "binary_upgrade_set_next_multirange_pg_type_oid", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨2278⟩, proargtypes := [⟨26⟩] }
    , { oid := ⟨4391⟩, proname := "binary_upgrade_set_next_multirange_array_pg_type_oid", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨2278⟩, proargtypes := [⟨26⟩] }
    , { oid := ⟨3586⟩, proname := "binary_upgrade_set_next_heap_pg_class_oid", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨2278⟩, proargtypes := [⟨26⟩] }
    , { oid := ⟨3587⟩, proname := "binary_upgrade_set_next_index_pg_class_oid", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨2278⟩, proargtypes := [⟨26⟩] }
    , { oid := ⟨3588⟩, proname := "binary_upgrade_set_next_toast_pg_class_oid", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨2278⟩, proargtypes := [⟨26⟩] }
    , { oid := ⟨3589⟩, proname := "binary_upgrade_set_next_pg_enum_oid", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨2278⟩, proargtypes := [⟨26⟩] }
    , { oid := ⟨3590⟩, proname := "binary_upgrade_set_next_pg_authid_oid", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨2278⟩, proargtypes := [⟨26⟩] }
    , { oid := ⟨3591⟩, proname := "binary_upgrade_create_empty_extension", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨2278⟩, proargtypes := [⟨25⟩, ⟨25⟩, ⟨16⟩, ⟨25⟩, ⟨1028⟩, ⟨1009⟩, ⟨1009⟩] }
    , { oid := ⟨4083⟩, proname := "binary_upgrade_set_record_init_privs", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨2278⟩, proargtypes := [⟨16⟩] }
    , { oid := ⟨4101⟩, proname := "binary_upgrade_set_missing_value", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨2278⟩, proargtypes := [⟨26⟩, ⟨25⟩, ⟨25⟩] }
    , { oid := ⟨4545⟩, proname := "binary_upgrade_set_next_heap_relfilenode", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨2278⟩, proargtypes := [⟨26⟩] }
    , { oid := ⟨4546⟩, proname := "binary_upgrade_set_next_index_relfilenode", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨2278⟩, proargtypes := [⟨26⟩] }
    , { oid := ⟨4547⟩, proname := "binary_upgrade_set_next_toast_relfilenode", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨2278⟩, proargtypes := [⟨26⟩] }
    , { oid := ⟨4548⟩, proname := "binary_upgrade_set_next_pg_tablespace_oid", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨2278⟩, proargtypes := [⟨26⟩] }
    , { oid := ⟨6312⟩, proname := "binary_upgrade_logical_slot_has_caught_up", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨19⟩] }
    , { oid := ⟨6319⟩, proname := "binary_upgrade_add_sub_rel_state", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨2278⟩, proargtypes := [⟨25⟩, ⟨26⟩, ⟨18⟩, ⟨3220⟩] }
    , { oid := ⟨6320⟩, proname := "binary_upgrade_replorigin_advance", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨2278⟩, proargtypes := [⟨25⟩, ⟨3220⟩] }
    , { oid := ⟨4302⟩, proname := "koi8r_to_mic", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨23⟩, proargtypes := [⟨23⟩, ⟨23⟩, ⟨2275⟩, ⟨2281⟩, ⟨23⟩, ⟨16⟩] }
    , { oid := ⟨4303⟩, proname := "mic_to_koi8r", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨23⟩, proargtypes := [⟨23⟩, ⟨23⟩, ⟨2275⟩, ⟨2281⟩, ⟨23⟩, ⟨16⟩] }
    , { oid := ⟨4304⟩, proname := "iso_to_mic", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨23⟩, proargtypes := [⟨23⟩, ⟨23⟩, ⟨2275⟩, ⟨2281⟩, ⟨23⟩, ⟨16⟩] }
    , { oid := ⟨4305⟩, proname := "mic_to_iso", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨23⟩, proargtypes := [⟨23⟩, ⟨23⟩, ⟨2275⟩, ⟨2281⟩, ⟨23⟩, ⟨16⟩] }
    , { oid := ⟨4306⟩, proname := "win1251_to_mic", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨23⟩, proargtypes := [⟨23⟩, ⟨23⟩, ⟨2275⟩, ⟨2281⟩, ⟨23⟩, ⟨16⟩] }
    , { oid := ⟨4307⟩, proname := "mic_to_win1251", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨23⟩, proargtypes := [⟨23⟩, ⟨23⟩, ⟨2275⟩, ⟨2281⟩, ⟨23⟩, ⟨16⟩] }
    , { oid := ⟨4308⟩, proname := "win866_to_mic", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨23⟩, proargtypes := [⟨23⟩, ⟨23⟩, ⟨2275⟩, ⟨2281⟩, ⟨23⟩, ⟨16⟩] }
    , { oid := ⟨4309⟩, proname := "mic_to_win866", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨23⟩, proargtypes := [⟨23⟩, ⟨23⟩, ⟨2275⟩, ⟨2281⟩, ⟨23⟩, ⟨16⟩] }
    , { oid := ⟨4310⟩, proname := "koi8r_to_win1251", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨23⟩, proargtypes := [⟨23⟩, ⟨23⟩, ⟨2275⟩, ⟨2281⟩, ⟨23⟩, ⟨16⟩] }
    , { oid := ⟨4311⟩, proname := "win1251_to_koi8r", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨23⟩, proargtypes := [⟨23⟩, ⟨23⟩, ⟨2275⟩, ⟨2281⟩, ⟨23⟩, ⟨16⟩] }
    , { oid := ⟨4312⟩, proname := "koi8r_to_win866", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨23⟩, proargtypes := [⟨23⟩, ⟨23⟩, ⟨2275⟩, ⟨2281⟩, ⟨23⟩, ⟨16⟩] }
    , { oid := ⟨4313⟩, proname := "win866_to_koi8r", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨23⟩, proargtypes := [⟨23⟩, ⟨23⟩, ⟨2275⟩, ⟨2281⟩, ⟨23⟩, ⟨16⟩] }
    , { oid := ⟨4314⟩, proname := "win866_to_win1251", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨23⟩, proargtypes := [⟨23⟩, ⟨23⟩, ⟨2275⟩, ⟨2281⟩, ⟨23⟩, ⟨16⟩] }
    , { oid := ⟨4315⟩, proname := "win1251_to_win866", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨23⟩, proargtypes := [⟨23⟩, ⟨23⟩, ⟨2275⟩, ⟨2281⟩, ⟨23⟩, ⟨16⟩] }
    , { oid := ⟨4316⟩, proname := "iso_to_koi8r", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨23⟩, proargtypes := [⟨23⟩, ⟨23⟩, ⟨2275⟩, ⟨2281⟩, ⟨23⟩, ⟨16⟩] }
    , { oid := ⟨4317⟩, proname := "koi8r_to_iso", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨23⟩, proargtypes := [⟨23⟩, ⟨23⟩, ⟨2275⟩, ⟨2281⟩, ⟨23⟩, ⟨16⟩] }
    , { oid := ⟨4318⟩, proname := "iso_to_win1251", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨23⟩, proargtypes := [⟨23⟩, ⟨23⟩, ⟨2275⟩, ⟨2281⟩, ⟨23⟩, ⟨16⟩] }
    , { oid := ⟨4319⟩, proname := "win1251_to_iso", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨23⟩, proargtypes := [⟨23⟩, ⟨23⟩, ⟨2275⟩, ⟨2281⟩, ⟨23⟩, ⟨16⟩] }
    , { oid := ⟨4320⟩, proname := "iso_to_win866", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨23⟩, proargtypes := [⟨23⟩, ⟨23⟩, ⟨2275⟩, ⟨2281⟩, ⟨23⟩, ⟨16⟩] }
    , { oid := ⟨4321⟩, proname := "win866_to_iso", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨23⟩, proargtypes := [⟨23⟩, ⟨23⟩, ⟨2275⟩, ⟨2281⟩, ⟨23⟩, ⟨16⟩] }
    , { oid := ⟨4322⟩, proname := "euc_cn_to_mic", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨23⟩, proargtypes := [⟨23⟩, ⟨23⟩, ⟨2275⟩, ⟨2281⟩, ⟨23⟩, ⟨16⟩] }
    , { oid := ⟨4323⟩, proname := "mic_to_euc_cn", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨23⟩, proargtypes := [⟨23⟩, ⟨23⟩, ⟨2275⟩, ⟨2281⟩, ⟨23⟩, ⟨16⟩] }
    , { oid := ⟨4324⟩, proname := "euc_jp_to_sjis", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨23⟩, proargtypes := [⟨23⟩, ⟨23⟩, ⟨2275⟩, ⟨2281⟩, ⟨23⟩, ⟨16⟩] }
    , { oid := ⟨4325⟩, proname := "sjis_to_euc_jp", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨23⟩, proargtypes := [⟨23⟩, ⟨23⟩, ⟨2275⟩, ⟨2281⟩, ⟨23⟩, ⟨16⟩] }
    , { oid := ⟨4326⟩, proname := "euc_jp_to_mic", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨23⟩, proargtypes := [⟨23⟩, ⟨23⟩, ⟨2275⟩, ⟨2281⟩, ⟨23⟩, ⟨16⟩] }
    , { oid := ⟨4327⟩, proname := "sjis_to_mic", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨23⟩, proargtypes := [⟨23⟩, ⟨23⟩, ⟨2275⟩, ⟨2281⟩, ⟨23⟩, ⟨16⟩] }
    , { oid := ⟨4328⟩, proname := "mic_to_euc_jp", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨23⟩, proargtypes := [⟨23⟩, ⟨23⟩, ⟨2275⟩, ⟨2281⟩, ⟨23⟩, ⟨16⟩] }
    , { oid := ⟨4329⟩, proname := "mic_to_sjis", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨23⟩, proargtypes := [⟨23⟩, ⟨23⟩, ⟨2275⟩, ⟨2281⟩, ⟨23⟩, ⟨16⟩] }
    , { oid := ⟨4330⟩, proname := "euc_kr_to_mic", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨23⟩, proargtypes := [⟨23⟩, ⟨23⟩, ⟨2275⟩, ⟨2281⟩, ⟨23⟩, ⟨16⟩] }
    , { oid := ⟨4331⟩, proname := "mic_to_euc_kr", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨23⟩, proargtypes := [⟨23⟩, ⟨23⟩, ⟨2275⟩, ⟨2281⟩, ⟨23⟩, ⟨16⟩] }
    , { oid := ⟨4332⟩, proname := "euc_tw_to_big5", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨23⟩, proargtypes := [⟨23⟩, ⟨23⟩, ⟨2275⟩, ⟨2281⟩, ⟨23⟩, ⟨16⟩] }
    , { oid := ⟨4333⟩, proname := "big5_to_euc_tw", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨23⟩, proargtypes := [⟨23⟩, ⟨23⟩, ⟨2275⟩, ⟨2281⟩, ⟨23⟩, ⟨16⟩] }
    , { oid := ⟨4334⟩, proname := "euc_tw_to_mic", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨23⟩, proargtypes := [⟨23⟩, ⟨23⟩, ⟨2275⟩, ⟨2281⟩, ⟨23⟩, ⟨16⟩] }
    , { oid := ⟨4335⟩, proname := "big5_to_mic", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨23⟩, proargtypes := [⟨23⟩, ⟨23⟩, ⟨2275⟩, ⟨2281⟩, ⟨23⟩, ⟨16⟩] }
    , { oid := ⟨4336⟩, proname := "mic_to_euc_tw", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨23⟩, proargtypes := [⟨23⟩, ⟨23⟩, ⟨2275⟩, ⟨2281⟩, ⟨23⟩, ⟨16⟩] }
    , { oid := ⟨4337⟩, proname := "mic_to_big5", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨23⟩, proargtypes := [⟨23⟩, ⟨23⟩, ⟨2275⟩, ⟨2281⟩, ⟨23⟩, ⟨16⟩] }
    , { oid := ⟨4338⟩, proname := "latin2_to_mic", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨23⟩, proargtypes := [⟨23⟩, ⟨23⟩, ⟨2275⟩, ⟨2281⟩, ⟨23⟩, ⟨16⟩] }
    , { oid := ⟨4339⟩, proname := "mic_to_latin2", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨23⟩, proargtypes := [⟨23⟩, ⟨23⟩, ⟨2275⟩, ⟨2281⟩, ⟨23⟩, ⟨16⟩] }
    , { oid := ⟨4340⟩, proname := "win1250_to_mic", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨23⟩, proargtypes := [⟨23⟩, ⟨23⟩, ⟨2275⟩, ⟨2281⟩, ⟨23⟩, ⟨16⟩] }
    , { oid := ⟨4341⟩, proname := "mic_to_win1250", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨23⟩, proargtypes := [⟨23⟩, ⟨23⟩, ⟨2275⟩, ⟨2281⟩, ⟨23⟩, ⟨16⟩] }
    , { oid := ⟨4342⟩, proname := "latin2_to_win1250", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨23⟩, proargtypes := [⟨23⟩, ⟨23⟩, ⟨2275⟩, ⟨2281⟩, ⟨23⟩, ⟨16⟩] }
    , { oid := ⟨4343⟩, proname := "win1250_to_latin2", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨23⟩, proargtypes := [⟨23⟩, ⟨23⟩, ⟨2275⟩, ⟨2281⟩, ⟨23⟩, ⟨16⟩] }
    , { oid := ⟨4344⟩, proname := "latin1_to_mic", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨23⟩, proargtypes := [⟨23⟩, ⟨23⟩, ⟨2275⟩, ⟨2281⟩, ⟨23⟩, ⟨16⟩] }
    , { oid := ⟨4345⟩, proname := "mic_to_latin1", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨23⟩, proargtypes := [⟨23⟩, ⟨23⟩, ⟨2275⟩, ⟨2281⟩, ⟨23⟩, ⟨16⟩] }
    , { oid := ⟨4346⟩, proname := "latin3_to_mic", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨23⟩, proargtypes := [⟨23⟩, ⟨23⟩, ⟨2275⟩, ⟨2281⟩, ⟨23⟩, ⟨16⟩] }
    , { oid := ⟨4347⟩, proname := "mic_to_latin3", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨23⟩, proargtypes := [⟨23⟩, ⟨23⟩, ⟨2275⟩, ⟨2281⟩, ⟨23⟩, ⟨16⟩] }
    , { oid := ⟨4348⟩, proname := "latin4_to_mic", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨23⟩, proargtypes := [⟨23⟩, ⟨23⟩, ⟨2275⟩, ⟨2281⟩, ⟨23⟩, ⟨16⟩] }
    , { oid := ⟨4349⟩, proname := "mic_to_latin4", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨23⟩, proargtypes := [⟨23⟩, ⟨23⟩, ⟨2275⟩, ⟨2281⟩, ⟨23⟩, ⟨16⟩] }
    , { oid := ⟨4352⟩, proname := "big5_to_utf8", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨23⟩, proargtypes := [⟨23⟩, ⟨23⟩, ⟨2275⟩, ⟨2281⟩, ⟨23⟩, ⟨16⟩] }
    , { oid := ⟨4353⟩, proname := "utf8_to_big5", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨23⟩, proargtypes := [⟨23⟩, ⟨23⟩, ⟨2275⟩, ⟨2281⟩, ⟨23⟩, ⟨16⟩] }
    , { oid := ⟨4354⟩, proname := "utf8_to_koi8r", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨23⟩, proargtypes := [⟨23⟩, ⟨23⟩, ⟨2275⟩, ⟨2281⟩, ⟨23⟩, ⟨16⟩] }
    , { oid := ⟨4355⟩, proname := "koi8r_to_utf8", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨23⟩, proargtypes := [⟨23⟩, ⟨23⟩, ⟨2275⟩, ⟨2281⟩, ⟨23⟩, ⟨16⟩] }
    , { oid := ⟨4356⟩, proname := "utf8_to_koi8u", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨23⟩, proargtypes := [⟨23⟩, ⟨23⟩, ⟨2275⟩, ⟨2281⟩, ⟨23⟩, ⟨16⟩] }
    , { oid := ⟨4357⟩, proname := "koi8u_to_utf8", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨23⟩, proargtypes := [⟨23⟩, ⟨23⟩, ⟨2275⟩, ⟨2281⟩, ⟨23⟩, ⟨16⟩] }
    , { oid := ⟨4358⟩, proname := "utf8_to_win", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨23⟩, proargtypes := [⟨23⟩, ⟨23⟩, ⟨2275⟩, ⟨2281⟩, ⟨23⟩, ⟨16⟩] }
    , { oid := ⟨4359⟩, proname := "win_to_utf8", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨23⟩, proargtypes := [⟨23⟩, ⟨23⟩, ⟨2275⟩, ⟨2281⟩, ⟨23⟩, ⟨16⟩] }
    , { oid := ⟨4360⟩, proname := "euc_cn_to_utf8", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨23⟩, proargtypes := [⟨23⟩, ⟨23⟩, ⟨2275⟩, ⟨2281⟩, ⟨23⟩, ⟨16⟩] }
    , { oid := ⟨4361⟩, proname := "utf8_to_euc_cn", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨23⟩, proargtypes := [⟨23⟩, ⟨23⟩, ⟨2275⟩, ⟨2281⟩, ⟨23⟩, ⟨16⟩] }
    , { oid := ⟨4362⟩, proname := "euc_jp_to_utf8", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨23⟩, proargtypes := [⟨23⟩, ⟨23⟩, ⟨2275⟩, ⟨2281⟩, ⟨23⟩, ⟨16⟩] }
    , { oid := ⟨4363⟩, proname := "utf8_to_euc_jp", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨23⟩, proargtypes := [⟨23⟩, ⟨23⟩, ⟨2275⟩, ⟨2281⟩, ⟨23⟩, ⟨16⟩] }
    , { oid := ⟨4364⟩, proname := "euc_kr_to_utf8", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨23⟩, proargtypes := [⟨23⟩, ⟨23⟩, ⟨2275⟩, ⟨2281⟩, ⟨23⟩, ⟨16⟩] }
    , { oid := ⟨4365⟩, proname := "utf8_to_euc_kr", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨23⟩, proargtypes := [⟨23⟩, ⟨23⟩, ⟨2275⟩, ⟨2281⟩, ⟨23⟩, ⟨16⟩] }
    , { oid := ⟨4366⟩, proname := "euc_tw_to_utf8", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨23⟩, proargtypes := [⟨23⟩, ⟨23⟩, ⟨2275⟩, ⟨2281⟩, ⟨23⟩, ⟨16⟩] }
    , { oid := ⟨4367⟩, proname := "utf8_to_euc_tw", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨23⟩, proargtypes := [⟨23⟩, ⟨23⟩, ⟨2275⟩, ⟨2281⟩, ⟨23⟩, ⟨16⟩] }
    , { oid := ⟨4368⟩, proname := "gb18030_to_utf8", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨23⟩, proargtypes := [⟨23⟩, ⟨23⟩, ⟨2275⟩, ⟨2281⟩, ⟨23⟩, ⟨16⟩] }
    , { oid := ⟨4369⟩, proname := "utf8_to_gb18030", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨23⟩, proargtypes := [⟨23⟩, ⟨23⟩, ⟨2275⟩, ⟨2281⟩, ⟨23⟩, ⟨16⟩] }
    , { oid := ⟨4370⟩, proname := "gbk_to_utf8", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨23⟩, proargtypes := [⟨23⟩, ⟨23⟩, ⟨2275⟩, ⟨2281⟩, ⟨23⟩, ⟨16⟩] }
    , { oid := ⟨4371⟩, proname := "utf8_to_gbk", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨23⟩, proargtypes := [⟨23⟩, ⟨23⟩, ⟨2275⟩, ⟨2281⟩, ⟨23⟩, ⟨16⟩] }
    , { oid := ⟨4372⟩, proname := "utf8_to_iso8859", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨23⟩, proargtypes := [⟨23⟩, ⟨23⟩, ⟨2275⟩, ⟨2281⟩, ⟨23⟩, ⟨16⟩] }
    , { oid := ⟨4373⟩, proname := "iso8859_to_utf8", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨23⟩, proargtypes := [⟨23⟩, ⟨23⟩, ⟨2275⟩, ⟨2281⟩, ⟨23⟩, ⟨16⟩] }
    , { oid := ⟨4374⟩, proname := "iso8859_1_to_utf8", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨23⟩, proargtypes := [⟨23⟩, ⟨23⟩, ⟨2275⟩, ⟨2281⟩, ⟨23⟩, ⟨16⟩] }
    , { oid := ⟨4375⟩, proname := "utf8_to_iso8859_1", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨23⟩, proargtypes := [⟨23⟩, ⟨23⟩, ⟨2275⟩, ⟨2281⟩, ⟨23⟩, ⟨16⟩] }
    , { oid := ⟨4376⟩, proname := "johab_to_utf8", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨23⟩, proargtypes := [⟨23⟩, ⟨23⟩, ⟨2275⟩, ⟨2281⟩, ⟨23⟩, ⟨16⟩] }
    , { oid := ⟨4377⟩, proname := "utf8_to_johab", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨23⟩, proargtypes := [⟨23⟩, ⟨23⟩, ⟨2275⟩, ⟨2281⟩, ⟨23⟩, ⟨16⟩] }
    , { oid := ⟨4378⟩, proname := "sjis_to_utf8", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨23⟩, proargtypes := [⟨23⟩, ⟨23⟩, ⟨2275⟩, ⟨2281⟩, ⟨23⟩, ⟨16⟩] }
    , { oid := ⟨4379⟩, proname := "utf8_to_sjis", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨23⟩, proargtypes := [⟨23⟩, ⟨23⟩, ⟨2275⟩, ⟨2281⟩, ⟨23⟩, ⟨16⟩] }
    , { oid := ⟨4380⟩, proname := "uhc_to_utf8", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨23⟩, proargtypes := [⟨23⟩, ⟨23⟩, ⟨2275⟩, ⟨2281⟩, ⟨23⟩, ⟨16⟩] }
    , { oid := ⟨4381⟩, proname := "utf8_to_uhc", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨23⟩, proargtypes := [⟨23⟩, ⟨23⟩, ⟨2275⟩, ⟨2281⟩, ⟨23⟩, ⟨16⟩] }
    , { oid := ⟨4382⟩, proname := "euc_jis_2004_to_utf8", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨23⟩, proargtypes := [⟨23⟩, ⟨23⟩, ⟨2275⟩, ⟨2281⟩, ⟨23⟩, ⟨16⟩] }
    , { oid := ⟨4383⟩, proname := "utf8_to_euc_jis_2004", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨23⟩, proargtypes := [⟨23⟩, ⟨23⟩, ⟨2275⟩, ⟨2281⟩, ⟨23⟩, ⟨16⟩] }
    , { oid := ⟨4384⟩, proname := "shift_jis_2004_to_utf8", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨23⟩, proargtypes := [⟨23⟩, ⟨23⟩, ⟨2275⟩, ⟨2281⟩, ⟨23⟩, ⟨16⟩] }
    , { oid := ⟨4385⟩, proname := "utf8_to_shift_jis_2004", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨23⟩, proargtypes := [⟨23⟩, ⟨23⟩, ⟨2275⟩, ⟨2281⟩, ⟨23⟩, ⟨16⟩] }
    , { oid := ⟨4386⟩, proname := "euc_jis_2004_to_shift_jis_2004", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨23⟩, proargtypes := [⟨23⟩, ⟨23⟩, ⟨2275⟩, ⟨2281⟩, ⟨23⟩, ⟨16⟩] }
    , { oid := ⟨4387⟩, proname := "shift_jis_2004_to_euc_jis_2004", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨23⟩, proargtypes := [⟨23⟩, ⟨23⟩, ⟨2275⟩, ⟨2281⟩, ⟨23⟩, ⟨16⟩] }
    , { oid := ⟨5040⟩, proname := "matchingsel", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨701⟩, proargtypes := [⟨2281⟩, ⟨26⟩, ⟨2281⟩, ⟨23⟩] }
    , { oid := ⟨5041⟩, proname := "matchingjoinsel", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨701⟩, proargtypes := [⟨2281⟩, ⟨26⟩, ⟨2281⟩, ⟨21⟩, ⟨2281⟩] }
    , { oid := ⟨6003⟩, proname := "pg_replication_origin_create", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨26⟩, proargtypes := [⟨25⟩] }
    , { oid := ⟨6004⟩, proname := "pg_replication_origin_drop", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨2278⟩, proargtypes := [⟨25⟩] }
    , { oid := ⟨6005⟩, proname := "pg_replication_origin_oid", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨26⟩, proargtypes := [⟨25⟩] }
    , { oid := ⟨6006⟩, proname := "pg_replication_origin_session_setup", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨2278⟩, proargtypes := [⟨25⟩] }
    , { oid := ⟨6007⟩, proname := "pg_replication_origin_session_reset", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨2278⟩, proargtypes := [] }
    , { oid := ⟨6008⟩, proname := "pg_replication_origin_session_is_setup", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [] }
    , { oid := ⟨6009⟩, proname := "pg_replication_origin_session_progress", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨3220⟩, proargtypes := [⟨16⟩] }
    , { oid := ⟨6010⟩, proname := "pg_replication_origin_xact_setup", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨2278⟩, proargtypes := [⟨3220⟩, ⟨1184⟩] }
    , { oid := ⟨6011⟩, proname := "pg_replication_origin_xact_reset", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨2278⟩, proargtypes := [] }
    , { oid := ⟨6012⟩, proname := "pg_replication_origin_advance", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨2278⟩, proargtypes := [⟨25⟩, ⟨3220⟩] }
    , { oid := ⟨6013⟩, proname := "pg_replication_origin_progress", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨3220⟩, proargtypes := [⟨25⟩, ⟨16⟩] }
    , { oid := ⟨6014⟩, proname := "pg_show_replication_origin_status", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨2249⟩, proargtypes := [] }
    , { oid := ⟨6119⟩, proname := "pg_get_publication_tables", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨2249⟩, proargtypes := [⟨1009⟩] }
    , { oid := ⟨6121⟩, proname := "pg_relation_is_publishable", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨16⟩, proargtypes := [⟨2205⟩] }
    , { oid := ⟨3298⟩, proname := "row_security_active", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨16⟩, proargtypes := [⟨26⟩] }
    , { oid := ⟨3299⟩, proname := "row_security_active", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨16⟩, proargtypes := [⟨25⟩] }
    , { oid := ⟨3400⟩, proname := "pg_config", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨2249⟩, proargtypes := [] }
    , { oid := ⟨3441⟩, proname := "pg_control_system", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨2249⟩, proargtypes := [] }
    , { oid := ⟨3442⟩, proname := "pg_control_checkpoint", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨2249⟩, proargtypes := [] }
    , { oid := ⟨3443⟩, proname := "pg_control_recovery", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨2249⟩, proargtypes := [] }
    , { oid := ⟨3444⟩, proname := "pg_control_init", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨2249⟩, proargtypes := [] }
    , { oid := ⟨6179⟩, proname := "array_subscript_handler", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨2281⟩, proargtypes := [⟨2281⟩] }
    , { oid := ⟨6180⟩, proname := "raw_array_subscript_handler", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨2281⟩, proargtypes := [⟨2281⟩] }
    , { oid := ⟨6098⟩, proname := "jsonb_subscript_handler", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨2281⟩, proargtypes := [⟨2281⟩] }
    , { oid := ⟨3445⟩, proname := "pg_import_system_collations", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨23⟩, proargtypes := [⟨4089⟩] }
    , { oid := ⟨3448⟩, proname := "pg_collation_actual_version", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨25⟩, proargtypes := [⟨26⟩] }
    , { oid := ⟨6249⟩, proname := "pg_database_collation_actual_version", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨25⟩, proargtypes := [⟨26⟩] }
    , { oid := ⟨3353⟩, proname := "pg_ls_logdir", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨2249⟩, proargtypes := [] }
    , { oid := ⟨3354⟩, proname := "pg_ls_waldir", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨2249⟩, proargtypes := [] }
    , { oid := ⟨5031⟩, proname := "pg_ls_archive_statusdir", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨2249⟩, proargtypes := [] }
    , { oid := ⟨5029⟩, proname := "pg_ls_tmpdir", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨2249⟩, proargtypes := [] }
    , { oid := ⟨5030⟩, proname := "pg_ls_tmpdir", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨2249⟩, proargtypes := [⟨26⟩] }
    , { oid := ⟨6270⟩, proname := "pg_ls_logicalsnapdir", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨2249⟩, proargtypes := [] }
    , { oid := ⟨6271⟩, proname := "pg_ls_logicalmapdir", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨2249⟩, proargtypes := [] }
    , { oid := ⟨6272⟩, proname := "pg_ls_replslotdir", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨2249⟩, proargtypes := [⟨25⟩] }
    , { oid := ⟨5028⟩, proname := "satisfies_hash_partition", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨26⟩, ⟨23⟩, ⟨23⟩, ⟨2276⟩] }
    , { oid := ⟨3423⟩, proname := "pg_partition_tree", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨2249⟩, proargtypes := [⟨2205⟩] }
    , { oid := ⟨3425⟩, proname := "pg_partition_ancestors", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨2205⟩, proargtypes := [⟨2205⟩] }
    , { oid := ⟨3424⟩, proname := "pg_partition_root", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨2205⟩, proargtypes := [⟨2205⟩] }
    , { oid := ⟨4549⟩, proname := "unicode_version", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨25⟩, proargtypes := [] }
    , { oid := ⟨6099⟩, proname := "icu_unicode_version", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨25⟩, proargtypes := [] }
    , { oid := ⟨6105⟩, proname := "unicode_assigned", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨25⟩] }
    , { oid := ⟨4350⟩, proname := "normalize", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨25⟩, proargtypes := [⟨25⟩, ⟨25⟩] }
    , { oid := ⟨4351⟩, proname := "is_normalized", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨16⟩, proargtypes := [⟨25⟩, ⟨25⟩] }
    , { oid := ⟨6198⟩, proname := "unistr", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨25⟩, proargtypes := [⟨25⟩] }
    , { oid := ⟨4596⟩, proname := "brin_bloom_summary_in", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨4600⟩, proargtypes := [⟨2275⟩] }
    , { oid := ⟨4597⟩, proname := "brin_bloom_summary_out", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨2275⟩, proargtypes := [⟨4600⟩] }
    , { oid := ⟨4598⟩, proname := "brin_bloom_summary_recv", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨4600⟩, proargtypes := [⟨2281⟩] }
    , { oid := ⟨4599⟩, proname := "brin_bloom_summary_send", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨17⟩, proargtypes := [⟨4600⟩] }
    , { oid := ⟨4638⟩, proname := "brin_minmax_multi_summary_in", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨4601⟩, proargtypes := [⟨2275⟩] }
    , { oid := ⟨4639⟩, proname := "brin_minmax_multi_summary_out", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨2275⟩, proargtypes := [⟨4601⟩] }
    , { oid := ⟨4640⟩, proname := "brin_minmax_multi_summary_recv", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨4601⟩, proargtypes := [⟨2281⟩] }
    , { oid := ⟨4641⟩, proname := "brin_minmax_multi_summary_send", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .stable, prorettype := ⟨17⟩, proargtypes := [⟨4601⟩] }
    , { oid := ⟨6291⟩, proname := "any_value", pronamespace := pgCatalogNamespace.oid, prokind := .aggregate, prosecdef := false, provolatile := .volatile, prorettype := ⟨2283⟩, proargtypes := [⟨2283⟩] }
    , { oid := ⟨6292⟩, proname := "any_value_transfn", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨2283⟩, proargtypes := [⟨2283⟩, ⟨2283⟩] }
    , { oid := ⟨6321⟩, proname := "pg_available_wal_summaries", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨2249⟩, proargtypes := [] }
    , { oid := ⟨6322⟩, proname := "pg_wal_summary_contents", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨2249⟩, proargtypes := [⟨20⟩, ⟨3220⟩, ⟨3220⟩] }
    , { oid := ⟨6323⟩, proname := "pg_get_wal_summarizer_state", pronamespace := pgCatalogNamespace.oid, prokind := .function, prosecdef := false, provolatile := .volatile, prorettype := ⟨2249⟩, proargtypes := [] }
    ]
  }

end Pg.Catalog.Generated
