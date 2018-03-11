pragma solidity ^0.4.18;

import "./Ownable.sol";

contract Meetup is Ownable {
    struct Talk {
        uint talk_id;
        string title;
        string location;
        bool canceled;
        address[] speakers;
    

    }
    // to do add speaker name string field in speaker struct
    struct Speaker {
        address account;
       
        uint[] talksId;
        
    }
    //state variables
    mapping( uint => Talk) public talks;
    mapping(address => Speaker) public speakers;
    uint totalTalks;
    //todo to add speakers name bytes array in addTalk function
    function addTalk(string _title,string _location,address[] speakerAddress) public {
       require(bytes(_title).length > 0);
       require(speakerAddress.length > 0);

       totalTalks++;

       talks[totalTalks].talk_id = totalTalks;
       talks[totalTalks].title = _title;
       talks[totalTalks].location = _location;
       talks[totalTalks].canceled = false;
       for ( uint i = 0 ;i < speakerAddress.length ; i++) {
            speakers[speakerAddress[i]].account = speakerAddress[i];
            speakers[speakerAddress[i]].talksId.push(totalTalks);
            talks[totalTalks].speakers.push(speakerAddress[i]);

       }
      
       

       
    }

    function cancelTalk(uint talkId) {
        require(bytes(talks[talkId].title).length>0);
        talks[talkId].canceled = true;

 }
    function checkIfTalkCanceled(uint talkId) public view returns (bool) {
        return talks[talkId].canceled;

    }
    function getTalk(uint talkId) public view returns
    (

        string title,
        string location,
        bool canceled,
        address[] _speakerAddress
    ) {
      require(bytes(talks[talkId].title).length>0);
     require(talks[talkId].canceled == false);
      Talk memory talk = talks[talkId];
      //todo define a for loop to get address and names of different speakers and return them
     
      return (talk.title,talk.location,talk.canceled,talk.speakers);

    }


}