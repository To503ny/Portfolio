/*$(document).ready(function()
{
    $(".odd").css("background-color", "yellow").css("color","black");
	$(".even").css("background-color","blue").css("color", "white");
	$("body").css("background-color", "black");
	$("body").css("color", "grey");
	
});*/
if(jQuery){
	/*var checkAnswers = function(){
		var answerString = "";
		var answers = $(":checked");
		answers.each(function(i){
			answerString = answerString + answers[i].value;
		});
		$(":checked").each(function(i){
			var answerString = answerString + answers[i].value;
		});
		checkIfCorrect(answerString);
	};
	
	var checkIfCorrect = function(theString){
		if(parseInt(theString, 16) === 811124566973){
			$("body").addClass("correct");
			$("h1").text("You Win!");
			$("canvas").show();
		}
	};*/
	
	$(document).ready(function()
	{
		var correct = 0;
	
		$('#q1Answer').click(function()
		{
			$("#q1Correct").show();
			correct += 1;
			checkNumCorrect(correct);
		});
	
		$('#q2Answer').click(function()
		{
			$("#q2Correct").show();
			correct += 1;
			checkNumCorrect(correct);
		});
	
		$('#q3Answer').click(function()
		{
			$("#q3Correct").show();
			correct += 1;
			checkNumCorrect(correct);
		});
	
		$('#q4Answer').click(function()
		{
			$("#q4Correct").show();
			correct += 1;
			checkNumCorrect(correct);
		});
	
		$('#q5Answer').click(function()
		{
			$("#q5Correct").show();
			correct += 1;
			checkNumCorrect(correct);
		});
	
		$('#q6Answer').click(function()
		{
			$("#q6Correct").show();
			correct += 1;
			checkNumCorrect(correct);
		});
	
		$('#q7Answer').click(function()
		{
			$("#q7Correct").show();
			checkNumCorrect(correct);
		});
	
		$('#q8Answer').click(function()
		{
			$("#q8Correct").show();
			correct += 1;
			checkNumCorrect(correct);
		});
	
		$('#q9Answer').click(function()
		{
			$("#q9Correct").show();
			correct += 1;
			checkNumCorrect(correct);
		});
	
		$('#q10Answer').click(function()
		{
			$("#q10Correct").show();
			correct += 1;
			checkNumCorrect(correct);
		});
	
		var checkNumCorrect = function(numCorrect)
		{
			if(numCorrect == 9)
			{
				console.log("all answers correct");
				$("body").addClass("correct");
				$("h1").text("You Win!");
				$("canvas").show();
			}
		};
	});
	
	console.log("q1");
	$("#question1").show();
};
if(impress){
	console.log("q2");
	$("#question2").show();
};
if(atom){
	console.log("q3");
	$("#question3").show();
};
if(createjs){
	console.log("q4");
	$("#question4").show()
};
if(me){
	console.log("q5");
	$("#question5").show();
};
if(require){
	console.log("q6");
	$("#question6").show();
};
if($().playground){
	console.log("q7");
	$("#question7").show();
};
if(jaws){
	console.log("q8");
	$("#question8").show();
};
if(enchant){
	console.log("q9");
	$("#question9").show();
};
if(Crafty){
	console.log("q10");
	$("#question10").show();
};