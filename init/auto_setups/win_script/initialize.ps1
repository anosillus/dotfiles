## prepare
##   Set-ExecutionPolicy RemoteSigned

#Requires -RunAsAdministrator

Write-Host "STEP 1: Windowsの設定 をセットアップしています……"
## Time Zone の設定
tzutil.exe /s "Tokyo Standard Time"
    
new-item -itemtype directory C:\tools
new-item -itemtype directory $env:USERPROFILE\Home
new-item -itemtype directory $env:USERPROFILE\Home\.config\fish
new-item -itemtype directory $env:USERPROFILE\Home\.config\vim
new-item -itemtype directory $env:USERPROFILE\Home\.config\nvim

new-item -itemtype directory $env:USERPROFILE\Home\.cashe\vim
new-item -itemtype directory $env:USERPROFILE\tools\kaoriya

## Install Chocolatey 
# https://chocolatey.org/install#install-with-powershellexe
# Don't forget to ensure ExecutionPolicy above

Write-Host "STEP 2: chocolatey をセットアップしています……"

if (Test-Path "C:\ProgramData\chocolatey")
{
    Write-Host "すでにインストールされています。"
}
else
{
    Set-ExecutionPolicy Bypass -Scope Process -Force; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))

## Get-PackageProvider -Name "Chocolatey" -ForceBootstrap
    Write-Host "インストールが完了しました。"
}

## Write-Host "STEP 3: GitHubから設定ファイルを導入している……"
## Install Git by Chocolatey
if(Test-Path "$env:USERPROFILE\Home\dotfiles")
{
    Write-Host "Dotfiles already installed"
}
else
{
## not finished
}    

## Write-Host "STEP 4: ドットファイルを作成しています……"

Rm -force $env:USERPROFILE\Home\.vimrc
Rm -force $env:USERPROFILE\Home\.vim
Rm -force $env:USERPROFILE\Home\.config
Rm -force $env:USERPROFILE\Home\.tmux.conf
Rm -force $env:USERPROFILE\Home\.gitconfig

# New-Item -Type SymbolicLink $env:USERPROFILE/Home/.ssh  -Value $env:USERPROFILE\.ssh
#
New-Item -Type SymbolicLink $env:USERPROFILE/Home/.skk  -Value $env:USERPROFILE\Home\dotfiles\dots\skk
New-Item -Type SymbolicLink $env:USERPROFILE/Home/.vimrc  -Value $env:USERPROFILE\Home\dotfiles\dots\vimrc
New-Item -Type SymbolicLink $env:USERPROFILE/Home/.gvimrc  -Value $env:USERPROFILE\Home\dotfiles\dots\gvimrc
New-Item -Type SymbolicLink $env:USERPROFILE/Home/.tmux.conf -Value $env:USERPROFILE\Home\dotfiles\dots\tmux.conf
New-Item -Type SymbolicLink $env:USERPROFILE/Home/.gitconfig -Value  $env:USERPROFILE\Home\dotfiles\dots\gitconfig
New-Item -Type SymbolicLink $env:USERPROFILE/Home/.vim -Value $env:USERPROFILE\Home\dotfiles\dots\vim
New-Item -Type SymbolicLink $env:USERPROFILE/Home/.config -Value $env:USERPROFILE\Home\dotfiles\dots\config

[System.Environment]::SetEnvironmentVariable("PATH", "$ENV:PATH;C:\tools\kaoriya", "USER")
[System.Environment]::SetEnvironmentVariable('HOME','USERPROFILE\Home','User')

Write-Host "STEP 5: 重要なソフトをインストールしています……"
choco install $env:USERPROFILE\Home\dotfiles\init\windows\package.config -y

Write-Host "セットアップが終了しました。キーを押すと終了します。"
$host.UI.ReadLine()

## 1分待機
Start-Sleep -Seconds 60

## OS再起動
## 	Restart-Computer
