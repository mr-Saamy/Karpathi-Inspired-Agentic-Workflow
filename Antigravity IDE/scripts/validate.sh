#!/usr/bin/env bash
set -euo pipefail

repo_root="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
errors=0

fail() {
  printf 'error: %s\n' "$1" >&2
  errors=$((errors + 1))
}

required_files=(
  "AGENTS.md"
  "README.md"
  "ROADMAP.md"
  "SPEC.md"
  "TASKS.md"
  "antigravity-home/AGENTS.md"
  "antigravity-home/skills.json"
  "antigravity-home/rules/default.rules"
  "docs/ANTIGRAVITY_LAYOUT.md"
  "docs/SKILLS.md"
  "docs/WORKFLOW.md"
  "docs/PROMPT_GUIDE.md"
  "scripts/install.sh"
  "scripts/test-install.sh"
  "scripts/validate.sh"
)

for relative in "${required_files[@]}"; do
  [[ -f "$repo_root/$relative" ]] || fail "missing $relative"
done

# Validate skills
skill_count=0
actual_skills=""
for skill_dir in "$repo_root"/.agents/skills/*; do
  [[ -d "$skill_dir" ]] || continue
  skill_count=$((skill_count + 1))
  skill_file="$skill_dir/SKILL.md"
  skill_basename="$(basename "$skill_dir")"

  if [[ ! -f "$skill_file" ]]; then
    fail "missing ${skill_file#"$repo_root"/}"
    continue
  fi

  first_line="$(sed -n '1p' "$skill_file")"
  [[ "$first_line" == "---" ]] || fail "${skill_file#"$repo_root"/} has no YAML front matter"
  grep -q '^name: .\+' "$skill_file" || fail "${skill_file#"$repo_root"/} has no name"
  grep -q '^description: .\+' "$skill_file" || fail "${skill_file#"$repo_root"/} has no description"
  skill_name="$(sed -n 's/^name: //p' "$skill_file" | sed -n '1p')"
  [[ "$skill_name" == "$skill_basename" ]] ||
    fail "${skill_file#"$repo_root"/} name does not match directory"
  actual_skills+="$skill_basename"$'\n'
done

[[ $skill_count -gt 0 ]] || fail "no skills found under .agents/skills"

documented_skills="$(
  sed -n '/^## Repository skills$/,/^## /p' "$repo_root/docs/SKILLS.md" |
    sed -n 's/^- `\([^`]*\)`$/\1/p' |
    sort
)"
actual_skills="$(printf '%s' "$actual_skills" | sed '/^$/d' | sort)"
[[ "$documented_skills" == "$actual_skills" ]] ||
  fail "docs/SKILLS.md does not match .agents/skills"

# Check shell scripts syntax
if ! bash -n \
  "$repo_root/scripts/install.sh" \
  "$repo_root/scripts/test-install.sh" \
  "$repo_root/scripts/validate.sh"; then
  fail "Bash syntax validation failed"
fi

if command -v shellcheck >/dev/null 2>&1; then
  shellcheck \
    "$repo_root/scripts/install.sh" \
    "$repo_root/scripts/test-install.sh" \
    "$repo_root/scripts/validate.sh" ||
    fail "ShellCheck failed"
fi

# Run installer test
if ! bash "$repo_root/scripts/test-install.sh"; then
  fail "installer integration test failed"
fi

if [[ $errors -gt 0 ]]; then
  printf 'validation failed with %d error(s)\n' "$errors" >&2
  exit 1
fi

printf 'validation passed: %d skills checked\n' "$skill_count"
