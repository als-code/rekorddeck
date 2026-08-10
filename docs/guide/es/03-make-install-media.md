# 03 — Crear medios de instalación (Windows o Linux)

Necesitas **dos** medios: **SteamOS Recovery** y **instalador Windows**.

## A — Desde un PC Windows

Herramienta recomendada: [Rufus](https://rufus.ie/en/).

1. Descarga la ISO de Recovery SteamOS (FAQ Valve) y la ISO de Windows 10/11 Pro.  
2. Abre Rufus → elige el USB/SD → selecciona la ISO → **Start**.  
3. Repite con el segundo medio para la otra ISO.  
4. Copia también al USB de Windows (carpeta aparte) los **drivers Valve** ya descomprimidos (LCD u OLED).

## B — Desde un PC Linux

Opciones válidas:

- **[Ventoy](https://www.ventoy.net/)** — copia ambas ISOs al pendrive Ventoy (cómodo).  
- **`dd`** (destructivo; verifica el dispositivo con `lsblk`):

```bash
# Ejemplo — SUSTITUYE /dev/sdX por tu pendrive real
sudo dd if=SteamOS-Recovery.img of=/dev/sdX bs=4M status=progress oflag=sync
```

- Para ISO Windows en Linux: Ventoy, o herramientas tipo **woeusb-ng** / balenaEtcher según tu distro.

Copia los drivers Valve a un directorio del USB Windows (o a un tercer USB).

## Comprobar

- [ ] Recovery arranca en el Deck (Vol− + Power)  
- [ ] USB Windows muestra el setup de Microsoft  
- [ ] Carpeta de drivers Valve en el USB  

Siguiente: [Preparar SteamOS](04-prepare-steamos.md).

English: [../en/03-make-install-media.md](../en/03-make-install-media.md)
