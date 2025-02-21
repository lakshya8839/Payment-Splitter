pragma solidity ^0.8.0;

contract PaymentSplitter {
    address payable[] recipients;

    function addRecipients() private {
        recipients.push(payable(0x1111111111111111111111111111111111111111));
        recipients.push(payable(0x2222222222222222222222222222222222222222));
        recipients.push(payable(0x3333333333333333333333333333333333333333));
    }

    function distribute() public payable {
        require(msg.value > 0, "No funds sent");
        uint256 share = msg.value / recipients.length;
        
        for (uint256 i = 0; i < recipients.length; i++) {
            recipients[i].transfer(share);
        }
    }
}
