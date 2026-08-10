# Rekorddeck

> **Pre-alpha 0.3 / WIP — usa bajo tu propio riesgo.**  
> Dual-boot y particionado pueden dejar el Deck inutilizable si algo sale mal.
> Haz backup, ten a mano la [imagen de recuperación SteamOS](https://help.steampowered.com/es/faqs/view/1B71-EDF2-EB8D-2BA0)
> y no asumas que esta guía está probada al 100 % en hardware real.  
> **Pre-alpha 0.3 / WIP — proceed at your own risk.** Dual-boot and partitioning can
> leave the Deck unbootable if something goes wrong. Back up first; keep SteamOS
> recovery media ready.

Guía + scripts para **dual-boot SteamOS ↔ Windows** en Steam Deck, orientado a DJs
(**rekordbox 6** + ASIO). SteamOS se queda para jugar.

**Guide + scripts** for **SteamOS ↔ Windows dual-boot** on Steam Deck for DJs
(**rekordbox 6** + ASIO). Keep SteamOS for gaming.

---

## Guías / Guides

| Idioma | Empezar aquí |
|--------|----------------|
| **Español** (canónico) | [docs/guide/es/01-overview.md](docs/guide/es/01-overview.md) |
| **English** | [docs/guide/en/01-overview.md](docs/guide/en/01-overview.md) |
| Índice | [docs/guide/README.md](docs/guide/README.md) |
| Estado / gaps | [es/00-status](docs/guide/es/00-status.md) · [en/00-status](docs/guide/en/00-status.md) |

## Ruta recomendada / Recommended path

1. Medios USB desde **PC Windows (Rufus)** o **Linux (Ventoy/dd)**  
2. SteamOS update + password → **rEFInd**  
3. Particionar desde **SteamOS Recovery** → instalar **Win10/11 Pro**  
4. Drivers Valve → bootnext oficial rEFInd → cerrar dual-boot  
5. Debloat (Pro) → pack escritorio → ASIO → rekordbox  

**LTSC 2021:** solo usuarios avanzados (sin guía de obtención de medios/licencia).

## Requisitos / Requirements

- Steam Deck LCD u OLED (ideal ≥256 GB)  
- ≥64 GB para Windows (recomendado 80 GB+); biblioteca en SD/USB  
- 2× USB/SD ≥8 GB, hub USB-C, teclado  
- Licencia **legítima** de Windows 10/11 Pro  
- PC Windows **o** Linux para grabar ISOs  

## Capturas / Screenshots

Placeholders (añade fotos reales cuando existan):

| Visual | Archivo |
|--------|---------|
| Menú rEFInd | [docs/assets/PLACEHOLDERS.md](docs/assets/PLACEHOLDERS.md) |
| Escritorio DJ (pack) | idem |
| Stand Deck ↔ controladora | [hardware/stands.es.md](hardware/stands.es.md) / [stands.en.md](hardware/stands.en.md) |

## Scripts (Windows)

Tras dual-boot estable — detalle: [windows/README.md](windows/README.md) · [windows/README.es.md](windows/README.es.md)

- `Invoke-DjDebloat.ps1` — solo Pro  
- `New-RekorddeckDesktop.ps1`  
- `Install-Rekordbox6.ps1`  

## Aviso legal / Legal

- Activa Windows con **tu** licencia. No documentamos activadores (p. ej. MAS).  
- No redistribuimos drivers Valve ni instaladores DJ — solo enlaces oficiales.  
- Dual-boot fix: solo [SteamDeck_rEFInd](https://github.com/jlobue10/SteamDeck_rEFInd) (no MediaFire).  

## Créditos / Credits

- [jlobue10/SteamDeck_rEFInd](https://github.com/jlobue10/SteamDeck_rEFInd)  
- Companion visual opcional: [vídeo dual-boot comunidad](https://www.youtube.com/watch?v=yBHzVSDVEqw)  
- [Drivers Valve](https://help.steampowered.com/en/faqs/view/6121-ECCD-D643-BAA8)  

## Estructura

```text
docs/guide/es|en/   # capítulos 00–17
docs/assets/        # capturas (placeholders)
windows/            # scripts PowerShell
hardware/           # stands 3D
```
