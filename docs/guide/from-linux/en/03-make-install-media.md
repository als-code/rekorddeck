# 03 — Make install media (Linux PC)

You need **SteamOS Recovery** and a **Windows installer** on USB/SD.

## Official Valve downloads

- [SteamOS Recovery image](https://help.steampowered.com/en/faqs/view/1B71-EDF2-EB8D-2BA0)  
- [Steam Deck Windows drivers](https://help.steampowered.com/en/faqs/view/6121-ECCD-D643-BAA8) (LCD or OLED — extract ZIPs)

Also get a **Windows 10/11 Pro** ISO from Microsoft / your legal channel (or LTSC if you already manage that path).

## Option A — Ventoy (recommended)

1. Install [Ventoy](https://www.ventoy.net/) on a USB stick.  
2. Copy the SteamOS Recovery image and the Windows ISO onto the Ventoy volume.  
3. Copy **extracted Valve drivers** to a folder on the same stick (or a second USB).

## Option B — `dd` + separate sticks

Verify the device with `lsblk` first (`/dev/sdX` is an example — **do not guess**):

```bash
sudo dd if=SteamOS-Recovery.img of=/dev/sdX bs=4M status=progress oflag=sync
```

For the Windows ISO on Linux use Ventoy, **woeusb-ng**, or balenaEtcher (distro-dependent).

## Check

- [ ] Recovery boots on the Deck (Vol− + Power)  
- [ ] Windows media shows Microsoft setup  
- [ ] Valve driver folders available on USB  

Next: [Prepare SteamOS](04-prepare-steamos.md).

Español: [../es/03-make-install-media.md](../es/03-make-install-media.md)
