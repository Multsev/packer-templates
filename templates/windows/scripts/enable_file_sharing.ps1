Write-Host 'enable filesharing'
netsh advfirewall firewall set rule group="File and Printer Sharing" new enable=Yes
