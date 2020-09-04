#vim set filetype=ps1

# Path
# llvm (from source) is better than msvs.
# VScode 2020 doesn't work by this tool and I use 2020 ver.
# Import-VisualStudioVars -VisualStudioVersion 2019 -Architecture amd64
$env:Path += ";${Env:SystemDrive}\tools\llvm-project\Release\bin"
$env:Path += ";${Env:SystemDrive}\tools\vcpkg"
$env:Path += ";${Env:SystemDrive}\Ruby27-x64\bin"
$env:Path += ";${Env:SystemDrive}\Go\bin"
$env:Path += ";${Env:USERPROFILE}\go\bin"
$env:Path += ";${Env:ProgramFiles}\nodejs"
$env:Path += ";${Env:USERPROFILE}\.cargo\bin"
# Even though you set python as env path, Store python recomender has priority. I use alias.
$env:Path += ";${Env:SystemDrive}\Python38"
$env:Path += ";${Env:APPDATA}\Python\Python38\Scripts"
$env:Path += ";${Env:SystemDrive}\Python38\Scripts"
$env:Path += ";${Env:SystemDrive}\Strawberry\c\bin"
$env:Path += ";${Env:SystemDrive}\Strawberry\perl\site\bin"
$env:Path += ";${Env:SystemDrive}\Strawberry\perl\bin"
$env:Path += ";${Env:ProgramFiles(x86)}\Common Files\Oracle\Java\javapath"
$env:Path += ";${Env:SystemDrive}\tools\neovim\Neovim\bin"
$env:Path += ";${Env:SystemDrive}\tools\vim82-kaoriya-win64"
$env:Path += ";${Env:ProgramFiles}\Git\cmd"
$env:Path += ";${Env:SystemDrive}\tools\msys64\usr\bin"
$env:Path += ";${Env:ProgramFiles}\7-Zip"
$env:Path += ";${Env:LOCALAPPDATA}\SumatraPDF"

# . C:\ProgramData\Anaconda3\shell\condabin\conda-hook.ps1
#  $env:Path += ";${Env:ProgramData}\Anaconda3\Scripts;" +
             # ";${Env:ProgramData}\Anaconda3\bin" +
             # ";${Env:ProgramData}\Anaconda3"

# Install-Module Pscx -Scope CurrentUser  -Force -AllowClobber -AllowClobber

Function touch($file) {
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

$DEV = "$ENV:USERPROFILE\dev"
$TOOL = "$ENV:HOMEDRIVE\tools"
$DOC = $(resolve-path "$ENV:USERPROFILE\Documents")
$DESKTOP = $(resolve-path "$ENV:USERPROFILE\Desktop")

# $HOMEDRIVE = "C:\"
# $HOMEPATH = "Users\" + $env:username

Set-Alias v $TOOL\vim82-kaoriya-win64\gvim.exe
Set-Alias vim $TOOL\vim82-kaoriya-win64\vim.exe
Set-Alias open Explorer
Set-Alias which Get-Command
Set-Alias vlc ${ENV:ProgramFiles(x86)}\VideoLAN\VLC\vlc.exe
# Set-Alias code ${Env:LOCALAPPDATA}\Programs\Microsoft VS Code\bin\code.cmd" $*

Set-Alias chrome ${ENV:ProgramFiles(x86)}\Google\Chrome\Application\chrome.exe
Set-Alias ssh $TOOL\msys64\usr\bin\ssh.exe
Set-Alias python ${ENV:SystemDrive}\Python38\python.exe
Set-Alias pdf ${Env:LOCALAPPDATA}\SumatraPDF\sumatrapdf.exe

# create a directory then change to it
# PS> mcd newFolder
function mcd { mkdir @args; cd @args }
# remove a directory
# PS> rdf this_folder_and_its_spawn
function rmd { Remove-Item -recurse -force @args }

function DEV() {cd $DEV }
function DOC() {cd $DOC }
function DRIVE() {cd $HOMEDRIVE }
function DESK() {cd $DESKTOP }

# calculate the size of the directory and its contents
function Get-DirectorySize() {
    param ([string]$root = $(resolve-path .))
    gci -re $root |
      ?{ -not $_.PSIsContainer } |
      measure-object -sum -property Length
  }

# Sanity
Set-Alias ll Get-ChildItem
#Set-Alias pwd Get-Location

function Edit-Vimrc {. $TOOL\vim82-kaoriya-win64\gvim.exe ${Env:USERPROFILE}\dotfiles\dots\vim}
Set-Alias vv Edit-Vimrc

function Edit-Powershell {. $TOOL\vim82-kaoriya-win64\gvim.exe ${Env:USERPROFILE}\dotfiles\dots\windows\Microsoft.PowerShell_profile.ps1 }
Set-Alias vp Edit-Powershell

# Git Aliases
function _git_status { git status }
Set-Alias gst _git_status

# Edit Profile
function Edit-Profile { subl $Profile }
Set-Alias ep Edit-Profile

# parse the PATH environment variable; make it readable
# PS> path
function path { ($env:Path).Replace(';',"`n") }

# wrap MKLINK command
# PS> mklink /h alias path\to\file
# PS> mklink /j alias path\to\folder
# function mklink { cmd /c mklink $args }

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

# enable Write-Debug messages
# toggle state by repeated issuing command
# PS> debug
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
Set-PSReadlineOption -EditMode Emacs
import-module vssetup
# Install-Module vssetup -Scope CurrentUser  -Force -AllowClobber
Import-Module posh-git
Import-Module 'C:\tools\vcpkg\scripts\posh-vcpkg'
# vcpkg   install boost:x86-windows pthreads:x86-windows
Import-Module oh-my-posh
Set-Theme Paradox
