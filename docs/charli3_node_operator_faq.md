# Frequently Asked Questions (FAQ) for Charli3 Node Operators

This document addresses common questions and concerns that Charli3 node operators may have. If you don't find an answer to your question here, please reach out to the Charli3 support team.

## 1. General Questions

### Q1.1: What is a Charli3 node operator?
A: A Charli3 node operator runs a node that contributes to the Charli3 oracle network by fetching, processing, and submitting price data to the Cardano blockchain.

### Q1.2: What are the benefits of running a Charli3 node?
A: Running a node contributes to the decentralization of the Charli3 network and can earn rewards in the form of C3 tokens.

### Q1.3: How much technical knowledge do I need to run a node?
A: Basic knowledge of Linux, Docker, and blockchain concepts is helpful. Our documentation guides you through the process, but some technical aptitude is beneficial.

## 2. Setup and Requirements

### Q2.1: What are the minimum hardware requirements for running a node?
A: Please refer to our [System Requirements](system-requirements.md) document for detailed hardware specifications.

### Q2.2: Can I run a Charli3 node on a cloud provider?
A: Yes, you can run a node on cloud providers like AWS, Google Cloud, or DigitalOcean, as long as they meet our system requirements.

### Q2.3: Do I need to run a full Cardano node to operate a Charli3 node?
A: Yes, a fully synced Cardano node is required along with Ogmios and Kupo for proper operation.

## 3. Operation and Maintenance

### Q3.1: How often does my node need to submit updates?
A: Update frequency can vary based on the specific oracle feed, but typically it's every few minutes.

### Q3.2: How much ADA do I need to keep in my node's wallet?
A: We recommend maintaining at least 50 ADA to cover transaction fees.

### Q3.3: How can I monitor my node's performance?
A: You can use the Docker logs and our recommended monitoring tools like Prometheus and Grafana. We also provide a dashboard for node operators.

## 4. Troubleshooting

### Q4.1: My node isn't syncing with the Cardano blockchain. What should I do?
A: Check our [Troubleshooting Guide](troubleshooting.md) for steps to resolve syncing issues.

### Q4.2: I'm seeing high resource usage on my server. Is this normal?
A: Some resource usage is expected, but if it's causing issues, refer to our troubleshooting guide for optimization steps.

## 5. Rewards and Economics

### Q5.1: How are node operator rewards calculated?
A: Rewards are based on the accuracy and consistency of your node's price submissions. The exact formula is subject to change and is detailed in our economic model documentation.

### Q5.2: How often are rewards distributed?
A: Rewards are typically distributed on a per-aggregation basis, subject to the feed's aggregation structure.

### Q5.3: How can node operators observe their C3 token balance?
A: Currently, there are two ways to check your C3 token balance:
1. On the [Charli3 portal](https://portal.charli3.io/), you can view rewards given for specific aggregation transactions.
2. Check the rewards datum by matching your public key hash. This method involves the following steps:

   a. Find the latest aggregation transaction. For example:
      https://preprod.cexplorer.io/tx/f23dc9860ce2fd8579e37230b8dcfe21882f3e35ca9c3c60f145e73d44d6f059

   b. Locate the rewards datum in the transaction. For example:
      https://preprod.cexplorer.io/datum/12fa6f0e6e7275a9c9dca9bc5ab861eb6aa9dbed16925691e5fb3808f5f941dd

   c. Examine the JSON structure of the datum and look for your public key hash (the "bytes" field) and the corresponding "int" value, which represents your reward in lovelaces.

   d. To convert lovelaces to C3 tokens, divide the "int" value by 1,000,000. For example, if your "int" value is 1922900, your reward would be 1.9229 C3 tokens.

**Note: A dedicated node operators section is planned for the Charli3 portal to make this information more accessible.**

### Q5.4: What is the process to redeem C3 tokens?
A: There are three methods to redeem C3 tokens:
1. Use a Python script (to be provided) that allows claiming available C3 tokens by inputting your mnemonic and oracle config details.

2. Utilize the automatic collection mechanism in the config file, which transfers tokens to a selected address when predefined conditions are met. Key reward parameters in the configuration are:
   - `reward_collection_trigger`: This sets the threshold (in lovelaces) at which automatic collection is triggered.
   - `reward_destination_address`: This is the address where collected rewards will be sent.

3. A third option will be implemented to claim tokens directly from the Node Operator UI.

## 6. Alerts and Monitoring

### Q6.1: How do I set up alerts for my Charli3 node?
A: Alerts are configured in the `dynamic_config.yml` file. You can set thresholds for C3 token balance, ADA balance, timeout variance, and minimum data sources. You can also configure notifications to be sent via Slack, Discord, or Telegram. Refer to the [Alerts Configuration Guide](alerts-configuration.md) for detailed instructions.

### Q6.2: What types of alerts can I receive?
A: The main types of alerts include:
1. Low C3 Token Balance
2. Low ADA Balance
3. Aggregation Timeout
4. Node Update Timeout
5. Insufficient Data Sources

### Q6.3: How can I adjust the frequency of alerts?
A: You can adjust the `cooldown` parameter in the Alerts configuration. This sets the minimum time (in seconds) between repeated alerts of the same type.

### Q6.4: Can I use multiple notification channels for alerts?
A: Yes, you can configure multiple notification channels (Slack, Discord, Telegram) in the `dynamic_config.yml` file. Alerts will be sent to all configured channels.

## 7. Reward Collection

### Q7.1: How does the automatic reward collection work?
A: The reward collection feature automatically sends accumulated C3 tokens to a specified Cardano address when the balance reaches a certain threshold. This is configured in the `dynamic_config.yml` file under the `RewardCollection` section.

### Q7.2: How often are rewards collected?
A: Rewards are collected whenever the accumulated C3 tokens reach the `trigger_amount` specified in your configuration. This amount is customizable.

### Q7.3: Are there any fees associated with reward collection?
A: Yes, standard Cardano transaction fees apply when rewards are collected. Ensure your node has sufficient ADA to cover these fees.

### Q7.4: What should I do if reward collection isn't working?
A: First, check your node logs for any error messages. Verify that your `destination_address` is correct and that you have sufficient ADA for transaction fees. If issues persist, consult the [Troubleshooting Guide](troubleshooting.md) or contact Charli3 support.

## 8. pgbouncer and Database

### Q8.1: What is pgbouncer and why is it used?
A: pgbouncer is a lightweight connection pooler for PostgreSQL. It's used to manage database connections efficiently, improving performance and reducing resource usage.

### Q8.2: Do I need to install pgbouncer separately?
A: No, pgbouncer is included in the Docker setup. You don't need to install it separately on your host system.

### Q8.3: How can I troubleshoot pgbouncer issues?
A: Check the pgbouncer container logs, verify its configuration in the `docker-compose.yml` file, and ensure it's running correctly. For more detailed troubleshooting steps, refer to the [Troubleshooting Guide](troubleshooting.md).

## 9. Security

### Q9.1: How can I secure my node's mnemonic phrase?
A: We recommend storing your mnemonic phrase offline in a secure location. Consider using a hardware wallet or a secure, encrypted digital storage solution.

### Q9.2: What should I do if I suspect my node has been compromised?
A: Immediately disconnect your node from the network and contact the Charli3 support team. Follow the incident response plan outlined in our [Security Best Practices](security-best-practices.md) guide.

### Q9.3: How is the collateral (slash-able deposit) commitment made?
A: Currently, the collateral process is handled manually by the Charli3 Team. For more detailed information, please contact the Charli3 team directly.

## 10. Updates and Maintenance

### Q10.1: How often should I update my node software?
A: We recommend checking for updates at least weekly and applying them as soon as possible.

### Q10.2: Will updates require downtime?
A: Most updates can be applied with minimal downtime, but occasionally major updates may require longer maintenance windows. We always communicate such updates in advance.

## 11. Support and Community

### Q11.1: Where can I get help if I'm having issues with my node?
A: Start with our [Troubleshooting Guide](troubleshooting.md). If you can't resolve the issue, reach out to our support team or community forums.

### Q11.2: Is there a community of Charli3 node operators I can join?
A: Yes, we have a vibrant community on Discord. Join us to connect with other operators and get support.

Remember, this FAQ is regularly updated. If you have a question that's not answered here, please don't hesitate to ask in our community channels or contact our support team.
