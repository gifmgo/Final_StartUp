<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


    
    <div class="container customContainer">
    	<div class="row">
    		<div class="col-md-12 firstCustomArticle">
    			<div class="row">
	    			<form>
    				<input type="hidden" id="member_favorit" name="favorit">
	    			<div class="col-md-6 infoDiv">
	    				<h4>개인정보</h4>
	    				<hr/>
		    			<ul class="list-group myUl">
						  <li class="list-group-item"><span class="badge">아이디</span><span class="textSpan">${dto.id}</span></li>
						  <li class="list-group-item"><span class="badge">닉네임</span><span class="textSpan">${dto.nickName}</span></li>
						  <li class="list-group-item"><span class="badge">생년월일</span><span id="birth" class="textSpan2"></span></li>
						  <c:choose>
                			<c:when test="${dto.gender == 'm'}">
                				<li class="list-group-item">
                					<span class="badge">성별</span><span class="textSpan3">남자</span>
                				</li>
                			</c:when>
                			<c:otherwise>
                				<li class="list-group-item">
                					<span class="badge">성별</span><span class="textSpan3">여자</span>
                				</li>
                			</c:otherwise>
                		</c:choose>	
                			<li class="list-group-item"><span class="badge">관심사</span><span id="myfavoritTr" class="textSpan"></span></li>
						</ul>
						<div class="form-group">
							<div class="col-md-4">
								<input type="button" class="btn btn-success" id="modifyStartBtn" value="정보수정하기">
							</div>
						</div>
    				</div>
    				</form>
					<div class="col-md-6 pointDiv">
						<h4>생활포인트</h4>
	    				<hr/>
	    				<div class="well myCustomWell text-center">
	    					<p>생활포인트란(생포)?</p>
	    					<p>
	    						기본적으로 10 포인트를 제공하며, 의원들의 포인트를 구매 할 수 있습니다.<br/>
	    					</p>
	    					<hr/>
	    					<p class="pointP">회원님의 현재 포인트</p>
	    					<p class="pointP"><span class="lifePoint">${dto.point}</span> 점 입니다</p>
	    					<a href="point.do" class="btn btn-default">생포 보러가기</a>
	    				</div>
					</div>
				</div>
			</div>
		</div>
    </div>
 <script>
 	$(function(){
 		
 		var db_favorit = ${dto.favorit};
 		var dongTd = "";
 		if(db_favorit.length > 0){
			for(var i = 0; i < db_favorit.length; i++){
				if(i < db_favorit.length-1){
					dongTd += db_favorit[i]+",";
				}else{
					dongTd += db_favorit[i];
				}
			} 		
 		}else{
 			dongTd += "<td colspan='4'>선택하신 관심사가 없습니다.</td>";
 		}
		$('#myfavoritTr').html(dongTd);
		
		
		var birth = ${dto.birth};
		var ttt = String(birth);
		for(var i = 0; i < ttt.length; i++){
			console.log("글짜 검색을 좀 : "+i+" / 번째 : "+ttt[i]);
		}
		
		var year = String(birth).substring(0,4);
		var month = String(birth).substring(4,6);
		var day = String(birth).substring(6,9);
		
		var result = year+"년"+month+"월"+day+"일";
		$('#birth').text(result);
 	});
 </script>   