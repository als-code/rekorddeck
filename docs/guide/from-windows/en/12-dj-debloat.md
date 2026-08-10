# 12 — DJ debloat (Pro only)

In an **elevated** PowerShell, without cloning the repo:

```powershell
# Dry-run (no changes)
irm https://raw.githubusercontent.com/als-code/rekorddeck/main/windows/bootstrap-dj-debloat.ps1 | iex

# Apply changes
& ([scriptblock]::Create((irm https://raw.githubusercontent.com/als-code/rekorddeck/main/windows/bootstrap-dj-debloat.ps1))) -Apply

# Apply + lighter UI
& ([scriptblock]::Create((irm https://raw.githubusercontent.com/als-code/rekorddeck/main/windows/bootstrap-dj-debloat.ps1))) -Apply -VisualLite
```

The bootstrap downloads the script and `debloat/` allowlists into a temp folder, then runs them.

**Alternative** (repo already cloned):

```powershell
cd path\to\rekorddeck\windows
.\Invoke-DjDebloat.ps1 -Apply
```

LTSC: script exits with no changes.

Next: [Desktop pack](13-dj-desktop-pack.md).

Español: [../es/12-dj-debloat.md](../es/12-dj-debloat.md)
