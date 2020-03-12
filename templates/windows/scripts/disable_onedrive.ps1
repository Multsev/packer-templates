# Disable OneDrive (this causes onedrive to load then instantly exit)
New-ItemProperty -Path 'HKLM:\Software\Policies\Microsoft\Windows\OneDrive' -Name 'DisableFileSyncNGSC' -value '1' -Force
