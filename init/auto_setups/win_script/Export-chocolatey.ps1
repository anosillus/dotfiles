# gist.github.com/alimbada/449ddf65b4ef9752eff3
# Export-Chocolatey.ps1 > packages.config

# Write-Output "<?xml version=`"1.0`" encoding=`"utf-8`"?>"
# Write-Output "<packages>"
# choco list -lo -r -y | % { "choco install " + $_.split('|')[0] + " -y" }
# Write-Output "</packages>"
#
$packageXml = ''
choco list -lo -r | % { $_ -split '\|' | select -first 1 } | % { $packageXml += "`n`t<package Id=""$_"" />" }
Set-Content "<packages>$packageXml`n</packages>" .\packages.config
