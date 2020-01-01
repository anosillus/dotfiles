$zip_item = Get-ChildItem $env:USERPROFILE\Downloads\vim*kaoriya-win64*.zip
$target_path = "C:\tools"
Add-Type -AssemblyName System.IO.Compression.FileSystem
[System.IO.Compression.ZipFile]::ExtractToDirectory($zip_item, $target_path)
$vim_dir =  Get-ChildItem $target_path\vim*
Rename-Item $vim_dir $target_path\kaoriya