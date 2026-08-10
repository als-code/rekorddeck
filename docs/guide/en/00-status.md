# 00 — Status and known gaps

**Recommended path:** Windows 10 Pro or Windows 11 Pro + DJ debloat.
The guide is end-to-end followable; some sections are still thin / untested on real hardware.

## Recommended vs advanced

| Path | Role |
|------|------|
| **Windows 10/11 Pro** | **Primary** — full walkthrough + `Invoke-DjDebloat.ps1` |
| **LTSC 2021** | **Advanced only** — no media/licensing tutorial; debloat skips |

## Canonical order

1. Update SteamOS + sudo password  
2. Make install media (**Windows or Linux** PC)  
3. Install rEFInd on SteamOS  
4. Partition from **SteamOS Recovery** (not Desktop)  
5. Install Windows on NTFS  
6. Valve drivers → official rEFInd bootnext → Create/Install Config again  
7. DJ layer: debloat → pack → ASIO → rekordbox  

Optional companion: [dual-boot video](https://www.youtube.com/watch?v=yBHzVSDVEqw) (credit the author; tools: [SteamDeck_rEFInd](https://github.com/jlobue10/SteamDeck_rEFInd)).

## Polish gaps (pre-0.5)

1. Real screenshots in `docs/assets/`  
2. Up-to-date Valve LCD/OLED driver checklist  
3. Clearer legal-only Win11 TPM notes  
4. Deck-specific ASIO tips  
5. Smoke-test scripts on hardware  
6. Concrete 3D stands  
7. Finer ES↔EN translation  

Español: [../es/00-status.md](../es/00-status.md)
