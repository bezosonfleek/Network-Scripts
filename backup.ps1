# Example: Backup Files and Check Network Connectivity # Author: System Administrator # Date: 2026-03-12

#Allow running of scripts if not enabled: Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser   

# Define source and destination paths
$Source = "C:\Shares"
$Destination = "E:\Backups\Documents_$(Get-Date -Format 'yyyyMMdd')"

# Create backup directory if it doesn't exist
if (-not (Test-Path -Path $Destination)) {
    New-Item -ItemType Directory -Path $Destination -Force
}

# Copy files recursively with overwrite
Copy-Item -Path "$Source\*" -Destination $Destination -Recurse -Force

Write-Output "Backup completed to: $Destination"

# List of servers to ping
$Servers = @("google.com", "microsoft.com", "github.com")

# Ping each server and report status
foreach ($Server in $Servers) {
    $PingResult = Test-Connection -ComputerName $Server -Count 1 -Quiet
    if ($PingResult) {
        Write-Output "$Server is reachable."
    } else {
        Write-Output "$Server is not reachable."
    }
}   

#next step - run it regularly