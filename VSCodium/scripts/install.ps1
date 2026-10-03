[CmdletBinding()]
param(
    [switch]$DryRun
)

$ErrorActionPreference = 'Stop'
$repoRoot = Resolve-Path "$PSScriptRoot\.."
$targetDir = "$HOME\.continue"
$timestamp = Get-Date -Format "yyyyMMddHHmmss"
$backupDir = "$targetDir\backups\vscodium-ai-$timestamp"

Write-Host "[vscodium-install] Installing Continue.dev configuration..."

if ($DryRun) {
    Write-Host "[vscodium-install] Dry-run mode: no files will be modified."
    Write-Host "[vscodium-install] Target directory: $targetDir"
    exit 0
}

New-Item -ItemType Directory -Force -Path "$targetDir\prompts" | Out-Null
New-Item -ItemType Directory -Force -Path "$backupDir" | Out-Null

if (Test-Path "$targetDir\config.json") {
    Copy-Item -Path "$targetDir\config.json" -Destination "$backupDir\"
}

Copy-Item -Path "$repoRoot\.continue\config.json" -Destination "$targetDir\config.json" -Force
Copy-Item -Path "$repoRoot\.continue\prompts\*" -Destination "$targetDir\prompts\" -Recurse -Force

Write-Host "[vscodium-install] Installation complete!"
