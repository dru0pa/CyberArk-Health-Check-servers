# Define the output file path
$outputFile = "C:\PowerShell\CyberARk Services\output.txt"

# Define an array of server objects
$servers = @(
    @{
        Name = 'PVWA'
        Computers = @(
            'PVWA-01' # Updated computer name
 #           '<PVWA02>'
        )
        ServiceNamePattern = '*Ark*', 'IISADMIN'
    },
    @{
        Name = 'CPM'
        Computers = @(
            'CPM-01' # Updated computer name
 #           '<CPM02>' # Updated computer name
        )
        ServiceNamePattern = '*Ark*'
    },
    @{
        Name = 'PSM'
        Computers = @(
            'PSM-01' # Updated computer name
 #           '<PSM02>' # Updated computer name
 #           '<PSM03>' # Updated computer name
 #           '<PSM04>' # Updated computer name
        )
        ServiceNamePattern = '*Ark*'
    }
)

# Clear the output file
Clear-Content -Path $outputFile

# Get the current date and time
Get-Date | Out-File -FilePath $outputFile

# Loop through each server object
foreach ($server in $servers) {
    Add-Content -Path $outputFile -Value $server.Name

    # Loop through each computer in the server object
    foreach ($computer in $server.Computers) {
        Add-Content -Path $outputFile -Value $computer
        Add-Content -Path $outputFile -Value 'CyberArk Services'
        Get-Service -ComputerName $computer -Name $server.ServiceNamePattern | Out-File -FilePath $outputFile -Append
        Add-Content -Path $outputFile -Value 'CPU LoadPercentage'
        Get-CimInstance -ComputerName $computer Win32_Processor | Measure-Object -Property LoadPercentage -Average | Out-File -FilePath $outputFile -Append
        Add-Content -Path $outputFile -Value 'Disk Free Space'
        Get-CimInstance -ComputerName $computer -ClassName Win32_LogicalDisk | Select-Object -Property DeviceID, @{Name = 'FreeSpace (GB)'; Expression = { [int]($_.FreeSpace / 1GB) }} | Out-File -FilePath $outputFile -Append
        Add-Content -Path $outputFile -Value 'RAM'

        # Use Get-CimInstance for RAM information
        Get-CimInstance -ClassName Win32_OperatingSystem -ComputerName $computer | 
        Select-Object -Property @{Name="Total Visible Memory Size (GB)";e={[math]::truncate($_.TotalVisibleMemorySize /1MB)}}, @{Name="Free Physical Memory (GB)";e={[math]::truncate($_.FreePhysicalMemory /1MB)}} | 
        Out-File -FilePath $outputFile -Append

    }
}

# Add PAReplicate.log content to the output file
# Edit the 70 to make sure the log will show the start of the last backup
Add-Content -Path $outputFile -Value 'PAReplicate.log'
Get-Content -Tail 70 "C:\Program Files (x86)\PrivateArk\Replicate\PAReplicate.log" | Out-File -FilePath $outputFile -Append
