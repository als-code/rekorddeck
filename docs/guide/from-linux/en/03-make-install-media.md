# 03 — Make install media (Linux PC)

You need **two separate sticks** (or USB + SD):

1. **SteamOS Recovery** — dedicated medium (Valve `.img`, not Ventoy)  
2. **Windows installer** — Ventoy / woeusb-ng / Etcher is fine  

## Official Valve downloads

- [SteamOS Installation and Repair](https://help.steampowered.com/en/faqs/view/65B4-2AA3-5F37-4227) (download recovery image)  
- [Steam Deck Windows drivers](https://help.steampowered.com/en/faqs/view/6121-ECCD-D643-BAA8) (LCD or OLED — extract ZIPs)

Also get a **Windows 10/11 Pro** ISO from Microsoft / your legal channel (or LTSC if you already manage that path).

## Why not Ventoy for Recovery?

Valve ships a compressed **raw disk image** (e.g. `steamdeck-recovery-*.img.bz2`), not a bootable ISO.
After decompressing to `.img`, **Ventoy usually does not list it or boot it**. That is expected.
Use a **dedicated USB/SD** and write the `.img` with `dd` or balenaEtcher.

## 1 — SteamOS Recovery (dedicated stick)

1. Download the recovery archive from Valve → decompress (e.g. `bunzip2 steamdeck-recovery-*.img.bz2`).  
2. Identify the target with `lsblk` (`/dev/sdX` is an example — **do not guess**).  
3. Write the image (this **wipes** the stick):

```bash
sudo dd if=steamdeck-recovery-4.img of=/dev/sdX bs=4M status=progress oflag=sync
```

(Use your real filename and device.) Or use **balenaEtcher** and select the `.img`.

4. On the Deck: **Vol− + Power** → pick the Recovery stick → confirm it boots.

## 2 — Windows stick (+ drivers)

Use a **second** stick:

- **Ventoy** (good for Windows ISO): install Ventoy → copy the Windows ISO onto the Ventoy volume.  
- Or **woeusb-ng** / balenaEtcher for a classic Windows installer stick.

Copy **extracted Valve drivers** into a folder on this Windows stick (or a third USB).

## Check

- [ ] Recovery boots on the Deck (Vol− + Power) from its **own** stick  
- [ ] Windows media shows Microsoft setup  
- [ ] Valve driver folders available on USB  

Next: [Prepare SteamOS](04-prepare-steamos.md).

Español: [../es/03-make-install-media.md](../es/03-make-install-media.md)
