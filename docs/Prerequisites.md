# Charli3 Node Operator Backend Setup - Prerequisites Document

## Introduction
This document details the prerequisites required for setting up the Charli3 node operator backend, ensuring all necessary conditions and configurations are in place before initiating the setup process.

## Server Requirements
Ensure your server meets the following specifications before beginning the setup:
- **CPU:** Modern, multi-core CPU to efficiently handle computational tasks.
- **Memory:** Minimum of 8GB RAM to support smooth operation.
- **Storage:** At least 50GB of available storage, with SSD recommended for faster data access.
- **Internet Connection:** A stable and reliable internet connection for consistent network connectivity.

## Software Requirements
Required software installations on your server include:
- **Docker:** For managing and deploying containerized services.
- **Docker Compose:** For running multi-container Docker applications.
- **Git:** Necessary for cloning the repository from GitHub.

## Installation & Setup Steps
1. **Clone the Repository:** Start by cloning the Charli3 node operator setup repository:
   ```bash
   git clone https://github.com/Charli3-Official/charli3-node-operator-setup.git
   ```
2. **Repository Access:** Ensure you have read access to the Charli3 node operator setup repository and read-only access to the artifact repository on GCP hosting the Docker image.

## Cardano Node, Ogmios, and Kupo Requirements
To successfully integrate and operate your node with the Cardano blockchain and oracle services, the following components are necessary:
- **Cardano Node:** A fully synced Cardano node is required for direct interaction with the blockchain.
- **Ogmios:** A Haskell implementation of the Ouroboros network protocol that provides a JSON-RPC interface over WebSocket. Required for real-time data exchange between your node and the Cardano blockchain.
- **Kupo:** Necessary for handling encrypted data transmissions within the oracle network. Ensure it is correctly configured and integrated.

## Mnemonic and Public Key Hash Setup
Securely prepare your node’s mnemonic (24 words) and public key hash. It’s critical to coordinate with the Charli3 team for proper configuration.

## Configuration File Setup
Configure the necessary YAML files with:
- **Mnemonic:** Securely inputted.
- **Ogmios URL:** Specified URL connection.
- **Blockfrost Project ID:** If needed for blockchain interactions.

## Running Your Node
- **Startup Command:** Initiate your node with:
  ```bash
  docker-compose up -d
  ```
- **Service Management:** Adjust the `docker-compose.yml` file as necessary to manage service deployment.

## Post-Setup
- **Monitoring:** Continuously monitor logs and performance to ensure optimal operation.
- **Updates:** Stay updated with information from the Charli3 team regarding node operation and maintenance.

## Troubleshooting
Refer to the Charli3 documentation or contact support for issues related to configuration, network connectivity, or Docker-specific problems.

## Conclusion
Meeting these prerequisites and following the outlined steps will ensure your Charli3 node operator backend is operational, contributing effectively to the ecosystem. Visit the official Charli3 channels for updates and community engagement.