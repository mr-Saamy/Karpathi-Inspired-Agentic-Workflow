[CmdletBinding()]
param(
    [ValidateSet("all", "antigravity", "copilot", "zed", "vscodium", "terminal")]
    [string]$Target = "all",
    [switch]$DryRun
)

$ErrorActionPreference = 'Stop'
$repoRoot = Resolve-Path "$PSScriptRoot\.."

function Invoke-SubInstaller {
    param(
        [string]$Name,
        [string]$SubDir
    )
    Write-Host "=== Installing $Name configuration ==="
    $script = Join-Path $repoRoot "$SubDir\scripts\install.ps1"
    if (Test-Path $script) {
        $params = @{}
        if ($DryRun) {
            $params["DryRun"] = $true
        }
        & $script @params
    } else {
        Write-Warning "Installer not found: $script"
    }
    Write-Host ""
}

switch ($Target.ToLower()) {
    "antigravity" {
        Invoke-SubInstaller "Antigravity IDE" "Antigravity IDE"
    }
    "copilot" {
        Invoke-SubInstaller "GitHub Copilot" "Github Copilot"
    }
    "zed" {
        Invoke-SubInstaller "Zed Editor" "Zed"
    }
    "vscodium" {
        Invoke-SubInstaller "VSCodium / Open VS Code" "VSCodium"
    }
    "terminal" {
        Invoke-SubInstaller "Terminal & CLI" "Terminal"
    }
    "all" {
        Invoke-SubInstaller "Antigravity IDE" "Antigravity IDE"
        Invoke-SubInstaller "GitHub Copilot" "Github Copilot"
        Invoke-SubInstaller "Zed Editor" "Zed"
        Invoke-SubInstaller "VSCodium / Open VS Code" "VSCodium"
        Invoke-SubInstaller "Terminal & CLI" "Terminal"
    }
}

Write-Host "Universal installation completed successfully!"
