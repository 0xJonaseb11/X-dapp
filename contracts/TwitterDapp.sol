// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0;


import { ERC721 } from "openzeppelin/contracts/token/ERC721/ERC721.sol";
import { Strinfs } from "openzeppelin/contracts/utils/Strings.sol";
import { Base64 } from "openzeppelin/contracts/utils/Base64.sol";

contract TwitterDapp is ERC721 ("TwitterDApp", "TDAPP"){

    // state variables
    uint256 tokenId;
    tweet[] public tweets;

    struct tweet {
        string name;
        string description;
        uint256 upvotes;
        string[] comments;
        address fromAddress;
    }

    function tokenURI(uint256 _tokenId)
        public
        view
        override
        returns (string memory)
    {
        bytes memory dataURI = abi.encodePacked(
            '{',
                '"name":', '"', tweets[_tokenId].name, '",'  '"description":' , '"',  tweets[_tokenId].description, '"', ',' ,

            '"attributes":', '[', '{', '"trait_type":', '"Upvotes",' , '"value":', Strings.toString(tweets[_tokenId].upvotes), '}', ']' , '}'
        );


        return string(
            abi.encodePacked(
                "data:application/json;base64,",
                Base64.encode(dataURI)
            )
        );
    }


}