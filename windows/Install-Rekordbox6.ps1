<#
.SYNOPSIS
  Open official AlphaTheta/Pioneer pages for rekordbox 6 (does not redistribute installers).

.PARAMETER OpenLatestPortal
  Also open the current rekordbox.com download portal (usually v7).

.PARAMETER AttemptDirect
  Try a documented direct archive URL pattern if configured; on failure fall back to the help article.
#>
[CmdletBinding()]
param(
    [switch]$OpenLatestPortal,
    [switch]$AttemptDirect
)

$ArchiveHelp = 'https://support.pioneerdj.com/hc/en-us/articles/8112764645785-I-want-to-use-previous-rekordbox-ver-6'
$LatestPortal = 'https://rekordbox.com/en/download/'

# Optional known archive landing — keep empty if unstable; help article is source of truth.
$DirectCandidate = $null

Write-Host 'Rekorddeck will open official AlphaTheta/Pioneer pages only.'
Write-Host 'You must accept their EULA and use your own account/license.'
Write-Host ''

if ($AttemptDirect -and $DirectCandidate) {
    try {
        Write-Host "Trying direct candidate: $DirectCandidate"
        Start-Process $DirectCandidate
    } catch {
        Write-Warning "Direct candidate failed; opening archive help article."
        Start-Process $ArchiveHelp
    }
} else {
    Write-Host "Opening rekordbox 6 archive article:"
    Write-Host "  $ArchiveHelp"
    Start-Process $ArchiveHelp
}

if ($OpenLatestPortal) {
    Write-Host "Opening current download portal:"
    Write-Host "  $LatestPortal"
    Start-Process $LatestPortal
}

Write-Host ''
Write-Host 'Pick the latest 6.x build you need from the archive, download, and install manually.'
