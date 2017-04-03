<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<div class="container text-center">
  <br/><br/>
  <div class="row">
  	<div class="col-md-12">
  		<div class="form-group">
  			<h2 class="text-center" style="font-size: 22px;"><i class="material-icons">person_outline</i>대선후보</h2>
  		</div>
  		<br/>
  		<div class="form-group">	
  			<hr/>
  			<div class="btn-group btn-group-justified">
				  <a href="PresidentMember.do" class="btn btn-default" style="border: none;">대선후보</a>
				  <a href="PresidentPolls.do" class="btn btn-default" style="border: none;">지지율</a>
				  <a href="PresidentVote.do" class="btn btn-default" style="border: none;">대통령 선거 안내</a>
				  <a href="PresidentTalk.do" class="btn btn-default" style="border: none;">대선 한마디</a>
			</div>
			<hr/>
  		</div>
  		<br/>
  	</div>
  </div>
  <c:forEach var="list" items="${list}" varStatus="status">
	  <div class="row">
	  	 <div class="col-md-4 text-center">
	  	   	<img src="img/15_president${status.count}.jpg" class="img-rounded" style="width:70%; height:300px;">
	  	 </div>
	  	 <div class="col-md-8">
	  	 	<h4 class="text-left" style="line-height: 40px;">이름: <span>${list.name}</span></h4>
		  	<h4 class="text-left" style="line-height: 40px;">정당: <span>${list.jungDang}</span></h4>
		  	<h4 class="text-left" style="line-height: 40px;">지역구: <span>${list.area}</span></h4>
		  	 <ul class="list-group">
			  	  <c:set var="customlist" value="${fn:split(list.status,',')}"></c:set> 
				  <c:forEach var="slist" items="${customlist}" varStatus="index">
				 		<li class="list-group-item">${index.count}.${slist}</li>
				  </c:forEach>
			 </ul>
			 <div class="btn-group">
			  <button type="button" class="btn btn-success" id="${list.twitter}" onclick="twitterFun(this);">twitter</button>
			  <button type="button" class="btn btn-success" id="${list.facebook}" onclick="FaceBookFun(this);">faceBook</button>
			  <button type="button" class="btn btn-success" id="${list.homepage}" onclick="HomePageFunc(this)">HomePage</button>
			</div>
	  	 </div>	
	  </div>
	  <hr/>
  </c:forEach>		
</div>


    