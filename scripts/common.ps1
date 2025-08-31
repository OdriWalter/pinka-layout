function Assert-Administrator {
    if (-not ([Security.Principal.WindowsPrincipal]::new([Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator))) {
        Write-Error "This script must be run as Administrator."
        exit 1
    }
}

function Get-InstallerArch {
    $arch = (Get-CimInstance Win32_OperatingSystem).OSArchitecture
    switch -regex ($arch) {
        '64' { return 'Pinka_amd64.msi' }
        '32' { return 'Pinka_i386.msi' }
        'Itanium|IA64' { return 'Pinka_ia64.msi' }
        default {
            Write-Error "Unsupported architecture: $arch"
            exit 1
        }
    }
}

function Verify-Checksum {
    param(
        [string]$FilePath,
        [string]$ChecksumFile
    )

    if (Test-Path $ChecksumFile) {
        $file = Split-Path $FilePath -Leaf
        $expected = Get-Content $ChecksumFile | Where-Object { $_ -match "\s$file$" }
        if ($expected) {
            $expectedHash = $expected.Split(' ')[0].ToLower()
            $actualHash = (Get-FileHash $FilePath -Algorithm SHA256).Hash.ToLower()
            if ($actualHash -ne $expectedHash) {
                Write-Error "SHA256 mismatch for $FilePath. Expected $expectedHash but got $actualHash."
                exit 1
            }
        } else {
            Write-Warning "No checksum entry for $file in $ChecksumFile."
        }
    } else {
        Write-Warning "Checksum file $ChecksumFile not found."
    }
}
