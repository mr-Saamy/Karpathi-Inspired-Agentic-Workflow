#!/usr/bin/env bash
set -euo pipefail

repo_root="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

echo "[1/2] Validating Antigravity IDE configuration..."
(cd "$repo_root/Antigravity IDE" && ./scripts/validate.sh)

echo ""
echo "[2/2] Validating GitHub Copilot configuration..."
(cd "$repo_root/Github Copilot" && ./scripts/validate.sh)

echo ""
echo "All validation suites passed successfully across all IDE targets!"
