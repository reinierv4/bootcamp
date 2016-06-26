var user = {};
var responses = [];


function askName (){
	
	var name = prompt('What is your name?');
	user.name = name;
	question1();

}

function question1 (){

	var answer1 = prompt("Did the Netherlands qualify for the EURO 2016?");
	if(answer1.toLowerCase()=="yes"){
		responses.push(false);
		question2();
	}else if (answer1.toLowerCase()=="no"){
		responses.push(true);
		question2();
	}else{
		alert("Please answer either Yes or No");
		return question1();
	}
}

function question2() {
  	var js = prompt('What was the original name for JavaScript: Java, LiveScript, JavaLive, or ScriptyScript?');
  	js = js.toLowerCase();
  	switch (js) {
    	case "java":
    	case "javalive":
    	case "scriptyscript":
    		responses.push(false);
    		question3();
    		break;
    	case "livescript":
    		responses.push(true);
    		question3();
    		break;
    	default:
    		alert("Please choose one of the answers from the list");
    		question2();
    		break;
    }
}

function question3() {
  	var js = prompt('How many children did Ted Bundy on the show Married with the Children have?');
  	js = js.toLowerCase();
  	if(js==="2"){
  		responses.push(true);
    	evaluate(responses);
    }else if (parseInt(js)=="undefined"){
  		alert("Plaese provide your answer as a numeric value");
  		question3();
	}else{
  		responses.push(false);
    	evaluate(responses);
  	}
}

function evaluate (responses){
	var correct=0;
	var incorrect=0;

	for (var i=0; i<responses.length; i++){
		if(responses[i]){
			correct++;
		}else{
			incorrect++;
		}
	}
	showResults(correct, incorrect, responses.length);
}

function showResults (correct, incorrect, number){
	var message;
	if(correct/number>0.5){
		message = " well done!";
	}else{
		message = " better luck next time!"
	}
	alert("You answered " + number + " questions and provided " + correct + " correct and " + incorrect +  " answers" + message)
}


askName();
