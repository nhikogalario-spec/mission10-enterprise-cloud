#!/bin/bash

BACKUP_DIR="/home/admin2/cloudnova/backups"
DATE=$(date +"%Y-%m-%d_%H-%M-%S")

mkdir -p "$BACKUP_DIR"

sudo docker exec cloudnova-db mariadb-dump \
  -u root \
  -proot_password_123 \
  wordpress > "$BACKUP_DIR/wordpress_$DATE.sql"

echo "Backup completed: $BACKUP_DIR/wordpress_$DATE.sql"
