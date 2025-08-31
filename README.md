# Pinka — QWERTY + AltGr for Hungarian

**Goal:** full Hungarian on US QWERTY without relearning keys.

**Features**
- AltGr layer: á é í ó ö ő ú ü ű and gy ly ny. Shift → capitals.
- Keeps US punctuation and shortcuts.
- Adds ß and German umlauts for CE users.
- Optional Ctrl+Shift accents on number row for compact boards.

**Install (Windows)**
1. If you're unsure, run `setup.exe`; it detects your architecture and installs the right package. Use a specific `.msi` for manual or unattended setups:
   - `Pinka_amd64.msi` for 64-bit x64 systems
   - `Pinka_i386.msi` for 32-bit x86 systems
   - `Pinka_ia64.msi` for Itanium systems
2. Settings → Time & Language → Language → Keyboard → add **Pinka**.
3. Switch with Win+Space.
   Note: on Windows, **AltGr = Right Alt = Ctrl+Alt**. If an app uses Ctrl+Alt shortcuts, rebind them.

**Uninstall**: Apps → Installed apps → Pinka → Uninstall.

**Verify download**
Use PowerShell to check the SHA256 of the installer you downloaded:

```
Get-FileHash .\Pinka_amd64.msi -Algorithm SHA256
Get-FileHash .\Pinka_i386.msi -Algorithm SHA256
Get-FileHash .\Pinka_ia64.msi -Algorithm SHA256
Get-FileHash .\setup.exe -Algorithm SHA256
```

**License**: MIT.
