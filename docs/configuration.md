# Configuration Guide for Charli3 Node Operator Backend

This guide provides detailed information on how to configure your Charli3 Node Operator Backend. The configuration process is streamlined to focus on essential settings while leveraging pre-configured feed-specific files.

## 1. Configuration File Overview

The main configuration file for your Charli3 node is `dynamic_config.yml`. This file contains essential settings for your node's operation, including network settings, database configuration, mnemonics for different oracle feeds, alert configurations, and reward collection settings.

## 2. Feed-Specific Configuration Files

For each oracle feed (e.g., `ada_usd_v3_config.yml`, `btc_usd_v3_config.yml`, etc.), the Charli3 team has prepared pre-configured files. These files are designed to work out of the box, so you should use them as-is unless you encounter specific issues. You don't need to modify these files under normal circumstances.

## 3. Configuration Priority

The Charli3 Node Operator Backend supports merging configurations from two files: `config.yml` and `dynamic_config.yml`. Parameters in `config.yml` take precedence over the same parameters in `dynamic_config.yml`. This allows for flexible and dynamic configuration management.

### 3.1 Merging Configurations

To merge configurations, the backend will load both `config.yml` and `dynamic_config.yml`, with `config.yml` taking precedence. This means that if a parameter is defined in both files, the value from `config.yml` will be used.

### 3.2 Validation and Warnings

The backend will validate that required parameters are present in at least one of the configuration files. If there are conflicting values between the two files, a warning will be issued, showing which value will be used.

## 4. Dynamic Configuration File Structure

The `dynamic_config.yml` file is the only file you need to configure. It contains settings that are shared across all feeds, reducing redundancy. Here's the structure of the `dynamic_config.yml` file:

```yaml
Updater:
  update_inter: 150
  verbosity: INFO
  percent_resolution: 10000  

database:
  url: "postgresql+asyncpg://charli3:charli3@charli3-node-operator-db:5432/node-operator-backend"

ChainQuery:
  network: MAINNET
  ogmios:
    ws_url: ws://10.128.0.3:1337
  kupo_url: http://10.128.0.3:1442

Alerts:
  cooldown: 1800
  thresholds:
    c3_token_balance: 100
    ada_balance: 500
    timeout_variance: 120
    minimum_data_sources: 3
  notifications:
    - type: slack
      config:
        webhook_url: "{tokenA}/{tokenB}/{tokenC}"
    - type: discord
      config:
        webhook_url: "{WebhookID}/{WebhookToken}"
    - type: telegram
      config:
        bot_token: your_bot_token
        chat_id: your_chat_id

RewardCollection:
  destination_address: "addr1q8ae7dedj82gjxdkcv25j5r9c22cvy3d4wx9k9u3r6ytf0s4j3cxv6gst3wqgf8psznsps5a7505prqyeygm2wh8lppqgvqd5p"
  trigger_amount: 1000

mnemonic_ada_charli3: 
mnemonic_ada_euro: 
mnemonic_ada_chf: 
mnemonic_ada_usd: 
mnemonic_book_usd: 
mnemonic_djed_usd: 
mnemonic_iusd_usd: 
mnemonic_mehen_usd: 
mnemonic_newm_usd: 
mnemonic_nmkr_ada: 
mnemonic_shen_usd: 
mnemonic_copi_usd: 
mnemonic_eth_usd: 
mnemonic_btc_ada: 
```

## 4. Configuring the Dynamic Configuration File

### 4.1 Updater Section

```yaml
Updater:
  update_inter: 150
  verbosity: INFO
  percent_resolution: 10000  
```

- `update_inter`: The interval (in seconds) between updates.
- `verbosity`: Logging level. Options are DEBUG, INFO, WARNING, ERROR.
- `percent_resolution`: Precision for percentage calculations.

### 4.2 Database Section

```yaml
database:
  url: "postgresql+asyncpg://charli3:charli3@pgbouncer:6432/node-operator-backend?prepared_statement_cache_size=0"
```

This section specifies the connection URL for the PostgreSQL database. The configuration above uses pgbouncer, which is recommended for improved performance but not mandatory. 

If you choose not to use pgbouncer, your configuration should look like this:

```yaml
database:
  url: "postgresql+asyncpg://charli3:charli3@charli3-node-operator-db:5432/node-operator-backend"
```

Note that pgbouncer is set up as a separate service in the Docker Compose file, so you don't need to install or configure it manually on your host system.

### 4.3 ChainQuery Section

```yaml
ChainQuery:
  network: MAINNET
  ogmios:
    ws_url: ws://10.128.0.3:1337
  kupo_url: http://10.128.0.3:1442
```

- `network`: Specifies the Cardano network (MAINNET or TESTNET).
- `ogmios.ws_url`: WebSocket URL for the Ogmios server.
- `kupo_url`: URL for the Kupo server.

Replace the IP addresses with those of your Cardano Infrastructure Server.

#### 4.3.1 External Configuration for Testnet

When running a node in a testnet environment, you may need to fetch certain data, particularly DEX prices, from the mainnet Cardano blockchain. This is because the testnet often lacks the necessary liquidity or trading activity to provide accurate price information for all asset pairs.

To enable this functionality, add an `external` section under `ChainQuery`:

```yaml
ChainQuery:
  network: TESTNET
  ogmios:
    ws_url: ws://10.128.0.3:1337
  kupo_url: http://10.128.0.3:1442
  external:
    ogmios:
      ws_url: ws://mainnet-ogmios-url:1337
      kupo_url: http://mainnet-kupo-url:1442
    blockfrost:
      project_id: "your-mainnet-blockfrost-project-id"
```

This configuration allows your testnet node to connect to mainnet services to fetch accurate DEX prices. You can configure either Ogmios+Kupo or Blockfrost for this purpose. If both are configured, the node will prioritize using Ogmios+Kupo.

- **Ogmios+Kupo**: Provides a more decentralized approach but requires running your own mainnet Cardano node.
- **Blockfrost**: A convenient option that doesn't require running your own mainnet node, but introduces a dependency on a third-party service.

Remember to secure your mainnet services properly and regularly verify that your external configuration is working correctly.

### 4.4 Alerts Section

```yaml
Alerts:
  cooldown: 1800
  thresholds:
    c3_token_balance: 100
    ada_balance: 500
    timeout_variance: 120
    minimum_data_sources: 3
  notifications:
    - type: slack
      config:
        webhook_url: "{tokenA}/{tokenB}/{tokenC}"
    - type: discord
      config:
        webhook_url: "{WebhookID}/{WebhookToken}"
    - type: telegram
      config:
        bot_token: your_bot_token
        chat_id: your_chat_id
```

- `cooldown`: Time (in seconds) between repeated alerts of the same type.
- `thresholds`: Customize alert trigger thresholds.
- `notifications`: Configure one or more notification services.

For detailed information on setting up alerts, refer to the [Alerts Configuration Guide](alerts-configuration.md).

### 4.5 RewardCollection Section

```yaml
RewardCollection:
  destination_address: "addr1q8ae7dedj82gjxdkcv25j5r9c22cvy3d4wx9k9u3r6ytf0s4j3cxv6gst3wqgf8psznsps5a7505prqyeygm2wh8lppqgvqd5p"
  trigger_amount: 1000
```

- `destination_address`: The address where collected rewards will be sent.
- `trigger_amount`: The amount of C3 tokens that triggers a reward collection.

For more information on reward collection, see the [Reward Collection Guide](reward-collection.md).

### 4.6 Mnemonic Section

```yaml
mnemonic_ada_charli3: 
mnemonic_ada_euro: 
mnemonic_ada_chf: 
mnemonic_ada_usd: 
# ... (other mnemonic entries)
```

Each line corresponds to a different oracle feed. Fill in the 24-word mnemonic for each feed you are approved to operate. Leave blank any feeds you're not operating.

## 5. Security Considerations

Remember to keep your configuration files, especially those containing mnemonics, secure. Never share your mnemonics or commit them to version control systems.

For best practices on securing your configuration, refer to our [Security Best Practices](security-best-practices.md) guide.

## 6. Applying Configuration Changes

After making changes to your `dynamic_config.yml` file, you need to restart your node for the changes to take effect:

```bash
docker-compose down
docker-compose up -d
```

Monitor the logs after restarting to ensure your node is operating correctly with the new configuration.

If you encounter any issues with your configuration, please refer to our [Troubleshooting Guide](troubleshooting.md) or contact the Charli3 support team.