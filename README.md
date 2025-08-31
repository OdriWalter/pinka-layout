# Pinka — QWERTY + AltGr for Hungarian and German

![Pinka logo](pinka_transparent.png)

Named after the [Pinka river](https://en.wikipedia.org/wiki/Pinka)—the only river that flows through both Austria and Hungary and whose name is spelled identically in Hungarian, German, and English. This reflects Pinka’s aim for a universal layout spanning English, Hungarian, and German, represented by the Austro-Hungarian flag in our logo.

**Goal:** full Hungarian and German support on US QWERTY without relearning keys.

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

**Install (macOS)**
1. Copy `macos/Pinka.bundle` to `/Library/Keyboard Layouts/` (for all users) or `~/Library/Keyboard Layouts/` (just for the current user).
   - Optional: convert `pinka_transparent.png` to `Pinka.icns` with Preview or `iconutil`
     and place it in `macos/Pinka.bundle/Contents/Resources` before copying if you want a custom icon.
2. Log out and back in so macOS loads the new layout.
3. Open **System Settings → Keyboard → Input Sources** and click **+** to add **Pinka**.
4. Switch layouts with the menu bar keyboard switcher or `Ctrl+Space`.

**Install (Linux)**
1. Run `sudo ./install.sh` to copy the layout to `/usr/share/X11/xkb/` and register it.
2. Add **Pinka** in your desktop environment's keyboard settings.
3. Switch layouts with your usual shortcut.

**Uninstall**
- Windows: run `uninstall.ps1` (add `-Quiet` for silent) or Apps → Installed apps → Pinka → Uninstall.
- Linux: run `sudo ./uninstall.sh`.

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

## Build

The installers are generated with [Microsoft Keyboard Layout Creator (MSKLC)
1.4](https://www.microsoft.com/en-us/download/details.aspx?id=102134).

1. Open the `Pinka.klc` source file in MSKLC.
2. Choose **Project → Build DLL and Setup Package**.
3. MSKLC produces the architecture-specific `.msi` files, `setup.exe`, and a
   `pinka.zip` archive in the project directory.

### Regenerate checksums

After building, refresh `dist/SHA256SUMS`:

```powershell
Get-FileHash Pinka_amd64.msi,Pinka_i386.msi,Pinka_ia64.msi,setup.exe,pinka.zip `
  -Algorithm SHA256 | ForEach-Object { "$(($_.Hash))  $(Split-Path $_.Path -Leaf)" } |
  Set-Content dist/SHA256SUMS
```

Or on Unix-like systems:

```bash
sha256sum Pinka_amd64.msi Pinka_i386.msi Pinka_ia64.msi setup.exe pinka.zip > dist/SHA256SUMS
```

**License**: MIT.
