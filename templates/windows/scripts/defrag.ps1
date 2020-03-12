Import-Module BitsTransfer

$url = "http://downloads.sourceforge.net/ultradefrag/ultradefrag-portable-7.0.2.bin.amd64.zip"
$output = $env:TEMP

Write-Host "Download and decompress UltraDefrag"
Start-BitsTransfer $url "$output\ultradefrag.zip"
Expand-Archive -LiteralPath "$output\ultradefrag.zip" -DestinationPath "$output\ultradefrag"

Write-Host "Run UltraDefarg"
& "$(dir -Path $env:TEMP\ultradefrag -Filter udefrag.exe -Recurse | %{$_.FullName})" --optimize --repeat %SystemDrive%


