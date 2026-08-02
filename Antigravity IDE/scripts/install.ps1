[CmdletBinding()]
param(
    [switch]$DryRun
)

$ErrorActionPreference = "Stop"

$repoRoot = Resolve-Path (Join-Path $PSScriptRoot "..")
$geminiConfig = if ($env:GEMINI_CONFIG) { $env:GEMINI_CONFIG } else { Join-Path $env:USERPROFILE ".gemini\config" }
$timestamp = Get-Date -Format "yyyyMMdd-HHmmss"
$backupRoot = Join-Path $geminiConfig "backups\antigravity-ai-$timestamp"

function Ensure-ParentDirectory ($path) {
    $parent = Split-Path -Parent $path
    if (-not (Test-Path $parent)) {
        if ($DryRun) {
            Write-Host "+ New-Item -ItemType Directory -Path $parent"
        } else {
            New-Item -ItemType Directory -Path $parent -Force | Out-Null
        }
    }
}

function Link-ManagedPath ($source, $target) {
    if (-not (Test-Path $source)) {
        Write-Error "Managed source does not exist: $source"
        exit 1
    }

    Ensure-ParentDirectory $target

    if (Test-Path $target) {
        $relative = $target.Replace("$geminiConfig\", "")
        $backup = Join-Path $backupRoot $relative
        Ensure-ParentDirectory $backup
        if ($DryRun) {
            Write-Host "+ Move-Item -Path $target -Destination $backup"
            Write-Host "+ New-Item -ItemType SymbolicLink -Path $target -Target $source"
        } else {
            Move-Item -Path $target -Destination $backup -Force
            New-Item -ItemType SymbolicLink -Path $target -Target $source -Force | Out-Null
            Write-Host "installed: $target -> $source"
        }
    } else {
        if ($DryRun) {
            Write-Host "+ New-Item -ItemType SymbolicLink -Path $target -Target $source"
        } else {
            New-Item -ItemType SymbolicLink -Path $target -Target $source -Force | Out-Null
            Write-Host "linked: $target -> $source"
        }
    }
}

Link-ManagedPath (Join-Path $repoRoot "antigravity-home\AGENTS.md") (Join-Path $geminiConfig "AGENTS.md")
Link-ManagedPath (Join-Path $repoRoot "antigravity-home\skills.json") (Join-Path $geminiConfig "skills.json")
Link-ManagedPath (Join-Path $repoRoot "antigravity-home\rules") (Join-Path $geminiConfig "rules")

$skills = Get-ChildItem -Path (Join-Path $repoRoot ".agents\skills") -Directory
foreach ($skill in $skills) {
    Link-ManagedPath $skill.FullName (Join-Path $geminiConfig "skills\$($skill.Name)")
}

if ($DryRun) {
    Write-Host "Dry run complete."
} else {
    Write-Host "Installation complete."
}
