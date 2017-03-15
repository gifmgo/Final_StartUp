$(document).ready(function(){
	/*$(".orignm").hide();
	$("#polyNm").change(function(){
		var polyNm = $(this).val; 
		alert(ployNm);
		$.ajax({
			url:"ajaxPalPolyNm.do",
			data : {
				polyNm :$(this).val
			},
			success : function(data){
				$(".orignm").show();
			}
		});
	});
	
	$("#polyNm").change(function(){
		$.ajax({
			url:"PaliamentDetailView.do",
			data : {
				num : $('#detailHiden_num').val(),
				dept_cd : $('#detailHiden_dept_cd').val(),
				img : $('#detail_img').val()
			},
			success : function(data){
				
			}
		});
	});
	*/
	
	$("#searchBtn").click(function(){
		$.ajax({
			url:"PaliamentCommentSearch.do",
			data : {
				polyNm : $('#polyNm').val(),
				orignm : $('#orignm').val(),
				name : $('#name').val()
			},
			success : function(data){
				alert("성공");
				/*$(data).find(){
					
				}*/
			}
		});
	});
	
	
	$("#name").keypress(function(e){
		if(e.which==13){
			$("#searchBtn").click();
		}
	});
	
	
});