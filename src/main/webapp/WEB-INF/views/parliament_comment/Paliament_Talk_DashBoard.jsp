<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" type="text/css" href="paliament/paliamentDash.css">
<script src="paliament/pal-dash.js"></script>

<div class="container">
	<div class="row">
		<h3 class="text-center">의원별 게시글 보기</h3>
		<div class="well customWell">
			<form action="" class="form-inline">
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
	 			<div class="form-group orignm">
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
		    		<label for="name">이름 검색</label>
		    		<input type="text" class="form-control" id="name">
				</div>
			   	<div class="form-group">
				  	<button type="button" id="searchBtn" class="btn btn-default text-right">검색</button>
				</div>
			</form>
		</div>
	</div>

	<p>검색하여 원하는 의원에 댓글을 볼 수 있습니다.</p><br>
	  
	 <!--  <div class="media">
	    <div class="media-left media-middle">
	      <img src="img/gom.png" class="media-object" style="width:80px">
	    </div>
	    <div class="media-body">
	      <h4 class="media-heading">Media Middle</h4>
	      <h4>의원 관련 정보 뿌려줘야지</h4>
	  </div>
	  <hr>
	  Right-aligned media object
	  <div class="media">
	    <div class="media-body">
	      <h4 class="media-heading">Right-aligned<span>(2016-04-15)</span></h4>
	      <p>게시글을 보여줘야해</p>
	    </div>
	    <div class="media-right">
	      <img src="img/gom.png" class="media-object" style="width:60px">
	    </div>
	  </div>
	</div>
	  <div class="media">
	    <div class="media-body">
	      <h4 class="media-heading">Right-aligned</h4>
	      <p>게시글을 보여줘야해</p>
	    </div>
	    <div class="media-right">
	      <img src="img/gom.png" class="media-object" style="width:60px">
	    </div>
	  </div>
	
	  <div class="media">
	    <div class="media-body">
	      <h4 class="media-heading">Right-aligned</h4>
	      <p>게시글을 보여줘야해</p>
	    </div>
	    <div class="media-right">
	      <img src="img/gom.png" class="media-object" style="width:60px">
	    </div>
	  </div>
	</div>
	<hr/> -->
	
 	<c:forEach var="list" items="${RPComment}">
		<div class="media pal">
	    <div class="media-left media-middle">
	      <img src="${list.img }" class="media-object" style="width:40px; height: 60px;">
	    </div>
	    <div class="media-body">
	      <h4 class="media-heading">${list.orignm}</h4>
	      <h4>${list.name}</h4>
	  </div>
	  <hr>
	  <!-- Right-aligned media object -->
	  <div class="media sub">
	    <div class="media-body">
	      <h4 class="media-heading">${list.writer}</h4>
	      <p>${list.content}</p>
	    </div>

	  </div>
	</div>
	</c:forEach>

</div>
</div>
</div>
