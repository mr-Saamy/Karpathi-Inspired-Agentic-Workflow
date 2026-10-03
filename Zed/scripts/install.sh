#!/usr/bin/env bash
set -euo pipefail

dry_run=0
if [[ "${1:-}" == "--dry-run" ]]; then
  dry_run=1
fi

repo_root="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

# Detect OS for default config dir
if [[ "$(uname -s)" == "Darwin" ]]; then
  target_dir="${HOME}/Library/Application Support/Zed"
else
  target_dir="${HOME}/.config/zed"
fi

# Allow override via ZED_CONFIG
target_dir="${ZED_CONFIG:-$target_dir}"

timestamp="$(date +%Y%m%d%H%M%S)"
backup_dir="${target_dir}/backups/zed-ai-${timestamp}"

log() {
  printf '[zed-install] %s\n' "$1"
}

if [[ $dry_run -eq 1 ]]; then
  log "Dry-run mode: no files will be modified."
  log "Target directory: $target_dir"
  log "Would backup existing config to: $backup_dir"
  log "Would install assistant-instructions.md and prompt files under .zed/"
  exit 0
fi

mkdir -p "$target_dir/prompts" "$backup_dir"

if [[ -f "$target_dir/assistant-instructions.md" ]]; then
  log "Backing up existing assistant-instructions.md..."
  cp "$target_dir/assistant-instructions.md" "$backup_dir/"
fi

log "Installing Zed assistant instructions..."
cp "$repo_root/.zed/assistant-instructions.md" "$target_dir/assistant-instructions.md"

log "Installing Zed custom prompt files..."
cp -r "$repo_root/.zed/prompts/"* "$target_dir/prompts/"

log "Installation complete!"
