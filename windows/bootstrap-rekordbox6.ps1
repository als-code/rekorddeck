<#
.SYNOPSIS
  Open official rekordbox 6 archive pages (no git clone, no installer download).
#>
[CmdletBinding()]
param(
    [switch]$OpenLatestPortal,
    [string]$Branch = 'main',
    [string]$RepoRawBase = 'https://raw.githubusercontent.com/als-code/rekorddeck'
)

$ErrorActionPreference = 'Stop'
$Base = "$RepoRawBase/$Branch/windows"
$Work = Join-Path $env:TEMP ("rekorddeck-rb6-" + [guid]::NewGuid().ToString('N').Substring(0, 8))
New-Item -ItemType Directory -Force -Path $Work | Out-Null

$url = "$Base/Install-Rekordbox6.ps1"
$dest = Join-Path $Work 'Install-Rekordbox6.ps1'
Write-Host "Downloading $url ..."
Invoke-WebRequest -Uri $url -OutFile $dest -UseBasicParsing

$argList = @()
if ($OpenLatestPortal) { $argList += '-OpenLatestPortal' }
& $dest @argList
