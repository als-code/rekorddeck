<#
.SYNOPSIS
  Conservative DJ / live-audio debloat for Windows 10 Pro and Windows 11 Pro.

.DESCRIPTION
  Skips LTSC automatically. Does not touch activation, AudioSrv, USB/PnP, or
  Windows Update core. Uses allowlists under .\debloat\.

.PARAMETER Apply
  Actually make changes. Without this flag, runs as dry-run (WhatIf).

.PARAMETER VisualLite
  Reduce animations / visual effects for a snappier UI.

.PARAMETER SkipRestorePoint
  Do not attempt to create a System Restore point when applying.
#>
[CmdletBinding(SupportsShouldProcess = $true)]
param(
    [switch]$Apply,
    [switch]$VisualLite,
    [switch]$SkipRestorePoint
)

$ErrorActionPreference = 'Continue'
$ScriptRoot = $PSScriptRoot
$LogDir = Join-Path $env:USERPROFILE 'Rekorddeck\logs'
New-Item -ItemType Directory -Force -Path $LogDir | Out-Null
$LogFile = Join-Path $LogDir ("dj-debloat-{0:yyyyMMdd-HHmmss}.log" -f (Get-Date))

function Write-Log {
    param([string]$Message, [string]$Level = 'INFO')
    $line = '[{0}] [{1}] {2}' -f (Get-Date -Format 's'), $Level, $Message
    Add-Content -Path $LogFile -Value $line
    switch ($Level) {
        'ERROR' { Write-Host $line -ForegroundColor Red }
        'WARN'  { Write-Host $line -ForegroundColor Yellow }
        default { Write-Host $line }
    }
}

function Test-IsAdministrator {
    $id = [Security.Principal.WindowsIdentity]::GetCurrent()
    $prin = New-Object Security.Principal.WindowsPrincipal($id)
    return $prin.IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)
}

function Get-WindowsEditionInfo {
    $caption = (Get-CimInstance Win32_OperatingSystem).Caption
    $productName = (Get-ItemProperty 'HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion').ProductName
    return [pscustomobject]@{
        Caption     = $caption
        ProductName = $productName
        IsLtsc      = ($caption -match 'LTSC|Enterprise S' -or $productName -match 'LTSC')
        IsPro       = ($caption -match 'Pro' -or $productName -match 'Pro')
    }
}

function Read-AllowList {
    param([string]$Path)
    if (-not (Test-Path $Path)) {
        Write-Log "Missing allowlist: $Path" 'WARN'
        return @()
    }
    Get-Content $Path |
        ForEach-Object { $_.Trim() } |
        Where-Object { $_ -and -not $_.StartsWith('#') }
}

$protectedServices = @(
    'AudioSrv', 'AudioEndpointBuilder', 'PlugPlay', 'usbhub', 'USBSTOR',
    'Wuauserv', 'UsoSvc', 'Wcmsvc', 'Dhcp', 'Dnscache', 'NlaSvc', 'netprofm'
)

Write-Log "Log file: $LogFile"
$edition = Get-WindowsEditionInfo
Write-Log ("Edition: {0} / {1}" -f $edition.Caption, $edition.ProductName)

if ($edition.IsLtsc) {
    Write-Log 'LTSC detected — debloat not required. Exiting without changes.'
    exit 0
}

if (-not $edition.IsPro -and -not $edition.IsLtsc) {
    Write-Log 'This script targets Windows Pro (or auto-skips LTSC). Proceeding cautiously on unrecognized edition.' 'WARN'
}

if ($Apply -and -not (Test-IsAdministrator)) {
    Write-Log 'Administrator privileges required for -Apply. Re-run elevated.' 'ERROR'
    exit 1
}

$whatIf = -not $Apply
if ($whatIf) {
    Write-Log 'Dry-run mode (pass -Apply to make changes).'
}

if ($Apply -and -not $SkipRestorePoint) {
    try {
        Checkpoint-Computer -Description 'Rekorddeck DJ Debloat' -RestorePointType MODIFY_SETTINGS -ErrorAction Stop
        Write-Log 'System restore point created.'
    } catch {
        Write-Log ("Could not create restore point: {0}" -f $_.Exception.Message) 'WARN'
    }
}

# --- AppX removal ---
$appxList = Read-AllowList (Join-Path $ScriptRoot 'debloat\appx-remove.txt')
foreach ($pkg in $appxList) {
    $packages = Get-AppxPackage -AllUsers -Name $pkg -ErrorAction SilentlyContinue
    if (-not $packages) {
        $packages = Get-AppxPackage -Name $pkg -ErrorAction SilentlyContinue
    }
    foreach ($p in @($packages)) {
        $msg = "Remove AppX $($p.Name) ($($p.PackageFullName))"
        if ($whatIf) {
            Write-Log "[WhatIf] $msg"
        } elseif ($PSCmdlet.ShouldProcess($p.PackageFullName, 'Remove-AppxPackage')) {
            try {
                Remove-AppxPackage -Package $p.PackageFullName -ErrorAction Stop
                Write-Log $msg
            } catch {
                Write-Log ("Failed AppX remove {0}: {1}" -f $p.Name, $_.Exception.Message) 'WARN'
            }
        }
    }
    $prov = Get-AppxProvisionedPackage -Online -ErrorAction SilentlyContinue |
        Where-Object { $_.DisplayName -eq $pkg }
    foreach ($pr in @($prov)) {
        $msg = "Deprovision $($pr.DisplayName)"
        if ($whatIf) {
            Write-Log "[WhatIf] $msg"
        } elseif ($PSCmdlet.ShouldProcess($pr.PackageName, 'Remove-AppxProvisionedPackage')) {
            try {
                Remove-AppxProvisionedPackage -Online -PackageName $pr.PackageName -ErrorAction Stop | Out-Null
                Write-Log $msg
            } catch {
                Write-Log ("Failed deprovision {0}: {1}" -f $pr.DisplayName, $_.Exception.Message) 'WARN'
            }
        }
    }
}

# --- Scheduled tasks ---
$taskList = Read-AllowList (Join-Path $ScriptRoot 'debloat\tasks-disable.txt')
foreach ($taskPath in $taskList) {
    $msg = "Disable scheduled task $taskPath"
    if ($whatIf) {
        Write-Log "[WhatIf] $msg"
        continue
    }
    try {
        $task = Get-ScheduledTask -TaskPath ([IO.Path]::GetDirectoryName($taskPath) + '\') `
            -TaskName ([IO.Path]::GetFileName($taskPath)) -ErrorAction SilentlyContinue
        if (-not $task) {
            # Fallback: TaskPath in lists includes leading backslash full path
            $leaf = Split-Path $taskPath -Leaf
            $dir = Split-Path $taskPath -Parent
            if (-not $dir.EndsWith('\')) { $dir = "$dir\" }
            $task = Get-ScheduledTask -TaskPath $dir -TaskName $leaf -ErrorAction SilentlyContinue
        }
        if ($task) {
            Disable-ScheduledTask -InputObject $task -ErrorAction Stop | Out-Null
            Write-Log $msg
        } else {
            Write-Log "Task not found (skip): $taskPath" 'WARN'
        }
    } catch {
        Write-Log ("Task disable failed {0}: {1}" -f $taskPath, $_.Exception.Message) 'WARN'
    }
}

# --- Services ---
$svcList = Read-AllowList (Join-Path $ScriptRoot 'debloat\services-disable.txt')
foreach ($svcName in $svcList) {
    if ($protectedServices -contains $svcName) {
        Write-Log "Refusing to disable protected service: $svcName" 'WARN'
        continue
    }
    $msg = "Disable service $svcName"
    if ($whatIf) {
        Write-Log "[WhatIf] $msg"
        continue
    }
    try {
        $svc = Get-Service -Name $svcName -ErrorAction SilentlyContinue
        if (-not $svc) {
            Write-Log "Service not found (skip): $svcName" 'WARN'
            continue
        }
        Stop-Service -Name $svcName -Force -ErrorAction SilentlyContinue
        Set-Service -Name $svcName -StartupType Disabled -ErrorAction Stop
        Write-Log $msg
    } catch {
        Write-Log ("Service disable failed {0}: {1}" -f $svcName, $_.Exception.Message) 'WARN'
    }
}

# --- Game Bar / DVR ---
function Set-DkDword {
    param([string]$Path, [string]$Name, [int]$Value)
    if ($whatIf) {
        Write-Log "[WhatIf] Set $Path\$Name = $Value"
        return
    }
    if (-not (Test-Path $Path)) {
        New-Item -Path $Path -Force | Out-Null
    }
    New-ItemProperty -Path $Path -Name $Name -PropertyType DWord -Value $Value -Force | Out-Null
    Write-Log "Registry $Path\$Name = $Value"
}

$gameBar = 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\GameDVR'
$gameConfig = 'HKCU:\System\GameConfigStore'
Set-DkDword $gameBar 'AppCaptureEnabled' 0
Set-DkDword $gameConfig 'GameDVR_Enabled' 0

# --- Power: High Performance + less sleep ---
if ($whatIf) {
    Write-Log '[WhatIf] Set High Performance power plan; disable standby timeouts'
} else {
    try {
        powercfg /setactive SCHEME_MIN | Out-Null
        powercfg /change standby-timeout-ac 0
        powercfg /change standby-timeout-dc 0
        powercfg /change hibernate-timeout-ac 0
        powercfg /change hibernate-timeout-dc 0
        Write-Log 'Power plan: High Performance; standby/hibernate timeouts cleared'
    } catch {
        Write-Log ("Power plan tweak failed: {0}" -f $_.Exception.Message) 'WARN'
    }
}

# --- Visual lite ---
if ($VisualLite) {
    $desk = 'HKCU:\Control Panel\Desktop'
    $winMet = 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects'
    if ($whatIf) {
        Write-Log '[WhatIf] Apply VisualLite tweaks'
    } else {
        Set-ItemProperty -Path $desk -Name 'UserPreferencesMask' -Value ([byte[]](0x90,0x12,0x03,0x80,0x10,0x00,0x00,0x00)) -ErrorAction SilentlyContinue
        Set-DkDword 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced' 'TaskbarAnimations' 0
        Set-DkDword 'HKCU:\Control Panel\Desktop\WindowMetrics' 'MinAnimate' 0
        Write-Log 'VisualLite applied (sign out may be required for full effect)'
    }
}

Write-Log 'Done.'
if ($whatIf) {
    Write-Host ''
    Write-Host 'Dry-run complete. Re-run with -Apply (elevated) to enforce changes.' -ForegroundColor Cyan
}
exit 0
