#!/usr/bin/env bash

# Define arrays of hostnames/IP addresses for wake-up and shutdown
# For waking up, if you're using different interfaces or MAC addresses, adjust accordingly
declare -a wakeUpMacs=("08:62:66:4E:1F:A3" "08:62:66:4E:1f:67" "08:62:66:4E:1D:CC" "08:62:66:4C:DF:B7")
declare -a shutDownHosts=("slave1@192.168.0.12" "slave2@192.168.0.13"  "slave3@192.168.0.14" "slave4@192.168.0.15")

if [ "$1" = "-on" ]; then
    # Wake-up commands
    for mac in "${wakeUpMacs[@]}"; do
        sudo etherwake -i enp3s0 "$mac"
    done
elif [ "$1" = "-off" ]; then
    # Shutdown commands
    for host in "${shutDownHosts[@]}"; do
        ssh "$host" 'sudo shutdown now'
    done
else
    echo "Usage: $0 -on | -off"
fi


