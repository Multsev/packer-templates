Write-Host "Set local account tocker filter policy"
Set-Itemproperty -path 'HKLM:\software\Microsoft\Windows\CurrentVersion\Policies\system' -Name 'LocalAccountTokenFilterPolicy' -value '1'

