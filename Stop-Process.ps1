# Get the process ID
process_id = Event.ProcessId

<# Stop the process
System.stopProcess(process_id)
#>

# Stop the process with PowerShell
Stop-Process -Id $processId -Force
