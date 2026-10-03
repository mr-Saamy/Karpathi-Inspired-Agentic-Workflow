#!/usr/bin/env bash
set -euo pipefail

dry_run=0
if [[ "${1:-}" == "--dry-run" ]]; then
  dry_run=1
fi

repo_root="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
target_dir="${CONTINUE_CONFIG:-$HOME/.continue}"
timestamp="$(date +%Y%m%d%H%M%S)"
backup_dir="${target_dir}/backups/vscodium-ai-${timestamp}"

log() {
  printf '[vscodium-install] %s\n' "$1"
}

if [[ $dry_run -eq 1 ]]; then
  log "Dry-run mode: no files will be modified."
  log "Target directory: $target_dir"
  log "Would backup existing config to: $backup_dir"
  log "Would install config.json and prompt files under .continue/"
  exit 0
fi

mkdir -p "$target_dir/prompts" "$backup_dir"

if [[ -f "$target_dir/config.json" ]]; then
  log "Backing up existing config.json..."
  cp "$target_dir/config.json" "$backup_dir/"
fi

log "Installing Continue.dev configuration..."
cp "$repo_root/.continue/config.json" "$target_dir/config.json"

log "Installing Continue.dev prompt files..."
cp -r "$repo_root/.continue/prompts/"* "$target_dir/prompts/"

log "Installation complete!"
