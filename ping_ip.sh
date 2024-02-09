#!/bin/bash

# Get the IP address, interval, and log file from the command line
ip_address=$1
interval=$2
log_file=$3

# A function to ping an IP address and log the result
# Arguments:
#   $1: IP address to ping
#   $2: Log file to write the result to
ping_ip() {
    local ip=$1  # IP address to ping
    local log=$2  # Log file to write the result to
    
    # Check if the ping is successful
    if ping -c 1 $ip >/dev/null 2>&1; then
        # If successful, write an informational message to the log file
        echo "$(date '+%Y-%m-%d %H:%M:%S') $(hostname) ping_monitor[$$]: INFO Ping successful to $ip" >> $log
    else
        # If failed, write an error message to the log file
        echo "$(date '+%Y-%m-%d %H:%M:%S') $(hostname) ping_monitor[$$]: ERROR Ping failed to $ip" >> $log
    fi
}

# Continuously ping the IP address at passed interval.
while true
do
    ping_ip $ip_address $log_file
    sleep $interval
done