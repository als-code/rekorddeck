# 00 — Status and known gaps

**This guide:** prepare install media from a **Linux PC**, then dual-boot the Deck.

**Recommended path:** Windows 10 Pro or Windows 11 Pro + DJ debloat.
Pre-alpha — untested end-to-end on every Deck revision.

## Recommended vs advanced

| Path | Role |
|------|------|
| **Windows 10/11 Pro** | **Primary** — full walkthrough + `Invoke-DjDebloat.ps1` |
| **LTSC 2021** | **Advanced only** — no media/licensing tutorial; debloat skips |

## Canonical order

1. Make Recovery + Windows USBs on a **Linux PC** (Recovery = dedicated `dd`/Etcher stick; Windows = Ventoy / woeusb OK)  
2. Update SteamOS + sudo password  
3. Install rEFInd on SteamOS  
4. Partition from **SteamOS Recovery**  
5. Install Windows on NTFS  
6. Valve drivers → official rEFInd bootnext → Create/Install Config again  
7. DJ layer: debloat → pack → ASIO → rekordbox  

Preparing media on Windows instead? Use the [Windows PC guide](../../from-windows/en/01-overview.md).

Español: [../es/00-status.md](../es/00-status.md)
