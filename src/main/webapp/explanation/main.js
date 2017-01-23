// JavaScript Document
$(document).ready(function(e) {
    
	var didsub = 0;
	var pNum = 0;
	var psts = 0;
	var mwEvt = (/Firefox/i.test(navigator.userAgent)?"DOMMouseScroll":"mousewheel");	
	
	text_slide();
	setInterval("text_slide()",8000);
	
	$("#nav>div").eq(1).click(function() {
		
		$("#login_bg").fadeIn();
		$("#loginForm").fadeIn();	
	});
	
	$("#loginForm>span").click(function(e) {
        
		$("#login_bg").fadeOut();
		$("#loginForm").fadeOut();
		
		setTimeout("loginDisplay()", 1000);
    }); 	
	
	$("#login>button").eq(1).click(function() {
		
		$("#login").css("display","none");
		$("#register").css("display","block");	
	});
	
	$("#register>button").eq(0).click(function() {
		
		$("#login").css("display","block");
		$("#register").css("display","none");	
	});
	
	$("#login").find("p").click(function(e) {
        
		$("#login").css("display","none");
		$("#find_password").css("display","block");	
    });
	
	$("#gender").find("li").click(function(e) {
        
		$(this).css({backgroundColor:"#333",color:"#fff"}).siblings().css({backgroundColor:"#fff",color:"#000"});
    });
	
	
	var inter0 = 0;
	var inter1 = 0;
	var inter2 = 0;
	var inter3 = 0;
	$("#interest").find("li").click(function(e) {
        var interSts = $(this).index();
		console.log(interSts);
		
		switch(interSts) {
			case 0:
				if(inter0 == 0) {
					$(this).css({backgroundColor:"#333",color:"#fff"});
					inter0 = 1;
				} else if(inter0 == 1) {
					$(this).css({backgroundColor:"#fff",color:"#000"});
					inter0 = 0;
				}
				break;
				
			case 1:
				if(inter1 == 0) {
					$(this).css({backgroundColor:"#333",color:"#fff"});
					inter1 = 1;
				} else if(inter1 == 1) {
					$(this).css({backgroundColor:"#fff",color:"#000"});
					inter1 = 0;
				}
				break;
				
			case 2:
				if(inter2 == 0) {
					$(this).css({backgroundColor:"#333",color:"#fff"});
					inter2 = 1;
				} else if(inter2 == 1) {
					$(this).css({backgroundColor:"#fff",color:"#000"});
					inter2 = 0;
				}
				break;
				
			case 3:
				if(inter3 == 0) {
					$(this).css({backgroundColor:"#333",color:"#fff"});
					inter3 = 1;
				} else if(inter3 == 1) {
					$(this).css({backgroundColor:"#fff",color:"#000"});
					inter3 = 0;
				}
				break;
					
		}
		
    });
	
	var address = location.href.split("/");
	var leng = address.length;	
	address = address[leng-1].split(".")[0];
	
	if(address == "index" || address == "header") {
		didsub = 0;
	} else {
		didsub = 1;	
	}
	
	if(didsub == 1) {
		$("#nav").css({position:"relative", opacity:"1"});
	}
	
	
	
	
	var bot_sts = 0;
	$("#bott_menu").click(function(e) {
     	var bott_ul = $("#banner>div").eq(1).find("ul").height();
	 	
		if(bot_sts == 0) {
			$("#banner>div").eq(1).animate({bottom:"0px"});
			$("#bott_menu").html('<i class="fa fa-angle-double-down" aria-hidden="true"></i>');
			bot_sts = 1;
		} else if(bot_sts == 1) {
			$("#banner>div").eq(1).animate({bottom:-bott_ul+"px"});
			$("#bott_menu").html('<i class="fa fa-angle-double-up" aria-hidden="true"></i>');
			bot_sts = 0;
		}
    });
	
	$(window).resize(function() {
		var bott_ul = $("#banner>div").eq(1).find("ul").height();
		
		if(bot_sts == 0) { 
			$("#banner>div").eq(1).css({bottom:-bott_ul+"px"});
		} else if(bot_sts == 1) {
			$("#banner>div").eq(1).css({bottom:"0px"});
		}
			
	});
	
	$("#mainMenu").find("li").eq(3).hover(function(){
		$("#menu_bg").stop().animate({height:"80px"},300);
	}, function(){
		$("#menu_bg").stop().animate({height:"0px"},300);
	});
	
	var mSts = 0;
	$("#nav>div").eq(0).click(function() {
		
		if(mSts == 0) {
			$("#m_menu").animate({height:"200px"});
			mSts = 1;
		} else if(mSts == 1) {
			
			$("#m_menu").animate({height:"0"});	
			mSts = 0;
		}
	});
	
	
});


var tSts = 0;
function text_slide() {
	
	console.log(tSts);
	
	if(tSts == 0) {
		$("#banner>div").eq(0).find("h2").animate({top:"0",opacity:"1"},1000);	
		$("#banner>div").eq(0).find("p").delay(200).animate({top:"0",opacity:"1"},1000);
		
		$("#banner>div").eq(0).find("h2").delay(5000).animate({top:"-50px",opacity:"0"},1000,function() {
			$(this).text("대한민국 헌법 1조 2항");
			$("#banner>div").eq(0).find("h2").css({top:"50px",opacity:"0"});
		});	
		$("#banner>div").eq(0).find("p") .delay(5000).animate({top:"-50px",opacity:"0"},1000,function() {
			$(this).text("대한민국의 주권은 국민에게 있고, 모든 권력은 국민으로부터 나온다.");
			$("#banner>div").eq(0).find("p").css({top:"50px",opacity:"0"});
		});
		
		tSts = 1;
		
	} else if (tSts == 1) {
		$("#banner>div").eq(0).find("h2").animate({top:"0",opacity:"1"},1000);	
		$("#banner>div").eq(0).find("p").delay(200).animate({top:"0",opacity:"1"},1000);
		
		$("#banner>div").eq(0).find("h2").delay(5000).animate({top:"-50px",opacity:"0"},1000,function() {
			$(this).text("대한민국 헌법 1조 1항");
			$("#banner>div").eq(0).find("h2").css({top:"50px",opacity:"0"});
		});	
		$("#banner>div").eq(0).find("p").delay(5000).animate({top:"-50px",opacity:"0"},1000,function() {
			$(this).text("대한민국은 민주공화국이다.");
			$("#banner>div").eq(0).find("p").css({top:"50px",opacity:"0"});
		});
		
		tSts = 0;
	}
}

function loginDisplay() {
	$("#login").css("display","block");
	$("#register").css("display","none");
	$("#find_password").css("display","none");
}