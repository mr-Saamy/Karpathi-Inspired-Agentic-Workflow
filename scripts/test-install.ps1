[CmdletBinding()]
param()

$ErrorActionPreference = "Stop"
$repoRoot = Resolve-Path (Join-Path $PSScriptRoot "..")
$tempDir = Join-Path ([System.IO.Path]::GetTempPath()) "antigravity-ai-test-$([System.Guid]::NewGuid())"

New-Item -ItemType Directory -Path $tempDir | Out-Null

try {
    $env:GEMINI_CONFIG = Join-Path $tempDir ".gemini\config"
    New-Item -ItemType Directory -Path $env:GEMINI_CONFIG | Out-Null

    & (Join-Path $repoRoot "scripts\install.ps1") -DryRun
    & (Join-Path $repoRoot "scripts\install.ps1")

    if (-not (Test-Path (Join-Path $env:GEMINI_CONFIG "AGENTS.md"))) {
        throw "AGENTS.md missing after install"
    }

    Write-Host "PowerShell installer integration test passed."
}
finally {
    Remove-Item -Path $tempDir -Recurse -Force -ErrorAction SilentlyContinue
}
