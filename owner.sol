// SPDX-License-Identifier: MIT
// this is where our code is going to go


pragma solidity >=0.7.0 <0.9.0;

// here am learning how to destructure and return multiple variables types, and keeping only one 
// solidity functitons below can return for us multiple variables of diffrent types 

contract DestructruingContract {

uint public changeValue;
string  public name  = "Tome";

// we wrap the pure returnns, and in the return we wrap it again with the value 
function f() public pure returns (uint, bool, string memory) {

return (3, true, "send");

}

}