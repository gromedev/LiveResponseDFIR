# IP address you want to block
hostile_ip = Event.SourceAddress

# Block IP address
Network.blockIp(hostile_ip)
