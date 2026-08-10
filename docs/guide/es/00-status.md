# 00 — Estado y huecos conocidos

La **ruta recomendada** es **Windows 10 Pro** o **Windows 11 Pro** + debloat DJ.
La guía es seguible de punta a punta, pero varias secciones siguen delgadas o sin
probar en un Deck real.

## Recomendado vs avanzado

| Ruta | Rol |
|------|-----|
| **Windows 10/11 Pro** | **Principal** — guía completa + `Invoke-DjDebloat.ps1` |
| **LTSC 2021** | **Solo avanzados** — sin tutorial de medios/licencia; debloat skip |

## Orden canónico (importante)

1. Actualizar SteamOS + password sudo  
2. Crear medios (PC **Windows o Linux**)  
3. Instalar rEFInd en SteamOS  
4. Particionar desde **SteamOS Recovery** (no desde Desktop)  
5. Instalar Windows en NTFS  
6. Drivers Valve → bootnext oficial rEFInd → Create/Install Config otra vez  
7. Capa DJ: debloat → pack → ASIO → rekordbox  

Companion visual opcional: [vídeo dual-boot](https://www.youtube.com/watch?v=yBHzVSDVEqw) (crédito al autor; herramientas: [SteamDeck_rEFInd](https://github.com/jlobue10/SteamDeck_rEFInd)).

## Huecos de pulido (pre-0.5)

1. Capturas reales en `docs/assets/`  
2. Checklist drivers Valve LCD/OLED al día  
3. Notas TPM Win11 más claras (solo legales)  
4. Tips ASIO específicos Deck  
5. Smoke-test scripts en hardware real  
6. Stands 3D concretos  
7. Traducción literaria ES↔EN más fina  

English: [../en/00-status.md](../en/00-status.md)
