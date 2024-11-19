# Setting Up Alerts for Charli3 Node Operators

Charli3 Node Operators can now configure alerts to monitor their nodes more effectively. This guide explains how to set up and customize these alerts.

## Alert Configuration

Alerts are configured in the `dynamic_config.yml` file. Here's an example configuration:

```yaml
Alerts:
  cooldown: 1800 # 30 minutes (Optional)
  thresholds: # (Optional)
    c3_token_balance: 100
    ada_balance: 500
    timeout_variance: 120
    minimum_data_sources: 3
  notifications: # at least one notification is required
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

### Configuration Options

1. `cooldown`: Time (in seconds) between repeated alerts of the same type.
2. `thresholds`: Customize alert trigger thresholds:
   - `c3_token_balance`: Minimum C3 token balance (in whole tokens)
   - `ada_balance`: Minimum ADA balance (in Ada)
   - `timeout_variance`: Percentage to adjust timeout thresholds
   - `minimum_data_sources`: Minimum number of active data sources
3. `notifications`: Configure one or more notification services

### Notification Configuration Syntax

The `notifications` section is crucial and requires at least one notification service to be configured. Here's a breakdown of the syntax for each supported service:

```yaml
notifications: # at least one notification is required
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

- Each notification service is defined as a list item (`-`) under `notifications`.
- The `type` field specifies the service (slack, discord, or telegram).
- The `config` section contains service-specific settings:
  - For Slack and Discord: provide the `webhook_url`
  - For Telegram: provide both `bot_token` and `chat_id`

You can configure multiple notification services by adding more list items with different types and configurations.

### Supported Notification Services

- Slack: Provide the webhook URL from Slack
- Discord: Provide the webhook URL from Discord
- Telegram: Provide the bot token and chat ID

## Alert Types

1. Low C3 Token Balance
2. Low ADA Balance
3. Aggregation Timeout
4. Node Update Timeout
5. Insufficient Data Sources

## Setting Up Notifications

### Slack

1. Create a Slack App for your workspace
2. Enable Incoming Webhooks
3. Create a new webhook and copy the URL
4. Add the webhook URL to your config as `{tokenA}/{tokenB}/{tokenC}`

### Discord

1. In your Discord server, go to Server Settings > Integrations
2. Create a new webhook and copy the URL
3. Add the webhook URL to your config as `{WebhookID}/{WebhookToken}`

### Telegram

1. Create a new bot using BotFather on Telegram
2. Get the bot token from BotFather
3. Start a chat with your bot and get the chat ID
4. Add the bot token and chat ID to your config

## Customizing Thresholds

Adjust the `thresholds` section in the config to customize when alerts are triggered. If not specified, default values will be used.

## Testing Your Configuration

After setting up your alerts, restart your node to apply the new configuration. You can temporarily lower the thresholds to test if alerts are working correctly.

## Behavior of Alerts in Relation to the `min_requirement` Parameter

The `min_requirement` parameter in the Rate section of `config.yml` affects the behavior of the "Insufficient Data Sources" alert. Here's how it works:

- If `min_requirement` is set to `false`, the alert logic is adjusted as follows:
  - The alert will not be triggered if the number of active data sources is less than the default threshold (3) but greater than 0.
  - The alert will still be triggered if there are no active data sources (0).
- If `min_requirement` is `true` or not specified, the current alert behavior is maintained, and the alert will be triggered if the number of active data sources is less than the default threshold (3).

This allows for more flexible alerting based on the specific requirements of your node operation.