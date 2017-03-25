/**
 * 
 */
$(document).ready(function(){
	
	$('#paliamentD').css("display","block");
	$('#presidentDiv').css("display","none");
	
	//의원 검색
	$('#paliamentLi').click(function(){
		
		$('#paliamentLi').addClass("active");
		$('#presidentLi').removeClass("active");
		
		$('#paliamentD').css("display","block");
		$('#presidentDiv').css("display","none");
	});
	
	//대선 검색
	$('#presidentLi').click(function(){
		$('#paliamentLi').removeClass("active");
		$('#presidentLi').addClass("active");
		
		$('#paliamentD').css("display","none");
		$('#presidentDiv').css("display","block");
	});
	
	
});