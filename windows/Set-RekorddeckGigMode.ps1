<#
.SYNOPSIS
  Enable or disable Gig Mode: launch rekordbox after logon (delayed, maximized).

.DESCRIPTION
  Opt-in only. Creates/removes a Startup .cmd. Does not change wallpaper or taskbar —
  set those yourself (black wallpaper + auto-hide) for a cleaner look.
  Enable fullscreen inside rekordbox Preferences if you want true full screen.

.PARAMETER Enable
  Resolve rekordbox.exe and write Startup launcher.

.PARAMETER Disable
  Remove Startup launcher.

.PARAMETER DelaySeconds
  Seconds to wait after logon before starting rekordbox (default 5, max 5).

.PARAMETER RekordboxPath
  Optional full path to rekordbox.exe (skips auto-detect).
#>
[CmdletBinding(DefaultParameterSetName = 'Enable')]
param(
    [Parameter(ParameterSetName = 'Enable')]
    [switch]$Enable,

    [Parameter(ParameterSetName = 'Disable')]
    [switch]$Disable,

    [Parameter(ParameterSetName = 'Enable')]
    [ValidateRange(0, 5)]
    [int]$DelaySeconds = 5,

    [Parameter(ParameterSetName = 'Enable')]
    [string]$RekordboxPath
)

$ErrorActionPreference = 'Stop'
$StartupDir = [Environment]::GetFolderPath('Startup')
$LauncherName = 'Rekorddeck-GigMode.cmd'
$LauncherPath = Join-Path $StartupDir $LauncherName

function Find-RekordboxExe {
    param([string]$Override)
    if ($Override) {
        if (-not (Test-Path -LiteralPath $Override)) {
            throw "RekordboxPath not found: $Override"
        }
        return (Resolve-Path -LiteralPath $Override).Path
    }
    $roots = @(${env:ProgramFiles}, ${env:ProgramFiles(x86)}) | Where-Object { $_ }
    $hits = foreach ($root in $roots) {
        foreach ($pattern in @(
                (Join-Path $root 'rekordbox\*\rekordbox.exe'),
                (Join-Path $root 'Pioneer\rekordbox*\rekordbox.exe'),
                (Join-Path $root 'rekordbox\rekordbox.exe')
            )) {
            Get-Item -Path $pattern -ErrorAction SilentlyContinue
        }
    }
    $pick = $hits | Sort-Object FullName -Descending | Select-Object -First 1
    if (-not $pick) {
        throw "rekordbox.exe not found under Program Files. Install rekordbox 6 first, or pass -RekordboxPath."
    }
    return $pick.FullName
}

if ($Disable) {
    if (Test-Path -LiteralPath $LauncherPath) {
        Remove-Item -LiteralPath $LauncherPath -Force
        Write-Host "Gig Mode OFF — removed $LauncherPath"
    } else {
        Write-Host "Gig Mode already off (no $LauncherName in Startup)."
    }
    return
}

# Default / -Enable
if (-not $Enable -and -not $Disable) {
    $Enable = $true
}

$exe = Find-RekordboxExe -Override $RekordboxPath
# CMD-safe quoted path
$exeCmd = $exe.Replace('"', '')

@"
@echo off
REM Rekorddeck Gig Mode — auto-generated; remove via Set-RekorddeckGigMode.ps1 -Disable
timeout /t $DelaySeconds /nobreak >nul
start "" /max "$exeCmd"
"@ | Set-Content -Path $LauncherPath -Encoding ASCII

Write-Host "Gig Mode ON"
Write-Host "  rekordbox: $exe"
Write-Host "  delay:     ${DelaySeconds}s"
Write-Host "  launcher:  $LauncherPath"
Write-Host "Tip: black wallpaper + auto-hide taskbar + rekordbox fullscreen preference."
