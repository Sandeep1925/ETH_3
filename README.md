## Project Title  
MyToken Smart Contract

## Problem Statement
Create a basictoken named MyToken with minting, transferring, and burning functionality. This contract allows the owner to mint new tokens, users to transfer tokens to each other, and any token holder to burn their tokens.

## Prerequisites
Solidity ^0.8.0


## Description  
The MyToken contract implements a simple token with the following features:

1. Minting: The owner can mint new tokens to any address.
2. Transferring: Users can transfer tokens to each other.
3. Burning: Any user can burn their tokens.
4. Check Balance: Users can check the balance of any address.


## Getting Started

### Installing  
To run this program, you can use Remix, an online Solidity IDE. To get started, go to the Remix website at https://remix.ethereum.org/.

Once you are on the Remix website, create a new file by clicking on the "+" icon in the left-hand sidebar. Save the file with a .sol extension. Copy and paste the following code into the file:

```javascript
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MyToken {
    uint256 public totalSupply;
    string public name;
    string public symbol;
    address public owner;

    mapping(address => uint256) public balances;

    event Transfer(address indexed from, address indexed to, uint256 amount);
    event Mint(address indexed to, uint256 amount);
    event Burn(address indexed from, uint256 amount);

    constructor(string memory _name, string memory _symbol, address _owner) {
        name = _name;
        symbol = _symbol;
        owner = _owner;
        totalSupply = 1000000;
        balances[msg.sender] = totalSupply;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Only the owner can call this function");
        _;
    }

    function mint(address to, uint256 amount) public onlyOwner {
        require(amount > 0, "Amount must be greater than zero");
        balances[to] += amount;
        totalSupply += amount;
        emit Mint(to, amount);
        emit Transfer(address(0), to, amount);
    }

    function burn(uint256 amount) public {
        require(amount > 0, "Amount must be greater than zero");
        require(balances[msg.sender] >= amount, "Not enough tokens to burn");
        balances[msg.sender] -= amount;
        totalSupply -= amount;
        emit Burn(msg.sender, amount);
        emit Transfer(msg.sender, address(0), amount);
    }

    function transfer(address to, uint256 amount) public {
        require(amount > 0, "Amount must be greater than zero");
        require(balances[msg.sender] >= amount, "Not enough tokens to transfer");
        balances[msg.sender] -= amount;
        balances[to] += amount;
        emit Transfer(msg.sender, to, amount);
    }

    function getBalance(address account) public view returns (uint256) {
        return balances[account];
    }
}


```

###  Executing program    
#### How to Run the Program      
1. Compile the Solidity contract.
2. Deploy the contract using your preferred Ethereum development environment. 

#### For Remix:    
1. Open Remix IDE.
2. Create and upload a new file named MyToken.sol.
3. Copy and paste the provided Solidity code into MyToken.sol.
4. Compile the contract .
5. Deploy the contract. 


## Authors  
Sandeep Kaur @Sandeep1925

## License  
This project is licensed under the MIT License - see the LICENSE.md file for details.  

We have established a solidity contract with this code. 
