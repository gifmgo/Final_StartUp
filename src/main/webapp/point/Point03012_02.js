/**
 * 
 */


//내가 구매한 국회의원 - 상세보기 페이지 
function myPointDetail(tag){
	var deptCd = tag.previousSibling.value;
	
	$.ajax({
		url:'myPaliamentDetail.do',
		data : {
			deptCd : deptCd
		},
		success : function(data){
			var dto = data.dto;
			//나의 보유 수량
			var myCount = data.count;
			//내 포인트
			var myPoint = data.myPoint;
			
			//select deptCd, empNm, jpgLink, num2, polyNm, point, pointCount  from tbl_paliament where deptCd = #{deptCd}
			$('#myPointImg').attr("src",'');
			$('#myPointEmpNm').text('');
			$('#myPointPolyNm').text('');
			$('#myPointPoint').text('');
			$('#myGetCount').text('');
			$('#BuyModalMyPoint').text('');
			$('#PointIndexDeptCd').val('');
			$('#PointIndexNum2').val('');

			$('#myPointImg').attr("src",dto.jpgLink);
			$('#myPointEmpNm').text(dto.empNm);
			$('#myPointPolyNm').text(dto.polyNm);
			$('#myPointPoint').text(dto.point);
			$('#myGetCount').text(myCount);
			$('#BuyModalMyPoint').text(myPoint);
			$('#PointIndexDeptCd').val(dto.deptCd);
			$('#PointIndexNum2').val(dto.num2);
			$('#BuyModal').modal();
			//console.log("디티오 확인 : deptCd  -  "+dto.deptCd + " / dto.empNm : "+dto.empNm + " / data.jpg : "+dto.jpgLink);
		}
	});
}

//내가 가지고 있는 국회의원  판매 하기
function PointIndexSellPoint(){
	//판매하려는 수량
	var sellPoint = $('#pointIndexsellCount').val();
	//나의 총 포인트
	var myPoint = $('#BuyModalMyPoint').text();
	//해당 국회의원 보유 포인트
	var paliamentPoint = $('#myGetCount').text();
	
	//의원 자체 포인트 - ex)1
	var paliamentRealPoint = $('#myPointPoint').text();
	console.log("곱한값 :/ 의원 자체 포인트 : "+paliamentRealPoint);

	
	//해당 의원 포인트
	var getPoint =$('#myPointPoint').text() * sellPoint; 
	
	//의원번호 
	var deptCd =  $('#PointIndexDeptCd').val();
	//의원 
	var num2 = $('#PointIndexNum2').val();
	//이미지
	var jpgLink = $('#myPointImg').attr("src");
	
	console.log("dept : "+deptCd + " / num2 : "+num2 + " / jpgLink : "+jpgLink);
	
	if(sellPoint > 0){
		
		if(sellPoint > paliamentPoint){
			alert("나의 보유 포인트가 부족합니다 !");
			$('#pointIndexsellCount').val(0);
		}else{
			
			$.ajax({
				url:"sellStartPaliament.do",
				data : {
					deptCd : deptCd,
					sellCount : sellPoint,
					getPoint : getPoint,
					paliamentPoint : paliamentRealPoint
				},
				success : function(data){
					if(data.message == '판매성공'){
						alert(data.message);
						location.href="point.do";
					}else{
						alert(data.message);
					}
					
				}
			});
			
		}
	}else{
		alert("판매수량을 정확히 입력해주세요 !");
	}
	
}



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
				alert(data.message);
				location.href="PointDetail.do";
			}
		});
		
	}
}
//내가 구매한 의원 상세보기 
function myPaliamentDetailView(){
	var num = $('#PointIndexNum2').val();
	var dept_cd = $('#PointIndexDeptCd').val();
	var img = $('#myPointImg').attr("src");
	var name = $('#myPointEmpNm').text();
	location.href="PaliamentDetail.do?num="+num+"&dept_cd="+dept_cd+"&img="+img+"&name="+name;
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
	//포인트 detail 페이지 >> 정당별 >> select 박스 이용시
	$('#polyNmSelect').change(function(){
		var value = $('#polyNmSelect').val();
		$.ajax({
			url:"PointDetailSelectAjax.do",
			data:{
				polyNm : value
			},
			success : function(data){
				//tbody
				$('#favoritPaliamentTbody').empty();
				var td = '';
				$.each(data.poly_detail,function(index, obj){
					if(index < 5){
						td += '<tr><td>'+(index+1)+'</td><td>'+obj.empNm+'</td><td>'+obj.pointCount+'</td></tr>';
					}
				});
				$('#favoritPaliamentTbody').html(td);
			}
		});
	});	
	
	
	$('#searchPaliamentDiv').css("display","none");
	$('#selectPaliamentDiv').css("display","none");
	$('#jungDangDiv').css("display","none");
	
	
	
	$('.point_explainePtag').css("display","block");
	$('#moreIcon').removeClass('fa fa-angle-double-down');
	$('#moreIcon').addClass('fa fa-angle-double-up');
	var count = 0;
	$('#moreIcon').click(function(){
		if(count == 0){
			$('#moreIcon').removeClass('fa fa-angle-double-up');
			$('#moreIcon').addClass('fa fa-angle-double-down');
			count=1;
			$('.point_explainePtag').css("display","none");
		}else{
			$('#moreIcon').removeClass('fa fa-angle-double-down');
			$('#moreIcon').addClass('fa fa-angle-double-up');
			count=0;
			$('.point_explainePtag').css("display","block");
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
						var well = "<div class='col-md-12'>";
							well +='<span class="text-center"><i class="fa fa-meh-o" style="font-size:48px;color:red"></i></span><div class="well">검색하신 결과가 없습니다.</div></div>';
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
						"<div class='well customWell' style='min-height:300px;'><span class='text-center'><i class='fa fa-meh-o' style='font-size:48px;color:red'></i></span><h4 class='text-center'>검색하신 결과가 없습니다.</h4></div></div></div></div>";
				$('#searchResultDiv').html(well);	
			}	
			
		}
	});
}

//포인트 상세 보기 - 랭킹  >>
function PointDetailFunc(){
	location.href="PointDetail.do";
}

//그래프 보기
function makeGrap(obj){

	var progress = '<div class="row">';
	var $proDiv = $('#progressDiv');
	$.each(obj, function(index, dto){
		var color = chooseJungDang(dto.polyNm);
		progress += '<div class="col-md-2">';
		progress +=	'<span class="text-center">이름 : '+dto.empNm+ '</span></div>';
		progress += '<div class="col-md-10">';
		progress += '<div class="progress">';
		progress += '<div class="progress-bar progress-bar-'+color+'" progress-bar-striped" role="progressbar" aria-valuenow="100" aria-valuemin="0" aria-valuemax="100" style=width:'+dto.totalCount+'%>';
		progress += dto.totalCount+'%';
		progress += '</div></div></div>';
	});
	progress += '</div>';
	
	$proDiv.empty();
	$proDiv.html(progress);
}

function chooseJungDang(polyNm){
	console.log("polyNm : "+polyNm);
	var color = '';
	switch (polyNm) {
	case '바른정당':
		  color = 'info';
		  break;
	case '국민의당' :
		  color = 'success';
		  break;

	case '더불어민주당' :
		  color = 'primary';
		break;
		

	case '무소속' :
		  color = 'default';
		break;

	case '자유한국당' :
		  color = 'danger';
		  break;	
		

	case '정의당' :
		  color = 'warning';
		  break;		
	default:
		break;
	}
	return color;
}
