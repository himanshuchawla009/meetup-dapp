var meetup = artifacts.require("./Meetup.sol");
module.exports=function(deployer){
    deployer.deploy(meetup);
};