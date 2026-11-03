#!/bin/bash

LOG_DIR="/home/admin2/cloudnova/backups"
LOG_FILE="$LOG_DIR/health.log"

mkdir -p "$LOG_DIR"

echo "===== Health Check $(date) =====" >> "$LOG_FILE"

if sudo docker ps --format '{{.Names}}' | grep -q "cloudnova-wordpress"; then
    echo "WordPress container: RUNNING" >> "$LOG_FILE"
else
    echo "WordPress container: NOT RUNNING" >> "$LOG_FILE"
fi

if sudo docker ps --format '{{.Names}}' | grep -q "cloudnova-db"; then
    echo "MariaDB container: RUNNING" >> "$LOG_FILE"
else
    echo "MariaDB container: NOT RUNNING" >> "$LOG_FILE"
fi

echo "Disk usage:" >> "$LOG_FILE"
df -h / >> "$LOG_FILE"

echo "" >> "$LOG_FILE"

# Keep the health log from growing too large
if [ -f "$LOG_FILE" ] && [ "$(wc -c < "$LOG_FILE")" -gt 1048576 ]; then
    mv "$LOG_FILE" "$LOG_FILE.old"
    touch "$LOG_FILE"
fi
