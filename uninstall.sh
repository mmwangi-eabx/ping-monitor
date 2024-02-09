#!/bin/bash

# Stop and disable the systemd service
sudo systemctl stop ping_monitor.service
sudo systemctl disable ping_monitor.service

# Remove the systemd service file
sudo rm /etc/systemd/system/ping_monitor.service

# Remove scripts
sudo rm /usr/local/bin/ping_monitor.sh
sudo rm /usr/local/bin/ping_ip.sh

# Remove the configuration file
sudo rm /etc/ping_monitor.conf

# Remove the log file and its directory
sudo rm /var/log/ping_monitor/ping_monitor.log
sudo rmdir /var/log/ping_monitor

# Reload the systemd daemon
sudo systemctl daemon-reload
