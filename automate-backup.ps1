$TaskName = "DailyDataBackup"
$Action = New-ScheduledTaskAction -Execute "PowerShell.exe" -Argument "-NoProfile -WindowStyle Hidden -File 'C:\Users\Administrator\Desktop\py\Powershell\backup.ps1'"
$Trigger = New-ScheduledTaskTrigger -Daily -At 10:00pm
$Settings = New-ScheduledTaskSettingsSet -AllowStartIfOnBatteries -DontStopIfGoingOnBatteries -StartWhenAvailable

if (-not (Get-ScheduledTask -TaskName $TaskName -ErrorAction SilentlyContinue)) {
    Register-ScheduledTask -Action $Action -Trigger $Trigger -TaskName $TaskName -Settings $Settings -Description "Daily backup of shares and vaults"
    Write-Output "Task scheduled successfully for 10 PM daily."
}

# confirm in the task scheduler app
# or using command: Get-ScheduledTask -TaskName "DailyDataBackup" | Get-ScheduledTaskInfo
# add error messages
