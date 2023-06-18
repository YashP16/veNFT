# Liquid ve-NFT Token

### Context:
The veToken model, originating from Curve's (veCRV) token, is a significant development in the token economy of digital assets. Since its introduction, it has been adopted by many other DeFi protocols and has undergone several transformations.

The value of veToken primarily comes from its governance rights. Holders of veToken stake the protocol's governance token for extended periods to drive the protocol, influence its emissions, and share in the protocol's earnings.

### Objective
Current models of veToken have some drawbacks and this project is essentially built to address those concerns. 
* User's stake their tokens for longer periods to earn higher incentives, however given the nature of the veToken model, user's assets are locked for long long time (like 4 years) and there is no other way out, but to wait for unlock time. 
* Meta-governance protocols provide an alternate option of liquid staking while getting the exact benefits for the users, which ends up with these governance protocols handling majority of veTokens.

### Proposal
Make the veToken an nft. Allowing user's to create multiple staking positions for each address, and brining them a flexibility to sell of their positions in case of need in an external / protocol's provided market. 


### References
ve(3,3) https://andrecronje.medium.com/ve-3-3-curves-initial-distribution-competition-building-a-protocol-for-protocols-79a1ff1cf1a1

BaseContract: https://github.com/Sperax/Vote-Escrow-Smart-Contract-Template

### Future Scope
* Optimize the process of querying a user's balance.
* Implement a protocol-provided marketplace to facilitate the sale of existing veNFT positions.
* Add more advanced functionalities such as merging and splitting existing NFT positions.
* Redesign the Gauge architecture to incorporate the veNFT model.


# Commands:
To set up the repository, please use the following commands:

```shell
$ npm ci
$ forge build --force
$ forge test
$ forge coverage
```


