# Mission 10 - Enterprise Cloud Infrastructure

## Project Overview

This project demonstrates an enterprise-style cloud infrastructure using Ubuntu Server, Docker, Docker Compose, WordPress, MariaDB, UFW firewall, automated backups, health monitoring, and Cron scheduling.

## Infrastructure Components

- Ubuntu Server 26.04.1 LTS
- Docker Engine
- Docker Compose
- WordPress
- MariaDB
- UFW Firewall
- Bash Automation Scripts
- Cron Scheduler

## Application

The application uses two linked Docker containers:

1. WordPress - Web application
2. MariaDB - Database server

The MariaDB database uses a persistent Docker volume to prevent data loss when the container is restarted.

## Security

UFW is configured with a default deny incoming policy. Only the required ports are allowed:

- SSH: TCP 22
- HTTP: TCP 80

## Automation

The system includes:

- Automated MariaDB/WordPress database backup
- Container health checking
- Health log monitoring
- Log rotation
- Daily Cron scheduling

## Project Structure

```text
mission10-enterprise-cloud/
├── README.md
├── docker-compose.yml
├── scripts/
│   ├── backup.sh
│   └── health_check.sh
├── docs/
├── diagrams/
└── screenshots/
