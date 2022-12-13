<#
# IP address you want to block
hostile_ip = Event.SourceAddress

# Block IP address
Network.blockIp(hostile_ip)
#>

#PowerShell equivalent 
# Get the IP address
$ipAddress = $Event.SourceAddress

# Block the IP address
New-NetFirewallRule -DisplayName "Block Malicious IP" -Direction Inbound -Action Block -RemoteAddress $ipAddress
