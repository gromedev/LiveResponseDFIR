# Get details about the event
event_details = "An event of type '{}' was detected at path '{}'" .format(Event.Type, Event.FilePath)

# Generate an alert
Alert.generate(event_details)
