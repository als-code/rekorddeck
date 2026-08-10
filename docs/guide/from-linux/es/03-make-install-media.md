# 03 — Crear medios (PC Linux)

Necesitas **dos medios separados** (o USB + SD):

1. **SteamOS Recovery** — medio dedicado (`.img` de Valve, **no** Ventoy)  
2. **Instalador Windows** — aquí sí vale Ventoy / woeusb-ng / Etcher  

## Descargas oficiales Valve

- [SteamOS Installation and Repair](https://help.steampowered.com/en/faqs/view/65B4-2AA3-5F37-4227) (descarga de la recovery)  
- [Drivers Windows para Steam Deck](https://help.steampowered.com/en/faqs/view/6121-ECCD-D643-BAA8) (LCD u OLED — descomprime los ZIP)

También: ISO de **Windows 10/11 Pro** desde Microsoft / tu canal legal (o LTSC si ya gestionas ese path).

## ¿Por qué no Ventoy para Recovery?

Valve reparte una **imagen de disco cruda** comprimida (p. ej. `steamdeck-recovery-*.img.bz2`), no un ISO arrancable.
Tras descomprimir a `.img`, **Ventoy suele no listarla ni arrancarla**. Es normal.
Usa un **USB/SD dedicado** y grábala con `dd` o balenaEtcher.

## 1 — SteamOS Recovery (stick dedicado)

1. Descarga el archivo de Valve → descomprime (p. ej. `bunzip2 steamdeck-recovery-*.img.bz2`).  
2. Identifica el destino con `lsblk` (`/dev/sdX` es un ejemplo — **no adivines**).  
3. Escribe la imagen (**borra** el stick):

```bash
sudo dd if=steamdeck-recovery-4.img of=/dev/sdX bs=4M status=progress oflag=sync
```

(Usa tu nombre de fichero y dispositivo reales.) O **balenaEtcher** con el `.img`.

4. En el Deck: **Vol− + Power** → elige el stick Recovery → confirma que arranca.

## 2 — Stick Windows (+ drivers)

Segundo medio:

- **Ventoy** (bien para la ISO de Windows): instala Ventoy → copia la ISO al volumen Ventoy.  
- O **woeusb-ng** / balenaEtcher para un instalador clásico.

Copia los **drivers Valve** descomprimidos a una carpeta de este stick (o a un tercero).

## Comprobar

- [ ] Recovery arranca en el Deck (Vol− + Power) desde **su** stick  
- [ ] El medio Windows muestra el setup  
- [ ] Drivers Valve accesibles en USB  

Siguiente: [Preparar SteamOS](04-prepare-steamos.md).

English: [../en/03-make-install-media.md](../en/03-make-install-media.md)
