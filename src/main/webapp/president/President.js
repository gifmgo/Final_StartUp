/**
 * 
 */
$(document).ready(function(){
	var topBar = $('#topBar').offset();
	
	$(window).scroll(function(){
		
		var doScrollY = $(document).scrollTop();
		var barThis = $("#topBar");
		var fixNext = $("#fixNextTag");
		
		if(doScrollY > topBar.top){
			barThis.addClass("top_bar_fix");
			fixNext.addClass("pd_top_80");
		}else{
			barThis.removeClass("top_bar_fix");
			fixNext.removeClass("pd_top_80");
		}
	});
	
	
	$('#listGroupBtn').click(function(){
		
	});
	
	$('#graphBtn').click(function(){
		location.href="PresidentGraph.do";
	});
	
	$('#tooPyooBtn').click(function(){
		
	});
	
	$('#presidentTalkBtn').click(function(){
		
	});
	
});