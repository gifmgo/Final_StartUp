<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<br/><br/>
<div class="container">
	<div class="row">
		<h4 class="text-center">의원별 게시글 보기</h4>
		<div class="col-md-12">
			<div class="well customWell">
				<form class="form-inline">
				<div class="col-md-4">
				  <div class="form-group">
				    	<label for="email">이름 검색</label>
				    	<input type="text" class="form-control" id="email">
				  </div>
				</div>
				<div class="col-md-4">	 
				  <div class="form-group">
				    <label for="pwd">정당별</label>
				    <input type="text" class="form-control" id="pwd">
				  </div>
			   	</div>
			   	
				  <button type="submit" class="btn btn-default text-right">검색</button>
				</form>
			</div>
		</div>
		
		
		
	<div class="container">
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
		<div class="media">
	    <div class="media-left media-middle">
	      <img src="${list.img }" class="media-object" style="width:40px; height: 60px;">
	    </div>
	    <div class="media-body">
	      <h4 class="media-heading">${list.orignm}</h4>
	      <h4>${list.name}</h4>
	  </div>
	  <hr>
	  <!-- Right-aligned media object -->
	  <div class="media">
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
