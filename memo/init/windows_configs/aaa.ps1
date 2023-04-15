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

New-SymLink C:\Users\anosillus\Documents D:\Documents
New-SymLink C:\Users\anosillus\Downloads D:\Downloads
New-SymLink C:\Users\anosillus\Videos D:\Videos
New-SymLink C:\Users\anosillus\Pictures\ D:\Pictures
New-SymLink C:\Users\anosillus\Favorites\ D:\Favorites
New-SymLink C:\Users\anosillus\Desktop\ D:\Desktop
New-SymLink C:\Users\anosillus\Music\ D:\Music
New-SymLink C:\Users\anosillus\tools\ C:\tools
