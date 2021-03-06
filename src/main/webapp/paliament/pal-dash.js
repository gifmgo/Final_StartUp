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
									div += '<div class="media-right morebtn">';
									div += '<p class="purl" data-num="'+no+'" data-deptcd="'+deptcd+'" data-img="'+img+'" data-name="'+name+'">더 보러가기<span class="glyphicon glyphicon-menu-right"></span></p>';
									div += '</div>';
									div += '</div>';
								}
								div += '<div class="media">';
								div += '<div class="sub">';
								div += '<div class="media-left media-middle">';
								div += '<span class="media-object glyphicon glyphicon-user" style="width:40px; height: 60px; font-size: 38px;"></span>';
								div += '</div>';
								div += '<div class="media-body">';
								div += '<h4 class="media-heading">'+writer+'</h4>';
								div += '<p>'+content+'</p>';
								div += '</div>';
								div += '</div>';
								div += '<hr style="margin-top: 0px; margin-bottom: 5px;">';
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
	
	$(document).on("click",".purl", function(){
		var num=$(this).attr("data-num");
		var deptcd=$(this).attr("data-deptcd");
		var img=$(this).attr("data-img");
		var name=$(this).attr("data-name");
		var url = "PaliamentDetail.do?num="+num+"&dept_cd="+deptcd+"&img="+img+"&name="+name;
		url= encodeURI(url);
		
		location.href= url;
	});

});