# Running Your Charli3 Node

This guide provides instructions on how to run and manage your Charli3 node operator backend.

## 1. Starting Your Node

Once you've completed the [installation](installation-guide.md) and [configuration](configuration.md) steps, you can start your node using Docker Compose:

- If you configured feeds to use `.skey`/`.vkey` files, copy them into the `keys/` directory (and any sub-folders) before starting the stack.

```bash
docker-compose up -d
```

This command starts all the services defined in your `docker-compose.yml` file in detached mode.

## 2. Checking Node Status

To check the status of your node and its services:

```bash
docker-compose ps
```

This will show you the status of all containers associated with your Charli3 node.

## 3. Viewing Logs

To view the logs of all services:

```bash
docker-compose logs
```

To follow the logs in real-time:

```bash
docker-compose logs -f
```

To view logs for a specific service (e.g., the ada-usd oracle):

```bash
docker-compose logs -f charli3-ada-usd-v3
```

## 4. Stopping Your Node

To stop your node and all its services:

```bash
docker-compose down
```

## 5. Updating Your Node

When updates are available:

1. Pull the latest changes from the repository:
   ```bash
   git pull origin main
   ```

2. Pull the latest Docker images:
   ```bash
   docker-compose pull
   ```

3. Restart your services:
   ```bash
   docker-compose down
   docker-compose up -d
   ```

## 6. Configuring and Managing Alerts

Alerts help you monitor your node's health and performance. To configure alerts:

1. Edit your `dynamic_config.yml` file to include the Alerts section:

   ```yaml
   Alerts:
     cooldown: 1800  # 30 minutes
     thresholds:
       c3_token_balance: 100
       ada_balance: 500
       timeout_variance: 120
       minimum_data_sources: 3
     notifications:
       - type: slack
         config:
           webhook_url: "your_slack_webhook_url"
   ```

2. Customize the thresholds and notification methods as needed.
3. Restart your node to apply the changes:

   ```bash
   docker-compose down
   docker-compose up -d
   ```

4. Monitor your configured notification channels for alerts.

For more detailed information on alert configuration, refer to our [Alerts Configuration Guide](alerts-configuration.md).

## 7. Managing Reward Collection

The reward collection feature automatically collects your earned C3 tokens. To set it up:

1. Edit your `dynamic_config.yml` file to include the RewardCollection section:

   ```yaml
   RewardCollection:
     destination_address: "your_cardano_address_here"
     trigger_amount: 1000  # in C3 tokens
   ```

2. Ensure your node has sufficient ADA to cover transaction fees.
3. Restart your node to apply the changes.
4. Monitor your specified destination address for incoming rewards.

For more information on reward collection, see our [Reward Collection Guide](reward-collection.md).

## 8. Monitoring Your Node

Regular monitoring is crucial for maintaining a healthy node. Key aspects to monitor include:

- System resources (CPU, memory, disk usage)
- Network connectivity
- Oracle update frequency and accuracy
- Cardano blockchain sync status
- Alert notifications
- Reward collection transactions

Consider setting up additional monitoring tools like Prometheus and Grafana for comprehensive monitoring and alerting.

## 9. Troubleshooting

If you encounter issues while running your node:

1. Check the logs for error messages
2. Ensure all configuration files are correctly set up
3. Verify network connectivity to the Cardano network and data sources
4. Consult the [Troubleshooting Guide](troubleshooting.md) for common issues and solutions

If problems persist, don't hesitate to reach out to the Charli3 support team.

## 10. Best Practices

- Regularly check for updates and apply them promptly
- Keep your system updated and secure
- Maintain sufficient ADA balance for transaction fees
- Regularly backup your configuration and essential data
- Monitor your node's performance and adjust resources as needed

For more detailed security practices, refer to our [Security Best Practices](security-best-practices.md) guide.

Remember, running a Charli3 node is a responsibility that contributes to the decentralization and reliability of the Charli3 oracle network. Your diligence in maintaining your node helps ensure the integrity of the entire system.
