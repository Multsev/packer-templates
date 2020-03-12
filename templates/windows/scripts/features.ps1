Import-Module Servermanager

if((Get-CimInstance Win32_OperatingSystem).version -eq 6.1) {
	Write-Host "Install feature NetFx3"
	Install-WindowsFeature -Name NetFx3
}


Write-Host "Uninstall feature MicrosoftWindowsPowerShellISE"
Uninstall-WindowsFeature -Name MicrosoftWindowsPowerShellISE

Write-Host "Uninstall feature Windows-Defender"
Uninstall-WindowsFeature -Name Windows-Defender
