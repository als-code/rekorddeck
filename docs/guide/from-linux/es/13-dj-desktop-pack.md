# 13 — Pack de escritorio DJ

PowerShell (sin clonar):

```powershell
irm https://raw.githubusercontent.com/als-code/rekorddeck/main/windows/bootstrap-dj-desktop.ps1 | iex
```

Crea carpetas en el Escritorio con `.url` oficiales (audio, hubs, software DJ, Valve/rEFInd).

También en **Rekorddeck - DJ Software**:

- `Install-Rekordbox6.cmd` — archivo oficial v6  
- `GigMode-Enable.cmd` / `GigMode-Disable.cmd` — opcional: arranca rekordbox tras
  el logon (retraso + maximizado). **No** toca fondo ni barra; configúralos tú.
  Pantalla completa: preferencias de rekordbox.

O one-liner:

```powershell
& ([scriptblock]::Create((irm https://raw.githubusercontent.com/als-code/rekorddeck/main/windows/Set-RekorddeckGigMode.ps1))) -Enable
& ([scriptblock]::Create((irm https://raw.githubusercontent.com/als-code/rekorddeck/main/windows/Set-RekorddeckGigMode.ps1))) -Disable
```

Siguiente: [ASIO](14-audio-asio.md).

English: [../en/13-dj-desktop-pack.md](../en/13-dj-desktop-pack.md)
