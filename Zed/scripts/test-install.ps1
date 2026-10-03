$ErrorActionPreference = 'Stop'
$scriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
$tempDir = Join-Path $env:TEMP ("zed-test-" + [System.Guid]::NewGuid().ToString())

try {
    New-Item -ItemType Directory -Force -Path $tempDir | Out-Null
    $env:APPDATA = $tempDir

    # Test dry-run
    powershell -ExecutionPolicy Bypass -File "$scriptDir\install.ps1" -DryRun | Out-Null

    if (Test-Path "$tempDir\Zed") {
        Write-Error "Test failed: dry-run created directory"
        exit 1
    }

    # Test live install
    powershell -ExecutionPolicy Bypass -File "$scriptDir\install.ps1" | Out-Null

    if (-not (Test-Path "$tempDir\Zed\assistant-instructions.md")) {
        Write-Error "Test failed: assistant-instructions.md not created"
        exit 1
    }

    if (-not (Test-Path "$tempDir\Zed\prompts")) {
        Write-Error "Test failed: prompts directory not created"
        exit 1
    }

    $count = (Get-ChildItem -Path "$tempDir\Zed\prompts\*.prompt.md").Count
    if ($count -ne 13) {
        Write-Error "Test failed: expected 13 prompts, found $count"
        exit 1
    }

    Write-Host "Zed installer test passed"
}
finally {
    if (Test-Path $tempDir) {
        Remove-Item -Recurse -Force $tempDir
    }
}
