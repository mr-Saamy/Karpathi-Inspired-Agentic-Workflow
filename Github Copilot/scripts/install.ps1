[CmdletBinding()]
param(
    [switch]$DryRun
)

$ErrorActionPreference = 'Stop'
$repoRoot = Resolve-Path "$PSScriptRoot\.."
$targetDir = "$HOME\.config\github-copilot"
$timestamp = Get-Date -Format "yyyyMMddHHmmss"
$backupDir = "$targetDir\backups\copilot-ai-$timestamp"

Write-Host "[copilot-install] Installing GitHub Copilot configuration..."

if ($DryRun) {
    Write-Host "[copilot-install] Dry-run mode: no files will be modified."
    Write-Host "[copilot-install] Target directory: $targetDir"
    exit 0
}

New-Item -ItemType Directory -Force -Path "$targetDir\prompts" | Out-Null
New-Item -ItemType Directory -Force -Path "$targetDir\instructions" | Out-Null
New-Item -ItemType Directory -Force -Path "$backupDir" | Out-Null

if (Test-Path "$targetDir\copilot-instructions.md") {
    Copy-Item -Path "$targetDir\copilot-instructions.md" -Destination "$backupDir\"
}

Copy-Item -Path "$repoRoot\.github\copilot-instructions.md" -Destination "$targetDir\copilot-instructions.md" -Force
Copy-Item -Path "$repoRoot\.github\prompts\*" -Destination "$targetDir\prompts\" -Recurse -Force
Copy-Item -Path "$repoRoot\.github\instructions\*" -Destination "$targetDir\instructions\" -Recurse -Force

Write-Host "[copilot-install] Installation complete!"
