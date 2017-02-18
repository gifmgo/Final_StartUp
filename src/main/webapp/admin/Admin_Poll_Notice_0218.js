/**
 * 
 */

//설문지 작성하기.
function pollWrite(){
	location.href="adminPollWrite.do";
}

$(function(){
	
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
	
	//설문지 문제 추가
	$('#addPollLi').click(function(){
		var makeWell = '<div class="well pollWell">';
			  makeWell += '<div class="dropdown">';
			  makeWell += '<button class="btn btn-primary dropdwn-toggle" type="button" data-toggle="dropdown">메뉴'
			  makeWell += '<span class="caret"></span></button>';
			  makeWell += '<ul class="dropdown-menu"><li><a href="#">단답형</a></li>';
			     makeWell += '<li><a href="#">체크박스</a></li>';
			     makeWell += '<li><a href="#">객관식</a></li></ul>';
			  makeWell += '</div>';
			     makeWell += '<div class="pollStatusDiv">';
			makeWell += '<div class="form-group">'
			  makeWell += '<div class="col-md-12">'
			    makeWell += '<input type="text" class="form-control" placeholder="질문">'
			  makeWell += '</div></div>'; 
			  makeWell += '<div class="radio">';
			    makeWell += '<label><input type="radio" name="optradio"><input type="text" class="form-control answerInput" placeholder="옵션"></label>';
			  makeWell += '</div>';
			  makeWell += '</div>';
			  makeWell += '</div>';
			$('#pollListDiv').append(makeWell);

	});
	
});