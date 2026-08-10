<#
.SYNOPSIS
  Create Rekorddeck Desktop folders with official .url shortcuts from links/*.md

.PARAMETER DesktopPath
  Override Desktop path (defaults to current user Desktop).
#>
[CmdletBinding()]
param(
    [string]$DesktopPath = [Environment]::GetFolderPath('Desktop')
)

$ErrorActionPreference = 'Stop'
$LinksRoot = Join-Path $PSScriptRoot 'links'

function Get-LinkEntries {
    param([string]$FilePath)
    $entries = @()
    if (-not (Test-Path $FilePath)) { return $entries }
    $lines = Get-Content $FilePath | ForEach-Object { $_.TrimEnd() }
    $pendingLabel = $null
    foreach ($raw in $lines) {
        $line = $raw.Trim()
        if (-not $line -or $line.StartsWith('#')) {
            $pendingLabel = $null
            continue
        }
        if ($line -match '^(?<label>.+?)\s*\|\s*(?<url>https?://\S+)\s*$') {
            $entries += [pscustomobject]@{ Label = $Matches.label.Trim(); Url = $Matches.url.Trim() }
            $pendingLabel = $null
            continue
        }
        if ($line -match '^https?://') {
            if ($pendingLabel) {
                $label = $pendingLabel
            } else {
                $slug = $line -replace '^https?://', '' -replace '[\\/]', '-'
                if ($slug.Length -gt 60) { $slug = $slug.Substring(0, 60) }
                $label = $slug
            }
            $entries += [pscustomobject]@{ Label = $label; Url = $line }
            $pendingLabel = $null
            continue
        }
        $pendingLabel = $line
    }
    return $entries
}

function New-InternetShortcut {
    param(
        [string]$Folder,
        [string]$Label,
        [string]$Url
    )
    $safe = ($Label -replace '[<>:"/\\|?*]', '-').Trim()
    if (-not $safe) { $safe = 'link' }
    $path = Join-Path $Folder ($safe + '.url')
    @"
[InternetShortcut]
URL=$Url
"@ | Set-Content -Path $path -Encoding ASCII
}

function New-DeskFolder {
    param([string]$Name, [string]$LinkFile)
    $folder = Join-Path $DesktopPath $Name
    New-Item -ItemType Directory -Force -Path $folder | Out-Null
    $file = Join-Path $LinksRoot $LinkFile
    $count = 0
    foreach ($e in (Get-LinkEntries $file)) {
        New-InternetShortcut -Folder $folder -Label $e.Label -Url $e.Url
        $count++
    }
    Write-Host "Created $folder ($count shortcuts)"
    return $folder
}

Write-Host "Desktop: $DesktopPath"
New-DeskFolder 'Rekorddeck - Audio Drivers' 'audio-interfaces.md' | Out-Null
New-DeskFolder 'Rekorddeck - USB Hubs' 'usb-hubs.md' | Out-Null
$djFolder = New-DeskFolder 'Rekorddeck - DJ Software' 'dj-software.md'

# Shortcut that does not depend on a local clone / temp path
$cmdPath = Join-Path $djFolder 'Install-Rekordbox6.cmd'
@"
@echo off
echo Opening official rekordbox 6 archive (AlphaTheta / Pioneer)...
start "" "https://support.pioneerdj.com/hc/en-us/articles/8112764645785-I-want-to-use-previous-rekordbox-ver-6"
pause
"@ | Set-Content -Path $cmdPath -Encoding ASCII

$valveFolder = Join-Path $DesktopPath 'Rekorddeck - Valve & Dual-boot'
New-Item -ItemType Directory -Force -Path $valveFolder | Out-Null
foreach ($e in (Get-LinkEntries (Join-Path $LinksRoot 'valve-drivers.md'))) {
    New-InternetShortcut -Folder $valveFolder -Label $e.Label -Url $e.Url
}
Write-Host "Created $valveFolder"
Write-Host 'Done. Open the Rekorddeck folders on your Desktop.'
