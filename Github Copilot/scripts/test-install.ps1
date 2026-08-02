$ErrorActionPreference = 'Stop'
$scriptPath = "$PSScriptRoot\install.ps1"

Write-Host "Running Copilot PowerShell installer dry-run test..."
& $scriptPath -DryRun
Write-Host "Copilot PowerShell installer test passed!"
