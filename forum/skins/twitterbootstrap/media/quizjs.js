$(document).ready(function(){
	//var min_left=$("span.testtime").text();	
	//starttimer(min_left);
	setQnQuestChoice(1);
});


// This will save the choices in button data attribute
// also change the color of button
//-------------------------------------------------------
function save_ans_temporary(){
	var qnumber =$('.questionnumber').text();
	var str_optSel='';	
	//if Descriptive type answer
	if ($("#btn-nav"+qnumber).data('qtype')=='DESC'){
		str_optSel+=$('#options-box textarea').val();
  	}else{
  		$(".optthumb").each(function(index) {
  			if ($(this).hasClass('thumbnail')){
  				str_optSel+= index + ":" + $(this).data('opt')+',';
			}
		});
	}
	if (str_optSel!=''){
		$("#btn-nav"+qnumber).attr('optselected',str_optSel);
		$("#btn-nav"+qnumber).addClass('btn-success');
	}
}


//this will create a perticular Choice
function createChoice(n,opt,optpk,questtype){
	//if ($("#typeid").text()==2){
	var str_opt='<div class="optthumb" id="choice'+n+'" data-opt="'+optpk+'" >';
	//var questtype=$('#questtype').text();
	
	//alert(questtype);
	if (questtype=='MC'){	
		var lbl_opt_number= n+1;//to put 1,2 ... for options
		str_opt+=lbl_opt_number+'. <span class="caption">'+opt+'</span></div>';		
	}else{		
		str_opt+='<input type="radio" name="optgroup" value="'+opt+'"> '+opt+'<br></div>';
	}	
	return str_opt;
}



function setSelOptions(optsel){
	if (optsel != ''){
		var opts = optsel.split(',');
		$.each(opts, function(key, line) {
			var parts = line.split(':');
			$('#choice'+parts[0]).addClass('thumbnail');
			//check the radio button
			$('#choice'+parts[0]).children('input').attr('checked', 'checked');
		});
	}
}

//Save the current answer temporarily
//And Will show the Next Question
//---------------------------------------
function setQnQuestChoice(qn){
	//Save the answer, then show New Question
	var $curquest=$("#btn-nav"+qn);	
	$(".btnnav").removeClass('btn-primary');
	$curquest.removeClass('btn-success');
	$curquest.addClass('btn-primary');

	//if not first question save previous question's answer temporarly
	if ($('.questionnumber').text()!='')save_ans_temporary();
	
	var ajaxdata={qpk:$curquest.data("qpk"),scorepk:$('#scoreid').text()};
	$.ajax({
		//myquiz.views.get_choice_question
		url:'/ajax/quest/',
		data:ajaxdata,
		success:function(data){
			//change question number,question and type
			$('.questionnumber').text(qn);
			$('.question-box').text(data.question);
			var qtype=$("#btn-nav"+qn).data('qtype');
			
			//the temporary saved answer
			var opt_selected=$("#btn-nav"+qn).attr('optselected');
			if (qtype=='DESC'){
				$("#options-box").html('<textarea class="field span12" id="textarea" rows="6" placeholder="Enter the Answer">'+opt_selected+'</textarea><br></div>');
			}else{
				var html_opts='';
				for (var i=0;i<data.nopts;i++){
					var curopt=data.opts[i];
					html_opts+=createChoice(i,curopt[0],curopt[1],qtype);
				}
				$("#options-box").html(html_opts);
				setSelOptions(opt_selected);
			}			
		}
	});	
}

$(".btnnav").click(function(){	
	if ($('.questionnumber').text()==$(this).text()){
		//alert("this is curquest");
		return false
	}
	//alert('someother question. going to chagne buttoncolor');		
	setQnQuestChoice($(this).text());
});

$("#btn-next").click(function() {
	var curqn= $('.questionnumber').text();		
	if (curqn==$('.nquests').text()){			
		setQnQuestChoice(1);
	}else{
		var nextqn = parseInt(curqn) + 1;			
		setQnQuestChoice(nextqn);
	}
});

$(document).on('click', '.optthumb', function(){
	if ($(this).children('input').length > 0 ) {
		$(".optthumb").removeClass('thumbnail');
		$(".optthumb input:radio[name=optgroup]:checked").parent('.optthumb').addClass('thumbnail');
    }else{
    	$(this).toggleClass('thumbnail');
    }
});


// to do
// SUBMIT ANSWERS BUTTON CLICK
// save the answers permanantley
//===============================================
function SubmitSaveQuiz(){
	save_ans_temporary();
	var score=$('#scoreid').text();
	var quests=new Object;
	$(".btnnav").each(function() {
		var optsel=$(this).attr('optselected');
		var c_optsel='';		
		quests[$(this).data('qpk')]=$(this).attr('optselected');			
	});		
	// Score:student(usr),quiz(quiz),quiz_taken(datetime)
	$.ajax({
		url:'/ajax/submit/',
		data:{questions:JSON.stringify(quests),score:score}
		}).done(function() {
		document.location.assign('/quiz/?scorepk='+score);	  	
	});//end of ajax
}

$("#btn-submit").click(function() {
	SubmitSaveQuiz();
});//end of submit