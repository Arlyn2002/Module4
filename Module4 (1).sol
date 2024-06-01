// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract Module4 is ERC20 {
    event TransferCustom(address indexed from, address indexed to, uint256 value);
    event Burn(address indexed burner, uint256 value);
    event Mint(address indexed to, uint256 value);
    event Redeem(address indexed user, uint256 amount, string item);

    constructor() ERC20("Assessment", "Arlyn Garcia") {
        _mint(msg.sender, 200 * (10 ** uint256(decimals())));
    }

    function transfer(address recipient, uint256 amount) public override returns (bool) {
        bool success = super.transfer(recipient, amount);
        if (success) {
            emit TransferCustom(msg.sender, recipient, amount);
        }
        return success;
    }

    function burn(uint256 amount) public {
        _burn(msg.sender, amount);
        emit Burn(msg.sender, amount);
    }

    function mint(address to, uint256 amount) public {
        _mint(to, amount);
        emit Mint(to, amount);
    }

    function redeem(uint256 amount, string memory item) public {
        require(balanceOf(msg.sender) >= amount, "Insufficient balance to redeem");

        // Burn the tokens being redeemed
        _burn(msg.sender, amount);

        // Deliver the item to the user
        deliverItem(msg.sender, item);

        emit Redeem(msg.sender, amount, item);
    }

    function deliverItem(address user, string memory item) internal {
        // Implement the logic to deliver the item to the user
        // This could be minting an NFT, transferring another token, etc.
        // For demonstration, we just log the item delivery
    }
}
