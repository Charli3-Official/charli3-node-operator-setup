# Charli3 Node Operator Backend Setup

## Getting Started

1. To setup your own charli3 backend node, clone this repository to your machine. 
```
git clone https://github.com/Charli3-Official/Charli3-Backend-setup.git
```
2. The next steps are divided in different phases. In first phase, start up the cardano-node, cardano-wallet and postgres database, with relavant network parameter.
```
NETWORK=mainnet docker-compose up -d 
```
or 
```
NETWORK=testnet docker-compose up -d 
```
3. In second phase, There will be migration command for setting up the PAB database. 
```
NETWORK=testnet docker-compose --profile migration up -d 
```
4. Configure all the information to run the node, as required by the [config.ini](config.ini.example) file.
5. After the node and wallet comes in sync, run the below command to start the feed. 
```
NETWORK=testnet docker-compose --profile backend up -d 
```
