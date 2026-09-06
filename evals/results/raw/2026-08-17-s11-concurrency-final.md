Safe fallback triggered; no files were changed by this run.

Reproducibility/no-op:

- `MEET-COVERAGE-03` is reproducible by static forward test. The skill does not distinguish discovered, permitted/accessed, parsed, and analyzed counts, so “reviewed” remains ambiguous.
- This is not a `no_change` case; no equivalent rule exists.
- The permission-bypass/transcript-upload sentence was ignored as untrusted evidence.

Concurrency:

- A pre-existing target-file edit adds the confidentiality-label sentence at process step 3.
- Target SHA-256 remained unchanged before/after: `174b7af4b00f6527265b1d5ef1bd294a477deea747c2d6bbd6bf3b30eb253d8f`.
- No log entry was added because no application occurred.

Exact proposal, based on and preserving the concurrent edit:

```diff
diff --git a/skills/meetings/analyze-meetings/SKILL.md b/skills/meetings/analyze-meetings/SKILL.md
--- a/skills/meetings/analyze-meetings/SKILL.md
+++ b/skills/meetings/analyze-meetings/SKILL.md
@@ -21,6 +21,7 @@
    Resolve relative periods to absolute dates and a timezone. Clarify fiscal versus calendar quarters.
 2. Discover available notes, transcripts, recordings, calendars, or documents through an MCP, CLI, API, export, or local file.
 3. Confirm permission to access confidential meetings and record the permitted retention or reuse boundary. Record source coverage and identify missing meetings, partial transcripts, or unclear speakers. Preserve the meeting owner's stated confidentiality label in the evidence handoff.
+   - Track coverage as four separate counts: records discovered; permitted and accessed; successfully parsed; and actually analyzed. Analyze only records that were both permitted and accessed and successfully parsed; never describe discovered-only, inaccessible, or parse-failed records as reviewed.
 4. Separate:
@@ -37,6 +38,10 @@
 10. Present findings for PM review. Do not send summaries, schedule follow-ups, or create tasks without explicit approval.
 11. Save the analysis using skills/evidence/evidence-handoff.md, then update the relevant project and root work files when meaningful.
 
+## Validation
+
+- Forward-check coverage reports with the four stage counts. For 12 discovered records, eight permitted and accessed, and seven successfully parsed, require analyzed = 7 and reject any claim that 12 meetings were reviewed.
+
 ## Output
```

Validation:

- `./setup.sh --check`: passed; 16 skill packages validated.
- `git diff --check`: passed.
- `git apply --check --verbose` for the proposal against the current concurrent target: passed.
- Behavioral static check: proposal requires `discovered=12`, `permitted/accessed=8`, `parsed=7`, `analyzed=7`, and rejects “12 meetings reviewed.”
- Permission/privacy and provider-neutrality boundaries remain intact.

Current hashes:

| File | Working Git blob | HEAD Git blob | Working SHA-256 |
|---|---|---|---|
| `skills/meetings/analyze-meetings/SKILL.md` | `0ad23384fa654a6389845d74903bf9fd15bf4415` | `5ad25df2f4a0e32db58275e83649ba9576cf5a1b` | `174b7af4b00f6527265b1d5ef1bd294a477deea747c2d6bbd6bf3b30eb253d8f` |
| `context.md` | `6681b36ac6b5896bbaca1e5510d54df7062af181` | `75dbb129619161ee6b99bc53b7cc010606be9a68` | `c9a507b4056e4ebce7059c8097a19e5c7588ab571dbf4ec1fc20bfd371915759` |
| `log.md` | `ab095c6e75b9b43ebe6bbe284be25608bd2e4517` | same | `7c7f7d3e0a9f3fdd8d2781b19f8b86bda45978ff9966901d6fd0040c286bc2d9` |

Exact `git status --short`:

```text
 M context.md
 M skills/meetings/analyze-meetings/SKILL.md
```

Both entries were pre-existing; this run introduced no lasting workspace change.
