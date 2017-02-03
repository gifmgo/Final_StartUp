/**
 * 
 */

$(function(){
	
	
	$('#debateWriteBtn').click(function(){
		
		var choose = $('input[name=choose]:radio:checked').val();
		
		if(choose != undefined){
			alert("라디오버튼 체크 값 확인  : "+choose);
			
			var textArea = $('#debateTextArea').val();
			var loginNickName=$('#loginNickName').val();
			var debateWord = $('#debateWord').val();
			alert("textArea : "+textArea + " /  loginNickName  : "+loginNickName); 
			$.ajax({
				url:"DebateWrite.do",
				data : {
					debateWord : debateWord,
					nickName : loginNickName,
					content : textArea,
					choose : choose
				},
				success : function(data){
					alert(data.result);
				}
			});
			
		}else{
			alert("성향을 선택해주세요 !");
			
		}
		
		
	});
	
});