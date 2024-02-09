#!/bin/bash

# Get configurations
source /etc/ping_monitor.conf  

# Get IP addresses and intervals
IFS=' ' read -ra IP_ARRAY <<< "$IP_ADDRESSES"
IFS=' ' read -ra INTERVAL_ARRAY <<< "$INTERVALS"

# Loop through each IP address and interval
for i in "${!IP_ARRAY[@]}"; do
  IP_ADDRESS=${IP_ARRAY[i]}
  INTERVAL=${INTERVAL_ARRAY[i]}

  # Run ping_ip.sh in the background with the given IP address and interval
  sudo ./ping_ip.sh "$IP_ADDRESS" "$INTERVAL" "$LOG_FILE" &
done

# Wait for all background processes to finish
wait
