function Get-PinkaMsi {
    $arch = (Get-CimInstance Win32_OperatingSystem).OSArchitecture

    switch -regex ($arch) {
        '64' { $msi = 'Pinka_amd64.msi' }
        '32' { $msi = 'Pinka_i386.msi' }
        'Itanium|IA64' { $msi = 'Pinka_ia64.msi' }
        default { throw "Unsupported architecture: $arch" }
    }

    $root = Split-Path $PSScriptRoot -Parent
    return (Join-Path $root $msi)
}
