/**
 * 
 */

//투표 결과 보기
function showVoteDetail(){
	$.ajax({
		url : "voteDetailAjax.do",
		success : function(data){
			if(data.list != null){
				
				var table = '<table class="table"><thead><tr><th class="text-center">No.</th><th class="text-center">이름</th><th class="text-center">정당</th><th class="text-center">투표수</th></thead><tbody>';
				$.each(data.list, function(index,obj){
					if(obj.jungDang.length > 7){
						obj.jungDang = obj.jungDang.substring(0,6);
					}
					table += '<tr><td class="text-center">'+(index+1)+'</td><td class="text-center">'+obj.name+'</td><td class="text-center">'+obj.jungDang+'</td><td class="text-center">'+obj.presidentCount+'</td></tr>';
				});
					table += '</tbody></table>';
					$('#resultVote').html(table);
				
			}else{
				alert("죄송합니다. 잠시후 이용해주세요");
			}
		}
	});
}

//투표 버튼 클릭시 >> 로그인 했는지 체크 
function voteFunc(){
	$.ajax({
		url : "loginCheck.do",
		success : function(data){
			if(data.result == 0){
				alert(data.message);
			}else{
				dbVoteFunc();
			}
		}
	});
}

//로그인 되어있을 때
function dbVoteFunc(){
	
	var chk = $(':radio[name="optradio"]:checked').val();
	
	$.ajax({
		url : "dbVoteStart.do",
		data : {
			chk : chk
		},
		success : function(data){
			
			switch (data.dbResult) {
			case 0:
				alert(data.message);
				break;
			case 1 :
				alert(data.message);
				break;
			case 2:
				alert(data.message);
				break;
			
			case 3:
				alert(data.message);
				break;
				
			default:
				alert("죄송합니다. 잠시후 이용해주세요");
				break;
			}
		}
	});
}

//새챁 띄우는 전역 변수

//트위터
function twitterFun(tag){
	var $btn = $(tag);
	var url = $btn.attr("id");
	var ck = checkURL(url);
	if(ck == true){
	var openNewWindow = window.open("about:blank");
	openNewWindow.location.href=url;
	}
}

//페이스북
function FaceBookFun(tag){
	var $btn = $(tag);
	var url = $btn.attr("id");
	var openNewWindow = window.open("about:blank");
	openNewWindow.location.href=url;
}

//홈페이지
function HomePageFunc(tag){
	var $btn = $(tag);
	var url = $btn.attr("id");
	var openNewWindow = window.open("about:blank");
	openNewWindow.location.href=url;
}

$(document).ready(function(){

	$('#listGroupBtn').click(function(){
		
	});
	
	
	$('#tooPyooBtn').click(function(){
		
	});
	
	$('#presidentTalkBtn').click(function(){
		
	});
	
});