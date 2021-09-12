// contracts/StockNft.sol
// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/utils/Counters.sol";

contract StockNft is ERC721 {
    struct nftMetadata {
        uint256 nftID;
        string name;
        string ipfsHash;
        uint256 price;
        string author;
        string description;
    }

    using Counters for Counters.Counter;
    Counters.Counter private _tokenIds;

    nftMetadata[] public nfts;
    mapping(uint256 => nftMetadata) public getNft;

    event CreatNftEvent(uint256 id, address owner);

    constructor(string memory name, string memory symbol)
        ERC721(name, symbol)
    {}

    /**
     * @notice Creates an nft.
     *
     * @param _name Name of nft
     * @param _ipfsHash Ipfs Hash of nft media
     * @param _price Price of nft (in eth)
     * @param _author Author of nft
     * @param _description More details description nft
     * @param _recipient Address to mint NFT to.
     */
    function createNft(
        string memory _name,
        string memory _ipfsHash,
        uint256 _price,
        string memory _author,
        string memory _description,
        address _recipient
    ) public returns (uint256) {
        _tokenIds.increment();

        uint256 nftId = _tokenIds.current();

        nftMetadata memory data = nftMetadata({
            nftID: nftId,
            name: _name,
            ipfsHash: _ipfsHash,
            price: _price,
            author: _author,
            description: _description
        });

        nfts.push(data);
        getNft[nftId] = data;

        _safeMint(_recipient, nftId);

        emit CreatNftEvent(nftId, _recipient);

        return nftId;
    }

    function _baseURI() internal pure override returns (string memory) {
        return "https://www.stocknft.com/api/NFT/";
    }
}
