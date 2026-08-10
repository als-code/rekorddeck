# 03 — Crear medios (PC Linux)

Necesitas **SteamOS Recovery** e **instalador Windows** en USB/SD.

## Descargas oficiales Valve

- [Imagen SteamOS Recovery](https://help.steampowered.com/en/faqs/view/1B71-EDF2-EB8D-2BA0)  
- [Drivers Windows para Steam Deck](https://help.steampowered.com/en/faqs/view/6121-ECCD-D643-BAA8) (LCD u OLED — descomprime los ZIP)

También: ISO de **Windows 10/11 Pro** desde Microsoft / tu canal legal (o LTSC si ya gestionas ese path).

## Opción A — Ventoy (recomendado)

1. Instala [Ventoy](https://www.ventoy.net/) en un USB.  
2. Copia la imagen Recovery y la ISO de Windows al volumen Ventoy.  
3. Copia los **drivers Valve** descomprimidos a una carpeta del mismo USB (o a otro).

## Opción B — `dd` + medios separados

Verifica el dispositivo con `lsblk` (`/dev/sdX` es un ejemplo — **no adivines**):

```bash
sudo dd if=SteamOS-Recovery.img of=/dev/sdX bs=4M status=progress oflag=sync
```

Para la ISO Windows en Linux: Ventoy, **woeusb-ng** o balenaEtcher.

## Comprobar

- [ ] Recovery arranca en el Deck (Vol− + Power)  
- [ ] El medio Windows muestra el setup  
- [ ] Drivers Valve accesibles en USB  

Siguiente: [Preparar SteamOS](04-prepare-steamos.md).

English: [../en/03-make-install-media.md](../en/03-make-install-media.md)
