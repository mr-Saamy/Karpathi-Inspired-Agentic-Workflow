[CmdletBinding()]
param(
    [switch]$DryRun
)

$ErrorActionPreference = 'Stop'
$repoRoot = Resolve-Path "$PSScriptRoot\.."
$targetDir = "$HOME\.config\terminal-ai"
$timestamp = Get-Date -Format "yyyyMMddHHmmss"
$backupDir = "$targetDir\backups\terminal-ai-$timestamp"

Write-Host "[terminal-install] Installing Terminal / CLI configuration..."

if ($DryRun) {
    Write-Host "[terminal-install] Dry-run mode: no files will be modified."
    Write-Host "[terminal-install] Target directory: $targetDir"
    exit 0
}

New-Item -ItemType Directory -Force -Path "$targetDir\prompts" | Out-Null
New-Item -ItemType Directory -Force -Path "$backupDir" | Out-Null

if (Test-Path "$targetDir\CLAUDE.md") {
    Copy-Item -Path "$targetDir\CLAUDE.md" -Destination "$backupDir\"
}

Copy-Item -Path "$repoRoot\CLAUDE.md" -Destination "$targetDir\CLAUDE.md" -Force
Copy-Item -Path "$repoRoot\.aider.conf.yml" -Destination "$targetDir\.aider.conf.yml" -Force
Copy-Item -Path "$repoRoot\.aider.prompt.md" -Destination "$targetDir\.aider.prompt.md" -Force
Copy-Item -Path "$repoRoot\prompts\*" -Destination "$targetDir\prompts\" -Recurse -Force

Write-Host "[terminal-install] Installation complete!"
