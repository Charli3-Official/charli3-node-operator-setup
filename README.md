# Charli3 Node Operator Backend Setup

## Getting Started

Welcome to the comprehensive setup guide for your Charli3 node operator backend. This guide will walk you through the steps required to get your node up and running, ensuring you meet all necessary requirements and configurations.

### System Architecture Overview

For optimal performance, security, and maintainability, we recommend a two-server setup:

1. **Cardano Infrastructure Server:** Dedicated to running the Cardano node, Ogmios, and Kupo.
2. **Charli3 Node Server:** Hosting the Charli3 node operator backend.

This separation allows for better resource allocation, easier maintenance, and enhanced security. However, if resources are limited, running all components on a single, sufficiently powerful server is possible.

### Prerequisites

Before you begin, ensure that you meet the following prerequisites:

- **Server Requirements:**
  For the recommended two-server setup:
  
  Cardano Infrastructure Server:
  - A modern, multi-core CPU (recommended: 8 cores or more)
  - At least 32GB of RAM
  - A minimum of 500GB of available storage (SSD required)
  - A stable and reliable internet connection with at least 100 Mbps up/down

  Charli3 Node Server:
  - A modern, multi-core CPU (recommended: 2 cores or more)
  - At least 8GB of RAM
  - A minimum of 50GB of available storage (SSD required)
  - A stable and reliable internet connection with at least 10 Mbps up/down

  If using a single server for all components, combine the above requirements.

- **Software Requirements:**
  - Docker (version 20.10 or later) and Docker Compose (version 1.29 or later) installed on both servers
  - Git (version 2.25 or later) for cloning the repository

- **Network Requirements:**
  - Open outbound ports for connecting to the Cardano network (default: 3001)
  - Open inbound ports on the Cardano Infrastructure Server for Ogmios (1337) and Kupo (1442)
  - Ensure the Charli3 Node Server can access the Cardano Infrastructure Server

### Installation & Setup Steps

1. **Set Up Cardano Infrastructure Server**
   To set up your Cardano node, Ogmios, and Kupo on the dedicated server, use the official Charli3 Cardano node setup repository:

   ```bash
   git clone https://github.com/Charli3-Official/cardano-node-setup.git
   cd cardano-node-setup
   ```

   Follow the instructions in the repository's README to set up and configure the Cardano node, Ogmios, and Kupo. This setup ensures compatibility with the Charli3 node operator backend.

2. **Clone the Charli3 Node Operator Setup Repository on Charli3 Node Server**
   On your Charli3 Node Server, clone the setup repository:
   ```bash
   git clone https://github.com/Charli3-Official/charli3-node-operator-setup.git
   cd charli3-node-operator-setup
   ```

3. **Access to Node-Operator-Backend Docker Image**
   To access the node-operator-backend Docker image, follow the instructions in the [Accessing Node Operator Backend Docker Image Guide](https://github.com/Charli3-Official/charli3-node-operator-setup/blob/main/docs/Accessing_Node_Operator_Backend_Docker_Image_Guide.md). This guide provides detailed steps on how to obtain and authenticate with the required Docker image.

4. **Mnemonic and Public Key Hash Setup**
   Prepare your node's mnemonic (24 words needed) and its public key hash. Coordinate with the Charli3 team to have your node's public key hash configured with the oracle feed you intend to operate. Store your mnemonic securely and never share it.

5. **Oracle Feed Configuration Files**
   Review and adjust the configuration YAML files for the oracle feeds you intend to run. Pay special attention to:
   - Data source endpoints and API keys
   - Oracle feed parameters (update frequency, deviation threshold, etc.)
   - Blockchain configuration (network, addresses, etc.)

6. **Configuration File Setup**
   You only need to configure one file: `dynamic_config.yml`. The rest of the datasources and oracle settings are pre-configured for your convenience. In the `dynamic_config.yml` file, set up the following details:

   ```yaml
   updater:
     update_inter: 150
     verbosity: INFO
     percent_resolution: 10000

   database:
     url: "postgresql+asyncpg://charli3:charli3@charli3-node-operator-db:5432/node-operator-backend"

   chainQuery:
     network: MAINNET
     ogmios:
       ws_url: ws://10.128.0.3:1337
     kupo_url: http://10.128.0.3:1442

   mnemonic_ada_charli3:
   mnemonic_ada_euro:
   mnemonic_ada_chf:
   mnemonic_ada_usd:
   mnemonic_book_usd:
   mnemonic_djed_usd:
   mnemonic_iusd_usd:
   mnemonic_mehen_usd:
   mnemonic_newm_usd:
   mnemonic_rmkr_ada:
   mnemonic_shen_usd:
   mnemonic_copi_usd:
   mnemonic_usda_usd:
   mnemonic_btc_ada:
   ```

   In this file:
   - Update the `ws_url` under `ogmios` and `kupo_url` to point to your Cardano Infrastructure Server.
   - Provide the mnemonic (24 words) for each feed you are approved to operate. Leave the fields blank for feeds you're not operating.

   Example:
   ```yaml
   mnemonic_ada_usd: word1 word2 word3 ... word24
   mnemonic_btc_ada: word1 word2 word3 ... word24
   ```

   Ensure you keep your mnemonics secure and never share them with anyone.

7. **Running Your Node**
   Ensure your node wallet is funded with sufficient ADA for operations (recommended minimum: 50 ADA). Start your node:
   ```bash
   docker-compose up -d
   ```

## Post-Setup

After starting your node:

1. **Monitor Logs:** Check the logs for any errors or warnings:
   ```bash
   docker-compose logs -f
   ```

2. **Verify Connectivity:** Ensure your Charli3 node is properly connected to Ogmios and Kupo on the Cardano Infrastructure Server.

3. **Check Oracle Feed Status:** Verify that your node is successfully fetching data and submitting oracle updates.

4. **Set Up Monitoring:** Configure monitoring and alerting for both servers to ensure high availability.

5. **Regular Updates:** Keep an eye out for updates from the Charli3 team and apply them promptly to both the Cardano Infrastructure Server and the Charli3 Node Server.

## Troubleshooting

If you encounter issues:

1. **Check Logs:** Review Docker logs on both servers for specific error messages.
2. **Verify Configurations:** Double-check all configuration files, especially the URLs for Ogmios and Kupo.
3. **Network Issues:** Ensure all required ports are open and services are accessible between servers.
4. **Resource Constraints:** Monitor system resources on both servers.
5. **Version Compatibility:** Verify that all software versions are compatible and up-to-date.

If issues persist, consult the official Charli3 documentation or reach out to the support team.

## Security Considerations

1. **Mnemonic Protection:** Store your mnemonic securely, preferably in an offline, encrypted format.
2. **Server Hardening:** Follow best practices for server security on both servers, including regular updates and firewall configuration.
3. **Access Control:** Limit access to both servers and use strong authentication methods.
4. **Monitoring:** Set up intrusion detection and monitoring systems on both servers.
5. **Network Security:** Ensure secure communication between your Charli3 Node Server and Cardano Infrastructure Server.

## Conclusion

Congratulations on setting up your Charli3 node operator backend! Your contribution to the Charli3 ecosystem and decentralized oracle networks on Cardano is valuable.

Stay informed about the latest developments and best practices in node operation to ensure the continued success and security of your Charli3 node.
