<#
.AUTHOR
  thomas@grome.dev
 
.SYNOPSIS
  Creates a log file that takes the newest 1000 event viewer events and uploads them to a private GitHub repo.
  Be sure to modify the script for your GitHub repo.
#>

# Create the log file
$logFile = "C:\Temp\EventLog.txt"

# Clear the contents of the log file
Clear-Content $logFile

# Get all of the events from the Windows Event Viewer
$events = Get-EventLog -LogName System -Newest 1000

# Loop through each event and append it to the log file
foreach ($event in $events) {
    $eventString = "{0} {1} {2}" -f $event.TimeGenerated, $event.EntryType, $event.Message
    Add-Content $logFile $eventString
}

# Set the GitHub API URL and authentication token
$apiUrl = "https://api.github.com/repos/<username>/<repo>/contents/<path>"
$authToken = "<personal access token>"

# Create the request body with the log file contents and commit message
$requestBody = @{
    message = "Uploaded event log file"
    content = [System.Convert]::ToBase64String([System.IO.File]::ReadAllBytes($logFile))
} | ConvertTo-Json

# Create the request headers with the authentication token
$requestHeaders = @{
    Authorization = "Bearer $authToken"
    "Content-Type" = "application/json"
}

# Send the API request to upload the log file
$response = Invoke-RestMethod -Method Put -Uri $apiUrl -Body $requestBody -Headers $requestHeaders
