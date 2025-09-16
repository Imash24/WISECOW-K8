#!/bin/bash

#  seeting Thresholds
CPU_THRESHOLD=80
MEM_THRESHOLD=80
DISK_THRESHOLD=80

# For the  system metrics
CPU_USAGE=$(top -bn1 | grep "Cpu(s)" | awk '{print 100 - $8}' | cut -d. -f1)
MEM_USAGE=$(free | grep Mem | awk '{print $3/$2 * 100.0}' | cut -d. -f1)
DISK_USAGE=$(df / | grep / | awk '{print $5}' | sed 's/%//')

echo "CPU: $CPU_USAGE% | MEM: $MEM_USAGE% | DISK: $DISK_USAGE%"

# Check thresholds
if [ "$CPU_USAGE" -gt "$CPU_THRESHOLD" ]; then
  echo "ALERT: CPU usage above $CPU_THRESHOLD% (Current: $CPU_USAGE%)"
fi

if [ "$MEM_USAGE" -gt "$MEM_THRESHOLD" ]; then
  echo "ALERT: Memory usage above $MEM_THRESHOLD% (Current: $MEM_USAGE%)"
fi

if [ "$DISK_USAGE" -gt "$DISK_THRESHOLD" ]; then
  echo "ALERT: Disk usage above $DISK_THRESHOLD% (Current: $DISK_USAGE%)"
fi
