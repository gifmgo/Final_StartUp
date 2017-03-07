/**
 * 
 */

var paliament = {};
//내가 구매한 국회의원 판매하기
function sellPaliament(tag){
	//판매하려는 의원의 번호
	var deptCd = $(tag).prev().val();
	if(deptCd != ''){
		$.ajax({
			url:"detailMyPaliament.do",
			data : {
				deptCd : deptCd
			},
			success : function(data){
				if(data.paliamentDTO != null){
					
					//판매 누른 국회의원 객체 
					paliament.deptCd = data.paliamentDTO.deptCd;
					paliament.jpgLink = data.paliamentDTO.jpgLink;
					paliament.empNm = data.paliamentDTO.empNm;
					paliament.num2 = data.paliamentDTO.num2;
					paliament.polyNm = data.paliamentDTO.polyNm;
					paliament.point = data.paliamentDTO.point;
					paliament.pointCount = data.paliamentDTO.pointCount;
					
					//모달 이미지
					$('#sellpaliamentImg').attr('src','');
					//모달 의원 이름 
					$('#sellmodalName').text('');
					//모달 의원 정당
					$('#sellmodalPolyNm').text('');
					//모달 의원 포인트
					$('#sellmodalPoint').text('');
					
					
					$('#sellpaliamentImg').attr('src',paliament.jpgLink);
					//모달 의원 이름 
					$('#sellmodalName').text(paliament.empNm);
					//모달 의원 정당
					$('#sellmodalPolyNm').text(paliament.polyNm);
					//모달 의원 포인트
					$('#sellmodalPoint').text(paliament.point);
					
					$('#sellCount').val(0);
					
					$('#paliamentSellModal').modal();
					
				}
			}
		});
	}else{
		alert("잠시후 이용해주세요 !");
	}
}

//의원 판매 
function sellPoint(){
	var count = $('#sellCount').val();
	console.log("판매 수량 : "+count + " // 내가 갖고있는 수량 : "+paliament.pointCount);
	if(paliament.pointCount < count || count <= 0){
		alert("판매수량을 다시 입력해주세요 !!");
		$('#sellCount').val(0);
		$('#sellCount').focus();
	}else{
		
		var getPoint = count * paliament.point; 
		
		$.ajax({
			url : "sellStartPaliament.do",
			data:{
				deptCd : paliament.deptCd,
				sellCount : count,
				paliamentPoint : paliament.point,
				getPoint : getPoint 
			},
			success : function(data){
				
			}
		});
		
	}
}

//토론방 보러가기 버튼
function debateFunc(){
	location.href="moreCommunityTalk.do";
}
//국회의원방 보러가기 버튼
function paliamentFunc(){
	location.href="Member_Parliament.do";
}
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
	$('#hiddenModalPaliamentName').val('');
	
	
	$('#paliamentImg').attr('src',img);
	$('#modalName').text(name);
	$('#modalPolyNm').text(jungDang);
	$('#modalPoint').text(point);
	$('#hiddenModalPoint').val(inputHidden);
	$('#hiddenModalPaliamentName').val(name);

	
	$('#modalHiddenDeptCd').val(dept_cd);
	$('#modalHiddenNum2').val(num);
	$('#modalHiddenEmpNm').val(name);
	
	$('#myModal').modal();
	
}

//상세보기
function detailView(){
	var num =$('#modalHiddenNum2').val();
	var dept_cd = $('#modalHiddenDeptCd').val();
	var img = $('#paliamentImg').attr('src');
	var name = $('#modalHiddenEmpNm').val();
	location.href="PaliamentDetail.do?num="+num+"&dept_cd="+dept_cd+"&img="+img+"&name="+name;
}

//구매시 가격 확인              //나  //국회의원
function checkBuyPoint(my, pal, count){
	var result = '';
	console.log("넘어온 포인트 내껏 : "+my + "// 국회의원 : "+pal);
	
	var total = count * pal;
	if((my-total) < 0){
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
	var $deptCd = $(tag).parent().parent().parent().parent().parent().children().children().children().eq(0);
	var $paliamentName = $(tag).parent().parent().parent().parent().children().eq(1);
	
	//나의 포인트
	var myPoint = $button.text();	
	//국회의원 포인트
	var paliamentPoint = $paliament.val();
	//국회의원 번호
	var deptCd = $deptCd.val();
	//국회의원 이름 
	var paliamentName = $paliamentName.val();
	
	//몇개 구매 할 것인지.
	var count = $('#count').val();
	if(count == ''){
		alert("수량을 입력해주세요 !");
		$('#count').focus();
		return false;
	}
	console.log("dept : "+deptCd + " // 내 포인트 : "+myPoint + " // 국회의원 포인트 : "+paliamentPoint + " // 국회의원 이름 : "+paliamentName);
	
	if(myPoint == '' || myPoint == null){
		alert("로그인을 해주세요 !");
		return false;
	}else{
		var result = checkBuyPoint(myPoint, paliamentPoint, count);
		console.log("result  확인좀 : "+result);
		if(result != false){
			
			var total = count * paliamentPoint;
			var updatePoint = myPoint - total; 
			$.ajax({
				url :"buyPoint.do",
				data : {
					deptCd : deptCd,
					empNm : paliamentName,
					buypoint : count,
					updatePoint : updatePoint
				},
				success : function(data){
					
					var message = data.message;
					if(data.result > 0){
						alert(message);
						location.href="point.do";
					}else{
						alert(message);
					}
					
				}
			});
			
		}else{
			alert("포인트가 부족합니다 !!");
			return false;
		}
	}
}

//검색해서 구매하기
function searchBuy(tag){
	
	var $button = $(tag);
		//이미지
	var jpgLink = $button.parent().children().eq(0).attr("src");
		//의원 이름
	var empNm = $button.prev().prev().prev().children().text();
		//정당 이름
	var polyNm = $button.prev().prev().children().text();
		//포인트
	var point = $button.prev().children().text();
	
	var deptCd = $button.parent().prev().prev().val();
	var num = $button.parent().prev().val();
	
	$('#paliamentImg').attr('src','');
	$('#modalName').val();
	$('#modalPolyNm').text();
	$('#modalPoint').text();
	
	$('#modalHiddenDeptCd').val('');
	$('#modalHiddenNum2').val('');
	$('#modalHiddenEmpNm').val('');
	$('#hiddenModalPoint').val('');
	$('#hiddenModalDeptCd').val('');
	$('#hiddenModalPaliamentName').val('');
	
	$('#paliamentImg').attr('src',jpgLink);
	$('#modalName').text(empNm);
	$('#modalPolyNm').text(polyNm);
	$('#modalPoint').text(point);
	$('#hiddenModalPoint').val(point);
	$('#hiddenModalPaliamentName').val(empNm);

	
	$('#modalHiddenDeptCd').val(deptCd);
	$('#modalHiddenNum2').val(num);
	$('#modalHiddenEmpNm').val(empNm);
	
	$('#myModal').modal();
	
}


$(document).ready(function(){
	
	$('#searchPaliamentDiv').css("display","none");
	$('#selectPaliamentDiv').css("display","none");
	$('#jungDangDiv').css("display","none");
	
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
							
							well += '<div class="col-md-3">';
							well += '<input type="hidden" value='+obj.deptCd+'>';
							well += '<input type="hidden" value='+obj.num2+'>';	
							well += '<div class="well customWell">';
							well += '<img src='+obj.jpgLink+' class="img-circle" alt='+obj.empNm+' width="100" height="100"><br/><br/>'; 
							well += "<p>이름 : <span>"+obj.empNm+"</span></p>";
							well += "<p>정당 : <span>"+obj.polyNm+"</span></p>";
							well += "<p>포인트 : <span class='pointSpan'>"+obj.point+"</span></p>";
							well += "<button class='btn btn-default' onclick='searchBuy(this);'>구매하기</button>";
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
	
	//퀴즈 풀기 버튼 클릭시
	$('#solveQuizBtn').click(function(){
		var select_answer =$('input[type=radio][name=optradio]:checked').val();
		var quiz_no=$('#hidden_no').val();
		console.log(" 선택한 답=========="+select_answer+" / "+quiz_no);
	
		$.ajax({
		   url:"solveQuiz.do",
		   data:{
			    quiz_no:quiz_no,
			    select_answer:select_answer
		   },
		   success:function(data){
			   if(data.result=='정답'){
				   alert('정답입니다');
				   var mypoint = $('#deleteMyPoint').text();
				   console.log("내 포인트 : "+mypoint);
				   var update_mypoint = Number(mypoint)+1;
				   $('#deleteMyPoint').text(update_mypoint);
				   console.log("업데이트 포인트: " +$('#deleteMyPoint').text());
			   }else if(data.result=='오답'){
				   alert('안타깝지만 틀렸습니다');
			   }else{
				   alert('이미 퀴즈를 푸셨습니다');
			   }
		   }
		});
	});
});


function chooseSearchFun(){
	
	var choose =$('#chooseSelectSearch option:selected').val();
	if(choose == 0){
		alert("옵션틀 선택해주세요 !");
			//이름
	}else if(choose == 1){
		//이름 만 검색
		$('#searchPaliamentDiv').css("display","block");
		//지역구 셀렉트로 보여줌
		$('#selectPaliamentDiv').css("display","none");
		$('#jungDangDiv').css("display","none");
		   
		//지역구
	}else if(choose == 2){
		//이름 만 검색
		$('#searchPaliamentDiv').css("display","none");
		//지역구 셀렉트로 보여줌
		$('#selectPaliamentDiv').css("display","block");
		$('#jungDangDiv').css("display","none");
	}
}

//검색하기 위한 지역구  변수
var areaSelect = '';
//지역 선택시
function areaSelectFunc(){
	areaSelect = $('#areaSelect').val();
	$('#jungDangDiv').css("display","block");
}
//정당 선택할때
function jungDangFunc(){
	var jungDang = $('#jungDangSelect').val();
	alert("확인  지역 : "+areaSelect + " // 정당 : "+jungDang);
	
	$.ajax({
		url:"pointSearchSelect.do",
		data : {
			area : areaSelect,
			jungDang : jungDang
		},
		success : function(data){
			
		
			if(data.selectlist != null && data.selectlist != ''){
				$('#searchResultDiv').empty();
				var well = '';
				
				$.each(data.selectlist, function(index, obj){
					
					well += '<div class="col-md-3">';
					well += '<input type="hidden" value='+obj.deptCd+'>';
					well += '<input type="hidden" value='+obj.num2+'>';	
					well += '<div class="well customWell">';
					well += '<img src='+obj.jpgLink+' class="img-circle" alt='+obj.empNm+' width="100" height="100"><br/><br/>'; 
					well += "<p>이름 : <span>"+obj.empNm+"</span></p>";
					well += "<p>정당 : <span>"+obj.polyNm+"</span></p>";
					well += "<p>포인트 : <span class='pointSpan'>"+obj.point+"</span></p>";
					well += "<button class='btn btn-default' onclick='searchBuy(this);'>구매하기</button>";
					well += "</div></div>";
				});
				$('#searchResultDiv').html(well);
			}else{
				var well = "<div class='col-md-12'>" +
						"<div class='row'>" +
						"<div class='col-sm-offset-4 col-sm-4 col-md-4'>" +
						"<div class='well customWell' style='min-height:300px;'>검색하신 결과가 없습니다.</div></div></div></div>";
				$('#searchResultDiv').html(well);	
			}	
			
		}
	});
}

//포인트 상세 보기 - 랭킹  >>
function PointDetailFunc(){
	location.href="PointDetail.do";
}


