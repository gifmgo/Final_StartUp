/**
 * 
 */

//글 상세 보기
function detailDebate(no, $tag){
	var seq = no;
	var $tag2 = $tag;
	console.log("태그 : " +$tag2);
	
	$.ajax({
		url:"debateDetail.do",
		data : {
			seq : seq
		},
		success : function(data){
			if(data.msg == "1"){
				var dto = data.dto;
				var div = "<div>";
				div += "<span> 제목 : "+dto.title+"</span><br/>";
				div += "<span> 내용 : "+dto.content+"</span><br/>";
				div += "<span> 날짜 : "+dto.writeDate+"</span><br/></div>";
				$tag2.append(div);
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