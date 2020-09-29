@echo off

doskey /macrofile=%USERPROFILE%\init.macros

if "%CMD_INIT_SCRIPT_LOADED%" neq "" goto :eof
set CMD_INIT_SCRIPT_LOADED=1

set EDITOR=%SystemDrive%\tools\vim82-kaoriya-win64\gvim.exe
set GIT_EDITOR=%SystemDrive%\tools\vim82-kaoriya-win64\gvim.exe
set LANG=ja_JP.UTF-8
set GIT_SSH=c:\windows\system32\openssh\ssh.exe
set PATH=%SystemDrive%\Python38;%SystemDrive%\\Python38\Scripts;%LOCALAPPDATA%\Python\Python38\scripts;%ProgramFiles%\Git\cmd;%APPDATA%\npm;%USERPROFILE%\go\bin;%SystemDrive%\Go\bin;%ProgramFiles%\nodejs;%PATH%

:: vim: ts=2 et sw=2 fdm=marker ft=dosbatch
