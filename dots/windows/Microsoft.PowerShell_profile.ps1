# Path {{{
$env:Path += ";${Env:LOCALAPPDATA}\yarn\bin"
$env:Path += ";${Env:USERPROFILE}\.pyenv\pyenv-win\bin"
$env:Path += ";${Env:ProgramFiles(x86)}\Microsoft Visual Studio\2019\Community\MSBuild\Current\Bin\Roslyn"
$env:Path += ";${Env:ProgramFiles(x86)}\Mecab\bin"
$env:Path += ";${ENV:ProgramFiles(x86)}\CaboCha\bin"
# }}}}

# $NEXTWORD_DATA_PATH="${Env:SystemDrive}\tools\nextword-data-large"
$GIT_SSH="{$ENV:USERPROFILE}\scoop\shims\ssh.exe"
$EDITOR="{$ENV:USERPROFILE}\scoop\shims\gvim.exe"
$XDG_CONFIG_HOME="{$ENV:USERPROFILE}\.config"

# Issue with VisualStudio {{{
# Install-Module Pscx -Scope CurrentUser  -Force -AllowClobber -AllowClobber
# }}}

# MyEnv {{{
$DEV = "$ENV:USERPROFILE\dev"
$WORK = "$ENV:USERPROFILE\work"
$TOOL = "$ENV:HOMEDRIVE\tools"
$DOC = $(resolve-path "$ENV:USERPROFILE\Documents")
$DESKTOP = $(resolve-path "$ENV:USERPROFILE\Desktop")
# }}}

# Program Alias {{{
Set-Alias make_dict ${Env:SystemDrive}\tools\yaskkserv2\yaskkserv2_make_dictionary.exe
# Set-Alias capture ${Env:ProgramFiles}\ShareX.exe
Set-Alias chrome ${ENV:ProgramFiles(x86)}\Google\Chrome\Application\chrome.exe
Set-Alias cmigemo ${Env:SystemDrive}\tools\cmigemo\cmigemo.exe
Set-Alias eblook ${Env:SystemDrive}\tools\eblook\bin\eblook.exe
Set-Alias open Explorer
Set-Alias pdf ${Env:LOCALAPPDATA}\SumatraPDF\sumatrapdf.exe
Set-Alias pic ${ENV:ProgramFiles}\ImageGlass\imageplass.exe
Set-Alias sumatrapdf ${Env:LOCALAPPDATA}\SumatraPDF\sumatrapdf.exe
Set-Alias v gvim.exe
Set-Alias vbox ${Env:ProgramFiles}\Oracle\VirtualBox\virtualbox.exe
Set-Alias vcpkg ${Env:SystemDrive}\tools\vcpkg\vcpkg.exe
Set-Alias vlc ${ENV:ProgramFiles}\VideoLAN\VLC\vlc.exe
# Set-Alias captura ${ENV:ProgramFiles(x86)}\Captura\captura.exe
# }}}

# short-cut alias {{{
Set-Alias which Get-Command
Set-Alias ll Get-ChildItem
Set-Alias la Get-ChildItem
# }}}

# User Command {{{
function mcd { mkdir @args; cd @args }
function rmd { Remove-Item -recurse -force @args }
function path { ($env:Path).Replace(';',"`n") }
function skkserv {C:\tools\yaskkserv2\yaskkserv2.exe --config-filename $HOME\.skk\win_yaskkserv2.conf}

function DEV() {cd $DEV }
function DOC() {cd $DOC }
function DRIVE() {cd $HOMEDRIVE }
function DESK() {cd $DESKTOP }
function PATH() {$env:path.split(";")}


function touch($file) {
  If (Test-Path $file) {
    (Get-Item $file).LastWriteTime = Get-Date
  } Else {
    Out-File -encoding Default $file
  }
}
Function uptime() {
  [DateTime]::Now -  [Management.ManagementDateTimeConverter]::ToDateTime((Get-WmiObject Win32_OperatingSystem).LastBootUpTime) |
  Select-Object Days, Hours, Seconds, Milliseconds| Format-Table -AutoSize
}

function Get-DirectorySize() {
    param ([string]$root = $(resolve-path .))
    gci -re $root |
      ?{ -not $_.PSIsContainer } |
      measure-object -sum -property Length
  }
Set-Alias size Get-DirectorySize
function Run-Ubuntu {Start-VM -Name "Ubuntu 20.10"}
Set-Alias vm Run-Ubuntu
function End-Ubuntu {Stop-VM -Name "Ubuntu 20.10"}
Set-Alias halt End-Ubuntu
function Edit-Vimrc {gvim ${Env:USERPROFILE}\dotfiles\dots\vim}
Set-Alias vv Edit-Vimrc
function Edit-Powershell {gvim ${Env:USERPROFILE}\dotfiles\dots\windows\Microsoft.PowerShell_profile.ps1 }
Set-Alias vp Edit-Powershell
# Edit Profile
function Edit-Profile { gvim $Profile }
Set-Alias ep Edit-Profile
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
Set-Alias ln New-SymLink
Function Remove-SymLink ($link)
{
    if (test-path -pathtype container $link)
    {
        $command = "cmd /c rmdir"
    }
    else
    {
        $command = "cmd /c del"
    }

    invoke-expression "$command $link"
}
Set-Alias unlink Remove-SymLink

function Set-DebugMode()
{
    switch ($DebugPreference) {
        'Continue' {
            write-host 'Setting debug off'
            $global:DebugPreference = 'SilentlyContinue'
        }
        'SilentlyContinue' {
            write-host 'Setting debug on'
            $global:DebugPreference = 'Continue'
        }
    }
}
Set-Alias debug Set-DebugMode

# Live Reload Profile
function Reload-Profile {
  @(
    $Profile.AllUsersAllHosts,
    $Profile.AllUsersCurrentHost,
    $Profile.CurrentUserAllHosts,
    $Profile.CurrentUserCurrentHost
  ) | % {
    if(Test-Path $_) {
      Write-Verbose "Running $_"
      . $_
    }
  }
}
Set-Alias reload Reload-Profile
# }}}

# Import-Module {{{
Set-PSReadlineOption -EditMode Emacs
import-module vssetup
# Install-Module vssetup -Scope CurrentUser  -Force -AllowClobber
Import-Module posh-git
Import-Module 'C:\tools\vcpkg\scripts\posh-vcpkg'
# vcpkg   install boost:x86-windows pthreads:x86-windows
Import-Module oh-my-posh
Set-PoshPrompt -Theme Paradox
# }}}

# Chocolatey profile
$ChocolateyProfile = "$env:ChocolateyInstall\helpers\chocolateyProfile.psm1"
if (Test-Path($ChocolateyProfile)) {
  Import-Module "$ChocolateyProfile"
}

# vim: ts=2 et sw=2 fdm=marker ft=ps1
