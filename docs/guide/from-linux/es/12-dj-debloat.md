# 12 — Debloat DJ (solo Pro)

En PowerShell **como administrador**, sin clonar el repo:

```powershell
# Dry-run (no cambia nada)
irm https://raw.githubusercontent.com/als-code/rekorddeck/main/windows/bootstrap-dj-debloat.ps1 | iex

# Aplicar cambios
& ([scriptblock]::Create((irm https://raw.githubusercontent.com/als-code/rekorddeck/main/windows/bootstrap-dj-debloat.ps1))) -Apply

# Aplicar + UI más ligera
& ([scriptblock]::Create((irm https://raw.githubusercontent.com/als-code/rekorddeck/main/windows/bootstrap-dj-debloat.ps1))) -Apply -VisualLite
```

El bootstrap descarga el script y las listas `debloat/` a una carpeta temporal y los ejecuta.

**Alternativa** (repo ya clonado):

```powershell
cd path\to\rekorddeck\windows
.\Invoke-DjDebloat.ps1 -Apply
```

LTSC: el script sale sin cambios.

Siguiente: [Pack escritorio](13-dj-desktop-pack.md).

English: [../en/12-dj-debloat.md](../en/12-dj-debloat.md)
