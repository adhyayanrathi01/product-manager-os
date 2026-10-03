# Current task

## Goal

Ship v0.5.0: optional setup with a trial path, and PM-first upgrades to existing skills (product context, competitive analysis, customer evidence, prototyping) sharing one public-research method. No new skills. Each upgrade is built on a screened existing skill and leans toward PMs by default while staying usable by anyone.

## Status

Implementation complete on branch `release/v0.5.0` (not merged, not pushed), awaiting the PM release review (plan Task 7).

- Tasks 1–6 done. Each task had a fresh Opus implementer and an Opus reviewer. Every Important finding was fixed after PM approval; approved deviations are listed at the end of the plan.
- Scenario gates 16–20 met; regressions 05, 07, and 08 pass, and 01 is no worse than its baseline. Results: `evals/results/2026-10-03-v0.5.0/RESULTS.md`.
- `./setup.sh --check` validates 16 skills and cores match `core.sha256`. Three Process sections are over their drift budget against `core-origin`: competitive-analysis 44/30, build-prototype 31/30, analyze-customer-evidence 31/30.

## Blockers

None.

## Open items (not decided)

1. Decide whether to tighten scenario 12 criteria B2 and B4, which currently require grader judgment. This is a human specification change and creates a new scenario version. Trials 12b and 12c disagreed on B2.
2. Run the suite at `k >= 5` with per-scenario paired deltas. This has never been run.
3. Confirm the license on OpenAI's `agent/refresh-role-plugins` branch, or keep `build-competitive-brief` as ideas only.

## Candidates (not decided)

The PM has not chosen any of these. They are options, not plans.

- v0.6 skills: `record-decision`, `write-spec`, `review-brief`, `design-experiment`.

## Next action

1. Final whole-branch review, then one fix pass for anything it finds.
2. PM release review: RESULTS.md, the three drift lines, and `git diff main -- skills/`.
3. Only after PM approval: merge to `main`, then move `core-origin` to the release. No push unless asked.
