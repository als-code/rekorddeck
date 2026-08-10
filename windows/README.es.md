# Helpers Windows (Rekorddeck)

Ejecuta estos scripts **en el lado Windows del Deck**, con PowerShell elevado cuando se indique.

| Script | Para qué |
|--------|----------|
| `bootstrap-dj-debloat.ps1` | One-liner: descarga + ejecuta debloat (**sin clonar**) |
| `Invoke-DjDebloat.ps1` | Aligerar **Win10/11 Pro** para audio en vivo (hace skip en LTSC) |
| `New-RekorddeckDesktop.ps1` | Carpetas en el Escritorio con `.url` oficiales |
| `Install-Rekordbox6.ps1` | Abre el archivo oficial de rekordbox 6 |

## One-liner (sin clonar)

PowerShell elevado:

```powershell
# Dry-run
irm https://raw.githubusercontent.com/als-code/rekorddeck/main/windows/bootstrap-dj-debloat.ps1 | iex

# Aplicar
& ([scriptblock]::Create((irm https://raw.githubusercontent.com/als-code/rekorddeck/main/windows/bootstrap-dj-debloat.ps1))) -Apply
```

## Política de ejecución

```powershell
Set-ExecutionPolicy -Scope Process Bypass
cd path\to\rekorddeck\windows
```

## Legal

- Trae tu propia licencia de Windows.
- Los scripts no activan Windows ni llaman a activadores de terceros.
- No incluimos instaladores propietarios — solo URLs en `links/`.

English: [README.md](README.md)
