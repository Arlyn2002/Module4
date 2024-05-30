# Arlynshoes ERC20 Token

Arlynshoes is an ERC20 token with additional functionalities for minting tokens and purchasing shoes. This contract also implements the `Ownable` pattern to restrict certain operations to the contract owner.

## Contract Overview

### `Arlynshoes` Contract

- Inherits from `ERC20` and `Ownable`.
- Represents a token called "DEGEN" with a symbol "DGN".

### State Variables

- `ShoesPrices`: A mapping from shoe type (uint256) to their respective prices (uint256).

### Constructor

- Initializes the token with the name "DEGEN" and symbol "DGN".
- Sets the deployer as the owner.
- Initializes the shoe prices for four types of shoes.

### Functions

#### `mintDGN(address _to, uint256 _amount)`

- Mints `_amount` of DGN tokens to the `_to` address.
- Can only be called by the owner.

#### `transferDGN(address _to, uint256 _amount)`

- Transfers `_amount` of DGN tokens from the caller to the `_to` address.
- Requires the caller to have a sufficient balance.

#### `buyShoes(uint256 shoeType)`

- Allows users to buy shoes by paying the price in DGN tokens.
- Checks if the shoe type exists.
- Transfers the required amount of DGN tokens from the caller to the owner.

## Getting Started

### Prerequisites

- Node.js
- Truffle
- Ganache (or any Ethereum testnet)

### Installation

1. Clone the repository:
   ```sh
   git clone https://github.com/yourusername/arlynshoes.git
   cd arlynshoes
   ```

2. Install dependencies:
   ```sh
   npm install
   ```

3. Compile the contracts:
   ```sh
   truffle compile
   ```

### Deployment

1. Start your Ethereum testnet (e.g., Ganache).

2. Deploy the contracts:
   ```sh
   truffle migrate --network development
   ```

### Testing

Run the tests to ensure the contract works as expected:
```sh
truffle test
```

## Usage

### Minting Tokens

Only the contract owner can mint new DGN tokens.

```solidity
function mintDGN(address _to, uint256 _amount) public onlyOwner
```

### Transferring Tokens

Users can transfer DGN tokens to another address.

```solidity
function transferDGN(address _to, uint256 _amount) public
```

### Buying Shoes

Users can buy shoes by specifying the shoe type and ensuring they have enough DGN tokens.

```solidity
function buyShoes(uint256 shoeType) public
```

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Acknowledgments

- OpenZeppelin for their Solidity library
- Truffle for development framework
- Remix for online Solidity IDE
