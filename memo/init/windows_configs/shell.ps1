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

New-SymLink D:\Documents\WindowsPowerShell\Microsoft.PowerShell_profile.ps1 ${Env:USERPROFILE}\dotfiles\dots\windows\Microsoft.PowerShell_profile.ps1


