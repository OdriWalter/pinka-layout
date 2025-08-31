#Requires -RunAsAdministrator
param(
    [switch]$Quiet
)

# Load shared helper functions
. "$PSScriptRoot/scripts/common.ps1"

# Confirm administrator privileges
Assert-Administrator

# Determine system architecture via shared module
$msi = Get-InstallerArch

$msiPath = Join-Path $PSScriptRoot $msi
if (-not (Test-Path $msiPath)) {
    Write-Error "Installer $msiPath not found."
    exit 1
}

# Verify SHA256 checksum via shared module
$checksumFile = Join-Path $PSScriptRoot 'dist' 'SHA256SUMS'
Verify-Checksum -FilePath $msiPath -ChecksumFile $checksumFile

$arguments = "/i `"$msiPath`""
if ($Quiet) {
    $arguments += " /qn"
}

$process = Start-Process -FilePath "msiexec.exe" -ArgumentList $arguments -Wait -PassThru
if ($process.ExitCode -ne 0) {
    Write-Error "Installer exited with code $($process.ExitCode)"
}
exit $process.ExitCode
