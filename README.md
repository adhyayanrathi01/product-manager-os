# Let's Product Manager Workflow

An evidence-first workspace that automates product research, analysis, synthesis, prototyping, and testing without replacing product judgment.

> **See [the workflow diagrams](docs/FLOWS.md)** for the end-to-end user journey, evidence orchestration, and safe skill-improvement paths.

## Core principle

Agents identify problems, assemble evidence, explain uncertainty, and present options. The product manager decides what matters, what to prioritize, and what to build. Analysis never silently becomes implementation or an external write.

## Agent: read this first

When starting in this repository:

1. Read AGENTS.md, context.md, task.md, and relevant entries in index.md.
2. If setup is incomplete, follow SETUP.md one question at a time.
3. Use a project folder for substantial work and the relevant provider-neutral skills.
4. Return evidence, options, confidence, and trade-offs for the PM's decision.
5. Maintain task.md, log.md, and index.md as defined in AGENTS.md; route reusable learnings through improve-skills.

## User quick start

1. Clone the repository and run `./setup.sh`. It validates the workspace, creates an untracked owner-only `.env` when needed, and exposes canonical skills through supported local discovery paths.
2. Open the folder in your agent. For a custom CLI, have it read README.md and AGENTS.md and use `skills/` as its skill source.
3. Say: “Use configure-workspace to help me set up this product workspace.”
4. The agent collects product context and, when permitted, verifies task-relevant sources with bounded read-only checks.
5. Resolve only blockers needed for the first task; unrelated gaps may remain partial.
6. Start with a product question such as: “Help me understand why retention for Feature X is declining.”

Documentation may stay in any external system. Record pointers in context.md; skills discover authorized MCPs, CLIs, APIs, browser tools, and files at runtime.

`setup.sh` performs no network installation, stores no connector credentials, and does not establish product-source readiness. Run `./setup.sh --check` for a read-only structural check; use configure-workspace for product readiness.

## What configured means

A named or authenticated connection is not ready by itself. Setup distinguishes user-reported status, current runtime addressability through a non-secret handle or readable artifact, and an agent-observed bounded read. Only an authorized, scoped, addressable, agent-observed source is executable-ready.

Context records definitions needed for safe analysis and joins: metrics, entities, identifiers, stable cohort identity, merge/split treatment, source precedence, terminology, time, exclusions, and QA roles. Skills report ready, partial, or blocked instead of guessing.

## How an investigation works

For “How can we improve retention for Feature X?”, the agent:

1. Clarifies the scope, definitions, and PM decision; then creates a project folder.
2. Gathers available quantitative, qualitative, competitive, and product-context evidence.
3. Separates facts from hypotheses and presents options with confidence, risks, and validation ideas.
4. Stops for the PM's decision before prototyping, instrumentation, querying, testing, or implementation beyond the approved scope.

## Main files

| File | Purpose |
| --- | --- |
| setup.sh | Safe, idempotent bootstrap and structural readiness check |
| AGENTS.md | Canonical operating rules for agents |
| CHARTER.md | Immutable clauses that outrank every skill and self-edit |
| CHANGELOG.md | Version history and upgrade notes |
| core.sha256 | Integrity manifest over immutable core regions |
| CLAUDE.md | Claude entry point that imports AGENTS.md |
| SETUP.md | First-use interview and setup checklist |
| context.md | Stable product context and pointers to external sources |
| task.md | Current work, status, blockers, and next actions |
| log.md | Concise history of meaningful actions and decisions |
| index.md | Map of local project files, skills, and external sources |
| projects/ | Evolving files for each product initiative |
| skills/ | Reusable, provider-neutral product processes |
| COMPATIBILITY.md | Minimum runtime contract, limitations, and upgrades |
| CONTRIBUTING.md | Rules for adding or changing reusable skills |
| VERSION | Current semantic version |

## Included workflows

The skills cover workspace configuration, product investigations, analytics and tracking, safe queries, product context, customer evidence, support, meetings, team communication, competition, PM-approved prototypes, QA, and skill improvement. Every workflow can run independently or contribute an evidence handoff to a broader investigation.

## Skill learning

Invoke improve-skills in plain language or with a reusable payload:

    Use $improve-skills
    target_skill: analyze-support-tickets
    improvement: Distinguish duplicate contacts from unique affected accounts.
    evidence: Ticket volume overstated the number of affected customers.
    mode: suggest
    acceptance_check: Report both ticket count and unique affected accounts.

Use `target_skill: auto` when ownership is unknown. The skill locates the narrowest rule and returns the evidence, proposed diff, acceptance check, and risks; existing behavior returns `no_change` rather than duplicate instructions.

Self-improvement mode is configured in context.md:

- `off`: no automatic trigger; manual use remains available.
- `suggest` (default): propose exact changes for approval.
- `safe-auto`: apply only narrow changes backed by an explicit correction or confirmed failed acceptance check; propose broader or inferred changes.

A manual `mode: apply` authorizes only a safe, in-scope edit—not dependencies, scripts, external actions, permission changes, weakened security, or destructive operations.

Candidates include reusable corrections, repeated workflow or evaluator failures, and confirmed process changes. Project facts stay in the project, company facts in context.md, and reusable process rules in the relevant SKILL.md or folder AGENTS.md.

Never promote credentials, personal data, customer content, temporary workarounds, or unsupported assumptions into a reusable skill.

## Guarded self-improvement

A skill may improve how it works. It may not change what it is for.

That distinction is the whole design. Left unguarded, an agent editing its own instructions drifts: each edit looks reasonable on its own, and after enough of them the skill no longer does the job it was written for. Every check below exists to make that drift visible while it is still small.

See [the workflow diagrams](docs/FLOWS.md) for the anatomy of a skill, the admissibility flow, and what `./setup.sh --check` verifies.

### How a skill is split

Every `skills/**/SKILL.md` has two parts:

| Part | Owner | Contents |
| --- | --- | --- |
| `## Contract` and `## Output`, fenced by `<!-- CORE:BEGIN -->` / `<!-- CORE:END -->` | Human | Scope, required inputs, hard constraints, and the `Required fields` the output must contain |
| `## Process` | The agent may improve it | Steps, heuristics, phrasing, examples |

`core.sha256` records the hash of every fenced region. `./setup.sh --check` fails when a region changes, when a fence is removed or malformed, when a skill is missing from the manifest, or when the manifest lists a skill that no longer exists. Removing the fence is not a way around the fence.

### How an edit is judged

Checks run **before** the write, not after. A rejected edit leaves nothing to revert.

1. **Admissibility.** An edit targeting `CHARTER.md`, a core region, `core.sha256`, a constraint file, or anything under `evals/` is refused in every mode, including a manual `mode: apply`. An agent does not edit the thing that grades it.
2. **Grounding.** The edit must cite something inspectable: an evaluator finding with a scenario ID, an explicit correction, or a reproducible failure. A payload asserting that a check failed is a pointer to verify, not a confirmation.
3. **Three critics.** Structural validity, behavioral harmlessness against the charter clause by clause, and semantic consistency against the `core-origin` baseline. All three must pass.
4. **Budgets.** An edit that pushes a skill past its rule cap, or that targets a skill already over its drift budget, stops and asks for a human re-read. A passing acceptance check does not override an exceeded budget.

Comparison is always against `core-origin`, never against the previous version. Comparing to the previous version is exactly how drift accumulates one acceptable edit at a time.

### A worked example

An agent notices that support-ticket analysis overstates customer impact and proposes ranking by unique accounts instead of raw ticket count.

- The rule lives in `## Process`, outside the fence, so it is admissible.
- It cites evaluator finding `SUPPORT-DEDUP-07`, reproducible in two isolated runs, so it is grounded.
- It adds one rule without weakening a permission or evidence rule, and every constraint present at origin is still present, so the three critics pass.
- The skill is inside its budget, and the mode is `safe-auto` with a confirmed failure, so the delta is applied and committed.

Change one fact and it is refused. If the same request had instead asked the skill to draw conclusions without a defensible denominator, that rule lives inside the contract fence, and the answer is a refusal naming the clause plus a pointer to the human specification-change path.

### Output contracts

Each skill declares what its output must contain, inside the fence so a self-edit cannot quietly shorten the list:

    **Required fields:** Findings|Confidence|Limitations|Plausible explanations|Contradictory evidence|Decision implications

Verify any produced artifact against it:

    evals/check-output.sh analyze-query-results path/to/analysis.md

A missing field exits non-zero and names it. No model call, no network.

### Versioning and rollback

Git is the archive; there is no ledger file. One commit per edit, touching one skill, with provenance in trailers:

    Skill: analyze-support-tickets
    Evidence: SUPPORT-DEDUP-07
    Validated-by: acceptance check pass
    Assisted-by: <runtime>

Trailers must be one contiguous block at the end of the message. Separate `-m` flags create separate paragraphs and git parses none of them, while the message still looks correct. Confirm with `git log -1 --format='%(trailers:key=Evidence,valueonly)'`.

Roll back to any earlier version with `git checkout <sha> -- <path>`, or undo a single edit with `git revert <sha>`.

### Setup and upgrades

Tag your reviewed baseline once so drift becomes measurable:

    git tag core-origin

Upstream owns the fenced regions and your local improvements own `## Process`, so an upgrade merges cleanly. A conflict on pull means an edit escaped its region, which is worth reading rather than an accident.

### The limit, stated plainly

An agent with shell access can edit a core region, regenerate `core.sha256`, and commit. There is no server-side enforcement in a plain clone. The manifest makes tampering visible in a diff; human review of that diff is the actual control. Treat `core.sha256` as a reviewed file, never a generated one.

Verify the guardrails yourself, including that each one fails when it should:

    evals/test-guardrails.sh

## Evidence channels

Analytics, queries, product documentation, support, meetings, and communications each produce reusable evidence packets. They may feed broader investigations while remaining independently usable. Tool discovery happens at runtime; no provider-specific workflow folder is required.
