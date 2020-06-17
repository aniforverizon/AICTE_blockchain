pragma solidity ^0.5.0;

contract SimpleBank{
    
    mapping (address=>uint ) private balances;
    
    address public owner;
    
    event LogDepositMade(string hello,
    address accountAddress,uint Amount);
    
    function Own() public{
        owner=msg.sender;
    }
    
    function deposit()public payable returns (uint){
        require((balances[msg.sender]+msg.value)>=balances[msg.sender]);
        balances[msg.sender]+=msg.value;
        emit LogDepositMade("Money Deposited",msg.sender,msg.value);
        return balances[msg.sender];
    }
    
    function withdraw(uint withdrawAmount) public returns (uint remainingBal){
        require(withdrawAmount <= balances[msg.sender]);
        balances[msg.sender]-=withdrawAmount;
        msg.sender.transfer(withdrawAmount);
        return balances[msg.sender];
    }
    
    function balance() view public returns (uint){
        return balances[msg.sender];
    }
    
    
}