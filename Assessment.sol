// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";

contract MyToken is ERC20, Ownable, ERC20Burnable {

    event Mint(address indexed to, uint256 amount);
    event Burn(address indexed from, uint256 amount);
    event Teansfer(address indexed from, address indexed to, uint256 amount);

    constructor(string memory _name, string memory _symbol, address initialOwner) 
        ERC20(_name, _symbol) 
        Ownable(initialOwner) // Pass the initialOwner to the Ownable constructor
    {
        _mint(initialOwner, 100 * 10 ** decimals()); // Mint initial supply to the initialOwner
    }

    function mint(address to, uint256 amount) external onlyOwner {
        _mint(to, amount);
        emit Mint(to, amount);
    }

    function burnTokens(uint256 amount) external {
        require(balanceOf(msg.sender) >= amount, "Insufficient balance to burn tokens.");
        _burn(msg.sender, amount);
        emit Burn(msg.sender, amount);
    }

    function transferToken(address to, uint256 amount) external  {
        require(amount > 0, "Amount must be greater than zero");
        require(balanceOf(msg.sender) >= amount, "Not enough tokens to transfer");
        _transfer(_msgSender(),to , amount);
        emit Transfer(msg.sender, to, amount);
    }
    function getBalance(address account) public view returns (uint256) {
        return balanceOf(account);
    }
}
