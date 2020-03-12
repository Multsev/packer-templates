# install virtualbox guest additions on vbox guests
if(Test-Path "C:\\Windows\\Temp\\virtualbox") {
	Get-Children E:cert/ -Filter vbox*.cert | ForEach-Object {
		E:/cert/VboxCertUtil.exe add-trusted-publisher $_.FullName --root $_.FullName
	}
	Start-Process -FilePath  "E:\\VBoxWindowsAdditions.exe" -ArgumentList "/S" -WorkingDirectory "C:\\Windows\\Temp\\virtualbox" -Wait
	Remove-Item "C:\\Window\\Temp\\virtualbox" -Recurse
}

# install vmware tools on vmware guests
$isopath="C:\\Windows\\Temp\\vmware.iso"
if(Test-Path $isopath) {
	Mount-DiskImage -ImagePath $isopath
	$exe = ((Get-DiskImage -ImagePath $isopath | Get-Volume).Driveletter + ':\setup.exe')
	$parameters = '/S /v "/qr REBOOT=R"'
	Dismount-DiskImage -ImagePath $isopath
	Remove-Item $isopath
}

# install qemu guest agent on qemu guests
# E:\guest-agent\qemu-ga-x86_64.msi
# E:\guest-agent\qemu-ga-i386.msi
