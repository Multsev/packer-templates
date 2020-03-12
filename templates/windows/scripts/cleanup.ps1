# Cleanmgr isn"t on windows server

$OsName=$(Get-CIMInstance -ClassName Win32_OperatingSystem -Property * | select Caption | Out-String)
$OsVerison=$(Get-CIMInstance -ClassName Win32_OperatingSystem -Property * | select Version | Out-String)
$OsArch=$(Get-CIMInstance -ClassName Win32_OperatingSystem -Property * | select OSArchitecture | Out-String)

if( ! $OsName.Contains("Server") ) {
	Write-Host "Clearing CleanMgr.exe automation settings."
	Get-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\VolumeCaches\*" -Name StateFlags0001 -ErrorAction SilentlyContinue | Remove-ItemProperty -Name StateFlags0001 -ErrorAction SilentlyContinue

	Write-Host "Enabling Update Cleanup. This is done automatically in Windows 10 via a scheduled task."
	New-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\VolumeCaches\Update Cleanup" -Name StateFlags0001 -Value 2 -PropertyType DWord

	Write-Host "Enabling Temporary Files Cleanup."
	New-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\VolumeCaches\Temporary Files" -Name StateFlags0001 -Value 2 -PropertyType DWord

	Write-Host "Starting CleanMgr.exe..."
	Start-Process -FilePath CleanMgr.exe -ArgumentList "/sagerun:1" -WindowStyle Hidden -Wait

	Write-Host "Waiting for CleanMgr and DismHost processes. Second wait neccesary as CleanMgr.exe spins off separate processes."
	Get-Process -Name cleanmgr,dismhost -ErrorAction SilentlyContinue | Wait-Process

	$UpdateCleanupSuccessful = $false
	if (Test-Path $env:SystemRoot\Logs\CBS\DeepClean.log) {
    		$UpdateCleanupSuccessful = Select-String -Path $env:SystemRoot\Logs\CBS\DeepClean.log -Pattern "Total size of superseded packages:" -Quiet
	}
}


if( Str(Get-Host | Select-Object Version ) > "6.1" ) {
Dism.exe /online /Cleanup-Image /StartComponentCleanup /ResetBase # command not present on Windows 7
}

# Remove unnecesary directories
  @(
      "C:\\Recovery",
      "$env:localappdata\\temp\\*",
      "$env:windir\\logs",
      "$env:windir\\winsxs\\manifestcache",
      "C:\\Users\\vagrant\Favorites\\*"
  ) | % {
          if(Test-Path $_) {
              Write-Host "Removing $_"
              try {
                Takeown /d Y /R /f $_
                Icacls $_ /GRANT:r administrators:F /T /c /q  2>&1 | Out-Null
                Remove-Item $_ -Recurse -Force | Out-Null
              } catch { $global:error.RemoveAt(0) }
          }
      }

# Clean all of the event logs
wevtutil el | Foreach-Object {wevtutil cl “$_”}

# Remove pagefile
Remove-Pagefile -SystemManaged  -CleanAtShutdown

