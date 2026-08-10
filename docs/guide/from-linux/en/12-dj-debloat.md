# 12 — DJ debloat (Pro only)

In an **elevated** PowerShell (no clone):

```powershell
irm https://raw.githubusercontent.com/als-code/rekorddeck/main/windows/bootstrap-dj-debloat.ps1 | iex

& ([scriptblock]::Create((irm https://raw.githubusercontent.com/als-code/rekorddeck/main/windows/bootstrap-dj-debloat.ps1))) -Apply

& ([scriptblock]::Create((irm https://raw.githubusercontent.com/als-code/rekorddeck/main/windows/bootstrap-dj-debloat.ps1))) -Apply -VisualLite
```

LTSC: script exits with no changes.

Next: [Desktop pack](13-dj-desktop-pack.md).

Español: [../es/12-dj-debloat.md](../es/12-dj-debloat.md)
