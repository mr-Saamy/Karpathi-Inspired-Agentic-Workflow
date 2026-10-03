#!/usr/bin/env bash
set -euo pipefail

target="all"
dry_run=""

show_help() {
  cat <<EOF
Usage: $0 [OPTIONS]

Options:
  --target <antigravity|copilot|zed|vscodium|terminal|all>
                     Target environment to install (default: all)
  --dry-run          Preview installation without modifying files
  -h, --help         Show this help message
EOF
}

while [[ $# -gt 0 ]]; do
  case "$1" in
    --target)
      target="${2:-all}"
      shift 2
      ;;
    --dry-run)
      dry_run="--dry-run"
      shift
      ;;
    -h|--help)
      show_help
      exit 0
      ;;
    *)
      printf 'error: unknown option %s\n' "$1" >&2
      show_help
      exit 2
      ;;
  esac
done

repo_root="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

run_installer() {
  local name="$1"
  local sub_dir="$2"
  echo "=== Installing $name configuration ==="
  if [[ -n "$dry_run" ]]; then
    (cd "$repo_root/$sub_dir" && ./scripts/install.sh --dry-run)
  else
    (cd "$repo_root/$sub_dir" && ./scripts/install.sh)
  fi
  echo ""
}

case "$target" in
  antigravity)
    run_installer "Antigravity IDE" "Antigravity IDE"
    ;;
  copilot)
    run_installer "GitHub Copilot" "Github Copilot"
    ;;
  zed)
    run_installer "Zed Editor" "Zed"
    ;;
  vscodium)
    run_installer "VSCodium / Open VS Code" "VSCodium"
    ;;
  terminal)
    run_installer "Terminal & CLI" "Terminal"
    ;;
  all)
    run_installer "Antigravity IDE" "Antigravity IDE"
    run_installer "GitHub Copilot" "Github Copilot"
    run_installer "Zed Editor" "Zed"
    run_installer "VSCodium / Open VS Code" "VSCodium"
    run_installer "Terminal & CLI" "Terminal"
    ;;
  *)
    printf 'error: invalid target: %s\n' "$target" >&2
    exit 1
    ;;
esac

echo "Universal installation completed successfully!"
