window.onload = function() {

	var submitButton = document.getElementById("submit-button");
	var green = document.getElementById("green");
	var red = document.getElementById("red");
	var blue = document.getElementById("blue");
	var test = document.getElementById("yellow");
	var buttonArray = [green,red,blue,yellow];

	submitButton.addEventListener('click', submitAction, false);

	function Game(){

		this.turn = 0;
		this.lastSequence = [];
	}

	function submitAction(){
		document.getElementById('message').textContent = "Pay close attention to the sequence of colors shown!"
		gameController();
	}

	function gameController(){
		console.log(buttonArray[3])
		game.turn++;
		game.submitClicked++;
		activateColors(randomizer(),0);;

	}

	function randomizer(){
		var randomNumbers = [];
		for(var i = 0; i<(2+game.turn); i++){
			randomNumbers.push(Math.floor((Math.random() * 4)));
		}
		return(randomNumbers)
		
	}



	function activateColors(randomNumbers, index){

		if(index<randomNumbers.length){
			setTimeout(changeColor,1000,randomNumbers,index, true);
		}
		else{
		 	setTimeout(changeColor,1000,randomNumbers,index, false);
		}
		
	}



	function changeColor(randomNumbers, index, notTheLastOne){
		
		if(notTheLastOne){
			green.classList.remove("visible")
			red.classList.remove("visible")
			blue.classList.remove("visible")
			yellow.classList.remove("visible")
			setTimeout(lightup,1000,randomNumbers,index);
			
			function lightup(randomNumbers,index){
				console.log("Changing: "+ randomNumbers[index])
				buttonArray[randomNumbers[index]].classList.add("visible")
				activateColors(randomNumbers, index+1)
			}
		}else{
			green.classList.remove("visible")
			red.classList.remove("visible")
			blue.classList.remove("visible")
			yellow.classList.remove("visible")
			game.lastSequence = randomNumbers;
			console.log(randomNumbers.length)
			checkAnswer(prompt("Please provide the last sequence of colors seperated by a comma").replace(/ /g,''));
		}
		
	}

	function checkAnswer(answer){
		var answer_array = answer.split(",")
		if(answer_array.length != game.lastSequence.length){
			alert("Your input was invalid, game over!")
			processAnswer(false);
		}
		answer_array = answer_array.map(wordToNumber);
		var return_value = true;
		for(var i =0; i<game.lastSequence.length; i++){
			if (game.lastSequence[i] != answer_array[i]){
				return_value = false;
			}
		}

		processAnswer(return_value);

	}

	function processAnswer(correct){
		if(correct){
			document.getElementById('message').textContent = "You're answer was correct, you have " + game.turn + "correct answers in a rows, woohoo! Click go for the next round!"
		}else{
			resetGame();
			document.getElementById('message').textContent = "You're answer was not correct :( click Go to start all over!"
		}

	}

	function resetGame(){
		game = new Game();
	}

	function wordToNumber(word){
		
		switch(word.toLowerCase()) {
	    case "green":
	        return 0;
	    case "red":
	        return 1;
	    case "blue":
	        return 2;
	    case "yellow":
	    	return 3;
 		default:
 			return 6;
 		}
	}
	var game = new Game();
}