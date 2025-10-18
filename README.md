# Charli3 Node Operator Backend Setup

Welcome to the Charli3 Node Operator Backend setup guide. This README provides a comprehensive overview of the setup process and points you to detailed documentation for each aspect of running a Charli3 node.

## Table of Contents

- [Charli3 Node Operator Backend Setup](#charli3-node-operator-backend-setup)
  - [Table of Contents](#table-of-contents)
  - [🚀 Quick Start](#-quick-start)
  - [📚 Essential Documentation](#-essential-documentation)
  - [🔬 Advanced Topics](#-advanced-topics)
  - [🛠 Troubleshooting](#-troubleshooting)
  - [System Architecture Overview](#system-architecture-overview)
  - [Prerequisites](#prerequisites)
  - [Installation](#installation)
  - [Configuration Files](#configuration-files)
  - [Available Oracle Feeds](#available-oracle-feeds)
  - [Key Features](#key-features)
    - [Alert System](#alert-system)
    - [Reward Collection](#reward-collection)
  - [Security Considerations](#security-considerations)
  - [🚀 Performance Optimization](#-performance-optimization)
  - [🔄 Upgrading Your Node](#-upgrading-your-node)
  - [Support and Community](#support-and-community)

## 🚀 Quick Start

1. 📋 Check the [Prerequisites](docs/Prerequisites.md)
2. 🛠 Follow the [Installation Guide](docs/installation-guide.md)
3. ⚙️ Configure your node using the [Configuration Guide](docs/configuration.md)
4. 🖥️ Start your node following the [Running Your Node](docs/running-your-node.md) guide

## 📚 Essential Documentation

For production usage, we recommend reviewing these documents:

- [Security Best Practices](docs/security-best-practices.md)
- [SLA Requirements](docs/sla-requirements.md)
- [Alerts Configuration](docs/alerts-configuration.md)
- [Reward Collection Guide](docs/reward-collection.md)

## 🔬 Advanced Topics

For more in-depth information:

- [Oracle Feeds Configuration](docs/oracle-feeds-configuration.md)
- [Architecture Overview](docs/architecture-overview.md)
- [System Requirements](docs/system-requirements.md)
- [Accessing Node Operator Backend Docker Image](docs/accessing-docker-image.md)
- [FAQ](docs/charli3_node_operator_faq.md)

## 🛠 Troubleshooting

Encountering issues? Check our [Troubleshooting Guide](docs/troubleshooting.md).

## System Architecture Overview

The recommended setup involves two servers:
1. **Cardano Infrastructure Server**: Runs the Cardano node, Ogmios, and Kupo.
2. **Charli3 Node Server**: Hosts the Charli3 node operator backend.

For a detailed explanation of the system architecture, refer to the [Architecture Overview](docs/architecture-overview.md) document.

## Prerequisites

Before setting up your Charli3 node, ensure you meet all system requirements. These include hardware specifications, software prerequisites, and network requirements.

For a comprehensive list of prerequisites, see the [Prerequisites](docs/Prerequisites.md) document.

## Installation

Follow these steps to set up your Charli3 node:

1. Set up the Cardano Infrastructure Server
2. Clone the Charli3 Node Operator Setup Repository
3. Access the Node-Operator-Backend Docker Image
4. Prepare your node wallet

For detailed installation steps, refer to the [Installation Guide](docs/installation-guide.md).

## Configuration Files

Charli3 nodes use two types of configuration files:
- `config.yml`: Feed-specific configuration files
- `dynamic_config.yml`: Shared configuration file for parameters common across all feeds

When operating with Cardano signing/verification keys instead of mnemonics:
- Place your key files under a new `keys/` directory (e.g., `keys/ada_charli3/node.skey`).
- Leave the corresponding mnemonic blank in `dynamic_config.yml`.
- Point each feed's `Node` section to `/app/keys/<feed>/node.skey` and `/app/keys/<feed>/node.vkey`.

For more information on configuring your node, see the [Configuration Guide](docs/configuration.md).

## Available Oracle Feeds

Charli3 supports various oracle feeds, including:
- ADA/USD
- BTC/ADA
- ETH/USD
- And more

For a complete list and configuration details, refer to the [Oracle Feeds Configuration](docs/oracle-feeds-configuration.md) guide.

## Key Features

### Alert System
Charli3 nodes include a configurable alert system to notify operators of important events or issues. For setup and configuration details, see the [Alerts Configuration Guide](docs/alerts-configuration.md).

### Reward Collection
Automatic reward collection allows node operators to efficiently manage their earned C3 tokens. Learn more in the [Reward Collection Guide](docs/reward-collection.md).


## Security Considerations

Security is crucial when operating a Charli3 node. Key security measures include:

- Protecting your mnemonic phrase
- Implementing server hardening techniques
- Using strong authentication methods

For detailed security best practices, refer to the [Security Best Practices](docs/security-best-practices.md) guide.

## 🚀 Performance Optimization

To ensure your node operates at peak efficiency:

- Optimize your server's resources
- Fine-tune your database configuration
- Consider using pgbouncer for improved database performance

For more details, consult the [System Requirements](docs/system-requirements.md) and [Configuration Guide](docs/configuration.md).

## 🔄 Upgrading Your Node

Stay up-to-date with the latest features and improvements:

1. Regularly check for updates from the Charli3 team
2. Follow the upgrade instructions provided with each release
3. Always back up your configuration before upgrading

## Support and Community

If you need assistance or want to connect with other Charli3 node operators:

- Join our [Discord community](#) (link to be provided)
- Visit the [Charli3 website](https://charli3.io) for more resources

Thank you for contributing to the Charli3 network! Your participation helps build a more decentralized and robust oracle system on Cardano.
