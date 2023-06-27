#requires -Modules BuildHelpers

param(
    [Parameter()]
    [string]$BuildOutput_Path = (Join-Path -Path (Resolve-Path -Path "$PSScriptRoot/..") -ChildPath 'Build_Output')
)

# Variables
$Repo_Path = Resolve-Path -Path "$PSScriptRoot/.."

# Prepare build output
if (Test-Path -Path $BuildOutput_Path) {
    Write-Verbose 'Removing existing build output directory...'

    Remove-Item -Path $BuildOutput_Path -Recurse -ErrorAction SilentlyContinue
}

Write-Verbose 'Creating build output directory...'

New-Item -Path $BuildOutput_Path -Type Directory | Out-Null
