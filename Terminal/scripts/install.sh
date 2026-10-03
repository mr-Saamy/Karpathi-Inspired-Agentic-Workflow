#!/usr/bin/env bash
set -euo pipefail

dry_run=0
if [[ "${1:-}" == "--dry-run" ]]; then
  dry_run=1
fi

repo_root="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
target_dir="${TERMINAL_CONFIG:-$HOME/.config/terminal-ai}"
timestamp="$(date +%Y%m%d%H%M%S)"
backup_dir="${target_dir}/backups/terminal-ai-${timestamp}"

log() {
  printf '[terminal-install] %s\n' "$1"
}

if [[ $dry_run -eq 1 ]]; then
  log "Dry-run mode: no files will be modified."
  log "Target directory: $target_dir"
  log "Would backup existing config to: $backup_dir"
  log "Would install CLAUDE.md, Aider configs, and prompt files"
  exit 0
fi

mkdir -p "$target_dir/prompts" "$backup_dir"

if [[ -f "$target_dir/CLAUDE.md" ]]; then
  log "Backing up existing CLAUDE.md..."
  cp "$target_dir/CLAUDE.md" "$backup_dir/"
fi

log "Installing Claude Code CLI instructions..."
cp "$repo_root/CLAUDE.md" "$target_dir/CLAUDE.md"

log "Installing Aider configuration..."
cp "$repo_root/.aider.conf.yml" "$target_dir/.aider.conf.yml"
cp "$repo_root/.aider.prompt.md" "$target_dir/.aider.prompt.md"

log "Installing prompt files..."
cp -r "$repo_root/prompts/"* "$target_dir/prompts/"

log "Installation complete!"
