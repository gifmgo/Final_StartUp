/*$(document).ready(function(){
	var topBar = $('#header-navBar').offset();
	$("#mobile-nav-img").hide();
	$("#under-nav").hide();
	
	$(window).scroll(function(){
		var doScrollY = $(document).scrollTop();
		var barThis = $("#header-navBar");
		var fixNext = $("#header-padding");
		var logo = $("#mobile-nav-img");
		
		if(doScrollY > topBar.top){
			barThis.addClass("top_bar_fix");
			if(window.innerWidth<768){
				fixNext.addClass("pd_top_38");
			}else{
				fixNext.addClass("pd_top_60");				
			}
		}else{
			barThis.removeClass("top_bar_fix");
			logo.hide();
			if(window.innerWidth<768){
				fixNext.removeClass("pd_top_38");
				fixNext.removeClass("pd_top_60");
			}else{
				fixNext.removeClass("pd_top_38");
				fixNext.removeClass("pd_top_60");
			}
		}
	});
});*/
