pragma solidity >=0.7.0 <0.9.0;
// ----------------------------------------------------------------------------
// Stack overflow business contract
//
//
//
// (c) by TU Zhekun 2021. MIT Licence.
// ----------------------------------------------------------------------------
import "./mytoken.sol";

contract StackOverflow {
    
    IERC20 token;
    struct Topic {
        string title;
        string description; 
        address addOwner;
    }

    Topic[] public topic;

    struct Response {
        uint256 TopicID;
        string content;
        bool status;
        address addReplier;
    }
    
    Response[] public response;
    
    constructor() {
        token = new Token();
    }

    function postQuestion(string memory title, string memory description) public {
        topic.push(Topic(title, description, msg.sender));
    }
    
    function replyQuestion(uint256 TopicID, string memory content) public {
        response.push(Response(TopicID, content, false, msg.sender));
    }
    
    function validQuestion(uint256 ResponseID) public payable{
        if (msg.sender == topic[response[ResponseID].TopicID].addOwner) {
            response[ResponseID].status = true;
            require(response[ResponseID].status == true, "Status Error");
            token.transfer(response[ResponseID].addReplier, 1);
        }
    }
    
        
    function getTopicAttri(uint256 TopicID) public returns (string memory title, string memory description, address addOwner) {
        return (topic[TopicID].title, topic[TopicID].description, topic[TopicID].addOwner);
    }
    function getResponseAttri(uint256 ResponseID) public returns (uint TopicID, string memory content, bool status, address addReplier) {
        return (response[ResponseID].TopicID, response[ResponseID].content, response[ResponseID].status, response[ResponseID].addReplier);
    }    
    
    // function postQuestion(string title, string description, address IDwalllet) public pure returns (uint c) {
        // c = a + b;
        // require(c >= a);
    // }
    
}
