function Install-gVim{
	$Path = "$($env:USERPROFILE)\Downloads"
	$Installer = "vim*kaoriya-win64*.zip"
	$Target_path = "C:\tools"
	$Zip_item = Get-ChildItem $Path/Installer
	$Version = $latest
	$Url = "http://vim-jp.org/redirects/koron/vim-kaoriya/$(Version)/win64/"
	try
	{
		Invoke-WebRequest -Uri $Url -OutFile $Path\$Installer -MaximumRedirection 1
		Add-Type -AssemblyName System.IO.Compression.FileSystem
		[System.IO.Compression.ZipFile]::ExtractToDirectory($Zip_item, $Target_path)
		Remove-Item $Path\$Installer
	}
	catch
	{
		$StatusCode = $_.Exception.Response.StatusCode.value__
		Write-Warning "$($StatusCode)"
		exit 1
	}
	# $vim_dir =  Get-ChildItem $target_path\vim*
	# Rename-Item $vim_dir $target_path\kaoriya
}

Install-gVim
