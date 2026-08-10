# 03 — Crear medios (PC Windows)

Necesitas **dos** medios separados: **SteamOS Recovery** e **instalador Windows**.
**No** pongas Recovery en Ventoy — Valve da un `.img` crudo (tras descomprimir `.img.bz2`); usa Rufus en modo **DD Image** en un stick propio.

## Descargas oficiales Valve

- [Imagen SteamOS Recovery](https://help.steampowered.com/en/faqs/view/65B4-2AA3-5F37-4227)  
- [Drivers Windows para Steam Deck](https://help.steampowered.com/en/faqs/view/6121-ECCD-D643-BAA8) (LCD u OLED — descomprime los ZIP)

También: ISO de **Windows 10/11 Pro** desde Microsoft / tu canal legal.

Herramienta: [Rufus](https://rufus.ie/en/). Recovery suele ser `.img` — en Rufus usa modo **DD Image** si lo pide (no grabación ISO normal).

1. Descarga Recovery + drivers desde los enlaces Valve de arriba, y tu ISO de Windows.  
2. Rufus → USB/SD → imagen Recovery → **Start**.  
3. Repite con el segundo medio para la ISO de Windows.  
4. Copia los **drivers Valve** descomprimidos al USB de Windows.

## Comprobar

- [ ] Recovery arranca en el Deck (Vol− + Power)  
- [ ] USB Windows muestra el setup  
- [ ] Carpeta de drivers en el USB  

Siguiente: [Preparar SteamOS](04-prepare-steamos.md).

English: [../en/03-make-install-media.md](../en/03-make-install-media.md)
