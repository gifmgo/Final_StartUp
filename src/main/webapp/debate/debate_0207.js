/**
 * 
 */

//글 상세 보기
function detailDebate(no){
	var seq = no;
	$.ajax({
		url:"debateDetail.do",
		data : {
			seq : seq
		},
		success : function(data){
			if(data.msg == "1"){
				
				var dto = data.dto
				
				$('#dbTitle').empty();
				$('#dbcontent').empty();
				$('#date').empty();
				
				console.log(dto.title + " / " + dto.content + " / "+dto.writeDate);
				
				$('#dbTitle').append(dto.title);
				$('#dbcontent').append(dto.content);
				$('#date').append(dto.writeDate);
				$('#myModal').modal();
			}else{
				alert("죄송합니다. 잠시후 이용해 주세요 !");
			}
		}
	});
	
}


$(function(){
	
	
	$('#debateWriteBtn').click(function(){
		var choose = $('input[name=choose]:radio:checked').val();
		if(choose != undefined){
			alert("라디오버튼 체크 값 확인  : "+choose);
			
			if(choose == 'Bo'){
				choose = '보수';
			}else{
				choose = '진보';
			}
			var textArea = $('#debateTextArea').val();
			var loginNickName=$('#loginNickName').val();
			var debateWord = $('#debateWord').val();
			var title = $('#title').val();
			alert("textArea : "+textArea + " /  loginNickName  : "+loginNickName); 
			$.ajax({
				url:"DebateWrite.do",
				data : {
					debateWord : debateWord,
					nickName : loginNickName,
					content : textArea,
					choose : choose,
					title : title
				},
				success : function(data){
					alert(data.result);
					var result = data.resultNo;
					if(result > 0){
						alert("result > 0 보다 큼");
						location.href="writeResult.do";	
					}
					
				}
			});
			
		}else{
			alert("성향을 선택해주세요 !");
			
		}
	});
});