#!/usr/bin/env bash
set -euo pipefail

script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
temp_home="$(mktemp -d)"

cleanup() {
  rm -rf "$temp_home"
}
trap cleanup EXIT

# Test dry-run
CONTINUE_CONFIG="$temp_home/.continue" bash "$script_dir/install.sh" --dry-run >/dev/null

if [[ -d "$temp_home/.continue" ]]; then
  echo "Test failed: dry-run created directory" >&2
  exit 1
fi

# Test live install
CONTINUE_CONFIG="$temp_home/.continue" bash "$script_dir/install.sh" >/dev/null

if [[ ! -f "$temp_home/.continue/config.json" ]]; then
  echo "Test failed: config.json not created" >&2
  exit 1
fi

if [[ ! -d "$temp_home/.continue/prompts" ]]; then
  echo "Test failed: prompts directory not created" >&2
  exit 1
fi

prompt_count=$(find "$temp_home/.continue/prompts" -name '*.prompt.md' | wc -l)
if [[ $prompt_count -ne 13 ]]; then
  echo "Test failed: expected 13 prompts, found $prompt_count" >&2
  exit 1
fi

# Test idempotency (re-running install)
CONTINUE_CONFIG="$temp_home/.continue" bash "$script_dir/install.sh" >/dev/null

echo "VSCodium installer test passed"
