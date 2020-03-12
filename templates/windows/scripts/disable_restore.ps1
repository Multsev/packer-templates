# don't bother saving data for a system restore
# New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows NT\SystemRestore' -Name 'DisableSR' -value '0' -Force
Disable-ComputerRestore -Drive "C:\"
