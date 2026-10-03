[CmdletBinding()]
param(
    [switch]$DryRun
)

$ErrorActionPreference = 'Stop'
$repoRoot = Resolve-Path "$PSScriptRoot\.."
$targetDir = "$env:APPDATA\Zed"
$timestamp = Get-Date -Format "yyyyMMddHHmmss"
$backupDir = "$targetDir\backups\zed-ai-$timestamp"

Write-Host "[zed-install] Installing Zed configuration..."

if ($DryRun) {
    Write-Host "[zed-install] Dry-run mode: no files will be modified."
    Write-Host "[zed-install] Target directory: $targetDir"
    exit 0
}

New-Item -ItemType Directory -Force -Path "$targetDir\prompts" | Out-Null
New-Item -ItemType Directory -Force -Path "$backupDir" | Out-Null

if (Test-Path "$targetDir\assistant-instructions.md") {
    Copy-Item -Path "$targetDir\assistant-instructions.md" -Destination "$backupDir\"
}

Copy-Item -Path "$repoRoot\.zed\assistant-instructions.md" -Destination "$targetDir\assistant-instructions.md" -Force
Copy-Item -Path "$repoRoot\.zed\prompts\*" -Destination "$targetDir\prompts\" -Recurse -Force

Write-Host "[zed-install] Installation complete!"
