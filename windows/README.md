# Windows helpers (Rekorddeck)

Run these **on the Steam Deck Windows side** from an elevated PowerShell when noted.

| Script | Purpose |
|--------|---------|
| `bootstrap-dj-debloat.ps1` | One-liner entry: download + run debloat (**no clone**) |
| `Invoke-DjDebloat.ps1` | Lean **Win10/11 Pro** for live audio (auto-skips LTSC) |
| `New-RekorddeckDesktop.ps1` | Desktop folders with official `.url` shortcuts |
| `Install-Rekordbox6.ps1` | Opens official rekordbox 6 archive / download portal |

## One-liner (no clone)

Elevated PowerShell:

```powershell
# Dry-run
irm https://raw.githubusercontent.com/als-code/rekorddeck/main/windows/bootstrap-dj-debloat.ps1 | iex

# Apply
& ([scriptblock]::Create((irm https://raw.githubusercontent.com/als-code/rekorddeck/main/windows/bootstrap-dj-debloat.ps1))) -Apply
```

## Execution policy

```powershell
Set-ExecutionPolicy -Scope Process Bypass
cd path\to\rekorddeck\windows
```

## Legal

- Bring your own Windows license.
- Scripts never activate Windows or call third-party activators.
- No proprietary installers are bundled — only URLs under `links/`.
