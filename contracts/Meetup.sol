pragma solidity ^0.4.18;

contract Meetup {
    address owner;
    string title;
    uint startTime;
    uint endTime;
    string location;
    address speakerAddress;
    string speakerName;
    //constructor
 function Meetup() {
    owner = msg.sender;

}
//event which emit when talk is added
event AddTalkEvent(string _title,uint _startTime,uint _endTime);
//addtalk
function addTalk(string _title,string _location,uint _startTime,uint _endTime,address _speakerAddress,string _speakerName) public {
    if (msg.sender != owner) {
        return;
    }
               title = _title;
               location = _location;
              startTime = _startTime;
            endTime = _endTime;
           
           speakerAddress = _speakerAddress;
           speakerName = _speakerName;
           AddTalkEvent(title,startTime,endTime);
}

 function getTalk() public view returns (
 string _title,
 string _location,
 uint _startTime,
 uint _endTime,
 address _speakerAddress,
 string _speakerName
 ) {

     return(title,location,startTime,endTime,speakerAddress,speakerName);

 }
}