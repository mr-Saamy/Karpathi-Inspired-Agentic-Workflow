#!/usr/bin/env bash
set -euo pipefail

repo_root="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
errors=0

fail() {
  printf 'parity error: %s\n' "$1" >&2
  errors=$((errors + 1))
}

expected_skills=(
  "ai-project-manager"
  "axiom"
  "bash-scripting"
  "forgejo-maintainer"
  "homelab-admin"
  "hugo"
  "linux-sysadmin"
  "mdbook"
  "podman-operator"
  "pr-readiness"
  "python-ai"
  "quickshell"
  "rust-cli"
)

targets=(
  "Antigravity IDE:.agents/skills:SKILL.md"
  "Github Copilot:.github/prompts:.prompt.md"
  "Zed:.zed/prompts:.prompt.md"
  "VSCodium:.continue/prompts:.prompt.md"
  "Terminal:prompts:.prompt.md"
)

echo "Verifying skill parity across all 5 target environments..."

for target_spec in "${targets[@]}"; do
  target_dir="${target_spec%%:*}"
  rest="${target_spec#*:}"
  rel_dir="${rest%%:*}"
  suffix="${rest#*:}"

  target_path="$repo_root/$target_dir/$rel_dir"
  [[ -d "$target_path" ]] || fail "missing directory $target_dir/$rel_dir"

  for skill in "${expected_skills[@]}"; do
    if [[ "$suffix" == "SKILL.md" ]]; then
      file="$target_path/$skill/SKILL.md"
    else
      file="$target_path/$skill$suffix"
    fi

    if [[ ! -f "$file" ]]; then
      fail "missing skill '$skill' in $target_dir ($file)"
      continue
    fi

    # Check YAML frontmatter name
    first_line="$(sed -n '1p' "$file")"
    if [[ "$first_line" != "---" ]]; then
      fail "$file has no YAML frontmatter"
      continue
    fi

    skill_name="$(sed -n 's/^name: //p' "$file" | head -n 1)"
    if [[ "$skill_name" != "$skill" ]]; then
      fail "$file name '$skill_name' does not match expected '$skill'"
    fi

    if ! grep -q '^description: .\+' "$file"; then
      fail "$file has no description"
    fi
  done
done

if [[ $errors -gt 0 ]]; then
  printf 'Skill parity verification failed with %d error(s)\n' "$errors" >&2
  exit 1
fi

printf 'All 13 skills verified with 100%% parity across all 5 target environments!\n'
