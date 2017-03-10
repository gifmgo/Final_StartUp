<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="container">
	 <div class="demo-row typography-row">
			<div class="demo-title">
				<ul class="nav nav-tabs">
				  <li><a href="AdminBanUserList.do">차단 유저 관리</a></li>
				  <li><a href="BanUserMail.do">문의 메일</a></li>
				  <li class="active"><a href="AdminPointPlus.do">포인트추가</a></li>
				</ul>
			</div>
	 </div>	
	 <br>	
</div>
<div class="container">
  <div class="row">
  	  <div class="col-md-offset-4 col-md-4 text-center" style="border: 4px solid #ECF0F1">
	  	<p style="line-height:50px;">매일 유저들 포인트를<br/> 증가시켜주는 페이지 입니다.</p>
	  	<button type="button" class="btn btn-info" id="plusPointBtn"><span class="fui-plus-circle"></span>포인트</button>
	  	<br/>
	  </div>	
  </div>	
  <br/>
  <div class="row">
  	<div class="col-sm-12">
  		<div class="table-responsive">
  			<table class="table table-hover">
		     <thead>
		     	<tr>
			       <th class="text-center">No</th>
			       <th class="text-center">아이디</th>
			       <th class="text-center">닉네임</th>
			       <th class="text-center">포인트</th>
		     	</tr>
		     </thead>
		     <tbody id="pointTbody">
		      	<c:choose>
		      		<c:when test="${list != null}">
		      			<c:forEach var="list" items="${list}">
			      				<tr>
			      					<td class="text-center">${list.index}</td>
			      					<td class="text-center">${list.id}</td>
			      					<td class="text-center">${list.nickName}</td>
			      					<td class="text-center">${list.point}</td>
			      				</tr>
		      			</c:forEach>
		      		</c:when>
		      		<c:otherwise>
		      			<tr>
		      				<td colspan="4">잠시후 다시 이용해주세요</td>
		      			</tr>
		      		</c:otherwise>
		      	</c:choose>
		     </tbody>
		  </table>  
		  <div class="form-group text-center">
			  <ul class="pagination">
			  	<c:choose>
			  		<c:when test="${pageNumbering != null}">
			  			<c:forEach var="idx" begin="1" end="${pageNumbering}" step="1">
			  				<li><a href="AdminPointPlus.do?pnowPage=${idx}">${idx}</a></li>	
			  			</c:forEach>
			  		</c:when>
			  		<c:otherwise>
			  			<li><a href="#">1</a></li>
			  		</c:otherwise>
			  	</c:choose>
			  </ul>
		  </div>
		</div>
  	</div>
  </div>
</div>  