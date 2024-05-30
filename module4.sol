// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract Arlynshoes is ERC20, Ownable {
    mapping(uint256 => uint256) public ShoesPrices;
    
    constructor() ERC20("DEGEN", "DGN") Ownable(msg.sender) {
        ShoesPrices[1] = 1500;
        ShoesPrices[2] = 2000;
        ShoesPrices[3] = 1800;
        ShoesPrices[4] = 2500;
    }
    function mintDGN(address _to, uint256 _amount) public onlyOwner {
        _mint(_to, _amount);
    }
     function transferDGN(address _to, uint256 _amount) public {
        require(balanceOf(msg.sender) >= _amount, "Transfer Failed: Insufficient balance.");
        _transfer(msg.sender, _to, _amount);
    }
     function buyShoes(uint256 shoeType) public {
        require(ShoesPrices[shoeType] > 0, "Shoe type does not exist.");
        uint256 price = ShoesPrices[shoeType];
        require(balanceOf(msg.sender) >= price, "Insufficient balance to buy shoes.");
        _transfer(msg.sender, owner(), price);
    }
}