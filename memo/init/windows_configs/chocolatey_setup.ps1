#Requires -RunAsAdministrator

if (Test-Path "C:\ProgramData\chocolatey")
{
    Write-Host "すでに Chocolatey は インストールされています。"
}
else
{
    Set-ExecutionPolicy Bypass -Scope Process -Force; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
## Get-PackageProvider -Name "Chocolatey" -ForceBootstrap
    choco feature enable -n=allowGlobalConfirmation
    Write-Host "インストールが完了しました。"
}

