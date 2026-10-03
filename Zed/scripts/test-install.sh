#!/usr/bin/env bash
set -euo pipefail

script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
temp_home="$(mktemp -d)"

cleanup() {
  rm -rf "$temp_home"
}
trap cleanup EXIT

# Test dry-run
ZED_CONFIG="$temp_home/.config/zed" bash "$script_dir/install.sh" --dry-run >/dev/null

if [[ -d "$temp_home/.config/zed" ]]; then
  echo "Test failed: dry-run created directories" >&2
  exit 1
fi

# Test live install
ZED_CONFIG="$temp_home/.config/zed" bash "$script_dir/install.sh" >/dev/null

if [[ ! -f "$temp_home/.config/zed/assistant-instructions.md" ]]; then
  echo "Test failed: assistant-instructions.md not created" >&2
  exit 1
fi

if [[ ! -d "$temp_home/.config/zed/prompts" ]]; then
  echo "Test failed: prompts directory not created" >&2
  exit 1
fi

prompt_count=$(find "$temp_home/.config/zed/prompts" -name '*.prompt.md' | wc -l)
if [[ $prompt_count -ne 13 ]]; then
  echo "Test failed: expected 13 prompts, found $prompt_count" >&2
  exit 1
fi

# Test idempotency (re-running install)
ZED_CONFIG="$temp_home/.config/zed" bash "$script_dir/install.sh" >/dev/null

echo "Zed installer test passed"
