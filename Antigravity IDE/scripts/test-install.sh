#!/usr/bin/env bash
set -euo pipefail

repo_root="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
test_dir="$(mktemp -d "${TMPDIR:-/tmp}/antigravity-ai-test.XXXXXX")"

cleanup() {
  rm -rf -- "$test_dir"
}
trap cleanup EXIT

test_gemini_config="$test_dir/.gemini/config"
test_agents_home="$test_dir/.agents"

mkdir -p "$test_gemini_config" "$test_agents_home"

# Run install dry run
GEMINI_CONFIG="$test_gemini_config" AGENTS_HOME="$test_agents_home" \
  bash "$repo_root/scripts/install.sh" --dry-run >/dev/null

# Run actual install
GEMINI_CONFIG="$test_gemini_config" AGENTS_HOME="$test_agents_home" \
  bash "$repo_root/scripts/install.sh" >/dev/null

# Verify linked files exist
[[ -L "$test_gemini_config/AGENTS.md" ]] || { printf 'test-install error: AGENTS.md link missing\n' >&2; exit 1; }
[[ -L "$test_gemini_config/skills.json" ]] || { printf 'test-install error: skills.json link missing\n' >&2; exit 1; }

# Idempotency test (re-run install)
GEMINI_CONFIG="$test_gemini_config" AGENTS_HOME="$test_agents_home" \
  bash "$repo_root/scripts/install.sh" >/dev/null

printf 'installer integration test passed\n'
