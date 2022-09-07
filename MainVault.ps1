Get-Date| Out-File -FilePath "C:\PowerShell\CyberArk Services\output.txt"
Add-Content "C:\PowerShell\CyberArk Services\output.txt" 'Vault01'
Add-Content "C:\PowerShell\CyberARk Services\output.txt" 'CyberArk Services'
Get-Service *Ark* | Out-File -FilePath "C:\PowerShell\CyberArk Services\output.txt" -Append
Add-Content "C:\PowerShell\CyberARk Services\output.txt" 'CPU LoadPercentage'
Get-CimInstance win32_processor | Measure-Object -Property LoadPercentage -Average | Out-File -FilePath "C:\PowerShell\CyberArk Services\output.txt" -Append
Add-Content "C:\PowerShell\CyberARk Services\output.txt" 'Disk Free Space'
Get-CimInstance -ClassName Win32_LogicalDisk | Select-Object -Property DeviceID,@{'Name' = 'FreeSpace (GB)'; Expression= { [int]($_.FreeSpace / 1GB) }} | Out-File -FilePath "C:\PowerShell\CyberArk Services\output.txt" -Append
Add-Content "C:\PowerShell\CyberARk Services\output.txt" 'RAM'
Get-WmiObject -Class win32_operatingsystem | ft @{Name="Total Visible Memory Size (GB)";e={[math]::truncate($_.TotalVisibleMemorySize /1MB)}}, @{Name="Free Physical Memory (GB)";e={[math]::truncate($_.FreePhysicalMemory /1MB)}} -AutoSize  | Out-File -FilePath "C:\PowerShell\CyberARk Services\output.txt" -Append

Add-Content "C:\PowerShell\CyberArk Services\output.txt" 'italog.log'
Get-content -tail 10 "C:\Program Files (x86)\PrivateArk\Server\Logs\italog.log" | Out-File -FilePath "C:\PowerShell\CyberArk Services\output.txt" -Append
