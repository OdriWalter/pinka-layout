param(
    [switch]$Quiet
)

# Determine system architecture
$arch = (Get-CimInstance Win32_OperatingSystem).OSArchitecture

switch -regex ($arch) {
    '64' { $msi = 'Pinka_amd64.msi' }
    '32' { $msi = 'Pinka_i386.msi' }
    'Itanium|IA64' { $msi = 'Pinka_ia64.msi' }
    default {
        Write-Error "Unsupported architecture: $arch"
        exit 1
    }
}

$msiPath = Join-Path $PSScriptRoot $msi
if (-not (Test-Path $msiPath)) {
    Write-Error "Installer $msiPath not found."
    exit 1
}

$arguments = "/x `"$msiPath`""
if ($Quiet) {
    $arguments += " /qn"
}

Start-Process -FilePath "msiexec.exe" -ArgumentList $arguments -Wait
