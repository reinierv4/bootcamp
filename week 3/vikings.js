//Defenition of all the classes

var Warrior = function(type){
	//Construct the warrior, the warrior has a type and a original health of 100
	this.type = type;
	this.health = 100;
	this.strength = 10
	this.attack = function(){
		return (Math.floor(Math.random() * this.strength) + 1 + this.weapon.damage); //returns a number from 1-10 which is the damage for an attack
	}
	this.weapon = {type:"None", damage: 0, defense: 0};
	this.confidence = 0;
	this.experience = 0;

}

var Game = function(){
	//Set up the game
	this.vikings = [];
	this.saxons = [];
	var self = this
	//Populate both armies to get a predefined size
	self.createArmys = function(size){
		for(var i = 0; i<size; i++){
			self.vikings.push(new Warrior("viking"))
			self.saxons.push(new Warrior("saxon"))
		}
	}
	//Call the arm up function on all the vikings to let them randomly select a weapon
	self.VikingArmUp = function(){
		for(var i = 0; i<self.vikings.length; i++){
			armUp(self.vikings[i]);
		}
	}
	//Execute a pitfight between two vikings
	self.pitFight = function(){
		var fighter1 = self.vikings[Math.floor(Math.random() * self.vikings.length)];	
		var fighter2 = self.vikings[Math.floor(Math.random() * self.vikings.length)];
		var loser = fight(fighter1,fighter2);
		//Recover health of the fighter
		fighter1.health = 100;
		fighter2.health = 100;
		//Add two condfidence points two winner and deduct two from loser
		fighter1.confidence += 2;
		fighter2.confidence += 2;
		loser.confidence -= 4;
		//Add experience points to the fighters
		fighter1.experience += 1;
		fighter2.experience += 1;
	}
	//Execute a real fight 
	self.realFight = function(){
		self.VikingArmUp(); //Make sure the vikings have armors
		var fighter1 = self.vikings[Math.floor(Math.random() * self.vikings.length)]; //randomly select one of the vikings for battle	
		var fighter2 = self.saxons[Math.floor(Math.random() * self.saxons.length)]; //randomly select one of the saxons for battle
		var loser = fight(fighter1,fighter2); //call the fight function that will return the loser
		//find and remove the loser from the army, this could alternatively be done by removing all warriors with health 0
		if(loser.type === "saxon"){
			var index = self.saxons.indexOf(loser);
			self.saxons.splice(index, 1);
		}else{
			var index = self.saxons.indexOf(loser);
			self.vikings.splice(index, 1);
		}
		//Check if one of the armies is completely eliminated, if not the case: repeat the function with two new warriors
		if(self.saxons.length == 0){
			self.showResult("the vikings")
		}else if(self.vikings.length == 0){
			self.showResult("the saxons")
		}else{
			//There are still fighters left, provide status update and continue to next fight
			console.log("Total health of the vikings: " + self.vikings.reduce(function(sum, viking){return(sum+viking.health)},0) );
			console.log("Total health of the saxons: " + self.saxons.reduce(function(sum, saxon){return(sum+saxon.health)},0) );
			console.log("There are " + self.vikings.length + " vikings and " + self.saxons.length + " saxons left, next round... Fight!");
			setTimeout(self.realFight, 2000);
		}
	}
	//Prints the winner to the screen, in the case the war is finished
	this.showResult = function(winner){
		console.log("The winners are " + winner);
	}
}

//Defenition of the helper functions below

fight = function(warrior1, warrior2){
	//Confidence points are added to the health before the battle
	warrior1.health += warrior1.confidence
	warrior2.health += warrior2.confidence
	//A battle can take maximum 1000 iterations, this does not have to be hard coded here
	for(var i = 0; i<1000; i++){
		//Assess the power of each of the attacks, weapon damage added, and training experience enhances the warriors attacks
		var attack1 = warrior1.attack()+warrior1.experience;
		var attack2 = warrior2.attack()+warrior2.experience;
		//Check if one of the two warriors is dead
		if(attack1 > warrior2.health){
			return (warrior2)
		}else if(attack2 > warrior1.health){
			return (warrior1)
		}else{
			warrior2.health -= Math.max(0, attack1 - warrior2.weapon.defense);
			warrior1.health -= Math.max(0, attack2 - warrior1.weapon.defense);
		}
	}
}

armUp = function(warrior){
	//Create an array of weapon hashes, all weapons have defensive and offensive power
	var weapons = [{type:"Ax", damage:5,defense:0},{type:"Spear",damage: 7 ,defense:0},
					{type:"Bow", damage:3, defense: 3}, {type:"Bow", damage:1, defense: 6}];
	var selection = Math.floor(Math.random() * 3);
	//Assign the randomly selected weapon to the warrior
	warrior.weapon = weapons[selection];
}

//The below code executes the script, it first creates a game, than assigns the armies and next executes the fight

game = new Game();
game.createArmys(10);
game.realFight();








