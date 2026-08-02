#!/usr/bin/env bash
set -euo pipefail

dry_run=0
if [[ "${1:-}" == "--dry-run" ]]; then
  dry_run=1
fi

repo_root="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
target_dir="${HOME}/.config/github-copilot"
timestamp="$(date +%Y%m%d%H%M%S)"
backup_dir="${target_dir}/backups/copilot-ai-${timestamp}"

log() {
  printf '[copilot-install] %s\n' "$1"
}

if [[ $dry_run -eq 1 ]]; then
  log "Dry-run mode: no files will be modified."
  log "Target directory: $target_dir"
  log "Would backup existing config to: $backup_dir"
  log "Would install copilot-instructions.md and prompt files under .github/"
  exit 0
fi

mkdir -p "$target_dir/prompts" "$target_dir/instructions" "$backup_dir"

if [[ -f "$target_dir/copilot-instructions.md" ]]; then
  log "Backing up existing copilot-instructions.md..."
  cp "$target_dir/copilot-instructions.md" "$backup_dir/"
fi

log "Installing GitHub Copilot custom instructions..."
cp "$repo_root/.github/copilot-instructions.md" "$target_dir/copilot-instructions.md"

log "Installing GitHub Copilot prompt files..."
cp -r "$repo_root/.github/prompts/"* "$target_dir/prompts/"

log "Installing instruction modules..."
cp -r "$repo_root/.github/instructions/"* "$target_dir/instructions/"

log "Installation complete!"
