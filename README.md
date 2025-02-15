## Project Title  
MyToken Smart Contract

## Problem Statement
Create a ERC20 token named MyToken with minting, transferring, and burning functionality. This contract allows the owner to mint new tokens, users to transfer tokens to each other, and any token holder to burn their tokens.

## Description  
The MyToken contract implements a simple token with the following features:

1. Minting: The owner can mint new tokens to any address.
2. Transferring: Users can transfer tokens to each other.
3. Burning: Any user can burn their tokens.
4. Check Balance: Users can check the balance of any address.

## Features

1. ERC20 Standard Compliance: Implements the standard ERC20 interface.
2. Ownable: Only the contract owner can mint new tokens.
3. Burnable: Token holders can burn their own tokens.
4. Custom Events: Emits events for minting, burning, and transfers.


## Getting Started

### Installing  
To run this program, you can use Remix, an online Solidity IDE. To get started, go to the Remix website at https://remix.ethereum.org/.

Once you are on the Remix website, create a new file by clicking on the "+" icon in the left-hand sidebar. Save the file with a .sol extension. Copy and paste the following code into the file:

```javascript
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


```

###  Executing program    
#### How to Run the Program      
1. Compile the Solidity contract.
2. Deploy the contract using your preferred Ethereum development environment. 

#### For Remix:    
1. Open Remix IDE.
2. Create and upload a new file named Assesment.sol.
3. Copy and paste the provided Solidity code into Assesment.sol.
4. Compile the contract .
5. Deploy the contract. 


## Authors  
Sandeep Kaur @Sandeep1925

## License  
This project is licensed under the MIT License - see the LICENSE.md file for details.  

We have established a solidity contract with this code. 
