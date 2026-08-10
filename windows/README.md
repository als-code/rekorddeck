# Windows helpers (Rekorddeck)

All steps work **without cloning**. Copy-paste into **elevated PowerShell** (or CMD where noted).

Raw base: `https://raw.githubusercontent.com/als-code/rekorddeck/main/windows/`

## One-liners

```powershell
# Debloat — dry-run
irm https://raw.githubusercontent.com/als-code/rekorddeck/main/windows/bootstrap-dj-debloat.ps1 | iex

# Debloat — apply
& ([scriptblock]::Create((irm https://raw.githubusercontent.com/als-code/rekorddeck/main/windows/bootstrap-dj-debloat.ps1))) -Apply

# Desktop pack (.url folders)
irm https://raw.githubusercontent.com/als-code/rekorddeck/main/windows/bootstrap-dj-desktop.ps1 | iex

# Gig Mode — start rekordbox after logon (opt-in)
& ([scriptblock]::Create((irm https://raw.githubusercontent.com/als-code/rekorddeck/main/windows/Set-RekorddeckGigMode.ps1))) -Enable
& ([scriptblock]::Create((irm https://raw.githubusercontent.com/als-code/rekorddeck/main/windows/Set-RekorddeckGigMode.ps1))) -Disable

# Open rekordbox 6 official archive
irm https://raw.githubusercontent.com/als-code/rekorddeck/main/windows/bootstrap-rekordbox6.ps1 | iex
```

**CMD** (rekordbox archive only):

```cmd
start https://support.pioneerdj.com/hc/en-us/articles/8112764645785-I-want-to-use-previous-rekordbox-ver-6
```

## Scripts in this folder

| Script | Purpose |
|--------|---------|
| `bootstrap-dj-debloat.ps1` | Download + run debloat |
| `bootstrap-dj-desktop.ps1` | Download + create Desktop link packs |
| `bootstrap-rekordbox6.ps1` | Download + open rekordbox 6 pages |
| `Set-RekorddeckGigMode.ps1` | Opt-in: enable/disable rekordbox autostart |
| `Invoke-DjDebloat.ps1` | Debloat core (used by bootstrap) |
| `New-RekorddeckDesktop.ps1` | Desktop pack core |
| `Install-Rekordbox6.ps1` | Opens official archive URLs |

## Legal

- Bring your own Windows license.
- Scripts never activate Windows or call third-party activators.
- No proprietary installers are bundled — only URLs under `links/`.

Español: [README.es.md](README.es.md)
