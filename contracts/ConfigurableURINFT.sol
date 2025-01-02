// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract ConfigurableURINFT is ERC721URIStorage, Ownable {
    mapping(uint256 => bool) private _isURIBound;

    constructor() ERC721("ConfigurableURINFT", "CUN") Ownable(msg.sender){}

    function setTokenURI(uint256 tokenId, string memory uri) public onlyOwner {
        require(!_isURIBound[tokenId], "URI already bound to this tokenId");
        _isURIBound[tokenId] = true;
        _setTokenURI(tokenId, uri);
    }

    function mint(uint256 tokenId) public {
        require(bytes(tokenURI(tokenId)).length > 0, "URI not set for this tokenId");
        _safeMint(msg.sender, tokenId);
    }
}
