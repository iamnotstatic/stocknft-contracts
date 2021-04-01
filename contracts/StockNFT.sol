// contracts/StockNft.sol
// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/utils/Counters.sol";

contract StockNft is ERC721 {
    using Counters for Counters.Counter;
    Counters.Counter private _tokenIds;


    constructor(string memory name, string memory symbol) ERC721(name, symbol) {}

    function mint(address recipient) public returns (uint256) {
        _tokenIds.increment();

        uint256 tokenId = _tokenIds.current();
        _safeMint(recipient, tokenId);

        return tokenId;
    }

    function _baseURI() internal pure override returns(string memory) {
        return "https://www.stocknft.com/api/NFT/";
    }
}
