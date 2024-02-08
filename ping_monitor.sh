#!/bin/bash

# Get configurations.
source /etc/ping_monitor.conf

# Log file path.
log_file="/var/log/ping_monitor/ping_monitor.log"

ping_ip() {
    ip=$1 
    log=$2
    
    if ping -c 1 $ip >/dev/null 2>&1; then
        echo "$(date '+%Y-%m-%d %H:%M:%S') $(hostname) ping_monitor[$$]: INFO Ping successful to $ip" >> $log
    else
        echo "$(date '+%Y-%m-%d %H:%M:%S') $(hostname) ping_monitor[$$]: ERROR Ping failed to $ip" >> $log
    fi
}

while true
do
    ping_ip $IP_ADDRESS $LOG_FILE
    sleep $INTERVAL
done