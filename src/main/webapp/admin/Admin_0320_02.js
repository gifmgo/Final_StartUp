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

//접속 유저 현황
function UserCount(){
	location.href="AdminCountUser.do";
}

//블로거 신청 리스트 확인
function Bloger(){
	location.href="AdminBloger.do";
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

//포인트 - 퀴즈
function PointQuiz(){
	location.href="pointQuiz.do";
}

//문의 메일 확인
function detailMailFunc(seq){
	var banUserMailSeq = seq;
	$.ajax({
		url:"banUserMailModal.do",
		data:{
			banUserMailSeq : banUserMailSeq
		},
		success : function(data){
			if(data.dto != null){
				
				var dto = {
					seq : data.dto.banUserMailSeq,
					banUser : data.dto.banUserId,
					realId : data.dto.realId,
					banContent : data.dto.banContent,
					mailDay : data.dto.mailDay
				};
				
				//매일 seq 번호
				$('#mailSeq').text('');
				//차단 유저
				$('#banUser').text('');
				//연락받을 유저
				$('#realUser').text('');
				$('#content').val('');
				
				$('#mailSeq').text(dto.seq);
				$('#banUser').text(dto.banUser);
				$('#realUser').text(dto.realId);
				$('#content').val(dto.banContent);
				
				console.log("확인 : "+dto.seq + " // 유저 : "+dto.banUser+ " // 리얼 : "+dto.realId+ " / 밴콘텐 : "+dto.banContent+ " / 날 : "+dto.mailDay);
				$('#mailModal').modal();
				
			}else{
				alert("죄송합니다. 잠시후 이용해주세요");
			}
		}
	});
}

//블로거 글 상세 보기 
function checkBloger(tag){
	var seq = $(tag).attr('name');
	
	$.ajax({
		url : "AdminBlogerInfo.do",
		data: {
			seq : seq
		},
		success : function(data){
			if(data.blogerInfo != null){
				var dto = data.blogerInfo;
				$('#blogerDate').text('');
				$('#blogerId').text('');
				$('#blogerPage').text('');
				$('#applyUser_seq').val('');
				$('#applyUser_NickName').val('');
				$('#blogerNickName').text('');
				
				
				$('#applyUser_seq').val(seq);
				$('#applyUser_NickName').val(dto.applyUser_NickName);
				$('#blogerNickName').text(dto.applyUser_NickName);
				$('#blogerDate').text(dto.applyUser_date);
				$('#blogerId').text(dto.applyUser_email);
				$('#blogerPage').text(dto.applyUser_page);
			}else{
				alert("죄송합니다. 잠시후 이용해주세요");
			}
		}
	});
	$('#myModal').modal();
}

$(document).ready(function(){
 
  //유저 포인트 추가
  $('#plusPointBtn').click(function(){
	  alert("포인트 추가 !!");
	  $.ajax({
		 url:"UpdatePointAjax.do",
		 success : function(data){
			 if(data.list != null){
				 alert("업데이트 성공!");
				 $('#pointTbody').empty();
				 var tbody = '';
				 $.each(data.list, function(index, obj){
					 tbody += '<tr>';
					 tbody += '<td class="text-center">'+index+'</td>';
					 tbody += '<td class="text-center">'+obj.id+'</td>';
					 tbody += '<td class="text-center">'+obj.nickName+'</td>';
					 tbody += '<td class="text-center">'+obj.point+'</td>';
					 tbody += '</tr>';
				 });
				 
				 $('#pointTbody').html(tbody);
				 
			 }else{
				 alert("죄송합니다. 잠시후 이용해주세요");
			 }
		 }
	  });
  });
	
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
 
 //일별 접속자 확인
 $('.customUl>li:first-child').click(function(){
	 alert("클릭!");
	 $.ajax({
		url:"AdminCountDate.do",
		success : function(data){
			var table = '<table class="table"><thead><tr><th class="text-center">No.</th><th class="text-center">날짜</th><th class="text-center">접속자</th><th class="text-center">전체 접속자</th></thead><tbody>';
				for(var i = 0; i < data.list.length; i++){
					table += '<tr class="text-center">'	
					table += '<td>'+data.list[i].no+'</td><td>'+data.list[i].adate+'</td><td>'+data.list[i].todayTotalUser+'</td><td>'+data.list[i].totalUser+"</td>";
					table += '</tr>';
				}
				table += '</tbody></table>';
			$('#customCountDiv').html(table);
		}
	 });
 });
 //월별 접속자 확인
 $('.customUl>li:last-child').click(function(){
	 alert("월별 클릭!");
 });
 
 //퀴즈 작성 버튼 클릭시
   $('#quizFormButton').click(function(){
	  if($('#question').val()==''){
		  alert('문제를 작성해주세요');
		  $('#question').focus();
	  }else if($('#option1').val()==''){
		  alert('보기1을 작성해주세요');
		  $('#option1').focus();
	  }
	  else if($('#option2').val()==''){
		  alert('보기2을 작성해주세요');
		  $('#option2').focus();
	  }else if($('#option3').val()==''){
		  alert('보기3을 작성해주세요');
		  $('#option3').focus();
	  }else if($('#answer').val()==''){
		  alert('정답을 작성해주세요');
		  $('#answer').focus();
	  }else{
		  $('#quizForm').submit();
	  }
   });
   
   
   //블로거 정보 등록하기
   $('#BlogerInfoForm').submit(function(){
	    var date = $('#blogerDate').text();
		var email = $('#blogerId').text();
		var page = $('#blogerPage').text();
		var upload = $('#upload').val();
		if(date != '' && email != '' && page != '' && upload != ''){
			$('#applyUser_email').val(email);
			$('#applyUser_page').val(page);
			$('#applyUser_date').val(date);
			return true;
		}else{
			alert("내용을 확인해주세요 !");
			return false;
		}
		
		
   });
   
});



