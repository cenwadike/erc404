// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import {ERC404} from "./ERC404.sol";
import {Ownable} from "@openzeppelin/contracts/access/Ownable.sol";
import {Strings} from "@openzeppelin/contracts/utils/Strings.sol";

contract HybridToken is Ownable, ERC404 {
    constructor(
        string memory name_,
        string memory symbol_,
        uint8 decimals_,
        uint256 maxTotalSupplyERC721_,
        address initialOwner_,
        address initialMintRecipient_
    ) ERC404(name_, symbol_, decimals_) Ownable(initialOwner_) {
        _setERC721TransferExempt(initialMintRecipient_, true);
        _mintERC20(initialMintRecipient_, maxTotalSupplyERC721_, false);
    }

    function tokenURI(uint256 id_) public pure override returns (string memory) {
        return string.concat("https://example.com/token/", Strings.toString(id_));
    }

    function mintERC20(
        address account_,
        uint256 value_,
        bool mintCorrespondingERC721s_
    ) external {
        _mintERC20(account_, value_, mintCorrespondingERC721s_);
    }

    function setERC721TransferExempt(address account_, bool value_) external {
        _setERC721TransferExempt(account_, value_);
    }
}
