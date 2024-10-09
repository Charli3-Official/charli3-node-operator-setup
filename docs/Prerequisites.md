# Prerequisites for Charli3 Node Operator Backend

Before setting up your Charli3 node operator backend, ensure that you have met all the following prerequisites. This will ensure a smooth setup process and optimal operation of your node.

## 1. Hardware Requirements

### Cardano Infrastructure Server:
- CPU: 4 cores or more
- RAM: 32 GB or more
- Storage: 500 GB SSD or more
- Network: 100 Mbps up/down or faster, stable connection

### Charli3 Node Server:
- CPU: 2 cores or more
- RAM: 8 GB or more
- Storage: 50 GB SSD or more
- Network: 50 Mbps up/down or faster, stable connection

For detailed information, refer to the [System Requirements](system-requirements.md) document.

## 2. Software Requirements

- Operating System: Ubuntu 20.04 LTS or later (64-bit)
- Docker: Version 20.10 or later
- Docker Compose: Version 1.29 or later
- Git: Version 2.25 or later

## 3. Network Requirements

- Open outbound port 3001 for connecting to the Cardano network
- For the two-server setup, open inbound ports on the Cardano Infrastructure Server:
  - Port 1337 for Ogmios
  - Port 1442 for Kupo
- Ensure the Charli3 Node Server can access the Cardano Infrastructure Server

## 4. Cardano Node Setup

- A fully synced Cardano node
- Ogmios installed and configured
- Kupo installed and configured

For detailed setup instructions, refer to the [Cardano Infrastructure Setup Guide](https://github.com/Charli3-Official/cardano-node-setup).

## 5. Wallet Requirements

- A Cardano wallet with sufficient ADA for operation (minimum recommended: 50 ADA)
- The wallet's 24-word mnemonic phrase (keep this secure and never share it)

## 6. Oracle Feed Approval

- Approval from the Charli3 team to operate specific oracle feeds
- Your node's public key hash registered with Charli3 for the approved feeds

## 7. Knowledge Prerequisites

- Basic understanding of Linux command line operations
- Familiarity with Docker and container concepts
- Basic knowledge of blockchain and oracle concepts

## 8. Access Requirements

- SSH access to your servers
- GitHub account with access to the Charli3 repositories

## 9. Time Commitment

- Initial setup: 2-4 hours
- Ongoing maintenance: 1-2 hours per week

## 10. Backup and Recovery Plan

- Strategy for backing up critical data and configuration files
- Plan for quickly restoring service in case of hardware failure

## Conclusion

Ensuring you meet all these prerequisites will set you up for success in operating your Charli3 node. If you're unsure about any of these requirements or need assistance, please reach out to the Charli3 support team before proceeding with the installation.

Next Steps:
- Review the [Installation Guide](installation-guide.md)
- Familiarize yourself with the [Configuration Guide](configuration.md)
- Understand the [Architecture Overview](architecture-overview.md)

Remember, running a Charli3 node is a responsibility that contributes to the decentralization and reliability of the Charli3 oracle network. Your preparation and attention to detail will help ensure the integrity of the entire system.
