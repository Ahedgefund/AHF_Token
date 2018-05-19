pragma solidity ^0.4.24;

import "./Owned.sol";
import "./DividendsDistributor.sol";

// ----------------------------------------------------------------------------
// Dividends implementation interface
// ----------------------------------------------------------------------------
contract AHF_DividendsDistributor is DividendsDistributor, Owned {
    address public tokenContract;

    modifier onlyTokenContract {
        require(msg.sender == tokenContract);
        _;
    }

    function setTokenContract(address _newTokenContract) public onlyOwner {
        tokenContract = _newTokenContract;
    }

    function totalDividends() public constant returns (uint) {
        return 0;
    }

    function totalUndistributedDividends() public constant returns (uint) {
        return 0;
    }

    function totalDistributedDividends() public constant returns (uint) {
        return 0;
    }

    function totalPaidDividends() public constant returns (uint) {
        return 0;
    }

    function balanceOf(address tokenOwner) public constant returns (uint balance) {
        return 0;
    }

    function distributeDividendsOnTransferFrom(address from, address to, uint tokens) public onlyTokenContract returns (bool success) {
        emit DividendsDistributed(from, 0);
        emit DividendsDistributed(to, 0);
        return true;
    }

    function withdrawDividends() public returns(bool success) {
        emit DividendsPaid(msg.sender, 0);
        return true;
    }

    event DividendsDistributed(address indexed tokenOwner, uint dividends);
    event DividendsPaid(address indexed tokenOwner, uint dividends);
}
