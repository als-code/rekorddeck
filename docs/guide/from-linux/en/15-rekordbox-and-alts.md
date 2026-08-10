# 15 — rekordbox 6 and alternatives

No clone needed.

## Why version 6?

The public download portal often points to **rekordbox 7**. This project targets
**rekordbox 6** because it is the version most DJ/Deck setups still use for
stable **ASIO** device support, older controllers, and lighter CPU use on the
Steam Deck.

- Install **6.x only** from AlphaTheta / Pioneer’s **official previous-version
  archive** (not random mirrors).
- Keep an AlphaTheta account / license that matches what you pay for.
- After install: Preferences → Audio → **ASIO** (see [ASIO](14-audio-asio.md)).

## Install rekordbox 6

**CMD / Run dialog**

```cmd
start https://support.pioneerdj.com/hc/en-us/articles/8112764645785-I-want-to-use-previous-rekordbox-ver-6
```

**PowerShell**

```powershell
# Open official v6 archive
irm https://raw.githubusercontent.com/als-code/rekorddeck/main/windows/bootstrap-rekordbox6.ps1 | iex

# Also open current portal (usually v7 — useful to compare, do not confuse with v6)
& ([scriptblock]::Create((irm https://raw.githubusercontent.com/als-code/rekorddeck/main/windows/bootstrap-rekordbox6.ps1))) -OpenLatestPortal
```

Or:

```powershell
Start-Process 'https://support.pioneerdj.com/hc/en-us/articles/8112764645785-I-want-to-use-previous-rekordbox-ver-6'
```

Current portal (often **v7**): [rekordbox.com/download](https://rekordbox.com/en/download/).

## Alternatives

Use these if you do not need rekordbox / Pioneer Export mode. Official pages
also appear in the [desktop pack](13-dj-desktop-pack.md).

| Software | Good fit when… | Link |
|----------|----------------|------|
| **Traktor** (NI) | You use Native Instruments gear / NI ecosystem | [Traktor](https://www.native-instruments.com/en/products/traktor/) |
| **VirtualDJ** | You want flexible mapping / quick trials | [VirtualDJ download](https://www.virtualdj.com/download/) |
| **Serato DJ** | Club / Serato-ready controllers | [Serato downloads](https://serato.com/dj/downloads) |

Pick **one** primary app for gigs; keep a second only if you already know it.

Next: [Recovery](16-recovery-and-updates.md).

Español: [../es/15-rekordbox-and-alts.md](../es/15-rekordbox-and-alts.md)
