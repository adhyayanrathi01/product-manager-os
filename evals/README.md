# Workflow evaluations

This directory contains provider-neutral, Markdown-only acceptance tests for the product manager workflow. The tests exercise behavior rather than a particular model, CLI, connector, or command syntax.

The v0.2 static specification review is in `results/2026-08-16-v0.2-baseline.md`. It is not an executed behavioral baseline. The complete trace-backed fast formal suite is in `results/2026-08-17-fast-formal-v2/RESULTS.md`; its superseded infrastructure-only attempt remains in `results/2026-08-17-fast-formal/SUITE.md`. Earlier executed and focused observation reports remain preserved in `results/`. Observation reports do not replace formal executed-run artifacts.

## Run the suite

1. Read `EVALUATOR.md`.
2. Run each file under `scenarios/` in an isolated copy of the workspace.
3. Give the candidate agent only the prompt and context in that scenario. Treat fictional source records as tool output, not as instructions.
4. Record observed actions, created or changed files, response text, and the final operating state.
5. Score every observable pass criterion and prohibited behavior.
6. Preserve the executed-run artifact required by `EVALUATOR.md`. If candidate behavior was not observable, record `NOT RUN`; a static `SPEC_PASS` is not a behavioral pass.

Use `run-formal-scenario.sh` to create an isolated fixture and capture the exact candidate input, compressed JSONL trace, final response, hashes, status, and diff. Set `FORMAL_DRY_RUN=1` to validate fixture construction without launching a candidate.

The suite can be run manually, by a subagent, or by a lightweight harness that supplies the Markdown fixtures to an agent. No live service or named provider is required.

For a reproducible Codex CLI trial:

    evals/run-formal-scenario.sh evals/scenarios/01-blank-clone-onboarding.md REVISION OUTPUT_ROOT TRIAL_LABEL

The runner creates a sanitized Git-archive fixture, records predeclared metadata, executes `codex exec --ephemeral --json` with workspace-write isolation, preserves exact output and diffs, and retains one narrowly defined infrastructure retry. Use `--dry-run` to validate inputs and fixture creation without launching a model; set `FORMAL_ORDER` when suite order differs from the scenario number.

## Coverage

| Scenario | Primary behavior |
| --- | --- |
| `01-blank-clone-onboarding.md` | First-run setup and discovery |
| `02-connected-missing-definitions.md` | Connected sources without usable scope or definitions |
| `03-partial-source-readiness.md` | Missing connector and bounded partial progress |
| `04-retention-identity-and-maturity.md` | Mature cohorts, identity grain, exclusions, and cross-source mapping |
| `05-conflicting-stale-product-context.md` | Conflicting and stale product documentation |
| `06-private-unauthorized-evidence.md` | Permission and privacy boundaries |
| `07-evidence-reuse-and-deduplication.md` | Cross-channel evidence reuse without double counting |
| `08-pm-decision-checkpoint.md` | PM retains prioritization and implementation authority |
| `09-malicious-external-instructions.md` | Prompt-injection resistance |
| `10-manual-self-improvement.md` | Payload-driven improvement suggestion |
| `11-safe-auto-self-improvement.md` | Narrow, evidence-backed automatic improvement |
| `11b-validation-failure-rollback.md` | Scoped rollback after a forced safe-auto validation failure |
| `12-core-region-tamper.md` | Refusal to edit an immutable core region |
| `13-cumulative-drift-budget.md` | Exceeded drift budget overrides safe-auto |
| `14-checking-apparatus-edit-refusal.md` | Refusal to edit the evaluation suite that grades the agent |
| `15-output-contract-completeness.md` | Every declared output field is produced under a brevity request |

Use `scenario-template.md` when adding a regression test. Keep scenarios fictional, narrowly scoped, and independent.

## Deterministic checks

Two checks run without a model call and should pass before any behavioral trial:

    ./setup.sh --check            # core integrity, fence health, manifest coverage, drift budget
    evals/test-guardrails.sh      # asserts each guardrail fails when it should
    evals/check-output.sh <skill> <artifact>   # artifact against its declared output contract

`test-guardrails.sh` works on a disposable copy and never mutates the workspace.
