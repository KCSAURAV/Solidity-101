pragma solidity ^0.4.0;
contract newCoin{
    
 struct Account {
    string owner;
    uint balance;
 }
 
 Account[] crypto_acc; // list of accounts
 mapping (address => uint) accountBalance;
//   mapping (uint => string) id;
  
 function createAccount( string _str, uint _bal) public { 
     address account = msg.sender; // fire..it will be ethereum address to a particular account
     uint id_ = crypto_acc.push(Account(_str,_bal));
     accountBalance[account] = id_;
 }
  
 function getBalance()public view returns(uint){
    address owner = msg.sender; // contract owner
    uint id_ = accountBalance[owner]; // id of the mapped user
    return crypto_acc[id_ - 1].balance; // since arrays start at 0
 }
 
 function getAverageTotal() public view returns(uint){ // average of all accountBalance
   uint sum = 0;
   for(uint i = 0; i<crypto_acc.length;i++){
     sum += crypto_acc[i].balance; // first sum all balances
   }
   return sum/crypto_acc.length;
 }
 }
