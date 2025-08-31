# Pinka — QWERTY + AltGr for Hungarian

**Goal:** full Hungarian on US QWERTY without relearning keys.

**Features**
- AltGr layer: á é í ó ö ő ú ü ű and gy ly ny. Shift → capitals.
- Keeps US punctuation and shortcuts.
- Adds ß and German umlauts for CE users.
- Optional Ctrl+Shift accents on number row for compact boards.

**Install (Windows)**
1. Download the latest release from the [releases page](../../releases):
   - `Pinka_amd64.msi` for 64-bit x64 systems
   - `Pinka_i386.msi` for 32-bit x86 systems
   - `Pinka_ia64.msi` for Itanium systems
   - `setup.exe` for a guided installer
2. Run `install.ps1` to auto-detect and install (use `-Quiet` for silent mode) or launch the installer you downloaded.
3. Settings → Time & Language → Language → Keyboard → add **Pinka**.
4. Switch with Win+Space.
   Note: on Windows, **AltGr = Right Alt = Ctrl+Alt**. If an app uses Ctrl+Alt shortcuts, rebind them.

**Uninstall**: run `uninstall.ps1` (add `-Quiet` for silent) or Apps → Installed apps → Pinka → Uninstall.

**Verify download**
SHA256 checksums are provided in `dist/SHA256SUMS` and on the releases page. Use PowerShell to verify the installer you downloaded:

```
Get-FileHash .\Pinka_amd64.msi -Algorithm SHA256
Get-FileHash .\Pinka_i386.msi -Algorithm SHA256
Get-FileHash .\Pinka_ia64.msi -Algorithm SHA256
Get-FileHash .\setup.exe -Algorithm SHA256
```

**License**: MIT.
