#!/bin/bash

# Turn off ratio limit
sed -i 's/"ratio-limit-enabled": true,/"ratio-limit-enabled": false,/' /etc/transmission-daemon/settings.json

# Start Transmission
ADMIN_PASS='password' /run_transmission.sh &
sleep 5

# Start the demo script
python app.py
