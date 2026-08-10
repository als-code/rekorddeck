# 05 — Install rEFInd (before Windows)

Install the boot manager **before** installing Windows.

Desktop Mode, online:

```bash
curl -L https://github.com/jlobue10/SteamDeck_rEFInd/raw/main/install-GUI.sh | sh
```

Open **SteamDeck_rEFInd**:

1. **Install rEFInd** (first time only).  
2. Keep SteamOS default; Windows as second option.  
3. **Create Config** → **Install Config**.  
4. Enable **Sysd On** if available.

After reboot you should see the menu (SteamOS only until Windows exists).

Docs: [SteamDeck_rEFInd](https://github.com/jlobue10/SteamDeck_rEFInd).

Next: [Partition from Recovery](06-partition-from-recovery.md).

Español: [../es/05-install-refind.md](../es/05-install-refind.md)
