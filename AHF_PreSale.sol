pragma solidity ^0.4.24;

import "./Owned.sol";
import "./ERC20Interface.sol";

// ----------------------------------------------------------------------------
// Dividends implementation interface
// ----------------------------------------------------------------------------
contract AHF_PreSale is Owned {
    ERC20Interface public tokenContract;
    address public vaultAddress;
    bool public fundingEnabled;
    uint public totalCollected;         // In wei
    uint public tokenPrice;         // In wei

    // ------------------------------------------------------------------------
    // Constructor
    // ------------------------------------------------------------------------
    constructor(address _tokenAddress, address _vaultAddress) public {
        tokenContract = ERC20Interface(_tokenAddress);
        vaultAddress = _vaultAddress;
        fundingEnabled = true;
    }
    
    function updateTokenPrice(uint _newTokenPrice) public onlyOwner {
        tokenPrice = _newTokenPrice;
        return;
    }

    function () public payable {
        require (fundingEnabled && (tokenPrice > 0) && (msg.value >= tokenPrice));
        
        totalCollected += msg.value;

        //Send the ether to the vault
        vaultAddress.transfer(msg.value);

        uint tokens = (msg.value * 10**18) / tokenPrice;
        require (tokenContract.transfer(msg.sender, tokens));

        return;
    }

    /// @notice This method can be used by the owner to extract mistakenly
    ///  sent tokens to this contract.
    /// @param _token The address of the token contract that you want to recover
    ///  set to 0 in case you want to extract ether.
    function claimTokens(address _token) public onlyOwner {
        if (_token == 0x0) {
            owner.transfer(address(this).balance);
            return;
        }

        ERC20Interface token = ERC20Interface(_token);
        uint balance = token.balanceOf(this);
        token.transfer(owner, balance);
        emit ClaimedTokens(_token, owner, balance);
    }
    
    event ClaimedTokens(address indexed _token, address indexed _controller, uint _amount);
}
