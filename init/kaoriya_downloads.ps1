$Res = $Null
$ErrCode = $Null
try 
{
    Invoke-WebRequest -Uri "http://vim-jp.org/redirects/koron/vim-kaoriya/latest/win64/" -MaximumRedirection 1
    $progressPreference = 'Continue'
}
catch
{
    $StatusCode = $_.Exception.Response.StatusCode.value__
}
$StatusCode

#$zip_item = Get-ChildItem $env:USERPROFILE\Downloads\vim*kaoriya-win64*.zip
#$target_path = "C:\tools"
#Add-Type -AssemblyName System.IO.Compression.FileSystem
#[System.IO.Compression.ZipFile]::ExtractToDirectory($zip_item, $target_path)
#$vim_dir =  Get-ChildItem $target_path\vim*
#Rename-Item $vim_dir $target_path\kaoriya