# 03 — Make install media (Windows or Linux)

You need **two** media: **SteamOS Recovery** and **Windows installer**.

## A — From a Windows PC

Recommended: [Rufus](https://rufus.ie/en/).

1. Download SteamOS Recovery ISO (Valve FAQ) and Windows 10/11 Pro ISO.  
2. Rufus → select USB/SD → select ISO → **Start**.  
3. Repeat for the second medium.  
4. Also copy **extracted Valve drivers** (LCD or OLED) onto the Windows USB.

## B — From a Linux PC

- **[Ventoy](https://www.ventoy.net/)** — copy both ISOs onto a Ventoy stick.  
- **`dd`** (destructive; verify with `lsblk`):

```bash
# REPLACE /dev/sdX with your real stick
sudo dd if=SteamOS-Recovery.img of=/dev/sdX bs=4M status=progress oflag=sync
```

- Windows ISO on Linux: Ventoy, **woeusb-ng**, or balenaEtcher depending on distro.

Copy Valve drivers to a folder on the Windows USB (or a third stick).

## Check

- [ ] Recovery boots on the Deck (Vol− + Power)  
- [ ] Windows USB shows Microsoft setup  
- [ ] Valve driver folders on USB  

Next: [Prepare SteamOS](04-prepare-steamos.md).

Español: [../es/03-make-install-media.md](../es/03-make-install-media.md)
