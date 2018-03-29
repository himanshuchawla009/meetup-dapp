var meetup = artifacts.require("./Meetup.sol");

// Test suite
contract(meetup,function(accounts){
    var contractInstance;
    var owner = accounts[0];
    var talkTitle = "Talk 1";
    var location = "Room 1";
    var startTime = new Date('11/07/2017 09:30').getTime() / 1000;
    var endTime = new Date('11/07/2017 12:30').getTime() / 1000;
    var speakerAccount = "0x45b23edabf54872331e9a9ea24e113a7a61265f5";
var speakerFullName = "John Doe";
    it("should be initialized with empty values",function(){
       
    return meetup.deployed().then(function(instance){

       return instance.getTalk().then(function(data){
           assert.equal(data[0],"","talk name must be empty");
           assert.equal(data[1],"","talk location must be empty");
           assert.equal(data[2].toNumber(),0,"talk starttime must be zero");
           assert.equal(data[3].toNumber(),0,"talk endtime must be zero");
           assert.equal(data[4],0x0,"speaker address must be empty");
           assert.equal(data[5],"","speaker name must be empty");

          

        })
    })
});
it("should add a talk",function(){
    meetup.deployed().then(function(instance){
        contractInstance=instance;
        return contractInstance.addTalk(talkTitle,location,startTime,endTime,speakerAccount,speakerFullName,{from:owner})
        .then(function(){
           return contractInstance.getTalk().then(function(data){
               assert.equal(data[0],talkTitle,"talk name must be" + talkTitle);
               assert.equal(data[1],location,"talk name must be" + location);
               assert.equal(data[2].toNumber(),startTime,"talk name must be" + startTime);
               assert.equal(data[3].toNumber(),endTime,"talk name must be" + endTime);
               assert.equal(data[4],speakerAccount,"talk name must be" + speakerAccount);
               assert.equal(data[5],speakerFullName,"talk name must be" + speakerFullName);
                      })
        })
    })

});
it("should emit a event when talk is added",function(){
    meetup.deployed().then(function(instance){
        
       return instance.addTalk(talkTitle,location,startTime,endTime,speakerAccount,speakerFullName,{from:owner})
       .then(function(reciept){
           assert.equal(reciept.logs.length,1,"one event must be emitted");
           assert.equal(reciept.logs[0].event,AddTalkEvent,"event name must be"+ AddTalkEvent);
           assert.equal(reciept.logs[0].args._title,title,"event title must be " + title);


       })
    })
})

});