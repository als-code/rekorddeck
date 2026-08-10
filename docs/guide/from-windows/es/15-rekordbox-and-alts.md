# 15 — rekordbox 6 y alternativas

Sin clonar. Elige una opción:

**CMD / Ejecutar**

```cmd
start https://support.pioneerdj.com/hc/en-us/articles/8112764645785-I-want-to-use-previous-rekordbox-ver-6
```

**PowerShell**

```powershell
# Abrir archivo oficial v6
irm https://raw.githubusercontent.com/als-code/rekorddeck/main/windows/bootstrap-rekordbox6.ps1 | iex

# También el portal actual (suele ser v7)
& ([scriptblock]::Create((irm https://raw.githubusercontent.com/als-code/rekorddeck/main/windows/bootstrap-rekordbox6.ps1))) -OpenLatestPortal
```

O directo:

```powershell
Start-Process 'https://support.pioneerdj.com/hc/en-us/articles/8112764645785-I-want-to-use-previous-rekordbox-ver-6'
```

Portal actual: [rekordbox.com/download](https://rekordbox.com/en/download/).  
Alternativas (Traktor, VirtualDJ, Serato): las crea el [pack de escritorio](13-dj-desktop-pack.md).

Siguiente: [Recuperación](16-recovery-and-updates.md).

English: [../en/15-rekordbox-and-alts.md](../en/15-rekordbox-and-alts.md)
