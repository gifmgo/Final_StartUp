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
	var choose = "차단";
	$("input[type=checkbox]:checked").each(function(){
		 banId += ($(this).attr('id') + ",");
	});
	if(banId != null && banId != ''){
		checkId(banId, choose);	
	}else{
		alert("차단하실 유저를 선택하세요!");
	}
}

//사용자 차단해제
function deleteBan(){
	var banId = '';
	var choose = "해제";
	$("input[type=checkbox]:checked").each(function(){
		 banId += ($(this).attr('id') + ",");
	});
	
	if(banId != null && banId != ''){
		checkId(banId, choose);	
	}else{
		alert("차단하실 유저를 선택하세요!");
	}
}

//차단된 사용자인지 확인
function checkId(banId, choose){
	var id = banId.split(",");
	
	
	if(choose == "차단"){
	$.ajax({
		 url: "Admin_checkId.do",
		 success:function(data){
			 var result = true;
			 
			 for(var i = 0; i < data.banUser.length; i++){
				 
				 console.log("디비 확인 : "+data.banUser[i].banUserId);
				 
				 for(var j = 0; j < id.length; j++){
					 
					 if(id[j] == data.banUser[i].banUserId){
						 alert("얼럿확인 : "+result);
						 result = false;
						 break;
					 }
				 }
			 }
			 
			 if(result == true){
					location.href="banUser.do?banId="+banId;
			}else{
				alert("정신차리세요 형님");
			}
		 }
	 });
	}else{
		$.ajax({
			 url: "Admin_checkId.do",
			 success:function(data){
				 var array = new Array();
				 for(var i=0; i<data.banUser.length; i++){
					 for(var j=0; j<id.length; j++){
						 if(id[j] == data.banUser[i].banUserId){
							array.push(id[j]);
						 }
					 }
				 }
				 
				 
				 if((id.length-1) == array.length){
						location.href="banUserDelete.do?banId="+banId;
					}else{
						alert("정신차리세요 형님");
					}
			 }
		});
	}
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