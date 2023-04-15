# Path {{{
$env:Path += ";${Env:LOCALAPPDATA}\yarn\bin"
# $env:Path += ";${Env:USERPROFILE}\.pyenv\pyenv-win\bin"
$env:Path += ";${Env:USERPROFILE}\scoop\apps\python\current\Scripts"
$env:Path += ";${Env:ProgramFiles}\Microsoft Visual Studio\2022\Community\MSBuild\Current\Bin\Roslyn"
$env:Path += ";${Env:ProgramFiles(x86)}\Mecab\bin"
$env:Path += ";${ENV:ProgramFiles(x86)}\CaboCha\bin"
$env:Path += ";${Env:SystemDrive}\tools\Nim\nim-1.4.6\bin"
$env:Path += ";${Env:USERPROFILE}\.nimble\bin"
$env:Path += ";${Env:SystemDrive}\tools\Goneovim"
$env:Path += ";${Env:USERPROFILE}\scoop\shims\nvim.ps1"
$env:Path += ";${ENV:ProgramFiles(x86)}\Android\android-sdk\platform-tools"
# }}}}

# $NEXTWORD_DATA_PATH="${Env:SystemDrive}\tools\nextword-data-large"
$GIT_SSH="{$ENV:USERPROFILE}\scoop\shims\ssh.exe"
$EDITOR="{$ENV:USERPROFILE}\scoop\shims\gvim.exe"
# $EDITOR="${Env:SystemDrive}\tools\Goneovim\goneovim.exe"
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
Set-Alias c clear
Set-Alias chrome ${ENV:ProgramFiles(x86)}\Google\Chrome\Application\chrome.exe
Set-Alias cmigemo ${Env:SystemDrive}\tools\cmigemo\cmigemo.exe
Set-Alias eblook ${Env:SystemDrive}\tools\eblook\bin\eblook.exe
Set-Alias open Explorer
Set-Alias pdf ${Env:LOCALAPPDATA}\SumatraPDF\sumatrapdf.exe
Set-Alias pic ${ENV:ProgramFiles}\ImageGlass\imageplass.exe
Set-Alias sumatrapdf ${Env:LOCALAPPDATA}\SumatraPDF\sumatrapdf.exe
Set-Alias gvim gvim.exe
Set-Alias v ${Env:SystemDrive}\tools\neovide\neovide.exe
# Set-Alias goneovim ${Env:SystemDrive}\tools\Goneovim\goneovim.exe
Set-Alias vbox ${Env:ProgramFiles}\Oracle\VirtualBox\virtualbox.exe
Set-Alias vcpkg ${Env:SystemDrive}\tools\vcpkg\vcpkg.exe
Set-Alias vlc ${ENV:ProgramFiles}\VideoLAN\VLC\vlc.exe
# Set-Alias python python3
Set-Alias py python3
Set-Alias p python3
Set-Alias pip pip3

# Set-Alias captura ${ENV:ProgramFiles(x86)}\Captura\captura.exe
# }}}

# short-cut alias {{{
Set-Alias which Get-Command
Set-Alias ll Get-ChildItem
Set-Alias la Get-ChildItem
# }}}

# User Command {{{
function mcd { mkdir @args; cd @args }
function g { ghq-peco}
function rmd { Remove-Item -recurse -force @args }
function path { ($env:Path).Replace(';',"`n") }
function skkserv {C:\tools\yaskkserv2\yaskkserv2.exe --config-filename $HOME\.skk\win_yaskkserv2.conf}

Set-PSReadlineKeyHandler -Key "Ctrl+n" -Function "MenuComplete"

function DEV() {cd $DEV }
function DOC() {cd $DOC }
function DRIVE() {cd $HOMEDRIVE }
function DESK() {cd $DESKTOP }
function PATH() {$env:path.split(";")}

Invoke-Expression (& {
    $hook = if ($PSVersionTable.PSVersion.Major -lt 6) { 'prompt' } else { 'pwd' }
    (zoxide init --hook $hook powershell) -join "`n"
})


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

function ghq-peco {
    ghq.exe look $(ghq list | peco.exe)
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
function Edit-Vimrc {v ${Env:USERPROFILE}\dotfiles\dots\vim}
Set-Alias vv Edit-Vimrc
function Edit-Powershell {v ${Env:USERPROFILE}\dotfiles\dots\windows\Microsoft.PowerShell_profile.ps1 }
Set-Alias vp Edit-Powershell
# Edit Profile
function Edit-Profile {v $Profile }
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

    # invoke-expression "$command $link $target"
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

    # invoke-expression "$command $link"
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

# Install-Module PSReadLine -RequiredVersion 2.1.0


# Install-Module VSSetup -Scope CurrentUser
import-module vssetup
# Install-Module vssetup -Scope CurrentUser -Force -AllowClobber
# Install-Module oh-my-posh -Scope CurrentUser -Force
# scoop install posh-git
# Add-PoshGitToProfile
# Import-Module posh-git
# git clone https://github.com/microsoft/vcpkg
# Import-Module 'C:\tools\vcpkg\scripts\posh-vcpkg'
# vcpkg   install boost:x86-windows pthreads:x86-windows
# .\vcpkg\bootstrap-vcpkg.bat
# Install-Module PSReadLine -Force
Set-PSReadlineOption -HistoryNoDuplicates
# Set-PSReadLineOption -PredictionSource History
Set-PSReadLineKeyHandler -Key "Ctrl+f" -Function ForwardWord
oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH\paradox.omp.json" | Invoke-Expression

# Set-PoshPrompt -Theme Paradox
# }}}

# Chocolatey profile
$ChocolateyProfile = "$env:ChocolateyInstall\helpers\chocolateyProfile.psm1"
if (Test-Path($ChocolateyProfile)) {
  Import-Module "$ChocolateyProfile"
}

# Invoke-Expression (&starship init powershell)
# Install-Module -Name PSFzf
Set-PsFzfOption -PSReadlineChordProvider 'Ctrl+t' -PSReadlineChordReverseHistory 'Ctrl+r'
Set-PSReadlineOption -BellStyle None
Set-PSReadlineOption -HistoryNoDuplicates
Set-PSReadLineOption -PredictionSource History

# vim: ts=2 et sw=2 fdm=marker ft=ps1
