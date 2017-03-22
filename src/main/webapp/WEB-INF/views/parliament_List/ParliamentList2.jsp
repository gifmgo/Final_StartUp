<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" type="text/css" href="paliament/paliamentList.css">
<script src="paliament/pal-list.js"></script>
<div class="container recent">
	<div class="row">
		<div class= "col-sm-7">
			<span style="font-size: 23px; font-weight: bold;">최근 달린 댓글</span> <span id="dashBoardTalkBtn">더 보러가기<span class="glyphicon glyphicon-menu-right"></span></span>
			<ul>
			<c:forEach var="list" items="${RPComment}">
				<li data-pno="${list.no}" style="border-top:1px solid gray;">
					<div class="inf pal-click" data-num="${list.no}" data-deptcd="${list.deptcd}" data-img="${list.img}" data-name="${list.name}">
						<img class="pal-img" src="${list.img}">
					</div>
					<div class="orignm pal-click" data-num="${list.no}" data-deptcd="${list.deptcd}" data-img="${list.img}" data-name="${list.name}">
						<span>${list.orignm}<br/>${list.name}</span>
					</div>
					<div class="comment col-xs-7">
						<p class= "pal-title"><span class="glyphicon glyphicon-user"></span>${list.writer}</p>
						<p class= "pal-p">${list.content}</p>
					</div>
				</li>
			</c:forEach>
			</ul>
		</div>
	
		<div class= "col-sm-5" id="paliamentD">
			<!--도표들어가는 부분-->
			<div id="piechart"></div>
		</div>
	</div>
</div>

<div class="container">
	<div class="row" style="margin-bottom:10px;">
		<h2>의원검색</h2>			 
		<form onsubmit="return false;" class="form-inline">
			 <div class="form-group">
    			<label class="control-label" for="polyNm">정당</label>
      			<select class="form-control" id="polyNm">
      				<option>전체</option>
      				<option>국민의당</option>
      				<option>더불어민주당</option>
      				<option>무소속</option>
      				<option>바른정당</option>
      				<option>자유한국당</option>
      				<option>정의당</option>
      			</select>
 			 </div>
 			 
 			 <div class="form-group">
 			 	<label class="control-label" for="orignm">지역구</label>
      			<select class="form-control" id="orignm">
      				<option>전체</option>
      				<option>비례대표</option>
      				<option>강원</option>
      				<option>경기</option>
      				<option>경남</option>
      				<option>경북</option>
      				<option>광주</option>
      				<option>대구</option>
      				<option>대전</option>
      				<option>부산</option>
      				<option>서울</option>
      				<option>세종</option>
      				<option>울산</option>
      				<option>인천</option>
      				<option>전남</option>
      				<option>전북</option>
      				<option>제주</option>
      				<option>충남</option>
      				<option>충북</option>
      			</select>
 			 </div>
 			 
 			 <div class="form-group">
    			<label class="control-label" for="empNm">이름</label>
      			<input type="text" class="form-control" id="empNm" placeholder="이름을 입력하세요">
 			 </div>
 			 
 			<div class="form-group text-center">
				<button type="button" id="searchBtn" class="btn btn-info">검색</button>
			</div>
		</form>
	</div>

</div>	

<!--검색 결과 나올 Div 영역-->
<div class="container">
	<div class="row" id="resultDiv">
		<div class="col-md-offset-4 col-md-4">
			<div class="well customWell text-center">
				<span class="text-center"><i class="fa fa-meh-o" style="font-size:48px;color:red"></i></span><br/><br/>
				<p>검색하신 의원이 없습니다.</p>
			</div>
		</div>
	</div>
</div>
