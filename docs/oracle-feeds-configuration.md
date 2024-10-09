# Oracle Feeds Configuration Guide for Charli3 Node Operator Backend

This guide provides information on configuring oracle feeds for your Charli3 Node Operator Backend. It's important to note that most of the feed-specific configuration is pre-set by the Charli3 team, and you typically won't need to modify these files unless instructed to do so.

## 1. Available Oracle Feeds

As of the latest update, the following oracle feeds are available:

1. ADA/CHARLI3
2. ADA/USD
3. ADA/EURO
4. BTC/ADA
5. BOOK/USD
6. NMKR/ADA
7. MEHEN/USD
8. NEWM/USD
9. COPI/USD
10. ETH/USD
11. WMT/USD
12. SNEK/USD

## 2. Feed-Specific Configuration Files

These files are located in your Charli3 node setup directory and are named according to the feed they configure. For example:

- `ada_usd_v3_config.yml`
- `btc_usd_v3_config.yml`
- `eth_usd_v3_config.yml`
- etc.

## 3. Configuration File Structure

While you don't need to modify these files, understanding their structure can be helpful. Here's a typical structure of a feed configuration file:

```yaml
include: dynamic_config.yml

Node:
  mnemonic: <%= @mnemonic_ada_usd %>
  oracle_curr: 657991fcca11e70169ba87ef626d2a3a5bd35faa32a5946b8689a342
  oracle_address: addr_test1wqd2qdzhh3x280q6erdksyku6k3eknrqsmrpkjnn6hsvjegk9gghn
  c3_token_hash: 436941ead56c61dbf9b92b5f566f7d5b9cac08f8c957f28f0bd60d4b
  c3_token_name: PAYMENTTOKEN
  c3_oracle_nft_name: "OracleFeed"
  c3_oracle_nft_hash: "ca9a3d8457735b989628ef1193a62f40799680e2bfcaf8936211420c"
  c3_oracle_rate_address: "addr_test1wqf99gagnjgfamek9v9vyrwulwh64xdnerq9xkvfhwyeu3qdufj2x"
  node_sync_api: "http://localhost:3000"

Rate:
  general_base_symbol: ADA-USD
  base_currency:
    api_sources:
      - adapter: generic-api
        asset_a: ADA
        asset_b: USD
        sources:
          - name: coinbase
            api_url: "https://api.exchange.coinbase.com/products/ADA-USD/ticker/"
            json_path: ["price"]
            headers: {}
          # ... other sources ...
```

## 4. Key Configuration Elements

While you shouldn't modify these elements unless instructed, here's what they represent:

- `Node`: Contains node-specific configurations.
  - `mnemonic`: References the mnemonic from the `dynamic_config.yml` file.
  - `oracle_curr`, `oracle_address`: Specific identifiers for this oracle feed.
  - `c3_token_*`: Charli3 token configurations.
  - `node_sync_api`: API endpoint for node synchronization.

- `Rate`: Contains rate-specific configurations.
  - `general_base_symbol`: The trading pair this feed reports on.
  - `base_currency`: Configurations for data sources.
    - `api_sources`: List of API sources for price data.
      - Each source includes details like `name`, `api_url`, and how to parse the response.

## 5. Adding or Modifying Feeds

In most cases, you won't need to add or modify feeds yourself. If a new feed needs to be added or an existing one modified, the Charli3 team will provide you with the necessary configuration file or instructions.

## 6. Troubleshooting

If you encounter issues with a specific feed:

1. Check the logs for that particular feed's container.
2. Verify that the `dynamic_config.yml` file has the correct mnemonic for the feed.
3. Ensure your node has the necessary permissions to operate the feed.
4. Contact the Charli3 support team for assistance if the issue persists.

## Conclusion

The pre-configured nature of these feed files ensures consistency and reduces the chance of misconfiguration. Always refer to official Charli3 documentation or contact support before making any changes to these files.

For information on configuring the shared settings across all feeds, refer to the [Configuration Guide](configuration.md) which covers the `dynamic_config.yml` file.