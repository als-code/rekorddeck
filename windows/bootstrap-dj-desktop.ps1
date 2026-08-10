<#
.SYNOPSIS
  Download Rekorddeck desktop-pack files and create Desktop shortcuts (no git clone).
#>
[CmdletBinding()]
param(
    [string]$DesktopPath = [Environment]::GetFolderPath('Desktop'),
    [string]$Branch = 'main',
    [string]$RepoRawBase = 'https://raw.githubusercontent.com/als-code/rekorddeck'
)

$ErrorActionPreference = 'Stop'
$Base = "$RepoRawBase/$Branch/windows"
$Work = Join-Path $env:TEMP ("rekorddeck-desktop-" + [guid]::NewGuid().ToString('N').Substring(0, 8))
$LinksDir = Join-Path $Work 'links'
New-Item -ItemType Directory -Force -Path $LinksDir | Out-Null

Write-Host "Downloading Rekorddeck desktop pack from $Base ..."
$files = @(
    @{ Rel = 'New-RekorddeckDesktop.ps1'; Dest = (Join-Path $Work 'New-RekorddeckDesktop.ps1') }
    @{ Rel = 'Install-Rekordbox6.ps1'; Dest = (Join-Path $Work 'Install-Rekordbox6.ps1') }
    @{ Rel = 'links/audio-interfaces.md'; Dest = (Join-Path $LinksDir 'audio-interfaces.md') }
    @{ Rel = 'links/dj-software.md'; Dest = (Join-Path $LinksDir 'dj-software.md') }
    @{ Rel = 'links/usb-hubs.md'; Dest = (Join-Path $LinksDir 'usb-hubs.md') }
    @{ Rel = 'links/valve-drivers.md'; Dest = (Join-Path $LinksDir 'valve-drivers.md') }
)

foreach ($f in $files) {
    $url = "$Base/$($f.Rel -replace '\\','/')"
    Invoke-WebRequest -Uri $url -OutFile $f.Dest -UseBasicParsing
}

$script = Join-Path $Work 'New-RekorddeckDesktop.ps1'
Write-Host "Running: $script"
& $script -DesktopPath $DesktopPath
Write-Host "Finished. Work dir (temp): $Work"
