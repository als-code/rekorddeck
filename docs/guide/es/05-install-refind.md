# 05 — Instalar rEFInd (antes de Windows)

Instala el gestor de arranque **antes** de instalar Windows.

En Desktop Mode, con red:

```bash
curl -L https://github.com/jlobue10/SteamDeck_rEFInd/raw/main/install-GUI.sh | sh
```

Abre el acceso directo **SteamDeck_rEFInd**:

1. **Install rEFInd** (solo la primera vez).  
2. Deja SteamOS como default; Windows como segunda opción.  
3. **Create Config** → **Install Config** (password sudo).  
4. Activa **Sysd On** si está disponible (mantiene rEFInd tras updates).

Tras reiniciar verás el menú (de momento solo SteamOS útil). Windows llegará después.

Docs: [SteamDeck_rEFInd](https://github.com/jlobue10/SteamDeck_rEFInd).

Siguiente: [Particionar desde Recovery](06-partition-from-recovery.md).

English: [../en/05-install-refind.md](../en/05-install-refind.md)
