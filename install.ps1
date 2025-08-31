#Requires -RunAsAdministrator
param(
    [switch]$Quiet
)

if (-not ([Security.Principal.WindowsPrincipal]::new([Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator))) {
    Write-Error "This script must be run as Administrator."
    exit 1
}

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

# Verify SHA256 checksum if available
$checksumFile = Join-Path $PSScriptRoot 'dist' 'SHA256SUMS'
if (Test-Path $checksumFile) {
    $expected = Get-Content $checksumFile | Where-Object { $_ -match "\s$msi$" }
    if ($expected) {
        $expectedHash = $expected.Split(' ')[0].ToLower()
        $actualHash = (Get-FileHash $msiPath -Algorithm SHA256).Hash.ToLower()
        if ($actualHash -ne $expectedHash) {
            Write-Error "SHA256 mismatch for $msiPath. Expected $expectedHash but got $actualHash."
            exit 1
        }
    } else {
        Write-Warning "No checksum entry for $msi in $checksumFile."
    }
} else {
    Write-Warning "Checksum file $checksumFile not found."
}

$arguments = "/i `"$msiPath`""
if ($Quiet) {
    $arguments += " /qn"
}

$process = Start-Process -FilePath "msiexec.exe" -ArgumentList $arguments -Wait -PassThru
if ($process.ExitCode -ne 0) {
    Write-Error "Installer exited with code $($process.ExitCode)"
}
exit $process.ExitCode
