# Product context

**Setup status:** Incomplete
**Last verified:**

Status values: `ready`, `partial`, `blocked`, or `not-needed`. A source is executable-ready only when it is authorized and scoped, the current runtime can address its non-secret invocation handle or supplied artifact, and an agent has observed a bounded read. A user-reported prior smoke test alone is not executable readiness.

Setup status values: `Incomplete`, `Trial`, or `Complete`. Trial values carry a tag: `(public: <url>, <YYYY-MM-DD>, read|inferred, unconfirmed|confirmed)`.

## Company and product

- Company:
- Product:
- Product stage:
- Current strategy or goals:
- Source:

## Users and personas

- Primary users:
- Important roles:
- Persona or research source:

## Product documentation

- Documentation source:
- Roadmap source:
- Research repository:

## Time and reporting conventions

- Default timezone:
- Week starts on:
- Calendar type: Calendar / Fiscal
- Fiscal year starts:
- Default comparison convention:

## Source readiness

| Source ID | Evidence type | Non-secret pointer | Invocation handle or supplied artifact | Connected | Authenticated | User-reported verification | Runtime-addressable now | Agent-observed verification | Status |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
| | | | | No | Unknown | Not reported | No | Not run | blocked |

### Source boundaries and verification

| Source ID | Authorized | Allowed scope and absolute authorization window | Access | Observed smoke test and absolute last-verified time | Freshness expectation | Privacy or retention boundary | Owner |
| --- | --- | --- | --- | --- | --- | --- | --- |
| | Unknown | | unknown | Not run | | | |

Access should state `read`, `write`, `read/write`, or `unknown`. Runtime-addressable means callable now through the recorded handle or readable now as the supplied artifact. A successful login, source name, or user report alone does not make a source ready.

## Evidence channels

- Support-ticket source:
- Team communication source:
- Meeting notes, transcripts, or calendar source:
- Default evidence retention or privacy constraints:

## Communication style

- Style guide source:
- Default audience:
- Preferred tone:
- Preferred update format:
- Terminology or phrases to use or avoid:

## Metrics and data

- Event dictionary source:
- Data dictionary or schema source:
- Data access notes:

### Metric definitions

| Metric | Business meaning | Grain | Entry or numerator | Return behavior or denominator | Window and maturity rule | Decision threshold or minimum sample | Exclusions | Source of truth | Owner | Last confirmed |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
| | | | | | | | | | | |

### Entity definitions

| Entity | Definition | Primary identifier | Source of truth | Historical or lifecycle behavior |
| --- | --- | --- | --- | --- |
| | | | | |

### Identity mappings

| From entity/source | To entity/source | Join key or method | Cardinality | Historical behavior | Confidence or owner |
| --- | --- | --- | --- | --- | --- |
| | | | | | |

Never infer a join from similar names, emails, or timestamps.

### Longitudinal identity and lifecycle

- Stable cohort identity:
- Cohort identity assignment time:
- Account/workspace merge treatment:
- Account/workspace split treatment:
- Deleted, restored, or reactivated entity treatment:
- Ambiguous-identity fallback: Block when task-critical; otherwise exclude ambiguous entities and report a sensitivity analysis
- Confirmed by and date:

Keep longitudinal account- or workspace-grain analytics and queries partial or blocked until the stable cohort identity and task-critical merge/split treatment are confirmed.

### Product terminology

| Canonical term | Aliases | Definition | Source |
| --- | --- | --- | --- |
| | | | |

## Test and internal activity

- Test account definition:
- Employee/internal account definition:
- Bot or demo account definition:
- Credential environment variables:
- Analytics exclusion rule:

## QA personas

Record environment-variable names only, never secret values.

| Persona or role | Environment | Username variable | Password variable | Allowed actions or limits | Status |
| --- | --- | --- | --- | --- | --- |
| | | | | | |

With user permission, the setup agent may append only missing blank declarations to a git-ignored, untracked local `.env`. It must inspect declaration names only and never inspect, overwrite, or print values. Until the required declarations and safe test access are agent-observed, keep QA partial.

## Design and prototyping

- Design system:
- Existing product or prototype:

## Available access

List available capabilities without storing credentials.

- MCP connectors:
- CLIs:
- Local files:
- Browser or QA tools:

## Skill readiness

| Skill or capability | Required source IDs | Required definitions | Status | Gap or next step | Last checked |
| --- | --- | --- | --- | --- | --- |
| | | | blocked | | |

## Self-improvement

- Mode: suggest
- Allowed automatic scope: Existing skills and folder rules, when supported by an explicit reusable correction or a confirmed failed acceptance check
- Approval required for: New files, dependencies, scripts, external actions, permission or security changes, destructive actions, inferred broad changes

## Known gaps

- Company, product, and user context are not configured.
- No source has been authorized, scoped, or verified for this workspace.
- Metric, entity, identity, time, privacy, exclusion, and QA-role conventions are incomplete.
