#!/usr/bin/env bash
set -euo pipefail

repo_root="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

echo "[1/6] Validating Antigravity IDE configuration..."
(cd "$repo_root/Antigravity IDE" && ./scripts/validate.sh)

echo ""
echo "[2/6] Validating GitHub Copilot configuration..."
(cd "$repo_root/Github Copilot" && ./scripts/validate.sh)

echo ""
echo "[3/6] Validating Zed Editor configuration..."
(cd "$repo_root/Zed" && ./scripts/validate.sh)

echo ""
echo "[4/6] Validating VSCodium / Open VS Code configuration..."
(cd "$repo_root/VSCodium" && ./scripts/validate.sh)

echo ""
echo "[5/6] Validating Terminal & CLI configuration..."
(cd "$repo_root/Terminal" && ./scripts/validate.sh)

echo ""
echo "[6/6] Verifying universal skill parity..."
"$repo_root/scripts/test-skill-parity.sh"

echo ""
echo "All validation suites and parity checks passed successfully across all targets!"
