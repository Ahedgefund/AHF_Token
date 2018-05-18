pragma solidity ^0.4.24;

// ----------------------------------------------------------------------------
// Safe maths
// ----------------------------------------------------------------------------
library SafeMath {
    function add(uint a, uint b) internal pure returns (uint c) {
        c = a + b;
        require(c >= a);
    }
    function sub(uint a, uint b) internal pure returns (uint c) {
        require(b <= a);
        c = a - b;
    }
    function mul(uint a, uint b) internal pure returns (uint c) {
        c = a * b;
        require(a == 0 || c / a == b);
    }
    function div(uint a, uint b) internal pure returns (uint c) {
        require(b > 0);
        c = a / b;
    }
}


// ----------------------------------------------------------------------------
// Dividends implementation
// ----------------------------------------------------------------------------
contract AHF_Dividends is Owned, DividendsImplementationInterface {
    uint private _totalDividends;
    uint private _totalUndistributedDividends;
    uint private _totalDistributedDividends;
    uint private _totalPaidDividends;

    mapping(address => uint) distributedBalances;

    // ------------------------------------------------------------------------
    // Constructor
    // ------------------------------------------------------------------------
    constructor(uint ) public {
    }


    function totalDividends() public constant returns (uint) {
        return _totalDividends
    }
    function totalUndistributedDividends() public constant returns (uint) {
        return _totalUndistributedDividends
    }
    function totalDistributedDividends() public constant returns (uint) {
        return _totalDistributedDividends
    }
    function totalPaidDividends() public constant returns (uint) {
        return _totalPaidDividends
    }
    function dividendsBalanceOf(address tokenOwner) public constant returns (uint) {
        return distributedBalances[tokenOwner];
    }
    function distributeDividendsOnTransferFrom(address from, address to, uint tokens) public returns (uint from_dividends, uint to_dividends) {
        
    }
    function withdrawDividends(address tokenOwner) public returns(uint dividends) {
        
    }
}

