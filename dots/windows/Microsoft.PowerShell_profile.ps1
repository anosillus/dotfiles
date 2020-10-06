# Path {{{
# $env:Path += ";${Env:APPDATA}\Python\Python38\Scripts"
$env:Path += ";${Env:APPDATA}\npm"
$env:Path += ";${Env:ProgramFiles}\Git\cmd"
$env:Path += ";${Env:ProgramFiles}\nodejs"
$env:Path += ";${Env:SystemDrive}\Go\bin"
# $env:Path += ";${Env:LOCALAPPDATA}\Programs\Python\Python38\Scripts"
$env:Path += ";${Env:SystemDrive}\Ruby27-x64\bin"
$env:Path += ";${Env:SystemDrive}\tools\llvm-project\Release\bin"
$env:Path += ";${Env:USERPROFILE}\.cargo\bin"
$env:Path += ";${Env:USERPROFILE}\go\bin"
$env:Path += ";${Env:ProgramData}\chocolatey\bin"
# last, mingw is too strong.
# $env:Path += ";${Env:SystemDrive}\tools\msys64\mingw64\bin"
# $env:Path += ";${Env:SystemDrive}\tools\msys64\usr\bin"
# }}}}

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
Set-Alias make_dict ${Env:SystemDrive}\tools\yaskkserv2\target\release\yaskkserv2_make_dictionary.exe
Set-Alias 7z ${Env:ProgramFiles}\7-Zip\7z.exe
Set-Alias aws ${Env:ProgramFiles}\Amazon\AWSCLIV2\aws.exe
Set-Alias capture ${Env:ProgramFiles}\ShareX.exe
Set-Alias chrome ${ENV:ProgramFiles(x86)}\Google\Chrome\Application\chrome.exe
Set-Alias cmigemo ${Env:SystemDrive}\tools\cmigemo-default-win64\cmigemo.exe
Set-Alias docker ${Env:ProgramData}\DockerDesktop\version-bin\docker.exe
Set-Alias docker-compose ${Env:ProgramFiles}\Docker\Docker\resources\bin\docker-compose.exe
Set-Alias mecab ${Env:ProgramFiles}\Mecab\bin\mecab.exe
Set-Alias gcloud ${Env:ProgramFiles(x86)}\Google\'Cloud SDK'\google-cloud-sdk\bin\gcloud-ps.ps1
Set-Alias gh ${Env:ProgramFiles(x86)}\'GitHub CLI'\gh.exe
Set-Alias gvim ${Env:SystemDrive}\tools\vim82-kaoriya-win64\gvim.exe
Set-Alias java ${Env:ProgramFiles(x86)}\'Common Files'\Oracle\Java\javapath\java.exe
Set-Alias n ${Env:SystemDrive}\tools\neovim\bin\nvim.exe
Set-Alias neovim ${Env:SystemDrive}\tools\neovim\bin\nvim.exe
Set-Alias ngrok ${Env:SystemDrive}\tools\ngrok-stable-windows-amd64\ngrok.exe
Set-Alias nvim ${Env:SystemDrive}\tools\neovim\bin\nvim.exe
Set-Alias open Explorer
Set-Alias pdf ${Env:LOCALAPPDATA}\SumatraPDF\sumatrapdf.exe
Set-Alias perl ${Env:SystemDrive}\Strawberry\perl\bin\perl.exe
Set-Alias pic ${ENV:ProgramFiles(x86)}\QuickPictureViewer\quick-picture-viewer.exe
Set-Alias picture ${ENV:ProgramFiles(x86)}\QuickPictureViewer\quick-picture-viewer.exe
Set-Alias quick-picture-viwer ${ENV:ProgramFiles(x86)}\QuickPictureViewer\quick-picture-viewer.exe
Set-Alias rg ${Env:SystemDrive}\tools\ripgrep\rg.exe
Set-Alias ssh ${Env:SystemDrive}\tools\msys64\usr\bin\ssh.exe
Set-Alias sumatrapdf ${Env:LOCALAPPDATA}\SumatraPDF\sumatrapdf.exe
Set-Alias v ${Env:SystemDrive}\tools\vim82-kaoriya-win64\gvim.exe
Set-Alias vagrant ${Env:SystemDrive}\HashiCorp\Vagrant\bin\vagrant.exe
Set-Alias vbox ${Env:ProgramFiles}\Oracle\VirtualBox\virtualbox.exe
Set-Alias vcpkg ${Env:SystemDrive}\tools\vcpkg\vcpkg.exe
Set-Alias vim ${Env:SystemDrive}\tools\vim82-kaoriya-win64\vim.exe
Set-Alias vlc ${ENV:ProgramFiles(x86)}\VideoLAN\VLC\vlc.exe
# Set-Alias curl ${Env:SystemDrive}\tools\msys64\usr\bin\curl.exe
Set-Alias grep ${Env:SystemDrive}\tools\msys64\usr\bin\grep.exe
# Set-Alias python ${Env:LOCALAPPDATA}\Programs\Python\Python38\python.exe
# Set-Alias python3 ${Env:LOCALAPPDATA}\Programs\Python\Python38\python.exe
# Set-Alias captura ${ENV:ProgramFiles(x86)}\Captura\captura.exe
Set-Alias code ${Env:LOCALAPPDATA}\Programs\'Microsoft VS Code'\bin\code.cmd
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
function skkserv {C:\tools\yaskkserv2\target\release\yaskkserv2.exe --config-filename $HOME\.skk\win_yaskkserv2.conf}

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
Set-Theme Paradox
# }}}

# vim: ts=2 et sw=2 fdm=marker ft=ps1
