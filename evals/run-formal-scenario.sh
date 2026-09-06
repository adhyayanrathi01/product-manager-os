#!/usr/bin/env bash

set -euo pipefail

usage() {
  echo "Usage: $0 <scenario.md> <output-root> <trial-label> <order>" >&2
  exit 2
}

[[ $# -eq 4 ]] || usage

scenario_input=$1
output_root=$2
trial_label=$3
trial_order=$4

script_dir=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)
repo_root=$(cd "$script_dir/.." && pwd)

if [[ $scenario_input = /* ]]; then
  scenario_path=$scenario_input
else
  scenario_path="$repo_root/$scenario_input"
fi

[[ -f $scenario_path ]] || { echo "Scenario not found: $scenario_path" >&2; exit 2; }
[[ $trial_label =~ ^[A-Za-z0-9._-]+$ ]] || { echo "Unsafe trial label" >&2; exit 2; }
[[ $trial_order =~ ^[0-9]+$ ]] || { echo "Order must be numeric" >&2; exit 2; }
command -v git >/dev/null
command -v ruby >/dev/null
command -v codex >/dev/null

artifact_dir="$output_root/$trial_label"
worktree_dir="$output_root/worktrees/$trial_label"
[[ ! -e $artifact_dir && ! -e $worktree_dir ]] || {
  echo "Trial output already exists; refusing to overwrite: $trial_label" >&2
  exit 2
}
mkdir -p "$artifact_dir" "$worktree_dir"

candidate_revision=$(git -C "$repo_root" rev-parse HEAD)
codex_version=$(codex --version 2>/dev/null)
fixture_overlay=none
fixture_overlay_hash=none
additional_fixture=none
additional_fixture_hash=none

git -C "$repo_root" archive "$candidate_revision" | tar -x -C "$worktree_dir"

scenario_name=$(basename "$scenario_path")
case "$scenario_name" in
  10-manual-self-improvement.md)
    fixture_overlay="$repo_root/evals/fixtures/10-pre-taxonomy.patch"
    git -C "$worktree_dir" apply "$fixture_overlay"
    ;;
  11-safe-auto-self-improvement.md|11b-validation-failure-rollback.md)
    fixture_overlay="$repo_root/evals/fixtures/11-pre-coverage.patch"
    git -C "$worktree_dir" apply "$fixture_overlay"
    if [[ $scenario_name = 11b-validation-failure-rollback.md ]]; then
      additional_fixture="$repo_root/evals/fixtures/11b-acceptance-check.sh"
      cp "$additional_fixture" "$worktree_dir/fixture-acceptance-check.sh"
      chmod 755 "$worktree_dir/fixture-acceptance-check.sh"
    fi
    ;;
esac

rm -rf "$worktree_dir/evals" "$worktree_dir/docs/plans"
mkdir -p "$worktree_dir/evals/scenarios"
printf '%s\n' '# Candidate fixture placeholder' '' 'Grader instructions and criteria are intentionally unavailable in this worktree.' > "$worktree_dir/evals/EVALUATOR.md"
printf '%s\n' '# Candidate fixture placeholder' '' 'The supplied task message contains the complete simulated source fixture.' > "$worktree_dir/evals/scenarios/fixture-placeholder.md"

printf '%s\n' '# Work log' '' '| Date | Project | Action | Outcome |' '| --- | --- | --- | --- |' > "$worktree_dir/log.md"
printf '%s\n' '# Current work' '' 'No active project. Use the supplied task and create a project only when the workflow requires one.' > "$worktree_dir/task.md"
printf '%s\n' '# Workspace index' '' '## Projects' '' '| Project | Description | Status |' '| --- | --- | --- |' '| projects/_template/ | Minimal project template | Available |' > "$worktree_dir/index.md"

git -C "$worktree_dir" init -q
git -C "$worktree_dir" add .
git -C "$worktree_dir" -c user.name='Formal Evaluator' -c user.email='evaluator@example.invalid' commit -qm fixture

awk '
  /^## Prompt$/ { capture=1 }
  /^## Expected behaviors$/ { capture=0 }
  capture { print }
' "$scenario_path" > "$artifact_dir/candidate-input.md"

hash_file() {
  if command -v sha256sum >/dev/null 2>&1; then
    sha256sum "$1" | awk '{print $1}'
  else
    shasum -a 256 "$1" | awk '{print $1}'
  fi
}

if [[ $fixture_overlay != none ]]; then
  fixture_overlay_hash=$(hash_file "$fixture_overlay")
fi
if [[ $additional_fixture != none ]]; then
  additional_fixture_hash=$(hash_file "$additional_fixture")
fi

manifest() {
  local root=$1
  local destination=$2
  (
    cd "$root"
    git ls-files -co --exclude-standard -z | while IFS= read -r -d '' file; do
      if [[ -f $file ]]; then
        printf '%s  %s\n' "$(hash_file "$file")" "$file"
      else
        printf 'DELETED  %s\n' "$file"
      fi
    done
  ) | LC_ALL=C sort > "$destination"
}

input_hash=$(hash_file "$artifact_dir/candidate-input.md")
manifest "$worktree_dir" "$artifact_dir/before.sha256"

{
  printf 'scenario=%s\n' "$scenario_name"
  printf 'trial_label=%s\n' "$trial_label"
  printf 'order=%s\n' "$trial_order"
  printf 'declared_k=1\n'
  printf 'candidate_revision=%s\n' "$candidate_revision"
  printf 'runtime=%s\n' "$codex_version"
  printf 'candidate_input_sha256=%s\n' "$input_hash"
  printf 'fixture_overlay=%s\n' "${fixture_overlay#$repo_root/}"
  printf 'fixture_overlay_sha256=%s\n' "$fixture_overlay_hash"
  printf 'additional_fixture=%s\n' "${additional_fixture#$repo_root/}"
  printf 'additional_fixture_sha256=%s\n' "$additional_fixture_hash"
  printf 'sandbox=workspace-write\n'
  printf 'session=ephemeral\n'
  printf 'infrastructure_retry_rule=one unchanged retry only if no candidate action or final output is observable\n'
  printf 'unavailable=live credentials, customer data, external writes, dependency installation, grader criteria, prior results\n'
} > "$artifact_dir/run-metadata.txt"

candidate_exit=0
if [[ ${FORMAL_DRY_RUN:-0} = 1 ]]; then
  printf 'DRY RUN: candidate not launched\n' > "$artifact_dir/stderr.log"
  : > "$artifact_dir/events.jsonl"
  : > "$artifact_dir/final.md"
  candidate_exit=125
else
  set +e
  codex exec \
    --ephemeral \
    --ignore-user-config \
    --json \
    --sandbox workspace-write \
    --cd "$worktree_dir" \
    --output-last-message "$artifact_dir/final.md" \
    - < "$artifact_dir/candidate-input.md" \
    > "$artifact_dir/events.jsonl" \
    2> "$artifact_dir/stderr.log"
  candidate_exit=$?
  set -e
fi

printf '%s\n' "$candidate_exit" > "$artifact_dir/exit-code.txt"
git -C "$worktree_dir" status --short > "$artifact_dir/status.txt"
manifest "$worktree_dir" "$artifact_dir/after.sha256"

git -C "$worktree_dir" add -N . >/dev/null 2>&1 || true
git -C "$worktree_dir" diff --binary --no-ext-diff > "$artifact_dir/diff.patch"
git -C "$worktree_dir" reset -q

if command -v gzip >/dev/null 2>&1; then
  gzip -n -f "$artifact_dir/events.jsonl"
fi

printf 'trial=%s exit=%s artifacts=%s worktree=%s\n' \
  "$trial_label" "$candidate_exit" "$artifact_dir" "$worktree_dir"
