#!/bin/bash

# Setup configuration
# Create configuration file
sudo cp ping_monitor.conf /etc/

# Setup logging
# Create log directory and file
sudo mkdir -p /var/log/ping_monitor
sudo touch /var/log/ping_monitor/ping_monitor.log

# Provide permissions
sudo chmod u=rwx,go=rx /var/log/ping_monitor
sudo chmod u=rw,go=r /var/log/ping_monitor/ping_monitor.log

# Setup program
# Create script
sudo cp ping_monitor.sh /usr/local/bin/

# Change ownership to root
sudo chown root:root /usr/local/bin/ping_monitor.sh

# Set permissions to make it executable
sudo chmod 755 /usr/local/bin/ping_monitor.sh

# Setup auto start
# Create service
sudo cp ping_monitor.service /etc/systemd/system/

# Start service
sudo systemctl enable ping_monitor.service
sudo systemctl start ping_monitor.service
