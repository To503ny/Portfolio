if(jQuery)
{	
	var correct = 0;
	
	$('#question1RadioB').click(function()
	{
		$("#q1Correct").show();
		correct += 1;
		checkNumCorrect(correct);
	});
	
	$('#question2RadioD').click(function()
	{
		$("#q2Correct").show();
		correct += 1;
		checkNumCorrect(correct);
	});
	
	$('#question3RadioD').click(function()
	{
		$("#q3Correct").show();
		correct += 1;
		checkNumCorrect(correct);
	});
	
	$('#question4RadioA').click(function()
	{
		$("#q4Correct").show();
		correct += 1;
		checkNumCorrect(correct);
	});
	
	$('#question5RadioC').click(function()
	{
		$("#q5Correct").show();
		correct += 1;
		checkNumCorrect(correct);
	});
	
	$('#question6RadioA').click(function()
	{
		$("#q6Correct").show();
		correct += 1;
		checkNumCorrect(correct);
	});
	
	$('#question7RadioA').click(function()
	{
		$("#q7Correct").show();
		checkNumCorrect(correct);
	});
	
	$('#question8RadioD').click(function()
	{
		$("#q8Correct").show();
		correct += 1;
		checkNumCorrect(correct);
	});
	
	$('#question9RadioB').click(function()
	{
		$("#q9Correct").show();
		correct += 1;
		checkNumCorrect(correct);
	});
	
	$('#question10RadioD').click(function()
	{
		$("#q10Correct").show();
		correct += 1;
		checkNumCorrect(correct);
	});
	
	var checkNumCorrect = function(numCorrect)
	{
		if(numCorrect == 9)
		{
			$("#youWin").show();
			alert("You Win!");
		}
	};
		//$("#q1Correct").show();
	
	
	//alert("question1 loaded");
	/*var checkAnswers = function()
	{
		var answerString = "";
		var answers = $(":checked");
		answers.each(function(i)
		{
			answerString = answerString + answers[i].value;
		});
		$(":checked").each(function(i)
		{
			var answerString = answerString + answers[i].value;
		});
		
		checkIfCorrect(answerString);
	};
	
	var checkIfCorrect = function(theString)
	{
		if(parseInt(theString, 16) === 811124566973) 
		{
			$("body").addClass("correct");
			$("h1").text("You Win!");
			$("canvas").show();
		}
	};

	$("#question1").show();*/
};

/*if(impress)
{
	alert("question2 loaded");
	$("#question2").show();
};

if(atom)
{
	alert('question3 loaded');
	$("#question3").show();
};

if(creatjs)
{
	alert("question4 loaded");
	$("#question4").show();
};

if(me)
{
	alert('question5 loaded');
	$("#question5").show();
};

if(require)
{
	alert("question6 loaded");
	$("#question6").show();
};

if($().playground)
{
	alert("question7 loaded");
	$("question7").show();
};

if(jaws)
{
	alert("question8 loaded");
	$("#question8").show();
};
if(enchant)
{
	alert("question9 loaded");
	$("#question9").show();
};

if(crafty)
{
	alert("question10 loaded");
	$("#question10").show();
};*/