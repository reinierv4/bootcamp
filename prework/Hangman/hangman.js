window.onload = function() {

	var submitButton = document.getElementById('submit-button');
	submitButton.addEventListener('click', submitAction, false);


	function Player (name) {
    	this.name = name;
    	

	}

	function Game (){
		this.players = [];
		this.try = 6;
		this.word = "";
		this.wordRaw = "";
		this.guessedWord = "";
		this.correctLetter = 0;
		this.submitClicked = 0;
		this.upcase = false;
		
	}

	Game.prototype.compareTry = function(letter) {
	    
	    
	    correct = false;
	    for(var i= 0; i<this.word.length; i++){
	    	
	    	if(this.word[i]===letter){
	    		
	    		correct = true;
	    		this.correctLetter++;
	    		//If it is the first letter and the first letter was originaly capital, Upcase
	    		if(i===0&&game.upcase){
	    			this.guessedWord = ReplaceString(this.guessedWord,i,letter.toUpperCase());
	    		}else{
	    			this.guessedWord = ReplaceString(this.guessedWord,i,letter);
	    		}
	    		
				
				if(this.correctLetter === this.word.length){
	    			this.gameOver(true);
	    		}
	    	}
	    }

	    if(!correct){
	    	this.reduceTry();
	    }

	};

	Game.prototype.reduceTry = function() {
	    this.try--;
	    if(this.try===0){
	    	this.gameOver(false);
	    }
	};

	Game.prototype.gameOver = function(player2Won) {
		if(player2Won){
			document.getElementById("guessedWord").textContent = game.guessedWord;
			alert("You guessed the word woohoo!");
		}else{
			alert ("You run out of lives, game over");
		}
		

	};

	
	ReplaceString = function(string, index, letter){
		var newString = "";
		for(var i = 0; i < string.length; i++){
			if(i===index){
				newString += letter;
			}else{
				newString += string[i];
			}
		}
		string = newString;
		return(string);
	}

	function submitAction() {
		
		if(game.submitClicked==0){
			//The first player name is now recieved, ask second player for name
			game.players[0] = new Player(document.getElementById("user-input").value);
			document.getElementById("player1name").textContent  = "Player 1: " + game.players[0].name;
			document.getElementById("user-input").value = "";
			document.getElementById("instruction").textContent = "Player 2, please provide your name";
			game.submitClicked++;
		}else if (game.submitClicked==1){
			//The second name is now recieved, prompt user for word
			game.players[1] = new Player(document.getElementById("user-input").value);
			document.getElementById("player2name").textContent  = "Player 2: " + game.players[1].name;
			document.getElementById("user-input").value = "";
			document.getElementById("instruction").textContent = game.players[0].name + " please submit a word";
			document.getElementById("user-input").setAttribute("type","password");
			game.submitClicked++;
		}else if (game.submitClicked==2){
			//store the word that was guessed, check if first letter is capital
			game.wordRaw = document.getElementById("user-input").value;
			game.word = game.wordRaw.toLowerCase();
			if(game.word!=game.wordRaw){
				game.upcase = true;
			}
			//The word is now recieved, create the empty word
			for(var i = 0; i<game.word.length; i++){
				game.guessedWord += "-";
			}
			document.getElementById("guessedWord").textContent = game.guessedWord;
			document.getElementById("tries").textContent = "You have " + game.try + " tries left!";
			document.getElementById("instruction").textContent = game.players[1].name + " please guess your first letter";
			document.getElementById("user-input").value = "";
			document.getElementById("user-input").setAttribute("type","text");
			game.submitClicked++;
		}else{
			var letter = document.getElementById("user-input").value;
			game.compareTry(letter);
			document.getElementById("user-input").value = "";
			document.getElementById("guessedWord").textContent = game.guessedWord;
			document.getElementById("tries").textContent = "You have " + game.try + " tries left!";
		}
	}

	var game = new Game();


	
		
}