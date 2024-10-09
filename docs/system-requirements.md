# System Requirements for Charli3 Node Operator

This document outlines the minimum and recommended system requirements for running a Charli3 node operator backend. We recommend a two-server setup for optimal performance, security, and maintainability.

## Two-Server Setup

### 1. Cardano Infrastructure Server

This server is dedicated to running the Cardano node, Ogmios, and Kupo.

#### Minimum Requirements:
- **CPU:** 4 cores
- **RAM:** 24 GB
- **Storage:** 300 GB SSD
- **Network:** 50 Mbps up/down, stable connection

#### Recommended Requirements:
- **CPU:** 6 cores or more
- **RAM:** 32 GB or more
- **Storage:** 500 GB SSD or more
- **Network:** 100 Mbps up/down or faster, stable connection

### 2. Charli3 Node Server

This server hosts the Charli3 node operator backend.

#### Minimum Requirements:
- **CPU:** 2 cores
- **RAM:** 4 GB
- **Storage:** 20 GB SSD
- **Network:** 10 Mbps up/down, stable connection

#### Recommended Requirements:
- **CPU:** 2 cores or more
- **RAM:** 8 GB or more
- **Storage:** 50 GB SSD or more
- **Network:** 50 Mbps up/down or faster, stable connection

## Single-Server Setup

If you're running all components on a single server, combine the requirements:

#### Minimum Requirements:
- **CPU:** 6 cores
- **RAM:** 20 GB
- **Storage:** 270 GB SSD
- **Network:** 50 Mbps up/down, stable connection

#### Recommended Requirements:
- **CPU:** 12 cores or more
- **RAM:** 40 GB or more
- **Storage:** 550 GB SSD or more
- **Network:** 100 Mbps up/down or faster, stable connection

## Software Requirements

- **Operating System:** Ubuntu 20.04 LTS or later (64-bit)
- **Docker:** Version 20.10 or later
- **Docker Compose:** Version 1.29 or later
- **Git:** Version 2.25 or later

## Network Requirements

- Open outbound port 3001 for connecting to the Cardano network
- For the two-server setup, open inbound ports on the Cardano Infrastructure Server:
  - Port 1337 for Ogmios
  - Port 1442 for Kupo
- Ensure the Charli3 Node Server can access the Cardano Infrastructure Server

## Notes

1. SSD storage is strongly recommended for both servers to ensure optimal performance.
2. Requirements may change as the Cardano network and Charli3 protocol evolve. Always refer to the latest documentation.
3. Regularly monitor your system resources and scale up if needed to maintain performance.
4. Ensure you have a plan for system redundancy and data backups to minimize downtime.

For any questions or concerns about system requirements, please contact the Charli3 support team.