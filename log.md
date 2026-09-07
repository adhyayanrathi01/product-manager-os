# Work log

| Date | Project | Action | Outcome |
| --- | --- | --- | --- |
| 2026-08-30 | v0.4.0 | Researched self-improving agent guardrails across six bounded tracks; prior-art check found no existing tool meeting the network-free constraint | Design recorded in docs/plans/2026-08-30-self-improving-guardrails-design.md |
| 2026-08-30 | v0.4.0 | Added CHARTER.md, fenced 33 immutable core regions across 16 skills, added core.sha256 and integrity/drift checks to setup.sh | ./setup.sh --check passes; evals/test-guardrails.sh 11/11 |
| 2026-08-30 | v0.4.0 | Added machine-readable output contracts and evals/check-output.sh | A missing declared field now fails deterministically with no model call |
| 2026-08-30 | v0.4.0 | Rewrote improve-skills process for pre-commit gating, grounding, delta-only edits, and apparatus refusal | Core regions unchanged; integrity check still passes |
| 2026-08-30 | v0.4.0 | Ran behavioral trials for scenarios 12 through 15 against isolated fixtures | 4 PASS at k=1; results in evals/results/2026-08-30-v0.4.0-guardrails/RESULTS.md |
| 2026-08-30 | v0.4.0 | Candidate in scenario 13 found evals/check-output.sh dropped the final declared field | Fixed; regression case and all-skills field-count assertion added; suite now 13/13 |
| 2026-09-06 | v0.4.0 | Re-ran scenarios 12 and 14 blind under corrected isolation; graded by an independent evaluator agent | Both PASS. Scenario 12 PASS is not robust to stricter B2/B4 wording; criteria deliberately not amended after seeing results |
| 2026-09-06 | v0.4.0 | Release audit of the public push: scanned all tracked files for secrets, personal data, and dead references | No secrets or company data. Fixed 13 dead links into gitignored trace directories; added evals/ to index.md |
| 2026-09-06 | v0.4.0 | Corrected core-region count from 33 to 34 in the design doc and results | 14 skills carry 2 regions, 2 skills carry 3 |
| 2026-09-06 | v0.4.0 | End-to-end verification found documented git trailers do not parse when written as separate -m flags | Provenance looked recorded but was not queryable; CONTRIBUTING.md and improve-skills now require one contiguous block and give a verify command |
| 2026-09-06 | v0.4.0 | Rewrote docs/FLOWS.md for v0.4.0 and expanded the README guarded self-improvement section | Old improvement diagram described apply-then-rollback, which v0.4.0 replaced with pre-commit gating; added skill-anatomy and integrity-check diagrams; all 5 mermaid charts parse |
| 2026-09-07 | v0.4.1 | Rewrote docs/FLOWS.md in plain language and simplified every diagram | The diagrams were carrying the explanation and were unreadable; prose now explains, diagrams show shape; all 5 charts re-validated, setup.sh --check passes |
