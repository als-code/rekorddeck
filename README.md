# Rekorddeck

> **Pre-alpha 0.3 / WIP — proceed at your own risk.**  
> Dual-boot and partitioning can leave the Deck unbootable. Back up first; keep
> [SteamOS recovery](https://help.steampowered.com/en/faqs/view/1B71-EDF2-EB8D-2BA0) ready.  
> **Pre-alpha 0.3 / WIP — usa bajo tu propio riesgo.** Haz backup y ten Recovery a mano.

**Guide + scripts** for **SteamOS ↔ Windows dual-boot** on Steam Deck for DJs
(**rekordbox 6** + ASIO). Keep SteamOS for gaming.

Guía + scripts para dual-boot en Steam Deck orientado a DJs.

---

## Guides (English first)

Pick the guide that matches the PC you use to write USB/SD media:

| Host PC | English | Español |
|---------|---------|---------|
| **Windows** | [from-windows/en/01-overview](docs/guide/from-windows/en/01-overview.md) | [from-windows/es/01-overview](docs/guide/from-windows/es/01-overview.md) |
| **Linux** | [from-linux/en/01-overview](docs/guide/from-linux/en/01-overview.md) | [from-linux/es/01-overview](docs/guide/from-linux/es/01-overview.md) |

Index: [docs/guide/README.md](docs/guide/README.md)

## Recommended path

1. Write Recovery + Windows media on your **Windows or Linux** PC  
2. SteamOS update + password → **rEFInd**  
3. Partition from **SteamOS Recovery** → install **Win10/11 Pro**  
4. Valve drivers → official rEFInd bootnext → finalize dual-boot  
5. Debloat (Pro) → desktop pack → ASIO → rekordbox  

**LTSC 2021:** advanced users only (no acquisition guide).

## Requirements

- Steam Deck LCD or OLED (ideally ≥256 GB)  
- ≥64 GB for Windows (80 GB+ recommended); library on SD/USB  
- USB/SD media, USB-C hub, keyboard  
- Legitimate Windows 10/11 Pro license  
- A Windows **or** Linux PC to write ISOs  

## Screenshots

Placeholders: [docs/assets/PLACEHOLDERS.md](docs/assets/PLACEHOLDERS.md)  
Stands: [hardware/stands.en.md](hardware/stands.en.md) · [stands.es.md](hardware/stands.es.md)

## Scripts (Windows side)

After dual-boot is stable — [windows/README.md](windows/README.md) · [README.es.md](windows/README.es.md)

- `Invoke-DjDebloat.ps1` — Pro only  
- `New-RekorddeckDesktop.ps1`  
- `Install-Rekordbox6.ps1`  

## Legal

- Activate Windows with **your** license. No third-party activators (e.g. MAS).  
- We do not redistribute Valve drivers or DJ installers — official links only.  
- Dual-boot fix: [SteamDeck_rEFInd](https://github.com/jlobue10/SteamDeck_rEFInd) only (not MediaFire).  

## Credits

- [jlobue10/SteamDeck_rEFInd](https://github.com/jlobue10/SteamDeck_rEFInd)  
- Optional companion video: [community dual-boot walkthrough](https://www.youtube.com/watch?v=yBHzVSDVEqw)  
- [Valve Windows drivers](https://help.steampowered.com/en/faqs/view/6121-ECCD-D643-BAA8)  

## Layout

```text
docs/guide/from-windows/{en,es}/   # guide when preparing media on Windows
docs/guide/from-linux/{en,es}/     # guide when preparing media on Linux
docs/assets/                       # screenshots (placeholders)
windows/                           # PowerShell helpers
hardware/                          # 3D stands
```
