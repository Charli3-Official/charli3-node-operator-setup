# SLA Requirements for Charli3 Node Operators

As a Charli3 node operator, you play a crucial role in maintaining the reliability and accuracy of our oracle network. To ensure the highest quality of service, we expect node operators to meet the following Service Level Agreement (SLA) requirements:

1. **Uptime**: Maintain a minimum of 99.9% uptime for your node. This allows for approximately 43 minutes of downtime per month.

2. **Scheduled Operations**: Ensure your node performs scheduled operations every 2-3 minutes. During these operations, your node should:
   - Fetch data from designated data sources
   - Check the current state on the blockchain
   - Determine if an update to the oracle is required

3. **Update Frequency**: While the node checks for updates every 2-3 minutes, actual updates to the blockchain may occur less frequently. The time between updates can range from 30 minutes to 24 hours, depending on the specific requirements of each oracle feed. Ensure your node is capable of updating within this range as required.

4. **Data Accuracy**: When an update is required, provide data that is accurate within 0.1% of the true value for financial data feeds, and within specified tolerances for other data types.

5. **Response Time**: When an update is determined to be necessary, ensure that your node submits the update to the blockchain within 30 seconds under normal network conditions.

6. **Network Connectivity**: Maintain a stable internet connection with less than 1% packet loss and latency under 100ms to major internet exchanges.

7. **Alert Responsiveness**: Respond to critical alerts within 1 hour during business hours and within 12 hours outside of business hours. This includes investigating the issue and taking necessary corrective actions.

8. **Alert Configuration**: Maintain properly configured alerts as specified in the [Alerts Configuration Guide](alerts-configuration.md). Ensure all critical alerts are set up and functioning.

9. **Security**: Implement and maintain security best practices as outlined in our [Security Best Practices](security-best-practices.md) document.

10. **Software Updates**: Apply critical security updates within 24 hours of release, and non-critical updates within 7 days.

11. **Monitoring and Alerting**: Implement a monitoring and alerting system to detect and respond to issues promptly. This should include monitoring for:
    - Node uptime
    - Successful completion of scheduled operations
    - Timely submission of updates when required
    - Accuracy of submitted data
    - Alert system functionality

12. **Support Responsiveness**: Respond to critical issues raised by the Charli3 team within 2 hours, and non-critical issues within 24 hours.

13. **Compliance**: Adhere to all legal and regulatory requirements applicable in your jurisdiction.

14. **Resource Management**: Ensure your node has sufficient computational resources and ADA balance to perform all required operations, including transaction fees for updates and reward collection.

15. **Reward Collection**: Configure and maintain the reward collection mechanism as described in the [Reward Collection Guide](reward-collection.md). Ensure the destination address is secure and regularly monitored.

Failure to meet these SLA requirements may result in penalties, including but not limited to reduced rewards or removal from the node operator program. We will provide support and guidance to help you meet these requirements.

For any questions or concerns about these SLA requirements, please contact the Charli3 support team.