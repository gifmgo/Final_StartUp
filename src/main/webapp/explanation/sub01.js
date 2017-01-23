// JavaScript Document

$(document).ready(function(e) {
    
	$("#tabMenu").find("li").click(function(e) {
        
		var tSts = $(this).index();
		
		//console.log(tSts);
		
		$(this).css({backgroundColor:"#333",color:"#fff"}).siblings().css({backgroundColor:"#fff",color:"#000"});
		
		$("#tabContent").find("div").eq(tSts).css({display:"block"}).siblings().css({display:"none"});
    });

	
	$("#news>ul").find("li").click(function(e) {
        
		$(this).css({backgroundColor:"#333",color:"#fff"}).siblings().css({backgroundColor:"#fff",color:"#000"});
    });

	
	$("#comm>div").find("span").click(function() {
		
		$("#comm>div").html("<textarea></textarea><button>등록</button>");	
	});
	
	var tr_length = $("#bill_table").find("tr").length;

	
	var billSts = 0;
	$("#bill").find("button").click(function() {
		
		if(billSts == 0) {	
			$("#bill").animate({height:500+(50*(tr_length-5))},400);
			$("#bill").find("div").animate({height:(50*(tr_length))},400);
			billSts = 1;
		} else if(billSts == 1) {
			$("#bill").animate({height:"500px"},400);
			$("#bill").find("div").animate({height:"290px"},400);
			billSts = 0;
		}
	});
	
	$("#attendance_table ul").find("li").click(function(e) {
        
		$(this).css({backgroundColor:"#333",color:"#fff"}).siblings().css({backgroundColor:"#fff",color:"#000"});
    });
	
	$(".pgNum").click(function(e) {
        
		$(this).css({backgroundColor:"#333",color:"#fff"}).siblings().css({backgroundColor:"#fff",color:"#000"});
    });
	
	var property_list = $("#property>ul").find("li").length;
	
	$("#property").css({height:250+(50*property_list)});

	var tb_height = $("#info").height();

	$("#basicInfo").css({height:600 + tb_height});


	$("#wrap>button").click(function(e) {
        var nick_form = "";
		nick_form += '<input type="text" class="nick" placeholder="닉네임을 입력하세요"/>';
		nick_form += '<button class="short_btn">중복확인</button>';
		
		var interest = '';
		interest += '<th>관심사</th>';
		interest += '<td><input type="checkbox"/>경제</td>';
		interest += '<td><input type="checkbox"/>사회</td>';
		interest += '<td><input type="checkbox"/>연예</td>';
		interest += '<td><input type="checkbox"/>스포츠</td>';
		
		$("#personal_tb>table").find("tr").eq(1).find("td").html(nick_form);
		$("#personal_tb>table").find("tr").eq(4).html(interest);
		$(this).text("수정완료");
    });
});