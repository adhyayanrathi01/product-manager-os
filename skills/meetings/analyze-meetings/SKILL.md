---
name: analyze-meetings
description: "Analyze meeting notes, transcripts, recordings, calendars, or summaries to extract evidence, decisions, assumptions, objections, action items, and unresolved questions. Use when a PM asks about recent meetings or meetings related to a customer, module, feature, project, stakeholder group, topic, or date range."
---

# Analyze Meetings

<!-- CORE:BEGIN -->
## Contract

- Require the decision, source ID, permitted meeting scope, participant boundary, absolute period, topic, and confidentiality or retention rules.
- Verify authorization, source coverage, chronology, and speaker clarity. If records are partial, limit conclusions to reviewed meetings and name missing coverage.
- Block access outside the permitted scope. Emit the shared evidence handoff for reusable findings.
<!-- CORE:END -->

## Process

1. Clarify the decision being supported and the requested scope:
   - date range;
   - meeting type;
   - project, module, feature, customer, or topic;
   - participant group.
   Resolve relative periods to absolute dates and a timezone. Clarify fiscal versus calendar quarters.
2. Discover available notes, transcripts, recordings, calendars, or documents through an MCP, CLI, API, export, or local file.
3. Confirm permission to access confidential meetings and record the permitted retention or reuse boundary. Record source coverage and identify missing meetings, partial transcripts, or unclear speakers. Track separate counts for records discovered, permitted and accessed, successfully parsed, and actually analyzed; analyze only successfully parsed records.
4. Separate:
   - confirmed decisions;
   - proposals and alternatives;
   - evidence presented;
   - assumptions;
   - objections and risks;
   - unresolved questions;
   - action items, owners, and due dates.
5. Label a decision as confirmed only when the source records explicit approval from an authorized owner. Otherwise label it proposed or unclear.
6. Preserve chronology when a later meeting revises an earlier decision.
7. Distinguish participant statements from agent inference and do not invent consensus.
8. Identify repeated themes, cross-meeting contradictions, stalled decisions, unowned actions, and information gaps.
9. Connect meeting evidence to support, analytics, data, or team-communication evidence when relevant.
10. Present findings for PM review. Do not send summaries, schedule follow-ups, or create tasks without explicit approval.
11. Save the analysis using skills/evidence/evidence-handoff.md, then update the relevant project and root work files when meaningful.

<!-- CORE:BEGIN -->
## Output

Provide:

- Scope and meetings reviewed
- Coverage validation showing all four stage counts and confirming inaccessible or failed records are not labeled reviewed
- Concise meeting-by-meeting summary when useful
- Decision log
- Evidence and assumptions
- Objections, risks, and contradictions
- Action items with confirmed owners and dates
- Unresolved questions
- Repeated product signals
- Implications and follow-up options for the PM

Do not treat discussion, silence, or attendance as approval.

**Required fields:** Scope and meetings reviewed|Coverage validation|Decision log|Evidence and assumptions|Objections and risks|Action items|Unresolved questions|Implications for the PM

Every field above must appear as a labeled section in the produced output. Verify with `evals/check-output.sh analyze-meetings <artifact>`.
<!-- CORE:END -->
