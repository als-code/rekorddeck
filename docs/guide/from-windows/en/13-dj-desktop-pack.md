# 13 — DJ desktop pack

PowerShell (no clone):

```powershell
irm https://raw.githubusercontent.com/als-code/rekorddeck/main/windows/bootstrap-dj-desktop.ps1 | iex
```

Creates Desktop folders with official `.url` shortcuts (audio, hubs, DJ software, Valve/rEFInd).

Also drops in **Rekorddeck - DJ Software**:

- `Install-Rekordbox6.cmd` — official v6 archive  
- `GigMode-Enable.cmd` / `GigMode-Disable.cmd` — optional: start rekordbox after
  logon (delay + maximized). Does **not** change wallpaper/taskbar; set those
  yourself. Prefer fullscreen in rekordbox Preferences.

Or one-liner:

```powershell
& ([scriptblock]::Create((irm https://raw.githubusercontent.com/als-code/rekorddeck/main/windows/Set-RekorddeckGigMode.ps1))) -Enable
& ([scriptblock]::Create((irm https://raw.githubusercontent.com/als-code/rekorddeck/main/windows/Set-RekorddeckGigMode.ps1))) -Disable
```

Next: [ASIO](14-audio-asio.md).

Español: [../es/13-dj-desktop-pack.md](../es/13-dj-desktop-pack.md)
