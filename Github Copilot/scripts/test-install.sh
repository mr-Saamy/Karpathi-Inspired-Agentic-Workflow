#!/usr/bin/env bash
set -euo pipefail

script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
temp_home="$(mktemp -d)"

cleanup() {
  rm -rf "$temp_home"
}
trap cleanup EXIT

HOME="$temp_home" bash "$script_dir/install.sh" >/dev/null

if [[ ! -f "$temp_home/.config/github-copilot/copilot-instructions.md" ]]; then
  echo "Test failed: copilot-instructions.md not created" >&2
  exit 1
fi

if [[ ! -d "$temp_home/.config/github-copilot/prompts" ]]; then
  echo "Test failed: prompts directory not created" >&2
  exit 1
fi

echo "Copilot installer test passed"
