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
	
	
	
});