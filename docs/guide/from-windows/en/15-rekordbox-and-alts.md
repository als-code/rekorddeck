# 15 — rekordbox 6 and alternatives

No clone needed. Pick one:

**CMD / Run dialog**

```cmd
start https://support.pioneerdj.com/hc/en-us/articles/8112764645785-I-want-to-use-previous-rekordbox-ver-6
```

**PowerShell**

```powershell
# Open official v6 archive
irm https://raw.githubusercontent.com/als-code/rekorddeck/main/windows/bootstrap-rekordbox6.ps1 | iex

# Also open current download portal (usually v7)
& ([scriptblock]::Create((irm https://raw.githubusercontent.com/als-code/rekorddeck/main/windows/bootstrap-rekordbox6.ps1))) -OpenLatestPortal
```

Or open directly:

```powershell
Start-Process 'https://support.pioneerdj.com/hc/en-us/articles/8112764645785-I-want-to-use-previous-rekordbox-ver-6'
```

Current portal: [rekordbox.com/download](https://rekordbox.com/en/download/).  
Alternatives (Traktor, VirtualDJ, Serato): created by the [desktop pack](13-dj-desktop-pack.md).

Next: [Recovery](16-recovery-and-updates.md).

Español: [../es/15-rekordbox-and-alts.md](../es/15-rekordbox-and-alts.md)
