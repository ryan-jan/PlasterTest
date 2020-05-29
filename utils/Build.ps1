param (
    [Switch] $Test,
    [Switch] $CodeCov,
    [Switch] $Deploy
)

Write-Host "Running on PowerShell $($PSVersionTable.PSEdition) $($PSVersionTable.PSVersion.ToString())"
$RepoRoot = Split-Path -Path $PSScriptRoot -Parent
$ModulePath = Join-Path -Path $RepoRoot -ChildPath "src" -AdditionalChildPath "PlasterTest.psd1"
$TestsPath = Join-Path -Path $PSScriptRoot -ChildPath "Invoke-Tests.ps1"
$DeployPath = Join-Path -Path $PSScriptRoot -ChildPath "Deploy.ps1"
Import-Module $ModulePath

if ($Test) {
    if ($CodeCov) {
        & $TestsPath -CodeCov
    } else {
        & $TestsPath
    }
}

if ($Deploy) {
    & $DeployPath
}

