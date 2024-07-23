// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract MyToken is ERC20, Ownable {

    event Mint(address indexed to, uint256 amount);
    event Burn(address indexed from, uint256 amount);

    constructor(string memory _name, string memory _symbol, address initialOwner) 
        ERC20(_name, _symbol) 
        Ownable(initialOwner) // Pass the initialOwner to the Ownable constructor
    {
        _mint(initialOwner, 100 * 10 ** decimals()); // Mint initial supply to the initialOwner
    }

    function mint(address to, uint256 amount) public onlyOwner {
        require(amount > 0, "Amount must be greater than zero");
        _mint(to, amount);
        emit Mint(to, amount);
    }

    function burn(uint256 amount) public {
        require(amount > 0, "Amount must be greater than zero");
        _burn(msg.sender, amount);
        emit Burn(msg.sender, amount);
    }

    function transfer(address to, uint256 amount) public override returns (bool) {
        require(amount > 0, "Amount must be greater than zero");
        require(balanceOf(msg.sender) >= amount, "Not enough tokens to transfer");
        _transfer(msg.sender, to, amount);
        return true; // Return true as per ERC20 standard
    }

    function getBalance(address account) public view returns (uint256) {
        return balanceOf(account);
    }
}
