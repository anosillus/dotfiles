@echo off

doskey /macrofile=%USERPROFILE%\init.macros

if "%CMD_INIT_SCRIPT_LOADED%" neq "" goto :eof
set CMD_INIT_SCRIPT_LOADED=1

set EDITOR=%SystemDrive%\tools\vim82-kaoriya-win64\gvim.exe
set GIT_EDITOR=%SystemDrive%\tools\vim82-kaoriya-win64\gvim.exe
set XDG_CONFIG_HOME=%USERPROFILE%\.config
set LANG=ja_JP.UTF-8
set NEXTWORD_DATA_PATH = c:\tools\nextword-data-large
set GIT_SSH = c:\tools\msys64\usr\bin\ssh.exe
set PATH=%SLOCALAPPDATA%\Packages\PythonSoftwareFoundation.Python.3.8_qbz5n2kfra8p0\LocalCache\local-packages\Python38\Scripts;%SystemDrive%\Python38\Scripts;%LOCALAPPDATA%\Python\Python38\scripts;%ProgramFiles%\Git\cmd;%APPDATA%\npm;%USERPROFILE%\go\bin;%SystemDrive%\Go\bin;%ProgramFiles%\nodejs;%PATH%

:: vim: ts=2 et sw=2 fdm=marker ft=dosbatch
