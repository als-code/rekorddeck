# 06 — Particionar desde SteamOS Recovery

**No** uses KDE Partition Manager desde el Desktop normal: el SSD suele estar
bloqueado. Arranca la **imagen de recuperación**.

## Arranque Recovery

1. Apaga el Deck.  
2. Inserta el medio Recovery.  
3. **Vol− + Power** → elige el USB/SD Recovery.  
4. En el escritorio Recovery: Utilidades → **KDE Partition Manager**.

## Redimensionar

1. Selecciona el disco interno.  
2. Localiza la partición **ext4 home** (datos SteamOS).  
3. Clic derecho → **Resize/Move** → deja espacio libre al final para Windows  
   (≥64 GB; recomendado 80 GB+; en discos grandes puedes dar más).  
4. Aplica. Debe aparecer espacio **unknown**/sin asignar.  
5. Clic derecho en ese espacio → **New** → sistema de archivos **NTFS** → OK.  
6. **Apply**.

Apaga, quita Recovery, inserta el USB de Windows.

## Orientación de tamaños (aprox., vídeo comunidad)

| Disco | Windows (orientativo) | SteamOS home (resto) |
|-------|----------------------|----------------------|
| 256 GB | ~80–150 GB | el resto |
| 512 GB | ~150–200 GB | el resto |
| 1 TB+ | 200–400 GB+ | el resto |

Ajusta a tu biblioteca y juegos.

Siguiente: [Elegir Windows](07-choose-windows.md).

English: [../en/06-partition-from-recovery.md](../en/06-partition-from-recovery.md)
