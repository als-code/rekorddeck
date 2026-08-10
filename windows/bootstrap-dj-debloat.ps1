<#
.SYNOPSIS
  Download Rekorddeck DJ debloat files to a temp folder and run them (no git clone).

.DESCRIPTION
  Fetches Invoke-DjDebloat.ps1 and windows/debloat/*.txt from GitHub raw, then
  invokes the script. Default is dry-run. Pass -Apply to make changes.

.EXAMPLE
  # Dry-run (elevated PowerShell recommended for -Apply)
  irm https://raw.githubusercontent.com/als-code/rekorddeck/main/windows/bootstrap-dj-debloat.ps1 | iex

.EXAMPLE
  & ([scriptblock]::Create((irm https://raw.githubusercontent.com/als-code/rekorddeck/main/windows/bootstrap-dj-debloat.ps1))) -Apply

.EXAMPLE
  & ([scriptblock]::Create((irm https://raw.githubusercontent.com/als-code/rekorddeck/main/windows/bootstrap-dj-debloat.ps1))) -Apply -VisualLite
#>
[CmdletBinding()]
param(
    [switch]$Apply,
    [switch]$VisualLite,
    [switch]$SkipRestorePoint,
    [string]$Branch = 'main',
    [string]$RepoRawBase = 'https://raw.githubusercontent.com/als-code/rekorddeck'
)

$ErrorActionPreference = 'Stop'
$Base = "$RepoRawBase/$Branch/windows"
$Work = Join-Path $env:TEMP ("rekorddeck-debloat-" + [guid]::NewGuid().ToString('N').Substring(0, 8))
$DebloatDir = Join-Path $Work 'debloat'
New-Item -ItemType Directory -Force -Path $DebloatDir | Out-Null

Write-Host "Downloading Rekorddeck DJ debloat from $Base ..."
$files = @(
    @{ Rel = 'Invoke-DjDebloat.ps1'; Dest = (Join-Path $Work 'Invoke-DjDebloat.ps1') }
    @{ Rel = 'debloat/appx-remove.txt'; Dest = (Join-Path $DebloatDir 'appx-remove.txt') }
    @{ Rel = 'debloat/tasks-disable.txt'; Dest = (Join-Path $DebloatDir 'tasks-disable.txt') }
    @{ Rel = 'debloat/services-disable.txt'; Dest = (Join-Path $DebloatDir 'services-disable.txt') }
)

foreach ($f in $files) {
    $url = "$Base/$($f.Rel -replace '\\','/')"
    Invoke-WebRequest -Uri $url -OutFile $f.Dest -UseBasicParsing
}

$script = Join-Path $Work 'Invoke-DjDebloat.ps1'
$argList = @()
if ($Apply) { $argList += '-Apply' }
if ($VisualLite) { $argList += '-VisualLite' }
if ($SkipRestorePoint) { $argList += '-SkipRestorePoint' }

Write-Host "Running: $script $($argList -join ' ')"
Write-Host "Work dir: $Work"
& $script @argList
$exit = $LASTEXITCODE
Write-Host "Finished (exit $exit). Logs under %USERPROFILE%\Rekorddeck\logs"
exit $exit
