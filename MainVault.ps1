Get-Date| Out-File -FilePath "C:\PowerShell\CyberArk Services\output.txt"
Add-Content "C:\PowerShell\CyberArk Services\output.txt" 'Vault01'
Get-Service *Ark* | Out-File -FilePath "C:\PowerShell\CyberArk Services\output.txt" -Append
Get-CimInstance win32_processor | Measure-Object -Property LoadPercentage -Average | Out-File -FilePath "C:\PowerShell\CyberArk Services\output.txt" -Append
Get-CimInstance -ClassName Win32_LogicalDisk | Select-Object -Property DeviceID,@{'Name' = 'FreeSpace (GB)'; Expression= { [int]($_.FreeSpace / 1GB) }} | Out-File -FilePath "C:\PowerShell\CyberArk Services\output.txt" -Append
