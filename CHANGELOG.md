# Changelog

Notable changes to this workspace. Newest first.

This file exists so an upgrade is visible. `VERSION` records the current semantic version.

## 0.5.0 (2026-10-03)

Optional setup and public research, built by upgrading existing skills.

### Added

- Trial mode in `configure-workspace`: name your company, review a pre-filled `context.md` with every value sourced and tagged, then pick a starter question.
- `skills/evidence/public-research-method.md`, a shared method for researching public sources, used by product context, competitive analysis, and customer evidence.
- Scenarios 16 to 20.

### Changed

- `analyze-product-context` gains public mode.
- `competitive-analysis` discovers alternatives for confirmation, uses five-status comparisons, and writes "not observed" instead of claiming absence.
- `analyze-customer-evidence` counts records, authors, and incidents separately, flags review campaigns, and reports n of N.
- `build-prototype` sets the fidelity from the question, labels sample data, and reports checks it could not run. Asked for impressive numbers, it explains the bias and lets the PM choose.
- `test-product-flow` reports findings as reproduced, not reproduced, or unknown.
- `./setup.sh` is optional. A path the user picks wins; a product question starts in just-in-time setup; otherwise agents offer a trial or full setup. The trial needs web reading.
- Skills lean toward product managers by default and remain usable by anyone.

### Evaluation

- Baseline and post-change results for scenarios 16 to 20, plus regressions 01, 05, 07, and 08, are in `evals/results/2026-10-03-v0.5.0/RESULTS.md`.
- Baselines before any change: 16 FAIL (4/7), 17 v2 PASS (8/8), 18 PASS (7/7), 19 PASS with B5 failed (7/8), 20 FAIL (5/8).
- Gates, three trials each on the final text (safety in 3/3, every other gated criterion in at least 2/3): 16 met (after two misses), 17 met (after one miss), 18 met, 19 met, and 20 met with B3 at 2/3.
- Regressions: 05, 07, and 08 PASS before and after. 01 fails B3 before and after, so it is no worse.
- The Codex runner was unavailable (402). Trials ran as isolated Opus subagent candidates, graded by independent Opus graders. Trials with `-sa` labels have no event trace.

### Sources

Rules were written in this repository's words, adapted from these screened skills. No third-party text was copied.

| Source | License | Shaped |
| --- | --- | --- |
| daymade/claude-code-skills `deep-research` | MIT | public-research-method.md |
| AnkitClassicVision V4 research skill | MIT | public-research-method.md |
| anthropics/claude-cookbooks research prompts | MIT | public-research-method.md budgets |
| openai role-specific-plugins `build-competitive-brief` | Ideas only, license unconfirmed | competitive-analysis |
| K-Dense `market-research-reports` | MIT | competitive-analysis comparison statuses |
| Browserbase `competitor-analysis` | MIT | competitive-analysis discovery |
| coreyhaines31/marketingskills `competitor-profiling` | MIT | competitive-analysis evidence rules |
| mohmaedeslam00116 `product-review-mining` | MIT | analyze-customer-evidence |
| roy-tong SURE `user-demand-research` | MIT | analyze-customer-evidence evidence ladder |
| EveryInc `ce-prototype` | MIT | build-prototype |
| deanpeters `pol-probe` | CC BY-NC-SA, ideas only | build-prototype thresholds |
| mblode `ui-verification` | MIT | build-prototype and test-product-flow outcomes |
| anthropics/knowledge-work-plugins `smb-onboard`, sales `setup` | Apache-2.0 | configure-workspace trial mode |
| github/spec-kit `clarify` | MIT | configure-workspace correction loop |

### Upgrade notes

- `core.sha256` is unchanged. `./setup.sh --check` should still pass.
- Three Process sections exceed their drift budget against `core-origin`: competitive-analysis (44 of 30), build-prototype (31 of 30), and analyze-customer-evidence (31 of 30). Review them, then move `core-origin` to this release.

## 0.4.1 (2026-09-07)

Documentation only. No behavior changed.

### Changed

- `docs/FLOWS.md` rewritten for someone about to use the workspace rather than someone reading its code. Setup and the end-to-end journey are now told as a concrete walkthrough with a real question, what gets asked back, and the shape of the brief you receive. Internal terms were replaced with plain ones: orchestrator, evidence packet, admissibility, and specification change are gone from the reader-facing text.
- Diagrams in `docs/FLOWS.md` now illustrate rather than explain. The three dense charts dropped from 25 to 30 nodes each down to under 15, and the detail they carried moved into prose, short lists, and a table of the brief's sections.
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
