$(document).ready(function(){
	$("#searchBtn").click(function(){
		$.ajax({
			url:"PaliamentCommentSearch.do",
			data : {
				polyNm : $('#polyNm').val(),
				orignm : $('#orignm').val(),
				name : $('#name').val()
			},
			success : function(data){
				var palComm = $("#pal-comm");
				palComm.empty();
				
				var list;
				var div = "";
				var flag= 0;
				$(data).each(function(index,item){
					with(item){
						$(list).each(function(index,item){
							with(item){
								if(flag==0||flag!=deptcd){
									flag = deptcd;
									div += '<div class="media pal">';
									div += '<div class="media-left media-middle">';
									div += '<img src="'+img+'" class="media-object" style="width:40px; height: 60px;">';
									div += '</div>';
									div += '<div class="media-body">';
									div += '<h4 class="media-heading">'+orignm+'</h4>';
									div += '<h4>'+name+'</h4>';
									div += '</div>';
									div += '<hr>';
									div += '</div>';
								}
								div += '<div class="media sub">';
								div += '<div class="media-body">';
								div += '<h4 class="media-heading">'+writer+'</h4>';
								div += '<p>'+content+'</p>';
								div += '</div>';
								div += '</div>';
							}
						});
					}
				});

				if(flag == 0){
					div += '<div class="container">';
					div += '<div class="row" id="resultDiv">';
					div += '<div class="col-md-offset-4 col-md-4">';
					div += '<div class="well customWell text-center">';
					div += '<span class="text-center"><i class="fa fa-meh-o" style="font-size:48px;color:red"></i></span><br/><br/>';
					div += '<p>해당 의원이 없거나 의원에게 쓰인 댓글이 없습니다.</p>';
					div += '</div>';
					div += '</div>';
					div += '</div>';
					div += '</div>';
				}
				palComm.html(div);
			}
		});
	});
	
	$("#name").keypress(function(e){
		if(e.which==13){
			$("#searchBtn").click();
		}
	});

});