Clear-History
if (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) { Start-Process powershell.exe "-NoProfile -ExecutionPolicy Bypass -File `"$PSCommandPath`" `"$args`"" -Verb RunAs; exit }
cls

$bitTest = Test-Path C:\Windows\SysWOW64\OneDriveSetup.exe
$bitInstall = Test-Path C:\Windows\SysWOW64\OneDriveSetup.exe

##Kills existing task
""
Write-Host "Killing task if running"
Stop-Process -Name OneDrive* -Force -ErrorAction SilentlyContinue

##Checking for bit version for uninstall
if ($bitTest -eq $True) {
""
Write-Host "Selecting 64-bit uninstaller"
C:\Windows\SysWOW64\OneDriveSetup.exe /uninstall -Wait
}else {
""
Write-Host "Selecting 32-bit uninstaller"
C:\Windows\System32\OneDriveSetup.exe /uninstall -Wait
}

Sleep -Seconds 10

##Checking for bit version to re-install
if ($bitInstall -eq $True) {
""
Write-Host "Selecting 64-bit installer"
C:\Windows\SysWOW64\OneDriveSetup.exe
}else {
""
Write-Host "Selecting 32-bit installer"
C:\Windows\System32\OneDriveSetup.exe
}
""
Write-Host "Installing OneDrive"

Sleep -Seconds 3
Exit