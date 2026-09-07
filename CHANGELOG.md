# Changelog

Notable changes to this workspace. Newest first.

This file exists so an upgrade is visible. `VERSION` records the current semantic version.

## 0.4.1 (2026-09-07)

Documentation only. No behavior changed.

### Changed

- `docs/FLOWS.md` rewritten in plain language. Every section now explains itself in prose first and shows a diagram second, so the diagrams no longer have to carry the explanation. The three dense charts were cut from 25 to 30 nodes each down to under 15, and the detail they used to hold moved into short lists and a table.
- README pointers to the diagrams now use plain wording instead of internal terms.

## 0.4.0 (2026-08-30)

Guarded self-improvement. Skills may now improve their own process, and cannot quietly change what they are for.

### Added

- `CHARTER.md`, ten immutable clauses that no skill, folder rule, or self-edit may contradict. An agent may read it and may never write it.
- Immutable core regions in every `skills/**/SKILL.md`, fenced by `<!-- CORE:BEGIN -->` and `<!-- CORE:END -->`, holding each skill's contract and output contract.
- `core.sha256`, an integrity manifest over those regions. `./setup.sh --check` fails on a changed region, a removed or malformed fence, an unlisted skill, or a listed skill that no longer exists.
- `./setup.sh --core-hash`, which prints the manifest for a reviewed human regeneration.
- A machine-readable `**Required fields:**` contract in every skill's output section.
- `evals/check-output.sh <skill> <artifact>`, which verifies a produced artifact against the fields its skill declared. No model call, no network.
- Drift reporting in `./setup.sh --check`: changed lines and commit count per skill against the `core-origin` tag, with a budget that flags a skill needing a human re-read.
- A `## Contract` section for `configure-workspace` and `improve-skills`, which previously had none.
- Two diagrams in `docs/FLOWS.md`: the anatomy of a skill, and what `./setup.sh --check` verifies.
- A worked example in `README.md` showing one edit accepted and one refused.

### Changed

- `improve-skills` gates before the write rather than reverting after it, requires cited evidence, applies deltas only, and refuses to touch the charter, a core region, the manifest, a constraint file, or an evaluation scenario.
- Skill edits are compared against a pinned origin baseline instead of the previous version, so drift that accumulates below the per-edit threshold becomes visible.
- Evaluation gates on per-scenario paired deltas against an origin-pinned run instead of suite pass rate, and validates on a held-out split.
- The safe-improvement diagram in `docs/FLOWS.md` now shows pre-commit gating. It previously described applying an edit and rolling it back after validation, which this release replaced.

### Upgrade notes

- Run `./setup.sh --check` after pulling. It now fails when a core region does not match the manifest.
- Tag your reviewed baseline once: `git tag core-origin`. Without it, drift is reported as unmeasured rather than as an error.
- Upstream owns core regions and local self-improvements own `## Process`. A merge conflict on pull means an edit escaped its region, which is information worth reading rather than an accident.
- `core.sha256` is a reviewed file, not a generated one. Regenerating it without reading the diff defeats the mechanism.

## 0.3.0

Sandbox hardening. Readiness states separated user-reported, runtime-addressable, and agent-observed verification. Executed-run evaluation artifacts replaced static-only behavioral claims.

## 0.2.0

Self-serve readiness. Conversational setup, source-readiness contract, and the first evaluation suite.

## 0.1.0

Initial evidence-first workspace: provider-neutral skills, project folders, and PM decision boundaries.
