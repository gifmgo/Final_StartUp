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

//유효성 >> 키워드 or 글개수 선택했는지
function checkList(){
	var result = true;
	var keyword = $('#keywordSelect option:selected').val();
	var wordNumber = $('#wordNumbering').val();
	 
	 if(keyword == -1){
		 alert("키워드를 선택해주세요 !");
		 result = false;
		 return result;
	 }else if(wordNumber == -1){
		 alert("글개수를 선택해주세요 !");
		 result = false;
		 return result;
	 }
	 return result;
}

$(function(){

  $('#chooseResultDiv').css("display","none");	
	
 //debateList 검색 부분
 $('#searchDebateBtn').click(function(){
	 //유효성 검사 하는 부분
	 var result = checkList();
	 if(result == true){
		 //키워드 검색 값
		 var keyword = $('#keywordSelect option:selected').val();
		 //페이지 글 개수
		 var wordNumber = $('#wordNumbering').val();
		 $.ajax({
			  url:"adminDebateListAjax.do",
			  data:{
				  keyword : keyword,
			  },
			  success : function(data){
				  //디비 데이터 있을때
				  if(data.list != null){
					  $('#notChooseResultDiv').css("display","none");
					  $('#chooseResultDiv').css("display","block");
					  $('#resultTableTbody').empty();
					  
					  var table = '<table class="table table-hover">';
				      	  table += '<thead><tr><th class="text-center">';
				      	  table +='<label class="checkbox" for="all"><input type="checkbox" id="all" data-toggle="checkbox"></label></th>'
					      table +='<th class="text-center">제목</th><th class="text-center">글쓴이</th><th class="text-center">날짜</th></tr></thead>';
				      
					  $.each(data.list, function(index, obj){
						  table += '<tr><td class="text-center"><label class="checkbox" for='+index+'><input type="checkbox" value="'+index+'"id="'+index+'"data-toggle="checkbox"></label></td>'; 
						  table += "<td class='text-center'>"+obj.title+"</td>";
						  table += "<td class='text-center'>"+obj.nickName+"</td>";
						  table += "<td class='text-center'>"+obj.writeDate+"</td></tr>";
					  });
					  	  table +="</table>";
					  	  
					  $('#resultTableTbody').append(table);
				  }
			  }
		 });
	 }
 });
	
 $('#banallCheck').click(function(){
	 var check =$(this).is(":checked");
	 if(check){
		 $('.b_checkbox').prop('checked', true);
	 }else{
		 $('.b_checkbox').prop('checked', false);
	 }
 });
	
 
 //관리자 - 키워드 등록시 유효성 검사
 $('#insertSubjectForm').submit(function(){
	 var fvideo = $('#firstvideo').val();
	 var svideo = $('#secondvideo').val();
	 var keyword = $('#admin_debate_debateword').val();
	 
	 if(fvideo == '' || fvideo == null){
		 alert("첫번째 영상 주소를 입력해주세요 !");
		 $('#firstvideo').focus();
		 return false;
	 }else if(svideo == '' || svideo == null){
		 alert("두번째 영상 주소를 입력해주세요 !");
		 return false;
	 }else if(keyword == '' || keyword == null){
		 alert("키워드를 입력해주세요 !");
		 return false;
	 }
	 return true;
 });
 
});