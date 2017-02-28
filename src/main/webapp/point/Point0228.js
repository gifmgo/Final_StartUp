/**
 * 
 */

//포인트 > 국회의원 상세 보기 넘어가는 부분
function detailPointPaliament(tag){

	//String num, String dept_cd, String img, String name
	var $button = $(tag).parent().parent();
	var dept_cd = $button.children().eq(0).val();
	var num = $button.children().eq(1).val();
	var img = $button.children().eq(2).attr("id");
	var name = $button.children().eq(3).val();
	
	var jungDang = $button.children().eq(4).val();
	var point = $button.children().eq(5).val();
		point += 'Point';
	var inputHidden=$button.children().eq(5).val();
	
	$('#paliamentImg').attr('src','');
	$('#modalName').val();
	$('#modalPolyNm').text();
	$('#modalPoint').text();
	
	
	$('#modalHiddenDeptCd').val('');
	$('#modalHiddenNum2').val('');
	$('#modalHiddenEmpNm').val('');
	$('#hiddenModalPoint').val('');
	$('#hiddenModalDeptCd').val('');
	
	$('#paliamentImg').attr('src',img);
	$('#modalName').text(name);
	$('#modalPolyNm').text(jungDang);
	$('#modalPoint').text(point);
	$('#hiddenModalPoint').val(inputHidden);
	$('#myModal').modal();
	
	$('#modalHiddenDeptCd').val(dept_cd);
	$('#modalHiddenNum2').val(num);
	$('#modalHiddenEmpNm').val(name);
	
}


function detailView(){
	var num =$('#modalHiddenNum2').val();
	var dept_cd = $('#modalHiddenDeptCd').val();
	var img = $('#paliamentImg').attr('src');
	var name = $('#modalHiddenEmpNm').val();
	location.href="PaliamentDetail.do?num="+num+"&dept_cd="+dept_cd+"&img="+img+"&name="+name;
}

//구매시 가격 확인              //나  //국회의원
function checkBuyPoint(my, pal){
	var result = '';
	console.log("넘어온 포인트 내껏 : "+my + "// 국회의원 : "+pal);
	
	if((my-pal) < 0){
		result = false;
		console.log("if 내부 : "+result);
	}else{
		result = true;
		console.log("else 내부 : "+result);
	}
	return result;
}

//상위랭커 - 구매버튼 클릭시
function buyPoint(tag){
	var $button = $(tag).parent().parent().parent().children().children().eq(0);
	var $paliament = $(tag).parent().parent().parent().parent().children().eq(0);
	
	var $deptCd = $(tag).parent().parent().parent().parent().parent().children().children().eq(0);
	var deptCd = $deptCd.val();
	
	//나의 포인트
	var myPoint = $button.text();	
	//국회의원 포인트
	var paliamentPoint = $paliament.val();

	console.log("dept : "+deptCd + " // 내 포인트 : "+myPoint + " // 국회의원 : "+paliamentPoint);
	
	if(myPoint == '' || myPoint == null){
		alert("로그인을 해주세요 !");
	}else{
		var result = checkBuyPoint(myPoint, paliamentPoint);
		console.log("result  확인좀 : "+result);
		if(result != false){
			
			$.ajax({
				url :"buyPoint.do",
				data : {
					
				},
				sucess : function(data){
					
				}
			});
			
		}else{
			alert("포인트가 부족합니다 !!");
		}
	}
}

$(document).ready(function(){
	
	$('.point_explainePtag').css("display", "none");
	
	var count = 0;
	$('#moreIcon').click(function(){
		if(count == 0){
			$('#moreIcon').removeClass('fa fa-angle-double-down');
			$('#moreIcon').addClass('fa fa-angle-double-up');
			count=1;
			
			$('.point_explainePtag').css("display","block");
			
		}else{
			$('#moreIcon').removeClass('fa fa-angle-double-up');
			$('#moreIcon').addClass('fa fa-angle-double-down');
			count=0;
			
			$('.point_explainePtag').css("display","none");
		}
	});
	
	
	$('#searchPaliamentBtn').click(function(){
		var name = $('#searchPaliamentNameInput').val();
		if(name == ''){
			alert("이름을 입력해주세요 !");
			$('#searchPaliamentNameInput').focus();
		}else{
			$.ajax({
				url : "PointSearchPaliament.do",
				data : {
					name : name
				},
				success : function(data){
					
					if(data.list != null && data.list != ''){
						$('#searchResultDiv').empty();
						var well = '';
						$.each(data.list, function(index, obj){
							well += '<div class="col-md-3"><div class="well customWell">';
							well += '<img src='+obj.jpgLink+' class="img-circle" alt='+obj.empNm+' width="100" height="100"><br/><br/>'; 
							well += "<p>이름 : "+obj.empNm+"</p>";
							well += "<p>정당 : "+obj.polyNm+"</p>";
							well += "<p>포인트 : <span class='pointSpan'>"+obj.point+"</span></p>";
							well += "<button class='btn btn-default'>구매하기</button>";
							well += "</div></div>";
							
						});
						$('#searchResultDiv').html(well);
					}else{
						var well = "<div class='col-md-12'><div class='well'>검색하신 결과가 없습니다.</div></div>";
						$('#searchResultDiv').html(well);	
					}
				}
			});
		}
	});
	
});