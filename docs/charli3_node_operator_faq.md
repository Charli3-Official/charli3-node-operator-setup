# Charli3 Node Operator FAQ

## Q1: How can node operators observe their C3 token balance?
A1: Currently, there are two ways to check your C3 token balance:
1. On the [Charli3 portal](https://portal.charli3.io/), you can view rewards given for specific aggregation transactions.
<img width="865" alt="image" src="https://github.com/user-attachments/assets/ca69dafb-229d-4bd3-93ad-5d5dcdc2a6ea">


2. Check the rewards datum by matching your public key hash. This method involves the following steps:

   a. Find the latest aggregation transaction. For example:
      https://preprod.cexplorer.io/tx/f23dc9860ce2fd8579e37230b8dcfe21882f3e35ca9c3c60f145e73d44d6f059

   b. Locate the rewards datum in the transaction. For example:
      https://preprod.cexplorer.io/datum/12fa6f0e6e7275a9c9dca9bc5ab861eb6aa9dbed16925691e5fb3808f5f941dd

   c. Examine the JSON structure of the datum. Here's an example:

   ```json
   {
       "fields": [
           {
               "fields": [
                   {
                       "list": [
                           {
                               "fields": [
                                   {
                                       "bytes": "cef7fb5f89a9c76a65acdd746d9e84104d6f824d7dc44f427fcaa1dd"
                                   },
                                   {
                                       "int": 1922900
                                   }
                               ],
                               "constructor": 0
                           },
                           {
                               "fields": [
                                   {
                                       "bytes": "4ad1571e7df63d4d6c49240c8372eb639f57c0ef669338c0d752f29b"
                                   },
                                   {
                                       "int": 1847900
                                   }
                               ],
                               "constructor": 0
                           },
                           {
                               "fields": [
                                   {
                                       "bytes": "fc8d65bf083804fdea0c86ac09e3685cd733e38df3d880c6ce9ddd01"
                                   },
                                   {
                                       "int": 19800
                                   }
                               ],
                               "constructor": 0
                           }
                       ]
                   },
                   {
                       "int": 1347600
                   }
               ],
               "constructor": 0
           }
       ],
       "constructor": 3
   }
   ```

   d. In this JSON, look for your public key hash (the "bytes" field) and the corresponding "int" value, which represents your reward in lovelaces (1 ADA = 1,000,000 lovelaces).

   e. To convert lovelaces to C3 tokens, divide the "int" value by 1,000,000. For example, if your "int" value is 1922900, your reward would be 1.9229 C3 tokens.

**Note: A dedicated node operators section is planned for the Charli3 portal to make this information more accessible.**

## Q2: What is the process to redeem C3 tokens?
A2: There are three methods to redeem C3 tokens:
1. Use a Python script (to be provided) that allows claiming available C3 tokens by inputting your mnemonic and oracle config details.

2. Utilize the automatic collection mechanism in the config file, which transfers tokens to a selected address when predefined conditions are met. Here's an example of the configuration:

   ```yaml
   Node:
     mnemonic: <%= @mnemonic_ada_charli3 %>
     oracle_curr: 2e527c8e42d0f28fd3f4025f60c0a89bc5815c8e2efc3fb973e3fc20
     oracle_address: addr_test1wz6jdu4f0eeamgzz2a8wt3eufux33nv6ju35z6r4de5rl0sncyqgh
     c3_token_hash: 436941ead56c61dbf9b92b5f566f7d5b9cac08f8c957f28f0bd60d4b
     c3_token_name: PAYMENTTOKEN
     c3_oracle_nft_name: "OracleFeed"
     c3_oracle_nft_hash: "ca9a3d8457735b989628ef1193a62f40799680e2bfcaf8936211420c"
     c3_oracle_rate_address: "addr_test1wqf99gagnjgfamek9v9vyrwulwh64xdnerq9xkvfhwyeu3qdufj2x"
     reward_collection_trigger: 100000000
     reward_destination_address: "addr_test1wqf99gagnjgfamek9v9vyrwulwh64xdnerq9xkvfhwyeu3qdufj2x"
     node_sync_api: "http://localhost:3000"
   ```

   Key reward parameters:
   - `reward_collection_trigger`: This sets the threshold (in lovelaces) at which automatic collection is triggered. In this example, it's set to 100,000,000 C3 lovelaces (100 Charli3).
   - `reward_destination_address`: This is the address where collected rewards will be sent.

   When the accumulated rewards reach or exceed the `reward_collection_trigger` value, they will be automatically collected and sent to the `reward_destination_address`.

3. A third option will be implemented to claim tokens directly from the Node Operator UI.

## Q3: How is the collateral (slash-able deposit) commitment made?
A3: Currently, the collateral process is handled manually by the Charli3 Team. For more detailed information, please contact the Charli3 team directly.
