#!/usr/bin/env bash
#
# Verify a produced artifact against the output contract its skill declares.
#
#   evals/check-output.sh <skill-name> <artifact-path>
#
# Reads "**Required fields:**" from the skill's immutable core region and checks
# that every field appears in the artifact. No model call, no network.
# Exit 0 = every field present. Exit 1 = a field is missing. Exit 2 = bad usage.

set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd -P)"

if [ "$#" -ne 2 ]; then
  printf 'Usage: evals/check-output.sh <skill-name> <artifact-path>\n' >&2
  exit 2
fi

SKILL_NAME="$1"
ARTIFACT="$2"

SKILL_FILE="$(find "$ROOT_DIR/skills" -type d -name "$SKILL_NAME" -exec test -f {}/SKILL.md \; -print -quit)/SKILL.md"
if [ ! -f "$SKILL_FILE" ]; then
  printf '[error] no skill named %s under skills/\n' "$SKILL_NAME" >&2
  exit 2
fi

if [ ! -f "$ARTIFACT" ]; then
  printf '[error] artifact not found: %s\n' "$ARTIFACT" >&2
  exit 2
fi

# The contract line lives inside a CORE fence, so it cannot be edited by a self-improvement.
FIELD_LINE="$(awk '
  /^<!-- CORE:BEGIN -->$/ { inside = 1; next }
  /^<!-- CORE:END -->$/   { inside = 0; next }
  inside && /^\*\*Required fields:\*\*/ {
    sub(/^\*\*Required fields:\*\*[[:space:]]*/, "")
    print
    exit
  }
' "$SKILL_FILE")"

if [ -z "$FIELD_LINE" ]; then
  printf '[error] %s declares no Required fields inside a core region.\n' "$SKILL_NAME" >&2
  exit 2
fi

MISSING=0
PRESENT=0
TOTAL=0

while IFS= read -r field; do
  [ -z "$field" ] && continue
  TOTAL=$((TOTAL + 1))
  # ponytail: case-insensitive substring match. Catches an omitted section, not a mislabeled one.
  # Upgrade to heading-anchored matching if artifacts start burying labels in prose.
  if grep -Fqi -- "$field" "$ARTIFACT"; then
    PRESENT=$((PRESENT + 1))
  else
    printf '[missing] %s\n' "$field"
    MISSING=$((MISSING + 1))
  fi
done < <(printf '%s\n' "$FIELD_LINE" | tr '|' '\n' | sed 's/^[[:space:]]*//; s/[[:space:]]*$//')

printf '[contract] %s: %s/%s required field(s) present in %s\n' \
  "$SKILL_NAME" "$PRESENT" "$TOTAL" "${ARTIFACT#$ROOT_DIR/}"

if [ "$MISSING" -gt 0 ]; then
  printf '[failed] %s required field(s) missing; the output does not satisfy the declared contract.\n' "$MISSING" >&2
  exit 1
fi
