pragma solidity ^0.4.24;

// ----------------------------------------------------------------------------
// Dividends implementation interface
// ----------------------------------------------------------------------------
contract DividendsDistributor {
    function totalDividends() public constant returns (uint);
    function totalUndistributedDividends() public constant returns (uint);
    function totalDistributedDividends() public constant returns (uint);
    function totalPaidDividends() public constant returns (uint);
    function balanceOf(address tokenOwner) public constant returns (uint balance);
    function distributeDividendsOnTransferFrom(address from, address to, uint tokens) public returns (bool success);
    function withdrawDividends() public returns(bool success);

    event DividendsDistributed(address indexed tokenOwner, uint dividends);
    event DividendsPaid(address indexed tokenOwner, uint dividends);
}
