# Don't check for updates automatically. This needs to be configured before you can install updates
Write-Host "Don't check for updates automatically"
Set-Itemproperty -path 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\WindowsUpdate\Auto Update' -Name 'AUOptions' -value '1'

$osversion = (Get-CimInstance Win32_OperatingSystem).Version
$version = $osversion.split(".")[0]

if ($version -eq 6.1) { # 2008_R2

  # This is basically a service pack and we should install it to fix a giant pile of bugs
  $windowsupdate = 'http://download.windowsupdate.com/d/msdownload/update/software/secu/2018/09/windows6.1-kb4462923-x64_5c4506692214692bf846da33052edb1dc5752156.msu'
  wusa.exe $windowsupdate /quiet /norestart
}
