// SPDX-License-Identifier: MIT
// this is where our code is going to go

pragma solidity >=0.7.0 <0.9.0;

contract Will {
 
 address owner;
 uint fortune;
 bool deceased;

  constructor() payable   {
     owner = msg.sender; //msg sender represent address that is being called
     fortune = msg.value; //msg value represent value of how much ether is being sent
     deceased = false;

  }
  // create  a modifier so the only person that can call this contract is the owener
   modifier  onlyOwner {

    require(msg.sender == owner, "You are not the owner");
    _; // this means to continue to run the code 

   }
  //create contract so that we only allocate funds if am deceased 
  modifier  mustBeDeceased {
  
  require(deceased == true, "Owner is not deceased");
  _;
  }

  // in this logic we want to be able to distribute funds to the deceseased familly 
  // first we get the family wallet details
  //second we loop over them

  // create an array that will store all of the addresses of the owner family
  // list of family wallets
  address payable  [] familyWallets;

  //create a map function that will iterate/loop over the array and bring out all addressess
  // or map through inheritance 
  mapping (address => uint) inheritance;

  //set inheritance for each address
  function setInheritance(address payable  wallet, uint amount) public onlyOwner {
    //add wallet to the family wallet
    familyWallets.push(wallet);
    //set the inheritance mapping 
    inheritance[wallet] = amount;

  }

    /// Payout function to distribute the inheritance
    function payout() private mustBeDeceased {
        for (uint i = 0; i < familyWallets.length; i++) {
            familyWallets[i].transfer(inheritance[familyWallets[i]]);
        }
    }

   // Function to set the deceased state and trigger payout
    function setDeceased() public onlyOwner {

      deceased = true;
      payout();  
    }

  




}