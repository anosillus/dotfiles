New-Item -ItemType SymbolicLink -Path $env:USERPROFILE/.skk  -Value $env:USERPROFILE\dotfiles\dots\skk
New-Item -Type SymbolicLink $env:USERPROFILE/.vimrc  -Value $env:USERPROFILE\dotfiles\dots\vimrc
New-Item -Type SymbolicLink $env:USERPROFILE/.gvimrc  -Value $env:USERPROFILE\dotfiles\dots\gvimrc
New-Item -Type SymbolicLink $env:USERPROFILE/.tmux.conf -Value $env:USERPROFILE\dotfiles\dots\tmux.conf
New-Item -Type SymbolicLink $env:USERPROFILE/.gitconfig -Value  $env:USERPROFILE\dotfiles\dots\gitconfig
New-Item -Type SymbolicLink $env:USERPROFILE/.vim -Value $env:USERPROFILE\dotfiles\dots\vim

New-Item -ItemType SymbolicLink -Path $env:USERPROFILE/.config  -Value $env:USERPROFILE\dotfiles\dots\config
New-Item -Type SymbolicLink $env:USERPROFILE/.config -Value $env:USERPROFILE\dotfiles\dots\config

New-Item -Path $env:USERPROFILE/.config  -Value $env:USERPROFILE\dotfiles\dots\config -ItemType SymbolicLink

New-Item -Type SymbolicLink $env:USERPROFILE\Documents\WindowsPowerShell\Microsoft.PowerShellISE_profile.ps1 -Value $env:USERPROFILE\dotfiles\dots\windows\Microsoft.PowerShell_profile.ps1