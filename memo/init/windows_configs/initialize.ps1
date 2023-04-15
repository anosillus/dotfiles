#Requires -RunAsAdministrator

Write-Host "STEP 1: Windowsの設定 をセットアップしています……"
tzutil.exe /s "Tokyo Standard Time"

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
Function New-SymLink ($link, $target)
{
    if (test-path -pathtype container $target)
    {
        $command = "cmd /c mklink /d"
    }
    else
    {
        $command = "cmd /c mklink"
    }

    invoke-expression "$command $link $target"
}
Rm -force $env:USERPROFILE\.vimrc
Rm -force $env:USERPROFILE\.vim
Rm -force $env:USERPROFILE\.config
Rm -force $env:USERPROFILE\.tmux.conf
Rm -force $env:USERPROFILE\.gitconfig
# Rm -force $env:USERPROFILE\.ssh

New-SymLink ${Env:USERPROFILE}\Documents\WindowsPowerShell\Microsoft.PowerShell_profile.ps1 ${Env:USERPROFILE}\dotfiles\dots\windows\Microsoft.PowerShell_profile.ps1
# New-SymLink ${Env:USERPROFILE}\.ssh \${Env:USERPROFILE}\dotfiles\dots\ssh
New-SymLink ${Env:USERPROFILE}\.skk ${Env:USERPROFILE}\dotfiles\dots\skk
New-SymLink ${Env:USERPROFILE}\.vimrc ${Env:USERPROFILE}\dotfiles\dots\vimrc
New-SymLink ${Env:USERPROFILE}\.gvimrc  ${Env:USERPROFILE}\dotfiles\dots\gvimrc
New-SymLink ${Env:USERPROFILE}\.vim  ${Env:USERPROFILE}\dotfiles\dots\vim
New-SymLink ${Env:USERPROFILE}\.tmux.conf  ${Env:USERPROFILE}\dotfiles\dots\tmux.conf
New-SymLink ${Env:USERPROFILE}\.gitconfig  ${Env:USERPROFILE}\dotfiles\dots\gitconfig
New-SymLink ${Env:USERPROFILE}\.config ${Env:USERPROFILE}\dotfiles\dots\config
New-SymLink ${Env:USERPROFILE}\vimfiles\coc-settings.json ${Env:USERPROFILE}\dotfiles\dots\vim\coc-settings.json
New-SymLink ${Env:APPDATA}\efm-langserver\config.yaml ${Env:USERPROFILE}\dotfiles\dots\config\coc\config.yaml
mkdir ${Env:USERPROFILE}\AppData\Local\nvim\
New-SymLink ${Env:USERPROFILE}\AppData\Local\nvim\init.vim ${Env:USERPROFILE}\dotfiles\dots\vimrc