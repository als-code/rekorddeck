# Helpers Windows (Rekorddeck)

Todo funciona **sin clonar**. Copia/pega en **PowerShell elevado** (o CMD donde se indique).

Base raw: `https://raw.githubusercontent.com/als-code/rekorddeck/main/windows/`

## One-liners

```powershell
# Debloat — dry-run
irm https://raw.githubusercontent.com/als-code/rekorddeck/main/windows/bootstrap-dj-debloat.ps1 | iex

# Debloat — aplicar
& ([scriptblock]::Create((irm https://raw.githubusercontent.com/als-code/rekorddeck/main/windows/bootstrap-dj-debloat.ps1))) -Apply

# Pack de escritorio (.url)
irm https://raw.githubusercontent.com/als-code/rekorddeck/main/windows/bootstrap-dj-desktop.ps1 | iex

# Abrir archivo oficial rekordbox 6
irm https://raw.githubusercontent.com/als-code/rekorddeck/main/windows/bootstrap-rekordbox6.ps1 | iex
```

**CMD** (solo archivo rekordbox):

```cmd
start https://support.pioneerdj.com/hc/en-us/articles/8112764645785-I-want-to-use-previous-rekordbox-ver-6
```

## Scripts

| Script | Para qué |
|--------|----------|
| `bootstrap-dj-debloat.ps1` | Descarga + ejecuta debloat |
| `bootstrap-dj-desktop.ps1` | Descarga + crea packs del Escritorio |
| `bootstrap-rekordbox6.ps1` | Descarga + abre páginas rekordbox 6 |
| `Invoke-DjDebloat.ps1` | Núcleo debloat |
| `New-RekorddeckDesktop.ps1` | Núcleo pack escritorio |
| `Install-Rekordbox6.ps1` | Abre URLs oficiales |

## Legal

- Trae tu propia licencia de Windows.
- Los scripts no activan Windows ni llaman a activadores de terceros.
- No incluimos instaladores propietarios — solo URLs en `links/`.

English: [README.md](README.md)
