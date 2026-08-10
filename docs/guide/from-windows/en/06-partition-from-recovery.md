# 06 — Partition from SteamOS Recovery

Do **not** use KDE Partition Manager from normal Desktop — the SSD is often locked. Boot the **recovery image**.

## Boot Recovery

1. Power off. Insert Recovery media.  
2. **Vol− + Power** → select Recovery USB/SD.  
3. Recovery desktop → Utilities → **KDE Partition Manager**.

## Resize

1. Select the internal disk.  
2. Find **ext4 home**.  
3. Resize/Move → leave free space at the end for Windows (≥64 GB; 80 GB+ recommended).  
4. Apply → create **NTFS** on the new free space → Apply.  

Shut down, remove Recovery, insert Windows USB.

## Size hints (community)

| Drive | Windows (ballpark) |
|-------|--------------------|
| 256 GB | ~80–150 GB |
| 512 GB | ~150–200 GB |
| 1 TB+ | 200–400 GB+ |

Next: [Choose Windows](07-choose-windows.md).

Español: [../es/06-partition-from-recovery.md](../es/06-partition-from-recovery.md)
