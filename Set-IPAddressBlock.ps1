# Get the IP address
$ipAddress = $Event.SourceAddress

# Block the IP address
New-NetFirewallRule -DisplayName "Block Malicious IP" -Direction Inbound -Action Block -RemoteAddress $ipAddress
