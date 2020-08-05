# Path
$env:Path += ";${Env:ProgramFiles}\Git\cmd"
$env:Path += ";${Env:SystemDrive}\Ruby27-x64\bin"
$env:Path += ";${Env:SystemDrive}\Go\bin"
$env:Path += ";${Env:USERPROFILE}\go\bin"
# $env:Path += ";${Env:USERPROFILE}\Python38\Scripts"
. C:\ProgramData\Anaconda3\shell\condabin\conda-hook.ps1

# Function
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

$DEV = "$Env:homedrive\dev"
$TOOL = "$env:HOMEDRIVE\tools"
$DOC = $(resolve-path "$Env:userprofile\Documents")
$DESKTOP = $(resolve-path "$Env:userprofile\Desktop")
# $HOMEDRIVE = "C:\"
# $HOMEPATH = "Users\" + $env:username

Set-Alias v $TOOL\vim82-kaoriya-win64\gvim.exe
Set-Alias vim $TOOL\vim82-kaoriya-win64\vim.exe
Set-Alias open Explorer
Set-Alias which Get-Command
Set-Alias vlc ${Env:ProgramFiles(x86)}\VideoLAN\VLC\vlc.exe
Set-Alias chrome ${Env:ProgramFiles(x86)}\Google\Chrome\Application\chrome.exe
Set-Alias ssh C:\tools\msys64\usr\bin\ssh.exe

# create a directory then change to it
# PS> mcd newFolder
function mcd { mkdir @args; cd @args }
# remove a directory
# PS> rdf this_folder_and_its_spawn
function rmd { Remove-Item -recurse -force @args }

# calculate the size of the directory and its contents
function Get-DirectorySize() {
    param ([string]$root = $(resolve-path .))
    gci -re $root |
      ?{ -not $_.PSIsContainer } |
      measure-object -sum -property Length
  }

# wrap MKLINK command
# PS> mklink /h alias path\to\file
# PS> mklink /j alias path\to\folder
function mklink { cmd /c mklink $args }
# Sanity
Set-Alias ll Get-ChildItem
#Set-Alias pwd Get-Location

# Git Aliases
function _git_status { git status }
Set-Alias gst _git_status

# Edit Profile
function Edit-Profile { subl $Profile }
Set-Alias ep Edit-Profile

# parse the PATH environment variable; make it readable
# PS> path
function path { ($env:Path).Replace(';',"`n") }

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
Import-Module posh-git
Import-Module oh-my-posh
Set-Theme Paradox
