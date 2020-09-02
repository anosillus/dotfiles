@echo off

REM doskey /macrofile=%USERPROFILE%\init.macros

if "%CMD_INIT_SCRIPT_LOADED%" neq "" goto :eof
set CMD_INIT_SCRIPT_LOADED=1

set EDITOR=%SystemDrive%/tools/vim82-kaoriya-win64/gvim.exe
set GIT_EDITOR=%SystemDrive%/tools/vim82-kaoriya-win64/gvim.exe
REM set GRAPHVIZ_DOT=c:/dev/graphviz/bin/dot.exe
set LANG=ja_JP.UTF-8
REM set GOROOT_BOOTSTRAP=C:\Go
REM set CMAKE_GENERATOR=MSYS Makefiles
REM set GIT_SSH=c:\windows\system32\openssh\ssh.exe

cls
set PATH=%SystemDrive%\Python38;%SystemDrive%\\Python38\Scripts;%LOCALAPPDATA%\Python\Python38\scripts;%ProgramFiles%\Git\cmd;%PATH%
