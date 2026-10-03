#!/usr/bin/env bash
set -euo pipefail

script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
temp_home="$(mktemp -d)"

cleanup() {
  rm -rf "$temp_home"
}
trap cleanup EXIT

# Test dry-run
TERMINAL_CONFIG="$temp_home/.config/terminal-ai" bash "$script_dir/install.sh" --dry-run >/dev/null

if [[ -d "$temp_home/.config/terminal-ai" ]]; then
  echo "Test failed: dry-run created directory" >&2
  exit 1
fi

# Test live install
TERMINAL_CONFIG="$temp_home/.config/terminal-ai" bash "$script_dir/install.sh" >/dev/null

if [[ ! -f "$temp_home/.config/terminal-ai/CLAUDE.md" ]]; then
  echo "Test failed: CLAUDE.md not created" >&2
  exit 1
fi

if [[ ! -f "$temp_home/.config/terminal-ai/.aider.conf.yml" ]]; then
  echo "Test failed: .aider.conf.yml not created" >&2
  exit 1
fi

if [[ ! -d "$temp_home/.config/terminal-ai/prompts" ]]; then
  echo "Test failed: prompts directory not created" >&2
  exit 1
fi

prompt_count=$(find "$temp_home/.config/terminal-ai/prompts" -name '*.prompt.md' | wc -l)
if [[ $prompt_count -ne 13 ]]; then
  echo "Test failed: expected 13 prompts, found $prompt_count" >&2
  exit 1
fi

# Test idempotency (re-running install)
TERMINAL_CONFIG="$temp_home/.config/terminal-ai" bash "$script_dir/install.sh" >/dev/null

echo "Terminal installer test passed"
