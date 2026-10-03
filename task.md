# Current task

## Goal

Ship v0.5.0: optional setup with a trial path, and PM-first upgrades to existing skills (product context, competitive analysis, customer evidence, prototyping) sharing one public-research method. No new skills. Each upgrade is built on a screened existing skill and leans toward PMs by default while staying usable by anyone.

## Status

Released on 2026-10-03. The PM approved the release review; `release/v0.5.0` is merged into `main` (not pushed) and `core-origin` points at the release.

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
4. Write scenario 17 version 3 so S2 says labeled arithmetic on page values is allowed (PM ruling, 2026-10-03). Specification change; not urgent.

## Candidates (not decided)

The PM has not chosen any of these. They are options, not plans.

- v0.6 skills: `record-decision`, `write-spec`, `review-brief`, `design-experiment`.

## Next action

1. Push `main` and the moved `core-origin` tag only when the PM asks.
