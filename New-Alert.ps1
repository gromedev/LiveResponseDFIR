<#
# Get details about the event
event_details = "An event of type '{}' was detected at path '{}'" .format(Event.Type, Event.FilePath)

# Generate an alert
Alert.generate(event_details)
#>


## PowerShell equivalent

# Get details about the event
$eventDetails = "An event of type '{0}' was detected at path '{1}'" -f $Event.Type, $Event.FilePath

# Generate an alert
New-DefenderAlert -Title "Malicious Activity Detected" -Description $eventDetails
