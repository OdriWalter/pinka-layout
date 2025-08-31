param(
    [switch]$Quiet
)

. "$PSScriptRoot/scripts/common.ps1"

$msiPath = Get-PinkaMsi
if (-not (Test-Path $msiPath)) {
    Write-Error "Installer $msiPath not found."
    exit 1
}

$arguments = "/x `"$msiPath`""
if ($Quiet) {
    $arguments += " /qn"
}

Start-Process -FilePath "msiexec.exe" -ArgumentList $arguments -Wait
