###Create new directory
New-Item -Path 'E:\new_dir\' -ItemType Directory

###Downloading Git file
$url = "https://github.com//repo/master.zip"
$output = "E:\new_dir\master.zip"
$start_time = Get-Date
$wc = New-Object System.Net.WebClient
$wc.DownloadFile($url, $output)


###Extracting zipfile
$DestinationFolder = "E:\new_dir\"
[void] (New-Item -Path $DestinationFolder -ItemType Directory -Force)
$Shell = new-object -com Shell.Application
$Shell.Namespace($DestinationFolder).copyhere($Shell.NameSpace($output).Items(),4)

###installation part
Start-Process C:\new_dir\master\windows_setup.msi -ArgumentList "/quiet /passive"
