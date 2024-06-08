#!/bin/bash

# Replace 'server_ip' with the IP address of your home server
server_ip="rsl-server.duckdns.org"

# Ping the server
if ping -c 1 "$server_ip" &> /dev/null; then
    # Server is online
    notify-send --urgency=critical "Fedora Server (RSL)" "Status: ONLINE"
else
    # Server is offline
    notify-send --urgency=critical "Fedora Server (RSL)" "Status: OFFLINE"
fi

