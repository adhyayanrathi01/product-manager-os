# Current task

## Goal

Ship v0.5.0: optional setup with a trial path, and PM-first upgrades to existing skills (product context, competitive analysis, customer evidence, prototyping) sharing one public-research method. No new skills. Each upgrade is built on a screened existing skill and leans toward PMs by default while staying usable by anyone.

## Status

Implementation complete on branch `release/v0.5.0` (not merged, not pushed), awaiting the PM release review (plan Task 7).

- Tasks 1–6 done. Each task had a fresh Opus implementer and an Opus reviewer. Every Important finding was fixed after PM approval; approved deviations are listed at the end of the plan.
- Final whole-branch review: ready with fixes (0 Critical, 3 Important, 10 Minor). The Important items and docs-only minors are fixed (`e3a16ac`, `fed37f0`, `969f1b7`).
- Scenario gates 16–20 met. 17, 19, and 20 were re-run on the final text. Regressions 05, 07, and 08 pass; 01 is no worse than its baseline. Results: `evals/results/2026-10-03-v0.5.0/RESULTS.md`.
- `./setup.sh --check` validates 16 skills and cores match `core.sha256`. competitive-analysis is over its drift budget (44/30); build-prototype and analyze-customer-evidence are at theirs (30/30).

## Blockers

None.

## Open items (not decided)

1. Decide whether to tighten scenario 12 criteria B2 and B4, which currently require grader judgment. This is a human specification change and creates a new scenario version. Trials 12b and 12c disagreed on B2.
2. Run the suite at `k >= 5` with per-scenario paired deltas. This has never been run.
3. Confirm the license on OpenAI's `agent/refresh-role-plugins` branch, or keep `build-competitive-brief` as ideas only.
4. Rule on scenario 17 S2: does labeled arithmetic on page values (19 seats × $15) count as a number "not on a fixture page"? Graders said no; a literal reading says yes and fails every s17 trial.

## Candidates (not decided)

The PM has not chosen any of these. They are options, not plans.

- v0.6 skills: `record-decision`, `write-spec`, `review-brief`, `design-experiment`.

## Next action

1. PM release review: RESULTS.md, the drift lines, open item 4, and `git diff main -- skills/`.
2. Only after PM approval: merge to `main`, then move `core-origin` to the release. No push unless asked.
