/**
 * 
 */

//관리자 공지사항 - 함수
function noticeAdmin(){
	location.href="AdminNotice.do";
}

function NoticeWrite(){
	alert("공지사항 쓰기");
	location.href="AdminNoticeWrite.do";
}

//관리자 - 토크 키워드 등록
function debateAdmin(){
	location.href="AdminDebate.do";
}

//관리자 - 토크별 리스트 보기
function AdminDebateList(){
	location.href="AdminDeabteList.do";
}

//관리자-유저관리
function banUser(){
	location.href="AdminBanUserList.do";
}

//사용자 차단하기
function ban(){
	var banId = '';
	$("input[type=checkbox]:checked").each(function(){
		 banId += ($(this).attr('id') + ",");
	});
	
	location.href="banUser.do?banId="+banId;
}

$(function(){
	
 $('#banallCheck').click(function(){
	 var check =$(this).is(":checked");
	 if(check){
		 $('.b_checkbox').prop('checked', true);
	 }else{
		 $('.b_checkbox').prop('checked', false);
	 }
 });
	

});