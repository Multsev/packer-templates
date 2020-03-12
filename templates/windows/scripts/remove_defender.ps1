Write-Host "Turn OFF Real Time Protection"
Set-MpPreference -DisableRealtimeMonitoring $true

Write-Host "Remove Windows Defender"
Uninstall-WindowsFeature -Name Windows-Defender
