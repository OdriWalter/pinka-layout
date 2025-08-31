# Pinka — QWERTY + AltGr for Hungarian

![Pinka logo](pinka_transparent.png)

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
   The script verifies the installer's SHA256 checksum against `dist/SHA256SUMS` before proceeding.
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

**SHA256 checksums**

| File | SHA256 |
| --- | --- |
| Pinka_amd64.msi | 02124b3d8fb281be65fda6a07e0a9bffeb306260bc025c4ad8be77b50db29615 |
| Pinka_i386.msi  | 0602c20fb7f722d9f9d32ac9931f656eb76dc1f5937caf02a06c38c6dcacdfa2 |
| Pinka_ia64.msi  | 99ba7ccc826d11aca828255ad426dafe539a35fde66352c4b492fd54b001cd93 |
| setup.exe       | 26e455d1953fe77a034f3bd53fc2bbe8caf22de2f6c9e53b03cd7cb0685feeef |
| pinka.zip       | 2cacb3851625ecb326365cca63c34859228d121d1a04895e1451d0949272be4f |

**License**: MIT.
