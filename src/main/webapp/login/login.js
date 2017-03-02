/**
 * 로그인 관련 
 */

$(document).ready(function(){
	$('#loginSubmitLabel').click(function(){
		
		var id=$('#email').val();
		var pwd =$('#pwd').val();
		
		$.ajax({
			url:"LoginPage.do",
			type : "POST",
			data:{
				id: id,
				pw:pwd
			},
			success : function(data){
				if(data.msg=='성공'){
					alert('로그인 성공');
					history.back();
				}else{
					alert('로그인 실패, 아이디와 비밀번호를 다시 확인해주세요');
				}
			}
		});
	});
});