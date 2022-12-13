<#
.AUTHOR
  thomas@grome.dev
 
.SYNOPSIS
  Creates a log file containg  x Number of the latest event viewer events.
#>

$maxEvents = 1000

if (!(Test-Path "C:\Temp\" -ErrorAction SilentlyContinue)) {
    New-Item "C:\Temp\" -ItemType Directory
}

if (!(Test-Path "C:\Temp\EventLog.txt" -ErrorAction SilentlyContinue)) {
    New-Item "C:\Temp\EventLog.txt"
}

# Create the log file
$logFile = "C:\Temp\EventLog.txt"

# Clear the contents of the log file
Clear-Content $logFile

# Get all of the events from the Windows Event Viewer
$events = Get-EventLog -LogName System -Newest $maxEvents

# Loop through each event and append it to the log file
foreach ($event in $events) {
    $eventString = "{0} {1} {2}" -f $event.TimeGenerated, $event.EntryType, $event.Message
    Add-Content $logFile $eventString
}
