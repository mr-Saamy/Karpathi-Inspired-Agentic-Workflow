$ErrorActionPreference = 'Stop'
$scriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
$tempDir = Join-Path $env:TEMP ("terminal-test-" + [System.Guid]::NewGuid().ToString())

try {
    New-Item -ItemType Directory -Force -Path $tempDir | Out-Null
    $env:HOME = $tempDir

    # Test dry-run
    powershell -ExecutionPolicy Bypass -File "$scriptDir\install.ps1" -DryRun | Out-Null

    if (Test-Path "$tempDir\.config\terminal-ai") {
        Write-Error "Test failed: dry-run created directory"
        exit 1
    }

    # Test live install
    powershell -ExecutionPolicy Bypass -File "$scriptDir\install.ps1" | Out-Null

    if (-not (Test-Path "$tempDir\.config\terminal-ai\CLAUDE.md")) {
        Write-Error "Test failed: CLAUDE.md not created"
        exit 1
    }

    if (-not (Test-Path "$tempDir\.config\terminal-ai\.aider.conf.yml")) {
        Write-Error "Test failed: .aider.conf.yml not created"
        exit 1
    }

    if (-not (Test-Path "$tempDir\.config\terminal-ai\prompts")) {
        Write-Error "Test failed: prompts directory not created"
        exit 1
    }

    $count = (Get-ChildItem -Path "$tempDir\.config\terminal-ai\prompts\*.prompt.md").Count
    if ($count -ne 13) {
        Write-Error "Test failed: expected 13 prompts, found $count"
        exit 1
    }

    Write-Host "Terminal installer test passed"
}
finally {
    if (Test-Path $tempDir) {
        Remove-Item -Recurse -Force $tempDir
    }
}
