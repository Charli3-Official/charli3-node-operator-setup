# Charli3 Node Operator Backend Setup

## Getting Started

Welcome to the setup guide for your Charli3 node operator backend. Follow the steps below to get your node up and running:

1. **Clone the Repository**

   Begin by cloning the Charli3 node operator setup repository to your local machine. Use the following command:

   ```bash
   git clone https://github.com/Charli3-Official/charli3-node-operator-setup.git
   ```

2. **Access to Node-Operator-Backend Docker Image**

   Ensure that you have access to the node-operator-backend Docker image. Additionally, it is necessary to have a connection with Ogmios running on your local server alongside the Cardano node.

3. **Mnemonic and Public Key Hash Setup**

   Prepare your node's mnemonic and its public key hash. It is essential to ensure that the Charli3 team has configured the public key hash of your node with the oracle feed you intend to run.

4. **Setup Configuration Files**

   Set up the related configuration file(s). You will mainly need to provide:
   - The mnemonic
   - Ogmios URL
   - Blockfrost project ID (if required)

5. **Running Your Node**

   Now, you're ready to run your node for the oracle feed. Ensure your node wallet has sufficient ADA. To start your node, execute:

   ```bash
   docker-compose up -d
   ```

   Note: In the Docker file, comment out any services that you do not wish to run or are not permitted to run.

Congratulations! Your Charli3 node operator backend should now be set up and running. For further assistance or troubleshooting, refer to the official Charli3 documentation or contact the support team.
```
