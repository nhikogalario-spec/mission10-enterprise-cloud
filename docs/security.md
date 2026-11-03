# Security Configuration

## Firewall

UFW is enabled on the Ubuntu Server.

Default policies:

- Incoming connections: DENY
- Outgoing connections: ALLOW

Allowed ports:

- TCP 22 - SSH
- TCP 80 - HTTP

## Docker Security

The application is separated into two containers:

- WordPress
- MariaDB

MariaDB is not directly exposed to the host. It communicates with WordPress through the Docker network.

## Persistent Storage

Database data is stored in the Docker volume `db_data`.

WordPress data is stored in the Docker volume `wordpress_data`.

## Backup

A Bash script creates regular MariaDB database backups.

Cron automatically runs the backup every day at 2:00 AM.

## Recommendations

For a production deployment, the following improvements should be implemented:

- Use strong unique passwords.
- Store secrets securely instead of directly in configuration files.
- Use HTTPS/TLS.
- Keep Ubuntu and Docker updated.
- Restrict SSH access to trusted networks.
- Monitor system logs and container logs.
- Store backups on a separate server or cloud storage.
