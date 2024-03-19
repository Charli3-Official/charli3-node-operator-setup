# Charli3 Node Operator Backend Setup

## Getting Started

Welcome to the comprehensive setup guide for your Charli3 node operator backend. This guide will walk you through the steps required to get your node up and running, ensuring you meet all necessary requirements and configurations.

### Prerequisites

Before you begin, ensure that you meet the following prerequisites:

- **Server Requirements:**
  - A modern, multi-core CPU
  - At least 8GB of RAM
  - A minimum of 50GB of available storage (SSD preferred for better performance)
  - A stable and reliable internet connection

- **Software Requirements:**
  - Docker and Docker Compose installed on your server
  - Git for cloning the repository

### Installation & Setup Steps

1. **Clone the Repository**

   Start by cloning the Charli3 node operator setup repository to your local machine. Open a terminal and run:

   ```bash
   git clone https://github.com/Charli3-Official/charli3-node-operator-setup.git
   ```

2. **Access to Node-Operator-Backend Docker Image**

   Ensure you have access to the node-operator-backend Docker image. This setup requires a connection with Ogmios and a running Cardano node on your local server.

3. **Mnemonic and Public Key Hash Setup**

   Prepare your node's mnemonic and its public key hash. It's crucial to coordinate with the Charli3 team to have your node's public key hash configured with the oracle feed you intend to operate.

4. **Oracle Feed Configuration Files**

   Each configuration YAML file contains the node configuration for that specific oracle feed running on the Cardano mainnet. For example, ada_usd_v3_config.yml contains the ADA-USD mainnet feed details, including data sources, oracle feed, and blockchain configuration. Ensure you review and adjust these files as necessary for the oracle feeds you intend to run.

5. **Configuration File Setup**

   You'll need to set up the configuration yaml file(s) with the following details:
   - The mnemonic
   - Ogmios URL
   - Blockfrost project ID (optional, if needed)

6. **Running Your Node**

   Ensure your node wallet is funded with sufficient ADA for operations. With the configuration set, start your node:

   ```bash
   docker-compose up -d
   ```

   If there are services in the Docker configuration you do not wish to run or are not authorized to operate, make sure to comment them out in the `docker-compose.yml` file.

## Post-Setup

After successfully starting your node, monitor its logs and performance to ensure it's running smoothly. Regularly check for any updates from the Charli3 team regarding node operation and maintenance.

## Troubleshooting

If you encounter any issues during the setup, consult the official Charli3 documentation or reach out to the support team for assistance. Common issues may involve configuration errors, network connectivity, or Docker-specific problems.

## Conclusion

Congratulations! Your Charli3 node operator backend should now be fully operational. By following this guide, you've taken an important step in supporting the Charli3 ecosystem. Thank you for your contribution.

For updates, further assistance, or to engage with the community, visit the official Charli3 channels.
