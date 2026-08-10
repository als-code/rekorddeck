# 03 — Crear medios (PC Linux)

Necesitas **SteamOS Recovery** e **instalador Windows**.

## Opción A — Ventoy (recomendado)

1. Instala [Ventoy](https://www.ventoy.net/) en un USB.  
2. Copia la imagen/ISO de Recovery y la ISO de Windows 10/11 Pro.  
3. Copia los **drivers Valve** (LCD u OLED) a una carpeta del mismo USB (o a otro).

## Opción B — `dd` + medios separados

Verifica el dispositivo con `lsblk` (`/dev/sdX` es un ejemplo):

```bash
sudo dd if=SteamOS-Recovery.img of=/dev/sdX bs=4M status=progress oflag=sync
```

Para la ISO Windows en Linux: Ventoy, **woeusb-ng** o balenaEtcher.

## Comprobar

- [ ] Recovery arranca en el Deck  
- [ ] El medio Windows muestra el setup  
- [ ] Drivers Valve accesibles  

Siguiente: [Preparar SteamOS](04-prepare-steamos.md).

English: [../en/03-make-install-media.md](../en/03-make-install-media.md)
