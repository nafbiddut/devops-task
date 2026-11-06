#!/bin/bash
# Logs CPU, memory and disk usage to health_log.txt

LOG_FILE="health_log.txt"

timestamp=$(date '+%Y-%m-%d %H:%M:%S')
cpu=$(top -bn1 | awk '/Cpu\(s\)/ {printf "%d", 100 - $8}')
mem=$(free | awk '/^Mem:/ {printf "%d", $3/$2*100}')
disk=$(df / | awk 'NR==2 {gsub("%",""); print $5}')

echo "$timestamp | CPU: ${cpu}% | MEM: ${mem}% | DISK: ${disk}%" >> "$LOG_FILE"

if [ "$disk" -gt 80 ]; then
    echo "[WARNING] Disk space high!"
fi