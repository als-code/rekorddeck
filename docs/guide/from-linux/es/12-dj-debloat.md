# 12 — Debloat DJ (solo Pro)

En PowerShell **elevado** (sin clonar):

```powershell
irm https://raw.githubusercontent.com/als-code/rekorddeck/main/windows/bootstrap-dj-debloat.ps1 | iex

& ([scriptblock]::Create((irm https://raw.githubusercontent.com/als-code/rekorddeck/main/windows/bootstrap-dj-debloat.ps1))) -Apply

& ([scriptblock]::Create((irm https://raw.githubusercontent.com/als-code/rekorddeck/main/windows/bootstrap-dj-debloat.ps1))) -Apply -VisualLite
```

LTSC: el script sale sin cambios.

Siguiente: [Pack escritorio](13-dj-desktop-pack.md).

English: [../en/12-dj-debloat.md](../en/12-dj-debloat.md)
