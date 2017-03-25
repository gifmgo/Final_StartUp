$(document).ready(function(){
	
	var img = $(".pal-img");
	var p = $(".pal-p");
	var name = $(".pal-name");
	
	if(window.innerWidth < 500){
		img.addClass("displayNone");
		p.addClass("pheight");
		name.addClass("widthauto");
	}else{
		img.removeClass("displayNone");				
		p.removeClass("pheight");				
		name.removeClass("widthauto");				
	}
	
	$(window).resize(function(){
		if(window.innerWidth < 500){
			img.addClass("displayNone");
			p.addClass("pheight");
			name.addClass("widthauto");
		}else{
			img.removeClass("displayNone");				
			p.removeClass("pheight");				
			name.removeClass("widthauto");				
		}
	});
	
	$(document).on("click",".pal-click", function(){
		var num=$(this).attr("data-num");
		var deptcd=$(this).attr("data-deptcd");
		var img=$(this).attr("data-img");
		var name=$(this).attr("data-name");
		var url = "PaliamentDetail.do?num="+num+"&dept_cd="+deptcd+"&img="+img+"&name="+name;
		url= encodeURI(url);
		
		location.href= url;
	});
	
	$('#dashBoardTalkBtn').click(function(){
   	 	location.href="Paliament_DashBoard.do"; 
     });
	
	$('#empNm').keypress(function(e){
		if(e.which==13){
			$("#searchBtn").click();
		}
	});
});