# Workspace index

## Root files

| File | Description |
| --- | --- |
| README.md | First-read explanation, onboarding, and operating model |
| setup.sh | Network-free bootstrap, package validation, and repo-local skill discovery |
| AGENTS.md | Canonical rules for agents |
| CHARTER.md | Immutable clauses no skill or self-edit may contradict |
| CHANGELOG.md | What changed in each version |
| core.sha256 | Integrity manifest over every immutable core region |
| CLAUDE.md | Claude import of the canonical rules |
| SETUP.md | Conversational first-use setup process |
| context.md | Stable product context and external source pointers |
| task.md | Current work and next actions |
| log.md | Historical record of meaningful work and decisions |
| index.md | Map of this workspace |
| COMPATIBILITY.md | Runtime requirements, limitations, versioning, and upgrades |
| CONTRIBUTING.md | Contribution, contract, safety, and evaluation requirements |
| VERSION | Current semantic version |
| docs/plans/ | Approved architecture and implementation designs |
| evals/ | Behavioral scenarios, evaluator protocol, and the deterministic guardrail checks |

## Skill buckets

| Folder | Purpose |
| --- | --- |
| skills/orchestration/ | Coordinate evidence-backed product investigations |
| skills/setup/ | Configure the workspace and verify source and skill readiness |
| skills/analytics/ | Analyze usage, define tracking, and audit events |
| skills/data/ | Build safe queries and interpret results |
| skills/evidence/ | Analyze product context and synthesize customer or stakeholder evidence |
| skills/support/ | Analyze recent or scoped support tickets |
| skills/communication/ | Analyze team chat, email, and collaboration evidence |
| skills/meetings/ | Analyze meeting notes, transcripts, decisions, and actions |
| skills/competition/ | Research competitors and alternatives |
| skills/design/ | Build prototypes from PM-approved directions |
| skills/qa/ | Test product flows and user roles |
| skills/learning/ | Improve rules and skills using reusable learnings |

## Shared workflow files

| File | Purpose |
| --- | --- |
| skills/evidence/evidence-handoff.md | Evidence packet contract |
| skills/learning/improve-skills/references/improvement-payload.md | Manual and automatic improvement input contract |
| evals/check-output.sh | Verifies an artifact against the output contract its skill declares |
| evals/test-guardrails.sh | Self-check that every guardrail fails when it should |

## Projects

| Project | Description | Status |
| --- | --- | --- |
| projects/_template/ | Minimal starting point for new initiatives | Available |

## External sources

| Source | Pointer | Authorization window | Last agent-observed verification | Status |
| --- | --- | --- | --- | --- |
| None registered | — | — | — | Awaiting setup |
