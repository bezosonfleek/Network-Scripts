#Allow running of scripts if not enabled: Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser   

# Define source and destination paths
$Source = @("C:\Shares", "C:\Common-Wall", "C:\IT-SecretVault") 
$Destination = "E:\Backups\Documents_$(Get-Date -Format 'yyyyMMdd')"

# Create backup directory if it doesn't exist
if (-not (Test-Path -Path $Destination)) {
    New-Item -ItemType Directory -Path $Destination -Force
}

# Copy files recursively with overwrite
Copy-Item -Path "$Source\*" -Destination $Destination -Recurse -Force

Write-Output "Backup completed to: $Destination"

# List of servers to ping
$Servers = @("google.com", "cloudflare.com", "github.com")

# Ping each server and report status
foreach ($Server in $Servers) {
    $PingResult = Test-Connection -ComputerName $Server -Count 1 -Quiet
    if ($PingResult) {
        Write-Output "$Server is reachable."
    } else {
        Write-Output "$Server is not reachable."
    }
}   
#next step - make the script run regularly (time)
#next - compress file after a certain period of time
#next add relevant fixes - fallback/error if the disk does not exist
