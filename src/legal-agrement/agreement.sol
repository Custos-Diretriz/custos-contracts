// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Agreement {
    struct LegalAgreement {
        address creator;
        string content;
        address secondPartyAddress;
        mapping(address => participants) firstParty;
        mapping(address => participants) secondParty;
        bool signed;
        bool validateSignature;
    }
    struct participants {
        string name;
        string validId;
    }

    mapping(uint256 => LegalAgreement) public agreements;
    uint256 public agreementCount;

    event AgreementCreated(
        uint256 agreementId,
        address creator,
        string content
    );
    event AgreementSigned(uint256 agreementId, address signer);
    event AgreementValid(uint256 agreementId, string firstpartyid, string secondpartyid);

    modifier onlyCreators(uint _id, address sender) {
        address _creator = agreements[_id].creator;
        if (sender != _creator) {
            revert("invalid caller");
        }
        _;
    }

    function createAgreement(
        string memory _content,
        address _secondPartyAddress,
        string memory _firstPartyName,
        string memory _firstPartyValidId
    ) external returns (uint256) {
        agreementCount++;
        agreements[agreementCount].creator = msg.sender;
        agreements[agreementCount].content = _content;
        agreements[agreementCount].secondPartyAddress = _secondPartyAddress;
        agreements[agreementCount].firstParty[msg.sender] = participants(
            _firstPartyName,
            _firstPartyValidId
        );
        emit AgreementCreated(agreementCount, msg.sender, _content);
        return agreementCount;
    }

    function signAgreement(
        uint256 _agreementId,
        string memory _fullname,
        string memory _validId
    ) external {
        require(
            _agreementId <= agreementCount && _agreementId > 0,
            "Invalid agreement ID"
        );
        require(
            msg.sender == agreements[_agreementId].secondPartyAddress,
            "Only second party can sign the agreement"
        );
        require(!agreements[_agreementId].signed, "Agreement already signed");


        agreements[_agreementId].signed = true;
        agreements[_agreementId].secondParty[msg.sender] = participants(
            _fullname,
            _validId
        );
        emit AgreementSigned(_agreementId, msg.sender);
    }

function validateSignature(uint _agreementId) public onlyCreators(_agreementId, msg.sender) {
    require(_agreementId <= agreementCount && _agreementId > 0, "Invalid agreement ID");
    
    LegalAgreement storage agreement = agreements[_agreementId];
    
    // Check if both parties have signed the agreement
    require(agreement.signed, "Agreement is not signed yet");
    agreement.validateSignature = true;
    // Emit event indicating that the signature is valid
    emit AgreementValid(_agreementId, agreement.firstParty[agreement.creator].validId, agreement.secondParty[agreement.secondPartyAddress].validId);
}

    function getAgreementDetails(
        uint256 _agreementId
    )
        public
        view
        returns (
            address creator,
            string memory content,
            address secondPartyAddress,
            string memory firstPartyName,
            string memory firstPartyValidId,
            bool signed
        )
    {
        require(
            _agreementId <= agreementCount && _agreementId > 0,
            "Invalid agreement ID"
        );

        LegalAgreement storage agreement = agreements[_agreementId];

        creator = agreement.creator;
        content = agreement.content;
        secondPartyAddress = agreement.secondPartyAddress;
        firstPartyName = agreement.secondParty[msg.sender].name;
        firstPartyValidId = agreement.secondParty[msg.sender].validId;
        signed = agreement.signed;
    }

function getAllAgreements() external view returns (uint256[] memory) {
    uint256[] memory agreementIds = new uint256[](agreementCount);

    for (uint256 i = 1; i <= agreementCount; i++) {
        agreementIds[i - 1] = i;
    }

    return agreementIds;
}


}
