// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "lib/openzeppelin-contracts/contracts/token/ERC721/ERC721.sol";
import "lib/openzeppelin-contracts/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "lib/openzeppelin-contracts/contracts/token/ERC721/extensions/ERC721Pausable.sol";
import "lib/openzeppelin-contracts/contracts/access/Ownable.sol";
import "./ERC2771Recipient.sol";

contract CrimeRecord is ERC721, ERC721URIStorage, Ownable, ERC721Pausable, ERC2771Recipient {
    uint256 private _nextTokenId;
    address trustedForwarder;

    event Mint(address user, string uri);

    constructor(address initialOwner, address _trustedForwarder)
        ERC721("CrimeRecords", "CRD")
        Ownable(initialOwner)
    {trustedForwarder = _trustedForwarder;}

    function coverCrime(string memory uri) public {
        uint256 tokenId = _nextTokenId++;
        _safeMint(_msgSender(), tokenId);
        _setTokenURI(tokenId, uri);
        emit Mint(_msgSender(), uri);
    }

    function setTrustedForwarder(address _forwarder) external onlyOwner() {
        _setTrustedForwarder(_forwarder);
    }


     function pause() public onlyOwner {
        _pause();
    }

    function unpause() public onlyOwner {
        _unpause();
    }

  function _update(address to, uint256 tokenId, address auth)
        internal
        override(ERC721, ERC721Pausable)
        returns (address)
    {
        return super._update(to, tokenId, auth);
    }

    function tokenURI(uint256 tokenId)
        public
        view
        override(ERC721, ERC721URIStorage)
        returns (string memory)
    {
        return super.tokenURI(tokenId);
    }

    function supportsInterface(bytes4 interfaceId)
        public
        view
        override(ERC721, ERC721URIStorage)
        returns (bool)
    {
        return super.supportsInterface(interfaceId);
    }

    function _msgSender() internal override(Context, ERC2771Recipient) virtual view returns (address ret) {
       ret = super._msgSender();
    }

    function _msgData() internal override(Context, ERC2771Recipient) virtual view returns (bytes calldata ret) {
        ret = super._msgData();
    }

    
}
