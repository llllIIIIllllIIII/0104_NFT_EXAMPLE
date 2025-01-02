// SPDX-License-Identifier: MIT
pragma solidity ^0.8.22;

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";

contract PredefinedURINFT is ERC721URIStorage {
    mapping(uint256 => string) private _predefinedURIs;

    constructor() ERC721("PredefinedURINFT", "PUN") {
        // 預定義 URI 與 tokenId 的映射
        _predefinedURIs[1] = "ipfs://QmExampleHash1";
        _predefinedURIs[2] = "ipfs://QmExampleHash2";
        _predefinedURIs[3] = "ipfs://QmExampleHash3";
    }

    function mint(uint256 tokenId) public {
        require(bytes(_predefinedURIs[tokenId]).length > 0, "URI not defined for this tokenId");
        _safeMint(msg.sender, tokenId);
        _setTokenURI(tokenId, _predefinedURIs[tokenId]);
    }
}
