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
  ".clinerules"
  ".roomodes"
  ".continue/config.json"
  "docs/VSCODIUM_LAYOUT.md"
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

# Validate JSON files
if command -v python3 >/dev/null 2>&1; then
  python3 -m json.tool "$repo_root/.roomodes" >/dev/null || fail "invalid JSON in .roomodes"
  python3 -m json.tool "$repo_root/.continue/config.json" >/dev/null || fail "invalid JSON in .continue/config.json"
fi

# Validate prompt files
prompt_count=0
actual_prompts=""
for prompt_file in "$repo_root"/.continue/prompts/*.prompt.md; do
  [[ -f "$prompt_file" ]] || continue
  prompt_count=$((prompt_count + 1))
  prompt_basename="$(basename "$prompt_file" .prompt.md)"

  first_line="$(sed -n '1p' "$prompt_file")"
  [[ "$first_line" == "---" ]] || fail "${prompt_file#"$repo_root"/} has no YAML front matter"
  grep -q '^name: .\+' "$prompt_file" || fail "${prompt_file#"$repo_root"/} has no name"
  grep -q '^description: .\+' "$prompt_file" || fail "${prompt_file#"$repo_root"/} has no description"
  prompt_name="$(sed -n 's/^name: //p' "$prompt_file" | sed -n '1p')"
  [[ "$prompt_name" == "$prompt_basename" ]] || fail "${prompt_file#"$repo_root"/} name does not match filename"
  actual_prompts+="$prompt_basename"$'\n'
done

[[ $prompt_count -eq 13 ]] || fail "expected 13 prompt files, found $prompt_count"

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
  fail "VSCodium installer integration test failed"
fi

if [[ $errors -gt 0 ]]; then
  printf 'validation failed with %d error(s)\n' "$errors" >&2
  exit 1
fi

printf 'VSCodium validation passed: %d prompts checked\n' "$prompt_count"
