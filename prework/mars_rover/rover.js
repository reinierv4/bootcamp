var myRover = {
  position: [0,0], 
  //1 = North, 2 = East, 3 = Sout, 4 = West
  direction: 'N'
};

var yourRover = {
  position: [2,0], 
  //1 = North, 2 = East, 3 = Sout, 4 = West
  direction: 'S'
};

function goForward(rover) {
  switch(rover.direction) {
    case 'N':
      rover.position[0]=(rover.position[0]+1)%10;
      break;
    case 'E':
      rover.position[1]=(rover.position[1]+1)%10;
      break;
    case 'S':
      if(rover.position[0]===0){
        rover.position[0] = rover.position[0]+10;
      }
      rover.position[0]=(rover.position[0]-1)%10;
      break;
    case 'W':
      if(rover.position[1]===0){
        rover.position[1] = rover.position[1]+10;
      }
      rover.position[1]=(rover.position[1]-1)%10;
      break;
  };


}

function goBack(rover) {
  switch(rover.direction) {
    case 'N':
      if(rover.position[0]===0){
        rover.position[0] = rover.position[0]+10;
      }
      rover.position[0]=(rover.position[0]-1)%10;
      break;
    case 'E':
      if(rover.position[1]===0){
        rover.position[1] = rover.position[1]+10;
      }
      rover.position[1]=(rover.position[1]-1)%10;
      break;
    case 'S':
      rover.position[0]=++rover.position[0]%10;
      break;
    case 'W':
      rover.position[1]=++rover.position[1]%10;
      break;
  };

}

function turnRight(rover) {
  switch(rover.direction) {
    case 'N':
      rover.direction='E'
      break;
    case 'E':
      rover.direction='S'
      break;
    case 'S':
      rover.direction='W'
      break;
    case 'W':
      rover.direction='N'
      break;
  };

  
}

function turnLeft(rover) {
  
  switch(rover.direction) {
    case 'N':
      rover.direction='W'
      break;
    case 'E':
      rover.direction='N'
      break;
    case 'S':
      rover.direction='E'
      break;
    case 'W':
      rover.direction='S'
      break;
  };

}


function rideOnMars(instructions){
  
  for (var i = 0; i < instructions.length; i++) {
    
    if(checkCrash()){
      break;
    }
    
    switch (instructions[i].toLowerCase()){
      case "f":
        goForward(myRover);
        goForward(yourRover);
        break;
      case "b":
        goBack(myRover);
        goBack(yourRover);
        break;
      case "l":
        turnLeft(myRover);
        turnLeft(yourRover);
        break;
      case "r":
        turnRight(myRover);
        turnRight(yourRover);
        break;
      default:
        break;
    }
  }
}

function checkCrash(){
  console.log(obstacle1);

  //Check if the rovers crash in to eachother
  if(myRover.position[0]===yourRover.position[0]&&myRover.position[1]===yourRover.position[1]){
    console.log("Rovers bump in to eachother at: [" + myRover.position[0] + ", " + myRover.position[1] + "]");
    crashed = true;
    return true;
  }

  rover = [myRover,yourRover];
  //check if one of the rovers crashes against an obstacle
  for(var i = 0; i<rover.length; i++){
    if(rover[i].position[0]===obstacle1[0]&&rover[i].position[1]===obstacle1[1]){
      console.log("Found obstacle at: [" + rover[i].position[0] + ", " + rover[i].position[1] + "]");
      crashed = true;
    }else{
      console.log("New Rover Position of rover " + i + ": [" + rover[i].position[0] + ", " + rover[i].position[1] + "]");
    }
  }

  return crashed;
  
}

var instructions;
var crashed = false;
instructions = prompt("Please give a chain of instructions: ");
var obstacle1 = [3,5];

rideOnMars(instructions);







