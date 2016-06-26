var read = require('read');
var jsonfile = require('jsonfile')



var Question = function(question, answer, id){
	this.question = question;
	this.answer = answer;
	this.id = id;
	this.pointvalue = 1;
	this.point = 0;
	
}

var UserList = function(){

	this.users = []
	this.userStatus = []


	this.registerUser = function(user){
		this.users.push(user);
		this.updateUserStatus(user, true);
		
	}

	this.userExists = function(username){
		

		var result = false;

		console.log(this.users)
		for(var i = 0; i<this.users.length; i++){
			if(this.users[i].name === username){
				result = true;
		 	}
		}
		
		return result

	}

	this.returnUser = function(username){
		
		var result = {};
		
		for(var i = 0; i<this.users.length; i++){
			if(this.users[i].name === username){
				result = i;
		 	}
		}
		
		return this.users[result]
		
	}

	this.updateUserStatus = function(user, newUser){
		if(newUser){
			SaveFile(this.userStatus);
		}else{
			var relevantUser = this.userStatus.find(function(userFromList){
				return (user.name === userFromList.name)
			})
			relevantUser.points = user.points;
			relevantUser.currentQuestionIndex = user.currentQuestionIndex
			SaveFile(this.userStatus);
		}
		
	}

	this.LoadSettings = function(){
		this.userStatus = OpenFile();
		this.users = this.userStatus;
	}


}

var User = function(name){
	this.name = name;
	this.points = 0;
	this.currentQuestionIndex = 0;
}



var Quizz = function(questions, user, userlist){
	
	this.userlist = userlist;
	this.questions = questions
	this.user = user;
	var index = 0
	var self = this;
	var randomnumber = Math.floor(Math.random()*self.questions.length)
	setBonus(randomnumber);
		
	startQuizz = function(){
		if(self.user.currentQuestionIndex<self.questions.length){
			options = {
    			prompt: self.questions[self.user.currentQuestionIndex].question
			}
			read(options, userAnswering); 
		}else{
			endOfQuizz()
		}
	}
	
	userAnswering = function(err, hisAnswer){
		
		console.log("user answer " + hisAnswer)
		console.log("actual answer " + self.questions[self.user.currentQuestionIndex].answer)
		if(hisAnswer == "save"){
			userlist.updateUserStatus(self.user, false)
			startQuizz();
		}else if(hisAnswer === self.questions[self.user.currentQuestionIndex].answer){
			self.questions[index].point = self.questions[self.user.currentQuestionIndex].pointvalue;
			self.user.points += self.questions[self.user.currentQuestionIndex].pointvalue;
			self.user.currentQuestionIndex++;
			startQuizz();
		}else{
			self.user.currentQuestionIndex++;
			startQuizz();
		}
		
	}

	endOfQuizz = function(){
		var totalPoints = self.user.points
		console.log("Your current score is now: " + totalPoints);
	}


	function setBonus(randomnumber){
		self.questions[randomnumber].pointvalue++;
	}

	return{
		startQuizz: startQuizz
	}

	

}

function SaveFile(userstatus){
	var file = '/Users/reinierverbeek/ironhack/userlist.json'
	jsonfile.writeFile(file, userstatus, function (err) {
  		console.error(err)
	})
}


function OpenFile(){
	return require('/Users/reinierverbeek/ironhack/userlist.json')
}



var PreQuizz = function(userlist){

	this.userlist = userlist;
	self = this
	welcome();

	function welcome(){
		console.log(self.userlist.users)
		options = {
	    	prompt: "New User?"
		}
		read(options, login)
    }

	
	
	function login(err, answer){
		console.log("Your answer " + answer)
		if(answer === "yes"){
			read({prompt: "Please choose your username"}, createUser)
		}else{
			read({prompt: "Please provide your username"}, checkUser)
		}
	}

	function createUser(err, username){
		self.userlist.registerUser(new User(username));
		console.log("Welcome " + username + " the quizz will start now")
		var userTry = self.userlist.returnUser(username)
		goToQuizz(userTry);
		//goToQuizz(self.userlist.returnUser(username));
	} 

	function checkUser(err, username){
		if(self.userlist.userExists(username)){
			console.log("Welcome back " + username + " the quizz will start now")
			var userTry = self.userlist.returnUser(username)
			goToQuizz(userTry);
		}else{
			console.log("We couldn't load your user profile please restart the application")
		}
	}

	function goToQuizz(user){
		var question1 = new Question("Does it work?","yes",0);
		var question2 = new Question("Does it really work?","yes",1);
		var question3 = new Question("Does it really really work?","yes",2);
		var question4 = new Question("Will it stop?","yes",3);
		var questions = [question1, question2, question3, question4];
		var quizz = new Quizz(questions, user, self.userlist)
		quizz.startQuizz();
	}



}



userlist = new UserList
userlist.LoadSettings();
prequizz = new PreQuizz(userlist)


