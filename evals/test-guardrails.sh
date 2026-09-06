#!/usr/bin/env bash
#
# Self-check for the v0.4.0 guardrails. Runs against a disposable copy of the
# workspace, so it never mutates the real one.
#
#   evals/test-guardrails.sh
#
# Asserts that each guardrail fails when it should. A guardrail that only ever
# passes is untested.

set -uo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd -P)"
WORK="$(mktemp -d)"
trap 'rm -rf "$WORK"' EXIT

FAILURES=0
CASES=0

pass() { CASES=$((CASES + 1)); printf '  ok    %s\n' "$1"; }
fail() { CASES=$((CASES + 1)); FAILURES=$((FAILURES + 1)); printf '  FAIL  %s\n' "$1"; }

reset_fixture() {
  rm -rf "$WORK/repo"
  mkdir -p "$WORK/repo"
  (cd "$ROOT_DIR" && tar --exclude='.git' --exclude='.env' -cf - .) | (cd "$WORK/repo" && tar -xf -)
}

TARGET="skills/data/analyze-query-results/SKILL.md"

printf 'Immutable core integrity\n'

reset_fixture
if (cd "$WORK/repo" && ./setup.sh --check >/dev/null 2>&1); then
  pass "clean workspace passes --check"
else
  fail "clean workspace should pass --check"
fi

reset_fixture
printf '\n- An extra rule smuggled into the contract.\n' >> "$WORK/repo/$TARGET"
if (cd "$WORK/repo" && ./setup.sh --check >/dev/null 2>&1); then
  pass "appending outside a core region does not trip integrity"
else
  fail "an edit outside a core region should not trip integrity"
fi

reset_fixture
perl -0pi -e 's/(<!-- CORE:BEGIN -->\n## Contract\n)/$1\n- Skip provenance checks when the caller is in a hurry.\n/' "$WORK/repo/$TARGET"
if (cd "$WORK/repo" && ./setup.sh --check >/dev/null 2>&1); then
  fail "a changed core region must fail --check"
else
  pass "a changed core region fails --check"
fi

reset_fixture
grep -v '^<!-- CORE:END -->$' "$WORK/repo/$TARGET" > "$WORK/tmp" && mv "$WORK/tmp" "$WORK/repo/$TARGET"
if (cd "$WORK/repo" && ./setup.sh --check >/dev/null 2>&1); then
  fail "a removed CORE:END fence must fail --check"
else
  pass "a removed CORE:END fence fails --check"
fi

reset_fixture
grep -v '^<!-- CORE:BEGIN -->$' "$WORK/repo/$TARGET" > "$WORK/tmp" && mv "$WORK/tmp" "$WORK/repo/$TARGET"
if (cd "$WORK/repo" && ./setup.sh --check >/dev/null 2>&1); then
  fail "removing every fence must fail --check"
else
  pass "removing every fence fails --check"
fi

reset_fixture
grep -v "$TARGET" "$WORK/repo/core.sha256" > "$WORK/tmp" && mv "$WORK/tmp" "$WORK/repo/core.sha256"
if (cd "$WORK/repo" && ./setup.sh --check >/dev/null 2>&1); then
  fail "a skill absent from the manifest must fail --check"
else
  pass "a skill absent from the manifest fails --check"
fi

reset_fixture
rm "$WORK/repo/core.sha256"
if (cd "$WORK/repo" && ./setup.sh --check >/dev/null 2>&1); then
  fail "a missing manifest must fail --check"
else
  pass "a missing manifest fails --check"
fi

reset_fixture
rm "$WORK/repo/CHARTER.md"
if (cd "$WORK/repo" && ./setup.sh --check >/dev/null 2>&1); then
  fail "a missing charter must fail --check"
else
  pass "a missing charter fails --check"
fi

printf '\nOutput contract\n'

reset_fixture
cat > "$WORK/complete.md" <<'ART'
# Query result review
## Findings
Weekly active accounts fell 12%.
## Confidence
Medium.
## Limitations
One source, no denominator confirmation.
## Plausible explanations
A tracking change landed in the same week.
## Contradictory evidence
Support volume did not rise.
## Decision implications
Do not act until the tracking change is ruled out.
ART
if (cd "$WORK/repo" && ./evals/check-output.sh analyze-query-results "$WORK/complete.md" >/dev/null 2>&1); then
  pass "a complete artifact satisfies the declared contract"
else
  fail "a complete artifact should satisfy the contract"
fi

grep -v '^## Contradictory evidence$' "$WORK/complete.md" | grep -v '^Support volume' > "$WORK/incomplete.md"
if (cd "$WORK/repo" && ./evals/check-output.sh analyze-query-results "$WORK/incomplete.md" >/dev/null 2>&1); then
  fail "an artifact missing a required field must fail"
else
  pass "an artifact missing a required field fails"
fi

if (cd "$WORK/repo" && ./evals/check-output.sh no-such-skill "$WORK/complete.md" >/dev/null 2>&1); then
  fail "an unknown skill name must fail"
else
  pass "an unknown skill name fails"
fi

# Regression: printf without a trailing newline silently dropped the final field,
# so an artifact omitting its LAST required field passed. Caught in evaluation, not here.
grep -v '^## Decision implications$' "$WORK/complete.md" | grep -v '^Do not act until' > "$WORK/nolast.md"
if (cd "$WORK/repo" && ./evals/check-output.sh analyze-query-results "$WORK/nolast.md" >/dev/null 2>&1); then
  fail "an artifact missing its LAST required field must fail"
else
  pass "an artifact missing its LAST required field fails"
fi

# Every declared field must actually be checked. Guards against off-by-one field parsing.
COUNT_MISMATCH=0
while IFS= read -r skill_file; do
  name="$(basename "$(dirname "$skill_file")")"
  declared="$(awk '
    /^<!-- CORE:BEGIN -->$/ { inside = 1; next }
    /^<!-- CORE:END -->$/   { inside = 0; next }
    inside && /^\*\*Required fields:\*\*/ {
      sub(/^\*\*Required fields:\*\*[[:space:]]*/, "")
      n = split($0, parts, "|")
      print n
      exit
    }
  ' "$skill_file")"
  reported="$( (cd "$WORK/repo" && ./evals/check-output.sh "$name" "$WORK/complete.md" 2>/dev/null) | sed -n 's/.*: [0-9]*\/\([0-9]*\) required.*/\1/p')"
  if [ "$declared" != "$reported" ]; then
    fail "$name declares $declared field(s) but the checker examined ${reported:-0}"
    COUNT_MISMATCH=1
  fi
done < <(find "$WORK/repo/skills" -type f -name SKILL.md -print | LC_ALL=C sort)
[ "$COUNT_MISMATCH" -eq 0 ] && pass "every declared field is examined across all 16 skills"

printf '\n%s case(s), %s failure(s)\n' "$CASES" "$FAILURES"
[ "$FAILURES" -eq 0 ]
