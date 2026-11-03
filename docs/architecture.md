# Enterprise Cloud Architecture

## Overview

The CloudNova Enterprise Cloud infrastructure uses an Ubuntu Server virtual machine hosted in VirtualBox. Docker runs on the Ubuntu Server and manages the application containers.

## Architecture Flow

```text
Windows Host
     |
     | VirtualBox
     v
Ubuntu Server
192.168.1.11
     |
     | Docker
     |
     +-----------------------+
     |                       |
     v                       v
WordPress Container      MariaDB Container
Port 80                  Database
     |                       |
     +-----------+-----------+
                 |
          Docker Network
                 |
          Persistent Volumes
