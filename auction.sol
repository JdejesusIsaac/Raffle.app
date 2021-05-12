pragma solidity 0.6.3;

contract Auction {
    
    
    struct Item {
        uint itemId;
        uint[] itemTokens;
    }
    
    struct Person {
        uint remainingTokens; // token remaining with bidder
        uint personId; // it serves as tokenId as well
        address addr; // address of bidder
    }
    
    mapping (address => Person) tokenDetails; // address to person
    Person [4] bidders; //Array containing 4 person objects 
    
    Item [3] public items; //Array containing 3 item objects
    address [3] public winners; //Array for address of winners
    address public beneficiary; // owner of smart contract
    
    uint bidderCount=0; // counter
    
    //functions
    
    function Raffle() public payable{ //constructor
        //Part 1 Task 1. Initialize beneficiary with address of smart contracts owner
        //hint. In constructor, "msg.sender" is the address of owner
        beneficiary = msg.sender;
        uint[] memory emptyArrray;
        items[0] = Item({itemId:0,itemTokens:emptyArrray});
        
        //part 2. InITIALIAZE two items with at index 1 and 2.
        items[1] = Item({itemId:1,itemTokens:emptyArrray});
        items[2] = Item({itemId:2,itemTokens:emptyArrray});
        
    
        
    }
    
    function register() public payable{
        bidders[bidderCount].personId = bidderCount;
        //part task3. InITIALIAZE the address of the bidderCount
        //*hint. here the bidders[bidderCount].addr should be InITIALIAZEd with address of the registrant.
        bidders[bidderCount].addr = msg.sender;
        
        bidders[bidderCount].remainingTokens = 5; // only 5 itemTokens
        tokenDetails[msg.sender]=bidders[bidderCount];
        bidderCount++;
        
    }
    
    function bid(uint _itemId, uint _count) public payable{
        if (tokenDetails[msg.sender].remainingTokens < _count || tokenDetails[msg.sender].remainingTokens == 0) {revert();}
        if (_itemId > 2) {revert();
            uint balance = tokenDetails[msg.sender].remainingTokens - _count;
            
            tokenDetails[msg.sender].remainingTokens = balance;
            bidders[tokenDetails[msg.sender].personId].remainingTokens = balance;
            
            Item storage bidItem = items[_itemId];
            for(uint i=0; i < _count; i++) {
                bidItem.itemTokens.push(tokenDetails[msg.sender].personId);
            }
            
        }
        
        
        
       
        
        
    }
    