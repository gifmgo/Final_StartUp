/**
 * 
 */

//설문지 작성하기.
function pollWrite(){
	location.href="adminPollWrite.do";
}

//플러스 버튼 눌렀을때 호출 되는 함수입니다.
function chooseSelect(select, span){
	//현재 체크박스인지 뭔지 구분하는 변수
	var choose = select;
	//스팬태그 
	var $span = span;
	var makeInput = '';
	//1 - 단답 - 인풋   
	if(choose == 1){
		var parent = $span.parent().parent().parent().parent();
		makeInput = '<div class="form-group"><div class="col-md-12">';
		makeInput += '<div class="input-group"><span class="input-group-addon chooseDiv"></span>';
		makeInput += '<input type="text" class="form-control answerInput" placeholder="옵션">';
		makeInput += '<span class="input-group-addon" onclick="plusSpan($(this));"><i class="glyphicon glyphicon-plus"></i></span>';
		makeInput += '</div></div>';
		//실질적으로 추가하는 부분
		parent.append(makeInput);
	}
	//2 - 체크 - 체크박스
	if(choose == 2){
		var parent = $span.parent().parent().parent().parent();
		makeInput = '<div class="form-group"><div class="col-md-12">';
		makeInput += '<div class="input-group"><span class="input-group-addon chooseDiv"></span>';
		makeInput += '<input type="text" class="form-control answerInput" placeholder="옵션">';
		makeInput += '<span class="input-group-addon" onclick="plusSpan($(this));"><i class="glyphicon glyphicon-plus"></i></span>';
		makeInput += '</div></div>';
		//실질적으로 추가하는 부분
		parent.append(makeInput);
	}
	//3 - 객관 - 라디오
	if(choose == 3){
		var parent = $span.parent().parent().parent().parent();
		makeInput = '<div class="form-group"><div class="col-md-12">';
		makeInput += '<div class="input-group"><span class="input-group-addon chooseDiv"></span>';
		makeInput += '<input type="text" class="form-control answerInput" placeholder="옵션">';
		makeInput += '<span class="input-group-addon" onclick="plusSpan($(this));"><i class="glyphicon glyphicon-plus"></i></span>';
		makeInput += '</div></div>';
		//실질적으로 추가하는 부분
		parent.append(makeInput);
	}
}

//설문지 내부 plus 버튼 클릭시
function plusSpan(span){
	var select = $('#sel1 option:selected').val();
	//어떤걸 선택했는지 확인한다.
	chooseSelect(select, span);
}

//동적으로 만든 셀렉박스가 바뀔때 well 한놈만 바뀌게 하는부분
function chooseWell(index, chooseWellId){
	//특정 웰 값 가져옴
	var wellId = chooseWellId;
	
		if(wellId == 'sel1'){
	
			if(index == 1){
				$('#firstWell').find(".chooseDiv").html('');
			}
			
			if(index == 2){
				console.log("index - 2 ");
				
				$('#firstWell').find(".chooseDiv").html('<input type="checkbox">');
			}
			
			if(index == 3){
				$('#firstWell').find(".chooseDiv").html('<input type="radio">');
			}
			
		}else{
			if(index == 1){
				console.log("index == 1");
				$('#'+wellId).find(".chooseDiv").html('');
			}
			//2.체크박스
			if(index == 2){
				console.log("index == 2");
				$('#'+wellId).find(".chooseDiv").html('<input type="checkbox">');
			
			}
			//3.라디오
			if(index == 3){
				console.log("index == 3");
				$('#'+wellId).find(".chooseDiv").html('<input type="radio">');
			}
	}
}

//추가된곳에서 셀렉트박스 이벤트 발생시 사용함
function selectChange(index, wellIndex){
	
	var $wellId = wellIndex;
	if($wellId.attr("id") == "sel1"){
		var chooseWellId = $wellId.attr("id");
		chooseWell(index, chooseWellId);
	}else{
	    //내가 현재 잡고있는 셀렉트 박스가 있는 well
	    var chooseWellId = $wellId.parent().parent().parent().attr("id");
	    chooseWell(index, chooseWellId);
	}
}

$(function(){
	
	//셀렉트 박스 ...
	/*$('#sel1').change(function(){
		//셀렉트 박스러 선택할때 (설문지 내부)
		var allChange = $('#sel1 option:selected').val();
		allChangeFunc(allChange);
	});*/
	
	
	$('#pollDiv').css("display","none");
	
	//공지사항 탭 클릭시
	$('#noticeTab').click(function(){
		//공지사항 탭
		$('#noticeTab').addClass('active');
		//설문지 탭
		$('#pollTab').removeClass('active');
		
		$('#noticeDiv').css("display", "block");
		$('#pollDiv').css("display","none");

	});
	
	//설문조사 탭 클릭시
	$('#pollTab').click(function(){
		$('#pollTab').addClass('active');
		$('#noticeTab').removeClass('active');
		
		$('#pollDiv').css("display","block");
		$('#noticeDiv').css("display", "none");
	});
	

	var pollWell = '1';
	//설문지 문제 추가
	$('#addPollLi').click(function(){
		  pollWell ++;
	  var makeWell = '<div class="well pollWell" id="'+pollWell+'">';
		  makeWell += '<div class="pollStatusDiv">';
		  makeWell += '<div class="form-group col-md-2 customSelectDiv">';
		  makeWell += '<select class="form-control customSelect" onchange="selectChange(this.options[this.selectedIndex].value, $(this));">';
		  makeWell += '<option value="1">단답형</option>';
		  makeWell += '<option value="2">체크박스</option>';
		  makeWell += '<option value="3">객관식</option>';
		  makeWell += '</select></div>';
		  makeWell += '<div class="form-group">'
		  makeWell += '<div class="col-md-12">'
		  makeWell += '<input type="text" class="form-control" placeholder="질문">'
		  makeWell += '</div></div>'; 
		  makeWell += '<div class="form-group">';
		  makeWell += '<div class="col-md-12">';
		  makeWell += '<div class="input-group">';
		  makeWell += '<span class="input-group-addon chooseDiv"></span>';
		  makeWell += '<input type="text" class="form-control answerInput" placeholder="옵션">';
		  makeWell += '<span class="input-group-addon" onclick="plusSpan($(this));"><i class="glyphicon glyphicon-plus"></i></span>';
		  makeWell += '</div></div></div>';
		  makeWell += '</div>';
		  makeWell += '</div>';
		  $('#pollListDiv').append(makeWell);
	});
	
	
});