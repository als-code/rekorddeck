# 15 — rekordbox 6 y alternativas

Sin clonar.

## ¿Por qué la versión 6?

El portal público suele apuntar a **rekordbox 7**. Este proyecto apunta a
**rekordbox 6**: sigue siendo la referencia en muchos setups DJ/Deck por
soporte **ASIO** estable, controladores más antiguos y menos carga de CPU en
Steam Deck.

- Instala **solo 6.x** desde el **archivo oficial** de versiones anteriores de
  AlphaTheta / Pioneer (nada de mirrors raros).
- Usa una cuenta / licencia AlphaTheta acorde a lo que pagas.
- Tras instalar: Preferencias → Audio → **ASIO** (ver [ASIO](14-audio-asio.md)).

## Instalar rekordbox 6

**CMD / Ejecutar**

```cmd
start https://support.pioneerdj.com/hc/en-us/articles/8112764645785-I-want-to-use-previous-rekordbox-ver-6
```

**PowerShell**

```powershell
# Abrir archivo oficial v6
irm https://raw.githubusercontent.com/als-code/rekorddeck/main/windows/bootstrap-rekordbox6.ps1 | iex

# También el portal actual (suele ser v7 — para comparar; no confundir con v6)
& ([scriptblock]::Create((irm https://raw.githubusercontent.com/als-code/rekorddeck/main/windows/bootstrap-rekordbox6.ps1))) -OpenLatestPortal
```

O directo:

```powershell
Start-Process 'https://support.pioneerdj.com/hc/en-us/articles/8112764645785-I-want-to-use-previous-rekordbox-ver-6'
```

Portal actual (a menudo **v7**): [rekordbox.com/download](https://rekordbox.com/en/download/).

## Alternativas

Si no necesitas rekordbox / modo Export Pioneer. Las mismas URLs salen en el
[pack de escritorio](13-dj-desktop-pack.md).

| Software | Encaja cuando… | Enlace |
|----------|----------------|--------|
| **Traktor** (NI) | Equipo / ecosistema Native Instruments | [Traktor](https://www.native-instruments.com/en/products/traktor/) |
| **VirtualDJ** | Mapeos flexibles / pruebas rápidas | [Descarga VirtualDJ](https://www.virtualdj.com/download/) |
| **Serato DJ** | Club / controladores Serato-ready | [Descargas Serato](https://serato.com/dj/downloads) |

Elige **una** app principal para bolos; segunda solo si ya la dominas.

Siguiente: [Recuperación](16-recovery-and-updates.md).

English: [../en/15-rekordbox-and-alts.md](../en/15-rekordbox-and-alts.md)
