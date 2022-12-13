<#
Identify and remove all malicious files that have been dropped by a specific process:
#>

# Get the process ID
$processId = $Event.ProcessId

# Get a list of all files that have been dropped by the process
$droppedFiles = Get-ProcessFileInfo -ProcessId $processId | Where-Object {$_.FileType -eq "Create" -and $_.Path -notlike "C:\Windows\*"} | Select-Object -ExpandProperty Path

# Remove all of the dropped files
Remove-Item $droppedFiles -Force
