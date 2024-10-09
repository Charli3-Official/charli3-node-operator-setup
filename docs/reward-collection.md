# Reward Collection for Charli3 Node Operators

Charli3 Node Operators can now configure automatic reward collection for their nodes. This guide explains how to set up and manage the reward collection feature.

## Reward Collection Configuration

Reward collection is configured in the `dynamic_config.yml` file. Here's an example configuration:

```yaml
RewardCollection:
  destination_address: "addr1q8ae7dedj82gjxdkcv25j5r9c22cvy3d4wx9k9u3r6ytf0s4j3cxv6gst3wqgf8psznsps5a7505prqyeygm2wh8lppqgvqd5p"
  trigger_amount: 1000  # 1000 C3 tokens
```

### Configuration Options

1. `destination_address`: The Cardano address where collected rewards will be sent.
2. `trigger_amount`: The amount of C3 tokens that triggers a reward collection.

## How Reward Collection Works

1. The node continuously monitors the accumulated C3 token rewards.
2. When the accumulated rewards reach or exceed the `trigger_amount`, the collection process is automatically initiated.
3. The rewards are sent to the specified `destination_address`.

## Best Practices

1. Choose a secure and accessible Cardano address for your `destination_address`.
2. Set the `trigger_amount` to a value that balances transaction costs with the frequency of collections.
3. Regularly monitor your destination address to ensure rewards are being collected as expected.

## Troubleshooting

If you're not seeing rewards collected as expected:

1. Verify that your `destination_address` is correct and accessible.
2. Check that you have accumulated enough rewards to meet the `trigger_amount`.
3. Ensure your node has sufficient ADA to cover transaction fees for the collection process.
4. Review your node logs for any error messages related to reward collection.

## Customizing Reward Collection

You can adjust the `trigger_amount` based on your preferences:
- A lower amount will result in more frequent collections but potentially higher cumulative transaction fees.
- A higher amount will result in less frequent collections but may accumulate rewards on the node for longer periods.

Choose a value that best suits your operational needs and risk tolerance.