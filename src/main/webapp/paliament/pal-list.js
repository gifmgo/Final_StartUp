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
});