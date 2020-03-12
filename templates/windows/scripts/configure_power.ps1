Write-Host "Set high performance power profile"
powercfg -setactive 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c

Write-Host "Turn off Hibernation"
powercfg.exe /hibernate off

Write-Host "Turn off monitor timeout on AC power"
powercfg -Change -monitor-timeout-ac 0

Write-Host "Turn off monitor timeout on DC power"
powercfg -Change -monitor-timeout-dc 0
