# Windows helpers (Rekorddeck)

Run these **on the Steam Deck Windows side** from an elevated PowerShell when noted.

| Script | Purpose |
|--------|---------|
| `Invoke-DjDebloat.ps1` | Lean **Win10/11 Pro** for live audio (auto-skips LTSC advanced installs) |
| `New-RekorddeckDesktop.ps1` | Desktop folders with official `.url` shortcuts |
| `Install-Rekordbox6.ps1` | Opens official rekordbox 6 archive / download portal |

## Execution policy

```powershell
Set-ExecutionPolicy -Scope Process Bypass
cd path\to\rekorddeck\windows
```

## Legal

- Bring your own Windows license.
- Scripts never activate Windows or call third-party activators.
- No proprietary installers are bundled — only URLs under `links/`.
