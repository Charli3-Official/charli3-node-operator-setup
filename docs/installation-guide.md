# Installation Guide for Charli3 Node Operator Backend

This guide provides step-by-step instructions for setting up the Charli3 Node Operator Backend. Please ensure you have met all the [system requirements](system-requirements.md) before proceeding.

## 1. Set Up Cardano Infrastructure Server

First, set up your Cardano node, Ogmios, and Kupo on the dedicated server:

```bash
git clone https://github.com/Charli3-Official/cardano-node-setup.git
cd cardano-node-setup
```

Follow the instructions in the repository's README to set up and configure the Cardano node, Ogmios, and Kupo.

## 2. Set Up Charli3 Node Server

### 2.1 Clone the Repository

On your Charli3 Node Server, clone the setup repository:

```bash
git clone https://github.com/Charli3-Official/charli3-node-operator-setup.git
cd charli3-node-operator-setup
```

### 2.2 Access the Node-Operator-Backend Docker Image

Follow the instructions in the [Accessing Node Operator Backend Docker Image Guide](accessing-docker-image.md) to obtain and authenticate with the required Docker image.

### 2.3 Configure the Node

Copy the example configuration file:

```bash
cp example_dynamic_config.yml dynamic_config.yml
```

Edit `dynamic_config.yml` with your preferred text editor:

```bash
nano dynamic_config.yml
```

Update the following details:

- Set the `ws_url` under `ogmios` to point to your Cardano Infrastructure Server.
- Set the `kupo_url` to point to your Cardano Infrastructure Server.
- Provide the mnemonic (24 words) for each feed you are approved to operate.

Example:

```yaml
ChainQuery:
  network: MAINNET
  ogmios:
    ws_url: ws://your-cardano-server-ip:1337
  kupo_url: http://your-cardano-server-ip:1442

mnemonic_ada_usd: word1 word2 word3 ... word24
mnemonic_btc_ada: word1 word2 word3 ... word24
```

### 2.4 Prepare Your Node Wallet

Ensure your node wallet is funded with sufficient ADA for operations (recommended minimum: 50 ADA).

## 3. Start Your Node

Run the following command to start your node:

```bash
docker-compose up -d
```

## 4. Verify Installation

### 4.1 Check Logs

Monitor the logs for any errors or warnings:

```bash
docker-compose logs -f
```

### 4.2 Verify Connectivity

Ensure your Charli3 node is properly connected to Ogmios and Kupo on the Cardano Infrastructure Server.

### 4.3 Check Oracle Feed Status

Verify that your node is successfully fetching data and submitting oracle updates.

## 5. Keep Your Node Updated

Regularly check for updates from the Charli3 team and apply them promptly to both the Cardano Infrastructure Server and the Charli3 Node Server.

## Troubleshooting

If you encounter any issues during the installation process, please refer to our [Troubleshooting Guide](troubleshooting.md) or contact the Charli3 support team.

Remember to always keep your mnemonic secure and never share it with anyone. For best practices on securing your node, refer to our [Security Best Practices](security-best-practices.md) guide.