# Crime Records Smart Contract Documentation

## Overview
The Crime Records smart contract is a decentralized application built on the Base blockchain, designed to manage crime records as non-fungible tokens (NFTs). The contract provides a framework for creating, managing, and transferring crime records, ensuring transparency, security, and immutability.

### License
The Crime Records smart contract is released under the MIT license.

### Compiler Version
The contract is compatible with Solidity compiler version 0.8.20 and above.

### Imports
The contract imports various ERC standards and other contracts necessary for its functionality from the OpenZeppelin library.

## Contract Declaration
The contract is named `CrimeRecord` and inherits from several contracts: ERC721, ERC721URIStorage, Ownable, ERC721Pausable, and ERC2771Recipient.

## State Variables
- `_nextTokenId`: A private variable that tracks the ID to be assigned to the next crime record token.
- `trustedForwarder`: A variable that stores the address of a trusted forwarder contract.

## Events
- `Mint`: Emitted when a new crime record is minted. Includes the address of the user minting the record and the URI associated with the record.

## Constructor
Initializes the contract with the provided initial owner and trusted forwarder address.

## Functions
- `coverCrime`: Allows users to create a new crime record by minting an NFT. Takes a URI as input, assigns a token ID, mints the token to the message sender, sets its URI, and emits the `Mint` event.
- `setTrustedForwarder`: Allows the owner to set a new trusted forwarder address.
- `pause` and `unpause`: Functions to pause and unpause the contract. Only executable by the contract owner.
- `_update`, `tokenURI`, `supportsInterface`, `_msgSender`, `_msgData`: Override functions from inherited contracts to customize their behavior.

## Modifiers
- `onlyOwner`: Ensures that only the contract owner can execute certain functions.

## Event Handlers
The following event handlers are defined to capture relevant information emitted by the CrimeRecords contract events:
- `handleApproval`
- `handleApprovalForAll`
- `handleBatchMetadataUpdate`
- `handleMetadataUpdate`
- `handleMint`
- `handleOwnershipTransferred`
- `handlePaused`
- `handleTransfer`
- `handleUnpaused`

These event handlers create new entities with details such as owner, approved address, token ID, URI, and other relevant information, making it easier to query and analyze event data on the blockchain.

# (Contract Address)[https://sepolia.basescan.org/address/0x08224d5346fe0f05dad0b3eed040b5c0f0da6d6d]


# Smart Contract Documentation for Agreement

## Overview
The Agreement smart contract is a decentralized application built on the Base blockchain. It facilitates the creation, signing, and validation of legal agreements between parties. Each agreement is represented by a unique ID and contains information about the creator, content, and participants.

### License
This contract is released under the MIT License.

### Compiler Version
Compatible with Solidity compiler version ^0.8.20.

## Contract Declaration
The contract defines a struct `LegalAgreement` to represent each agreement, along with a struct `participants` to store participant details. It maintains a mapping of agreement IDs to `LegalAgreement` structs.

## Events
- `AgreementCreated`: Emitted when a new agreement is created.
- `AgreementSigned`: Emitted when an agreement is signed by a participant.
- `AgreementValid`: Emitted when an agreement is validated by its creator.

## Functions
- `createAgreement`: Allows the creation of a new agreement by specifying content and participant details.
- `signAgreement`: Allows a participant to sign an existing agreement.
- `validateSignature`: Allows the creator to validate the signatures of all parties involved in an agreement.
- `getAgreementDetails`: Retrieves details of a specific agreement.
- `getAllAgreements`: Retrieves IDs of all existing agreements.

## Modifiers
- `onlyCreators`: Restricts access to certain functions to the creator of the agreement.

## Subgraph Functionality
The Agreement smart contract integrates with a subgraph to enable efficient querying and indexing of agreement-related events and data. This allows developers to build applications that require real-time access to agreement information on the Ethereum blockchain.

## Event Handlers (TypeScript)
Event handlers are implemented to capture and store relevant information emitted by the Agreement contract events. These handlers create entities for each event type, capturing details such as agreement ID, creator, content, signer, and validation status.

# Agreement (Contract Address)[https://sepolia.basescan.org/address/0x71B7d170E025CEDaeD65d5579330C865fe3633Ca]

## Conclusion
This document has provided a comprehensive overview of both the Agreement and Crime Records smart contracts, highlighting their key components, functionalities, event handling mechanisms, and integration with a subgraph.

The Agreement smart contract serves as a decentralized solution for managing legal agreements on the Ethereum blockchain. It enables the creation, signing, and validation of agreements between parties, ensuring transparency and immutability. The integration with a subgraph enhances its usability by enabling efficient querying and indexing of agreement-related data.

Similarly, the Crime Records smart contract offers a decentralized approach to managing crime records as non-fungible tokens (NFTs) on Ethereum. Its features, including minting, pausing, and setting a trusted forwarder, contribute to ensuring the security and transparency of crime record management. The event handlers defined in the documentation facilitate the capture of relevant information emitted by contract events, facilitating easier analysis and querying of event data on the blockchain.

Both contracts contribute to the advancement of decentralized applications (DApps) by providing efficient and secure solutions for managing legal agreements and crime records, respectively.
