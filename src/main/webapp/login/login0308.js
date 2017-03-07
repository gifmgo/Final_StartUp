/**
 * 로그인 관련 
 */

$(document).ready(function(){
	$('#loginSubmitLabel').click(function(){
		
		var id=$('#email').val();
		var pwd =$('#pwd').val();
		var prev = $('#prevURI').val();
		$.ajax({
			url:"LoginPage.do",
			type : "POST",
			data:{
				id: id,
				pw:pwd,
				prev:prev
			},
			success : function(data){
				if(data.msg=='성공'){
					alert(data.msg);
					if(data.result == '관리자'){
						location.href="adminIndex.do";
					}else{
						location.href=data.prev;
					}
				}else if(data.msg == '실패'){
					alert('로그인 실패, 아이디와 비밀번호를 다시 확인해주세요');
				}else{
					location.href="banPage.do";
				}
			}
		});
	});
});