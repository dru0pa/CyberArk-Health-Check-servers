Get-Date| Out-File -FilePath "C:\PowerShell\CyberARk Services\output.txt"
Add-Content "C:\PowerShell\CyberARk Services\output.txt" 'PVWA'
Add-Content "C:\PowerShell\CyberARk Services\output.txt" '<PVWA01>'
Get-Service -ComputerName <PVWA01> *Ark*, IISADMIN | Out-File -FilePath "C:\PowerShell\CyberARk Services\output.txt" -Append
Get-CimInstance -ComputerName <PVWA01> win32_processor | Measure-Object -Property LoadPercentage -Average | Out-File -FilePath "C:\PowerShell\CyberARk Services\output.txt" -Append
Get-CimInstance -ComputerName <PVWA01> -ClassName Win32_LogicalDisk | Select-Object -Property DeviceID,@{'Name' = 'FreeSpace (GB)'; Expression= { [int]($_.FreeSpace / 1GB) }} | Out-File -FilePath "C:\PowerShell\CyberARk Services\output.txt" -Append
Get-WmiObject -Class win32_operatingsystem -ComputerName <PVWA01> | ft @{Name="Total Visible Memory Size (GB)";e={[math]::truncate($_.TotalVisibleMemorySize /1MB)}}, @{Name="Free Physical Memory (GB)";e={[math]::truncate($_.FreePhysicalMemory /1MB)}} -AutoSize  | Out-File -FilePath "C:\PowerShell\CyberARk Services\output.txt" -Append

Add-Content "C:\PowerShell\CyberARk Services\output.txt" '<PVWA02>'
Get-Service -ComputerName <PVWA02> *Ark*, IISADMIN | Out-File -FilePath "C:\PowerShell\CyberARk Services\output.txt" -Append
Get-CimInstance -ComputerName <PVWA02> win32_processor | Measure-Object -Property LoadPercentage -Average | Out-File -FilePath "C:\PowerShell\CyberARk Services\output.txt" -Append
Get-CimInstance -ComputerName <PVWA02> -ClassName Win32_LogicalDisk | Select-Object -Property DeviceID,@{'Name' = 'FreeSpace (GB)'; Expression= { [int]($_.FreeSpace / 1GB) }} | Out-File -FilePath "C:\PowerShell\CyberARk Services\output.txt" -Append
Get-WmiObject -Class win32_operatingsystem -ComputerName <PVWA02> | ft @{Name="Total Visible Memory Size (GB)";e={[math]::truncate($_.TotalVisibleMemorySize /1MB)}}, @{Name="Free Physical Memory (GB)";e={[math]::truncate($_.FreePhysicalMemory /1MB)}} -AutoSize  | Out-File -FilePath "C:\PowerShell\CyberARk Services\output.txt" -Append

Add-Content "C:\PowerShell\CyberARk Services\output.txt" 'CMP'
Add-Content "C:\PowerShell\CyberARk Services\output.txt" '<CPM01>'
Get-Service -ComputerName <CPM01> -Name *Ark* | Out-File -FilePath "C:\PowerShell\CyberARk Services\output.txt" -Append
Get-CimInstance -ComputerName <CPM01> win32_processor | Measure-Object -Property LoadPercentage -Average | Out-File -FilePath "C:\PowerShell\CyberARk Services\output.txt" -Append
Get-CimInstance -ComputerName <CPM01> -ClassName Win32_LogicalDisk | Select-Object -Property DeviceID,@{'Name' = 'FreeSpace (GB)'; Expression= { [int]($_.FreeSpace / 1GB) }} | Out-File -FilePath "C:\PowerShell\CyberARk Services\output.txt" -Append
Get-WmiObject -Class win32_operatingsystem -ComputerName <CPM01> | ft @{Name="Total Visible Memory Size (GB)";e={[math]::truncate($_.TotalVisibleMemorySize /1MB)}}, @{Name="Free Physical Memory (GB)";e={[math]::truncate($_.FreePhysicalMemory /1MB)}} -AutoSize  | Out-File -FilePath "C:\PowerShell\CyberARk Services\output.txt" -Append
Get-Date| Out-File -FilePath "C:\PowerShell\CyberArk Services\outputpadr.txt"
Add-Content "C:\PowerShell\CyberArk Services\outputpadr.txt" 'PAReplicate.log'
Get-content -tail 70 "C:\Program Files (x86)\PrivateArk\Replicate\PAReplicate.log" | Out-File -FilePath "C:\PowerShell\CyberArk Services\outputPAReplicate.txt" -Append

Add-Content "C:\PowerShell\CyberARk Services\output.txt" '<CPM02>'
Get-Service -ComputerName <CPM02> -Name *Ark* | Out-File -FilePath "C:\PowerShell\CyberARk Services\output.txt" -Append
Get-CimInstance -ComputerName <CPM02> win32_processor | Measure-Object -Property LoadPercentage -Average | Out-File -FilePath "C:\PowerShell\CyberARk Services\output.txt" -Append
Get-CimInstance -ComputerName <CPM02> -ClassName Win32_LogicalDisk | Select-Object -Property DeviceID,@{'Name' = 'FreeSpace (GB)'; Expression= { [int]($_.FreeSpace / 1GB) }} | Out-File -FilePath "C:\PowerShell\CyberARk Services\output.txt" -Append
Get-WmiObject -Class win32_operatingsystem -ComputerName <CPM02> | ft @{Name="Total Visible Memory Size (GB)";e={[math]::truncate($_.TotalVisibleMemorySize /1MB)}}, @{Name="Free Physical Memory (GB)";e={[math]::truncate($_.FreePhysicalMemory /1MB)}} -AutoSize  | Out-File -FilePath "C:\PowerShell\CyberARk Services\output.txt" -Append

Add-Content "C:\PowerShell\CyberARk Services\output.txt" 'PSM'
Add-Content "C:\PowerShell\CyberARk Services\output.txt" '<PSM01>'
Get-Service -ComputerName <PSM01> -Name *Ark*  | Out-File -FilePath "C:\PowerShell\CyberARk Services\output.txt" -Append
Get-CimInstance -ComputerName <PSM01> win32_processor | Measure-Object -Property LoadPercentage -Average | Out-File -FilePath "C:\PowerShell\CyberARk Services\output.txt" -Append
Get-CimInstance -ComputerName <PSM01> -ClassName Win32_LogicalDisk | Select-Object -Property DeviceID,@{'Name' = 'FreeSpace (GB)'; Expression= { [int]($_.FreeSpace / 1GB) }} | Out-File -FilePath "C:\PowerShell\CyberARk Services\output.txt" -Append
Get-WmiObject -Class win32_operatingsystem -ComputerName <PSM01> | ft @{Name="Total Visible Memory Size (GB)";e={[math]::truncate($_.TotalVisibleMemorySize /1MB)}}, @{Name="Free Physical Memory (GB)";e={[math]::truncate($_.FreePhysicalMemory /1MB)}} -AutoSize  | Out-File -FilePath "C:\PowerShell\CyberARk Services\output.txt" -Append

Add-Content "C:\PowerShell\CyberARk Services\output.txt" '<PSM02>'
Get-Service -ComputerName <PSM02> -Name *Ark* | Out-File -FilePath "C:\PowerShell\CyberARk Services\output.txt" -Append
Get-CimInstance -ComputerName <PSM02> win32_processor | Measure-Object -Property LoadPercentage -Average | Out-File -FilePath "C:\PowerShell\CyberARk Services\output.txt" -Append
Get-CimInstance -ComputerName <PSM02> -ClassName Win32_LogicalDisk | Select-Object -Property DeviceID,@{'Name' = 'FreeSpace (GB)'; Expression= { [int]($_.FreeSpace / 1GB) }} | Out-File -FilePath "C:\PowerShell\CyberARk Services\output.txt" -Append
Get-WmiObject -Class win32_operatingsystem -ComputerName <PSM02> | ft @{Name="Total Visible Memory Size (GB)";e={[math]::truncate($_.TotalVisibleMemorySize /1MB)}}, @{Name="Free Physical Memory (GB)";e={[math]::truncate($_.FreePhysicalMemory /1MB)}} -AutoSize  | Out-File -FilePath "C:\PowerShell\CyberARk Services\output.txt" -Append

Add-Content "C:\PowerShell\CyberARk Services\output.txt" '<PSM03>'
Get-Service -ComputerName <PSM03> -Name *Ark* | Out-File -FilePath "C:\PowerShell\CyberARk Services\output.txt" -Append
Get-CimInstance -ComputerName <PSM03> win32_processor | Measure-Object -Property LoadPercentage -Average | Out-File -FilePath "C:\PowerShell\CyberARk Services\output.txt" -Append
Get-CimInstance -ComputerName <PSM03> -ClassName Win32_LogicalDisk | Select-Object -Property DeviceID,@{'Name' = 'FreeSpace (GB)'; Expression= { [int]($_.FreeSpace / 1GB) }} | Out-File -FilePath "C:\PowerShell\CyberARk Services\output.txt" -Append
Get-WmiObject -Class win32_operatingsystem -ComputerName <PSM03> | ft @{Name="Total Visible Memory Size (GB)";e={[math]::truncate($_.TotalVisibleMemorySize /1MB)}}, @{Name="Free Physical Memory (GB)";e={[math]::truncate($_.FreePhysicalMemory /1MB)}} -AutoSize  | Out-File -FilePath "C:\PowerShell\CyberARk Services\output.txt" -Append

Add-Content "C:\PowerShell\CyberARk Services\output.txt" '<PSM04>'
Get-Service -ComputerName <PSM04> -Name *Ark* | Out-File -FilePath "C:\PowerShell\CyberARk Services\output.txt" -Append
Get-CimInstance -ComputerName <PSM04> win32_processor | Measure-Object -Property LoadPercentage -Average | Out-File -FilePath "C:\PowerShell\CyberARk Services\output.txt" -Append
Get-CimInstance -ComputerName <PSM04> -ClassName Win32_LogicalDisk | Select-Object -Property DeviceID,@{'Name' = 'FreeSpace (GB)'; Expression= { [int]($_.FreeSpace / 1GB) }} | Out-File -FilePath "C:\PowerShell\CyberARk Services\output.txt" -Append
Get-WmiObject -Class win32_operatingsystem -ComputerName <PSM04> | ft @{Name="Total Visible Memory Size (GB)";e={[math]::truncate($_.TotalVisibleMemorySize /1MB)}}, @{Name="Free Physical Memory (GB)";e={[math]::truncate($_.FreePhysicalMemory /1MB)}} -AutoSize  | Out-File -FilePath "C:\PowerShell\CyberARk Services\output.txt" -Append
