$(document).ready(function(e) {
	//댓글 쓰기 관련
	$("#talkWrite").hide();
	$(".double_comm").hide();
	$("#commButton").click(function() {
		if($(this).attr("data-id")==null){
			//로그인 연결
		}else{
			$("#talkWrite").show();
		}	
	});
	
	//답글 펼치기
	$(".cocobutton").click(function(){
		var flag = $(this).attr("value");
		var grpno = $(this).attr("data-grpno");
		
		if(flag==0){
			$(".comm"+grpno).show();
			$(this).attr("value", 1);
		}else{
			$(".comm"+grpno).hide();
			$(this).attr("value", 0);
		}
	});
	
	//답글 수정 뷰
	$(".commmod").click(function(){
		var co_no = $(this).attr("data-cono");
		var depth = $(this).attr("data-depth");
		var li = $(this).parent().parent();
		var content = li.find(".content").html();
		content = content.replace(/<br>/g, '\n');
		li.empty();
		var div = '<textarea style="resize:none;">'+content+'</textarea>';
		div += '<button class="commmodButton" data-cono="'+co_no+'">등록</button>';
		li.append(div);
	});
	
	//답글 수정 뷰
	$("#commList").on("click",".commmodButton",function(){
		var dept_cd = $("#detailHiden_dept_cd").val();
		var img = $("#detail_img").val();
		var num = $("#detailHiden_num").val();
		var name = $("#detailName").val();
		var no = $("#detailHiden_num").val();
		
		var co_no = $(this).attr("data-cono");
		var content =$(this).prev().val();
		content = content.replace(/\n/g, "<br>");
		
		$.ajax({
			url: "paliamentmodifyComment.do",
			type : "POST",
			data : {
				no : no,
				dept_cd: dept_cd,
				img : img,
				name : name,
				num : num,
				content : content,
				co_no : co_no
			},
			beforeSend: function()
			   { 
			    $(this).attr("disable",true);
			 },
			success : function(data){
				$(data).each(function(index,item){
					with(item){
						if(result==1){
							location.href='PaliamentDetail.do?num='+num+'&dept_cd='+dept_cd+'&img='+img+'&name='+name;
						}else{
							alert("다시 시도해주세요");
						}
					}
				});
			},
			error : function(){
				$(this).attr("disable",false);
			}
		});
	});
	
	//답글,댓글 쓰기
	$(".commButton").click(function(){
		var dept_cd = $("#detailHiden_dept_cd").val();
		var img = $("#detail_img").val();
		var num = $("#detailHiden_num").val();
		var name = $("#detailName").val();

		var no = $("#detailHiden_num").val();
		var depth = $(this).attr("data-depth");
		var cono = $(this).attr("data-cono");
		var content = $(this).prev().val();
		content = content.replace(/\n/g, "<br>");
		
		$.ajax({
			url: "paliamentCommentWrite.do",
			type : "POST",
			data : {
				no : no,
				dept_cd: dept_cd,
				img : img,
				name : name,
				num : num,
				content : content,
				depth : depth,
				coNo : cono
			},
			beforeSend: function()
			   { 
			    $(this).attr("disable",true);
			 },
			success : function(data){
				$(data).each(function(index,item){
					with(item){
						if(result==1){
							location.href='PaliamentDetail.do?num='+num+'&dept_cd='+dept_cd+'&img='+img+'&name='+name;
						}else{
							alert("로그인 해줘");
						}
					}
				});
			},
			error : function(){
				$(this).attr("disable",false);
			}
		});
	});
	
	//답글,댓글 삭제
	$(".commdel").click(function(){
		var dept_cd = $("#detailHiden_dept_cd").val();
		var img = $("#detail_img").val();
		var num = $("#detailHiden_num").val();
		var name = $("#detailName").val();
		var no = $("#detailHiden_num").val();
		
		var depth = $(this).attr("data-depth");
		var cono = $(this).attr("data-cono");
		
		if(confirm('삭제하시겠습니까?')){
			$.ajax({
				url: 'paliamentRemoveComment.do',
				data : {
					no : no,
					dept_cd: dept_cd,
					img : img,
					name : name,
					num : num,
					depth : depth,
					co_no : cono
				},
				beforeSend: function()
				   { 
				    $(this).attr("disable",true);
				 },
				success : function(data){
					$(data).each(function(index,item){
						with(item){
							if(result>=1){
								location.href='PaliamentDetail.do?num='+num+'&dept_cd='+dept_cd+'&img='+img+'&name='+name;
							}else{
								alert("다시 시도해주세요.");
							}
						}
					});
				},
				error : function(){
					$(this).attr("disable",false);
				}
			});
		}
	});
});
