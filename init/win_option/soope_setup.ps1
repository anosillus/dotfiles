$PowerShellVersion = (Get-Host).Version

tzutil.exe /s "Tokyo Standard Time"

function Install_Scoope
{
  Set-ExecutionPolicy RemoteSigned -scope CurrentUser
  iex (new-object net.webclient).downloadstring('https://get.scoop.sh')
}

If ($PowerShellVersion.Major -gt 3) {
  Install_Scoope
} Else {
  Read-Host "You have an older version of PowerShell. Scoop requires at least PowerShell 3."
}
