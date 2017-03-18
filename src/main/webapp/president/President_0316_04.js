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

//삭제 아이콘 클릭시 
function deleteComment(icon){
	var seq_Val = $(icon).prev().val();
	$('#hiddenSeq').val('');
	$('#hiddenSeq').val(seq_Val);
}

//삭제 아이콘 클릭시 >> 로그인한 유저일때
function deleteCommentUser(icon){
	var seq_Val = $(icon).prev().val();
}

function loginFunc(){
	location.href="LoginP.do";
}


//글쓰기 폼 만듬 >> 로그인 안했을때 
function makeForm(empNm, polyNm){

	var sc_writeForm = '';
	switch (empNm) {
	case '문재인':
		sc_writeForm += '<form method="POST">';
		sc_writeForm += '<input type="hidden" name="color" value="#2980b9">';
		sc_writeForm += '<input type="hidden" name="empNm" value='+empNm+'>';
		sc_writeForm += '<input type="hidden" name="polyNm" value='+polyNm+'>';
		sc_writeForm += '<div class="well" style="border:4px solid #2980b9; background-color:#fff;">'
			sc_writeForm += '<h3 class="text-center">'+empNm+'<p><br/><em style="color:#2980b9;">'+polyNm+'</em></p></h3><hr/><br/>';
			sc_writeForm += '<div class="row">';
			sc_writeForm += '<div class="col-md-offset-2 col-md-8">';
				sc_writeForm += '<div class="row">';
					sc_writeForm += '<div class="col-sm-6 form-group">';
						sc_writeForm += '<input class="form-control" id="name" name="nickName" placeholder="닉네임" type="text" required>';
					sc_writeForm += '</div>';
					sc_writeForm += '<div class="col-sm-6 form-group">';
						sc_writeForm += '<input class="form-control" id="pw" name="pw" placeholder="비밀번호" type="password" required>';
					sc_writeForm += '</div>';
				sc_writeForm += '</div>';
				sc_writeForm += '<div class="row">';
				sc_writeForm += '<div class="col-sm-12 form-group">';
				sc_writeForm += '<input class="form-control" id="title" name="title" placeholder="제목" type="text" required">';
				sc_writeForm += '</div></div>';
			sc_writeForm += '<textarea class="form-control" id="comments" name="comments" placeholder="Comment" rows="5" maxlength="500"></textarea><br/>';
			sc_writeForm += '<div class="row"><div class="col-md-12 form-group"><button class="btn pull-right type="submit" style="background-color:#2980b9; color:white;">글등록</button></div></div>';
			sc_writeForm += '</div></div></form>';
		break;
	case '안희정':
		sc_writeForm += '<form method="POST">';
		sc_writeForm += '<input type="hidden" name="color" value="#2980b9">';
		sc_writeForm += '<input type="hidden" name="empNm" value='+empNm+'>';
		sc_writeForm += '<input type="hidden" name="polyNm" value='+polyNm+'>';
		sc_writeForm += '<div class="well" style="border:4px solid #2980b9; background-color:#fff;">'
			sc_writeForm += '<h3 class="text-center">'+empNm+'<p><br/><em style="color:#2980b9;">'+polyNm+'</em></p></h3><hr/><br/>';
			sc_writeForm += '<div class="row">';
			sc_writeForm += '<div class="col-md-offset-2 col-md-8">';
				sc_writeForm += '<div class="row">';
					sc_writeForm += '<div class="col-sm-6 form-group">';
						sc_writeForm += '<input class="form-control" id="name" name="nickName" placeholder="닉네임" type="text" required>';
					sc_writeForm += '</div>';
					sc_writeForm += '<div class="col-sm-6 form-group">';
						sc_writeForm += '<input class="form-control" id="pw" name="pw" placeholder="비밀번호" type="password" required>';
					sc_writeForm += '</div>';
				sc_writeForm += '</div>';
				sc_writeForm += '<div class="row">';
				sc_writeForm += '<div class="col-sm-12 form-group">';
				sc_writeForm += '<input class="form-control" id="title" name="title" placeholder="제목" type="text" required">';
				sc_writeForm += '</div></div>';
			sc_writeForm += '<textarea class="form-control" id="comments" name="comments" placeholder="Comment" rows="5" maxlength="500"></textarea><br/>';
			sc_writeForm += '<div class="row"><div class="col-md-12 form-group"><button class="btn pull-right type="submit" style="background-color:#2980b9; color:white;">글등록</button></div></div>';
			sc_writeForm += '</div></div></form>';
		break;
	
	case '안철수':	
		sc_writeForm += '<form method="POST">';
		sc_writeForm += '<input type="hidden" name="color" value="#1abc9c">';
		sc_writeForm += '<input type="hidden" name="empNm" value='+empNm+'>';
		sc_writeForm += '<input type="hidden" name="polyNm" value='+polyNm+'>';
		sc_writeForm += '<div class="well" style="border:4px solid #1abc9c; background-color:#fff;">'
			sc_writeForm += '<h3 class="text-center">'+empNm+'<p><br/><em style="color:#1abc9c;">'+polyNm+'</em></p></h3><hr/><br/>';
			sc_writeForm += '<div class="row">';
			sc_writeForm += '<div class="col-md-offset-2 col-md-8">';
				sc_writeForm += '<div class="row">';
					sc_writeForm += '<div class="col-sm-6 form-group">';
						sc_writeForm += '<input class="form-control" id="name" name="nickName" placeholder="닉네임" type="text" required>';
					sc_writeForm += '</div>';
					sc_writeForm += '<div class="col-sm-6 form-group">';
						sc_writeForm += '<input class="form-control" id="pw" name="pw" placeholder="비밀번호" type="password" required>';
					sc_writeForm += '</div>';
				sc_writeForm += '</div>';
				sc_writeForm += '<div class="row">';
				sc_writeForm += '<div class="col-sm-12 form-group">';
				sc_writeForm += '<input class="form-control" id="title" name="title" placeholder="제목" type="text" required">';
				sc_writeForm += '</div></div>';
			sc_writeForm += '<textarea class="form-control" id="comments" name="comments" placeholder="Comment" rows="5" maxlength="500"></textarea><br/>';
			sc_writeForm += '<div class="row"><div class="col-md-12 form-group"><button class="btn pull-right type="submit" style="background-color:#1abc9c; color:white;">글등록</button></div></div>';
			sc_writeForm += '</div></div></form>';
		break;
	
	case '이재명':
		sc_writeForm += '<form method="POST">';
		sc_writeForm += '<input type="hidden" name="color" value="#2980b9">';
		sc_writeForm += '<input type="hidden" name="empNm" value='+empNm+'>';
		sc_writeForm += '<input type="hidden" name="polyNm" value='+polyNm+'>';
		sc_writeForm += '<div class="well" style="border:4px solid #2980b9; background-color:#fff;">'
			sc_writeForm += '<h3 class="text-center">'+empNm+'<p><br/><em style="color:#2980b9;">'+polyNm+'</em></p></h3><hr/><br/>';
			sc_writeForm += '<div class="row">';
			sc_writeForm += '<div class="col-md-offset-2 col-md-8">';
				sc_writeForm += '<div class="row">';
					sc_writeForm += '<div class="col-sm-6 form-group">';
						sc_writeForm += '<input class="form-control" id="name" name="nickName" placeholder="닉네임" type="text" required>';
					sc_writeForm += '</div>';
					sc_writeForm += '<div class="col-sm-6 form-group">';
						sc_writeForm += '<input class="form-control" id="pw" name="pw" placeholder="비밀번호" type="password" required>';
					sc_writeForm += '</div>';
				sc_writeForm += '</div>';
				sc_writeForm += '<div class="row">';
				sc_writeForm += '<div class="col-sm-12 form-group">';
				sc_writeForm += '<input class="form-control" id="title" name="title" placeholder="제목" type="text" required">';
				sc_writeForm += '</div></div>';
			sc_writeForm += '<textarea class="form-control" id="comments" name="comments" placeholder="Comment" rows="5" maxlength="500"></textarea><br/>';
			sc_writeForm += '<div class="row"><div class="col-md-12 form-group"><button class="btn pull-right type="submit" style="background-color:#2980b9; color:white;">글등록</button></div></div>';
			sc_writeForm += '</div></div></form>';
		break;	
		
	case '유승민':	
		sc_writeForm += '<form method="POST">';
		sc_writeForm += '<input type="hidden" name="color" value="#3498db">';
		sc_writeForm += '<input type="hidden" name="empNm" value='+empNm+'>';
		sc_writeForm += '<input type="hidden" name="polyNm" value='+polyNm+'>';
		sc_writeForm += '<div class="well" style="border:4px solid #3498db; background-color:#fff;">'
		sc_writeForm += '<h3 class="text-center">'+empNm+'<p><br/><em style="color:#3498db;">'+polyNm+'</em></p></h3><hr/><br/>';
		sc_writeForm += '<div class="row">';
		sc_writeForm += '<div class="col-md-offset-2 col-md-8">';
			sc_writeForm += '<div class="row">';
				sc_writeForm += '<div class="col-sm-6 form-group">';
					sc_writeForm += '<input class="form-control" id="name" name="nickName" placeholder="닉네임" type="text" required>';
				sc_writeForm += '</div>';
				sc_writeForm += '<div class="col-sm-6 form-group">';
					sc_writeForm += '<input class="form-control" id="pw" name="pw" placeholder="비밀번호" type="password" required>';
				sc_writeForm += '</div>';
			sc_writeForm += '</div>';
			sc_writeForm += '<div class="row">';
			sc_writeForm += '<div class="col-sm-12 form-group">';
			sc_writeForm += '<input class="form-control" id="title" name="title" placeholder="제목" type="text" required">';
			sc_writeForm += '</div></div>';
		sc_writeForm += '<textarea class="form-control" id="comments" name="comments" placeholder="Comment" rows="5" maxlength="500"></textarea><br/>';
		sc_writeForm += '<div class="row"><div class="col-md-12 form-group"><button class="btn pull-right type="submit" style="background-color:#3498db; color:white;">글등록</button></div></div>';
		sc_writeForm += '</div></div></form>';
		break;	
		
	default:
		break;
	}
	
	$('#writeWell').empty();
	$('#writeWell').html(sc_writeForm);
}


//로그인 했을 때 사용하는 폼
function makeMemberForm(empNm, polyNm){
	var sc_writeForm = '';
	switch (empNm) {
	case '문재인':
		sc_writeForm += '<form method="POST">';
		sc_writeForm += '<input type="hidden" name="color" value="#2980b9">';
		sc_writeForm += '<input type="hidden" name="empNm" value='+empNm+'>';
		sc_writeForm += '<input type="hidden" name="polyNm" value='+polyNm+'>';
		sc_writeForm += '<div class="well" style="border:4px solid #2980b9; background-color:#fff;">'
			sc_writeForm += '<h3 class="text-center">'+empNm+'<p><br/><em style="color:#2980b9;">'+polyNm+'</em></p></h3><hr/><br/>';
			sc_writeForm += '<div class="row">';
				sc_writeForm += '<div class="col-md-offset-2 col-md-8">';
				sc_writeForm += '<div class="row">';
					sc_writeForm += '<div class="col-sm-12 form-group">';
						sc_writeForm += '<input class="form-control" id="name" name="title" placeholder="제목" type="text" required>';
					sc_writeForm += '</div>';
				sc_writeForm += '</div>';	
			sc_writeForm += '<textarea class="form-control" id="comments" name="comments" placeholder="Comment" rows="5" maxlength="500"></textarea><br/>';
				sc_writeForm += '<div class="row">';
					sc_writeForm += '<div class="col-md-12 form-group">';
						sc_writeForm += '<button class="btn pull-right type="submit" style="background-color:#2980b9; color:white;">글등록</button>';
					sc_writeForm +=	'</div>';
				sc_writeForm +=	'</div>';
			sc_writeForm += '</div></div></div></form>';
		break;
	case '안희정':
		sc_writeForm += '<form method="POST">';
		sc_writeForm += '<input type="hidden" name="color" value="#2980b9">';
		sc_writeForm += '<input type="hidden" name="empNm" value='+empNm+'>';
		sc_writeForm += '<input type="hidden" name="polyNm" value='+polyNm+'>';
		sc_writeForm += '<div class="well" style="border:4px solid #2980b9; background-color:#fff;">'
			sc_writeForm += '<h3 class="text-center">'+empNm+'<p><br/><em style="color:#2980b9;">'+polyNm+'</em></p></h3><hr/><br/>';
			sc_writeForm += '<div class="row">';
				sc_writeForm += '<div class="col-md-offset-2 col-md-8">';
				sc_writeForm += '<div class="row">';
					sc_writeForm += '<div class="col-sm-12 form-group">';
						sc_writeForm += '<input class="form-control" id="name" name="title" placeholder="제목" type="text" required>';
					sc_writeForm += '</div>';
				sc_writeForm += '</div>';	
			sc_writeForm += '<textarea class="form-control" id="comments" name="comments" placeholder="Comment" rows="5" maxlength="500"></textarea><br/>';
				sc_writeForm += '<div class="row">';
					sc_writeForm += '<div class="col-md-12 form-group">';
						sc_writeForm += '<button class="btn pull-right type="submit" style="background-color:#2980b9; color:white;">글등록</button>';
					sc_writeForm +=	'</div>';
				sc_writeForm +=	'</div>';
			sc_writeForm += '</div></div></div></form>';
		break;
	
	case '안철수':	
		sc_writeForm += '<form method="POST">';
		sc_writeForm += '<input type="hidden" name="color" value="#1abc9c">';
		sc_writeForm += '<input type="hidden" name="empNm" value='+empNm+'>';
		sc_writeForm += '<input type="hidden" name="polyNm" value='+polyNm+'>';
		sc_writeForm += '<div class="well" style="border:4px solid #1abc9c; background-color:#fff;">'
		sc_writeForm += '<h3 class="text-center">'+empNm+'<p><br/><em style="color:#1abc9c;">'+polyNm+'</em></p></h3><hr/><br/>';
		sc_writeForm += '<div class="row">';
			sc_writeForm += '<div class="col-md-offset-2 col-md-8">';
			sc_writeForm += '<div class="row">';
				sc_writeForm += '<div class="col-sm-12 form-group">';
					sc_writeForm += '<input class="form-control" id="name" name="title" placeholder="제목" type="text" required>';
				sc_writeForm += '</div>';
			sc_writeForm += '</div>';	
		sc_writeForm += '<textarea class="form-control" id="comments" name="comments" placeholder="Comment" rows="5" maxlength="500"></textarea><br/>';
			sc_writeForm += '<div class="row">';
				sc_writeForm += '<div class="col-md-12 form-group">';
					sc_writeForm += '<button class="btn pull-right type="submit" style="background-color:#1abc9c; color:white;">글등록</button>';
				sc_writeForm +=	'</div>';
			sc_writeForm +=	'</div>';
		sc_writeForm += '</div></div></div></form>';
		break;
	
	case '이재명':
		sc_writeForm += '<form method="POST">';
		sc_writeForm += '<input type="hidden" name="color" value="#2980b9">';
		sc_writeForm += '<input type="hidden" name="empNm" value='+empNm+'>';
		sc_writeForm += '<input type="hidden" name="polyNm" value='+polyNm+'>';
		sc_writeForm += '<div class="well" style="border:4px solid #2980b9; background-color:#fff;">'
			sc_writeForm += '<h3 class="text-center">'+empNm+'<p><br/><em style="color:#2980b9;">'+polyNm+'</em></p></h3><hr/><br/>';
			sc_writeForm += '<div class="row">';
				sc_writeForm += '<div class="col-md-offset-2 col-md-8">';
				sc_writeForm += '<div class="row">';
					sc_writeForm += '<div class="col-sm-12 form-group">';
						sc_writeForm += '<input class="form-control" id="name" name="title" placeholder="제목" type="text" required>';
					sc_writeForm += '</div>';
				sc_writeForm += '</div>';	
			sc_writeForm += '<textarea class="form-control" id="comments" name="comments" placeholder="Comment" rows="5" maxlength="500"></textarea><br/>';
				sc_writeForm += '<div class="row">';
					sc_writeForm += '<div class="col-md-12 form-group">';
						sc_writeForm += '<button class="btn pull-right type="submit" style="background-color:#2980b9; color:white;">글등록</button>';
					sc_writeForm +=	'</div>';
				sc_writeForm +=	'</div>';
			sc_writeForm += '</div></div></div></form>';
		break;	
		
	case '유승민':	
		sc_writeForm += '<form method="POST">';
		sc_writeForm += '<input type="hidden" name="color" value="#3498db">';
		sc_writeForm += '<input type="hidden" name="empNm" value='+empNm+'>';
		sc_writeForm += '<input type="hidden" name="polyNm" value='+polyNm+'>';
		sc_writeForm += '<div class="well" style="border:4px solid #3498db; background-color:#fff;">'
			sc_writeForm += '<h3 class="text-center">'+empNm+'<p><br/><em style="color:#3498db;">'+polyNm+'</em></p></h3><hr/><br/>';
			sc_writeForm += '<div class="row">';
				sc_writeForm += '<div class="col-md-offset-2 col-md-8">';
				sc_writeForm += '<div class="row">';
					sc_writeForm += '<div class="col-sm-12 form-group">';
						sc_writeForm += '<input class="form-control" id="name" name="title" placeholder="제목" type="text" required>';
					sc_writeForm += '</div>';
				sc_writeForm += '</div>';	
			sc_writeForm += '<textarea class="form-control" id="comments" name="comments" placeholder="Comment" rows="5" maxlength="500"></textarea><br/>';
				sc_writeForm += '<div class="row">';
					sc_writeForm += '<div class="col-md-12 form-group">';
						sc_writeForm += '<button class="btn pull-right type="submit" style="background-color:#3498db; color:white;">글등록</button>';
					sc_writeForm +=	'</div>';
				sc_writeForm +=	'</div>';
			sc_writeForm += '</div></div></div></form>';
		break;	
		
	default:
		break;
	}
	
	$('#writeWell').empty();
	$('#writeWell').html(sc_writeForm);

}


$(document).ready(function(){

	var loginId = $('#loginNick').val();
	
	//드래그앤 드롭 하는 스크립트
	$("#draggable span").draggable({
		start : function(event, ui){
			$(this).draggable("option", "revert", true);	
		}
	});
	
	$("#droppable").droppable({
    	drop: function( event, ui ) {
			var dragid = ui.draggable.attr("id");
			var polyNm = ui.draggable.attr("name");
			if(loginId == '' || loginId == null){
				makeForm(dragid, polyNm);
			}else{
				makeMemberForm(dragid, polyNm);
			}
    	}
	});
	
	$('#modalDelBtn').click(function(){
		alert("모달 글 삭제2 !");
		var seq = $('#hiddenSeq').val();
		var id = $('#modal_nickName').val();
		var pw = $('#modal_pw').val();
		
		$.ajax({
			url : "deletePresidentTalk.do",
			data : {
				seq : seq,
				id : id,
				pw : pw
			},
			success : function(data){
				if(data.result > 0){
					alert("글삭제 성공 !");
					location.href="PresidentTalk.do";
				}else{
					alert("죄송합니다. 잠시후 이용해주세요");
					location.href="PresidentTalk.do";
				}
			}
		});
		
	});
	
	var talkCount = 0;
	//더보기 버튼 클릭시 
	$('#moreTalkBtn').click(function(){
		talkCount = (talkCount+1);
		$.ajax({
			url : "PresidentAjaxTalk.do",
			data : {
				talkCount : talkCount
			},
			success : function(data){
		
				if(data.comment_List.length != 0){
				var notLogin = ''; 
				$.each(data.comment_List,function(index, obj){
					console.log("확인좀 : "+obj.title);
					if(obj.loginPw == null || obj.loginPw == ''){
						notLogin += '<div class="panel panel-default">'
						notLogin += '<div class="panel-heading" style="color:#fff; background-color:'+obj.color+'">'+obj.title+'<em>('+obj.empNm + '/'+obj.polyNm+')</em> <span class="pull-right">'+obj.writeDate+'<input type="hidden" value='+obj.presidentTalk_seq+'><i class="material-icons" style="font-size:15px" data-toggle="modal" data-target="#talkModal" onclick="delteComment(this)">delete</i></span></div>';
						notLogin += '<div class="panel-body">'+obj.comments+'</div></div>'
					}else{
						notLogin += '<div class="panel panel-default">'
						notLogin += '<div class="panel-heading" style="color:#fff; background-color:'+obj.color+'">'+obj.title+'<em>('+obj.empNm + '/'+obj.polyNm+')</em> <span class="pull-right">'+obj.writeDate+'<input type="hidden" value='+obj.presidentTalk_seq+'><i class="material-icons" style="font-size:15px" data-toggle="modal" data-target="#talkModal" onclick="deleteCommentUser(this)">delete</i></span></div>';
						notLogin += '<div class="panel-body">'+obj.comments+'</div></div>'
					}
				});
				
				}else{
					alert("더이상 내용이 없습니다.");
				}
				
				$('#makeDiv').html(notLogin);
			}	
		});
	});
	
});