# Asset Tokenization Smart Contract

This is an asset tokenization smart contract built in Solidity. Initially designed for the tokenization of street art, particularly graffiti, its architecture enables the digital representation of a wide range of physical and financial assets.

[![Solidity v0.8.18](https://img.shields.io/badge/Solidity-v0.8.18-blue.svg)](https://soliditylang.org/) [![Ganache](https://img.shields.io/badge/Ganache-CLI-orange.svg)](https://www.trufflesuite.com/ganache) [![Truffle](https://img.shields.io/badge/Truffle-v5.11.4-green.svg)](https://www.trufflesuite.com/truffle)

## How a Graffiti is Assigned to a User (Graffiti Artist)

1. **Graffiti Creation**: The graffiti artist creates their artwork in a physical space.
2. **Documentation**: A photo of the graffiti is taken and associated with additional data like location and date.
3. **Unique ID Generation**: An algorithm generates a unique ID for this graffiti.
4. **Upload to Blockchain**: The graffiti artist uses a User Interface (DApp) to register this graffiti on the blockchain.
5. **Confirmation**: Once the transaction is confirmed, the graffiti artist becomes the registered owner of that graffiti on the blockchain.
6. **Events and Evidence**: Blockchain events are emitted serving as immutable proof of ownership.

### Importance of Off-Chain Documentation

It's crucial to have solid off-chain documentation to authenticate that an `assetId` on the blockchain corresponds to a real-world physical asset. This could include authenticity certificates, legal records, GPS location, or even real-time verification mechanisms.

## Supported Asset Types

### Street Art

The tokenization of graffiti enables digital ownership of street art. This opens up opportunities for financing artists, sharing profits from artworks, and even facilitating art trade on secondary market platforms.

### Other Assets

Besides street art, this contract could be adapted to tokenize other types of assets, including but not limited to:

- **Real Estate**: Houses, buildings, lands.
- **Precious Materials**: Gold, silver, platinum.
- **Machinery**: Industrial equipment, vehicles.
- **Trees**: In a forest investment program.
- **Investment Funds**: Shares in diversified funds.
- **National Debt**: Government or corporate bonds.
- **Copyrights**: Software licenses, art copyrights.
- **Carbon Credits**: Emission reduction certificates.

## Contract Features

- Token creation representing assets.
- Asset ownership registry.
- Token transfer between owners.
- Access control for issuing new tokens.

## Installation & Usage

To install and use this contract, follow these steps:

1. Clone the repository:

   ```
   git clone https://github.com/oscarpascualbakker/asset-tokenization.git
   ```

2. Build the project:

   ```
   docker-compose build
   ```

## Testing & Static Code Analysis

For testing and static code analysis, you can use Truffle, Ganache, and Slither.

```
# Compile the contract
truffle compile

# Run tests
truffle test
```

If called through a Docker container:

```
docker compose run --rm assettokenization truffle test
```

For static code analysis, you can use Slither:

```
# Run Slither in the project directory
slither .
```

If called through a Docker container:

```
docker compose run --rm slither slither .
```

This should provide a detailed assessment of code quality and potential vulnerabilities.

## Disclaimer

This contract is a demonstration project and should not be used in a production environment without thorough review and adaptation. It's crucial to consider the legal and regulatory implications of asset tokenization in your jurisdiction.

## License

This project is licensed under the [MIT](https://opensource.org/licenses/MIT) License.
