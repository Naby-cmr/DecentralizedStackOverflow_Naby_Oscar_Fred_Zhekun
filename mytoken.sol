// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

 

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC20/ERC20.sol";



contract Token is ERC20 {

 

    constructor () ERC20("Token", "TKN") {
        _mint(msg.sender, 1000000 * (10 ** uint256(decimals())));
    }
    
}
