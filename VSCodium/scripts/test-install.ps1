$ErrorActionPreference = 'Stop'
$scriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
$tempDir = Join-Path $env:TEMP ("vscodium-test-" + [System.Guid]::NewGuid().ToString())

try {
    New-Item -ItemType Directory -Force -Path $tempDir | Out-Null
    $env:HOME = $tempDir

    # Test dry-run
    powershell -ExecutionPolicy Bypass -File "$scriptDir\install.ps1" -DryRun | Out-Null

    if (Test-Path "$tempDir\.continue") {
        Write-Error "Test failed: dry-run created directory"
        exit 1
    }

    # Test live install
    powershell -ExecutionPolicy Bypass -File "$scriptDir\install.ps1" | Out-Null

    if (-not (Test-Path "$tempDir\.continue\config.json")) {
        Write-Error "Test failed: config.json not created"
        exit 1
    }

    if (-not (Test-Path "$tempDir\.continue\prompts")) {
        Write-Error "Test failed: prompts directory not created"
        exit 1
    }

    $count = (Get-ChildItem -Path "$tempDir\.continue\prompts\*.prompt.md").Count
    if ($count -ne 13) {
        Write-Error "Test failed: expected 13 prompts, found $count"
        exit 1
    }

    Write-Host "VSCodium installer test passed"
}
finally {
    if (Test-Path $tempDir) {
        Remove-Item -Recurse -Force $tempDir
    }
}
