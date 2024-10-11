# Define the output file path
$outputFile = "C:\PowerShell\CyberArk Services\output.txt"
$outputDir = Split-Path $outputFile -Parent
if (!(Test-Path $outputDir)) {
    New-Item -ItemType Directory -Path $outputDir
}

# Clear the output file
Clear-Content -Path $outputFile

# Get the current date and time
Get-Date | Out-File -FilePath $outputFile

# Add CyberArk Services information
Add-Content -Path $outputFile -Value 'CyberArk Services'
Get-Service *Ark* | Out-File -FilePath $outputFile -Append

# Add CPU LoadPercentage
Add-Content -Path $outputFile -Value 'CPU LoadPercentage'
Get-CimInstance win32_processor | Measure-Object -Property LoadPercentage -Average | Out-File -FilePath $outputFile -Append

# Add Disk Free Space
Add-Content -Path $outputFile -Value 'Disk Free Space'
Get-CimInstance -ClassName Win32_LogicalDisk | Select-Object -Property DeviceID, @{Name = 'FreeSpace (GB)'; Expression = { [int]($_.FreeSpace / 1GB) }} | Out-File -FilePath $outputFile -Append

# Add RAM information (using Get-CimInstance)
Add-Content -Path $outputFile -Value 'RAM'
Get-CimInstance -ClassName Win32_OperatingSystem | 
Select-Object -Property @{Name="Total Visible Memory Size (GB)";e={[math]::truncate($_.TotalVisibleMemorySize /1MB)}}, @{Name="Free Physical Memory (GB)";e={[math]::truncate($_.FreePhysicalMemory /1MB)}} | 
Out-File -FilePath $outputFile -Append

# Add italog.log content to the output file
Add-Content -Path $outputFile -Value 'italog.log'
Get-content -Tail 10 "C:\Program Files (x86)\PrivateArk\Server\Logs\italog.log" | Out-File -FilePath $outputFile -Append
