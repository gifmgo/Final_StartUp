/**
 * 
 */

	$.ajax({
		url : "AssemblyStatueList.do",
		success : function(data){
			var table = '';
			$.each(data.statutelist,function(index, obj){
				console.log("obj.billId : "+obj.billId);
				table += '<tr>';
				table += '<td>'+obj.proposeDt+'</td>';
				table += '<td><a target="_blank" href=http://likms.assembly.go.kr/bill/billDetail.do?billId='+obj.billId+'>'+obj.billName+'</a></td>';
				table += '<td>'+obj.committeeName+'</td>';
				table += '<td>'+obj.generalResult+'</td>';
				table += '</tr>';
			});
			$('#statuteTbody').html(table);
		}
	});
	
	$.ajax({
		url:"AssemblyPaliamentList.do",
		success : function(data){
			
			//ba - 바른정당, guck - 국민의당, dou - 더불어 민주당, free - 자유 한국당
			//jung - 정의당, mu - 무소속

			var ba=0;
			var guck = 0;
			var dou = 0;
			var free = 0;
			var jung = 0;
			var mu = 0;
			
			var guckicon='';
			var baicon = '';
			var douicon = '';
			var freeicon = '';
			var jungicon = '';
			var muicon = '';
			$.each(data.paliament_list, function(index, obj){
				if(obj.polyNm == '국민의당'){
					guckicon+='<i class="material-icons" style="font-size:15px; color:#79b394;">perm_identity</i>';
					guck++;
				}
				if(obj.polyNm == '더불어민주당'){
					douicon += '<i class="material-icons" style="font-size:15px; color:#1870b9;">perm_identity</i>';
					dou++;
				}
				if(obj.polyNm == '바른정당'){
						baicon+='<i class="material-icons" style="font-size:15px; color:#01b1ec;">perm_identity</i>';
						ba++;
				}
				if(obj.polyNm == '자유한국당'){
					freeicon+='<i class="material-icons" style="font-size:15px; color:#dc5356;">perm_identity</i>';
					free++;
				}
				if(obj.polyNm == '정의당'){
					jungicon += '<i class="material-icons" style="font-size:15px; color:#f2c755;">perm_identity</i>';
					jung++;
				}
				if(obj.polyNm == '무소속'){
					muicon += '<i class="material-icons" style="font-size:15px; color:#a6a6a6;">perm_identity</i>';
					mu++;
				}
			});

			$('#guckSpan').text(guck + "명");
			$('#guckDiv').html(guckicon);
			
			$('#doubSpan').text(dou + "명");
			$('#doubDiv').html(douicon);
			
			$('#baSpan').text(ba + "명");
			$('#baDiv').html(baicon);
			
			$('#freeSpan').text(free +"명");
			$('#freeDiv').html(freeicon);
			
			$('#jungSpan').text(jung +"명");
			$('#jungDiv').html(jungicon);
			
			$('#muSpan').text(mu +"명");
			$('#muDiv').html(muicon);
		}
	});

	
$(document).ready(function(){
	//국민의당
	$('#guckDiv').hover(function(){
		$(this).contents().css("font-size","18px");
	});
	
	$('#guckDiv').mouseleave(function(){
		$(this).contents().css("font-size","15px");
	});
	//더불어 민주당
	$('#doubDiv').hover(function(){
		$(this).contents().css("font-size","18px");
	});
	$('#doubDiv').mouseleave(function(){
		$(this).contents().css("font-size","15px");
	});
	//바른 정당
	$('#baDiv').hover(function(){
		$(this).contents().css("font-size","18px");
	});
	
	$('#baDiv').mouseleave(function(){
		$(this).contents().css("font-size","15px");
	});
	
	//무소속
	$('#muDiv').hover(function(){
		$(this).contents().css("font-size","18px");
	});
	$('#muDiv').mouseleave(function(){
		$(this).contents().css("font-size","15px");
	});
	//정의당
	$('#jungDiv').hover(function(){
		$(this).contents().css("font-size","18px");
	});
	$('#jungDiv').mouseleave(function(){
		$(this).contents().css("font-size","15px");
	});
	//자유 한국당
	$('#freeDiv').hover(function(){
		$(this).contents().css("font-size","18px");
	});
	$('#freeDiv').mouseleave(function(){
		$(this).contents().css("font-size","15px");
	});
	
	$('#moreStatueBtn').click(function(){
		location.href="statute.do";
	});
	
	
});	
	
