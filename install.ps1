$ErrorActionPreference = "Stop"
Write-Host "𓂀 Installing ANUBIS AGENT — The Guardian of Code (Windows x64)..." -ForegroundColor Yellow

$InstallDir = "$env:LOCALAPPDATA\Programs\AnubisAgent"
New-Item -ItemType Directory -Force -Path $InstallDir | Out-Null

$ZipUrl = "https://github.com/Groennesby/Anubis-Agent/releases/download/v1.0.0/anubis-windows-amd64.zip"
$ZipPath = "$env:TEMP\anubis-windows-amd64.zip"

Write-Host "⬇️ Downloading Anubis Agent v1.0.0 from GitHub Releases..." -ForegroundColor Cyan
Invoke-WebRequest -Uri $ZipUrl -OutFile $ZipPath

Expand-Archive -Path $ZipPath -DestinationPath $InstallDir -Force
Remove-Item -Path $ZipPath -Force

$UserPath = [Environment]::GetEnvironmentVariable("Path", "User")
if ($UserPath -notlike "*$InstallDir*") {
    [Environment]::SetEnvironmentVariable("Path", "$UserPath;$InstallDir", "User")
    $env:Path += ";$InstallDir"
}

Write-Host "✓ Installed 'annubis.exe', 'anubis.exe', and 'anubis-gui.exe' to $InstallDir" -ForegroundColor Green
Write-Host "𓂀 Type 'annubis' or 'anubis' in PowerShell / Terminal to launch Anubis Agent!" -ForegroundColor Yellow
