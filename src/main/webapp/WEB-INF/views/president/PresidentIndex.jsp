<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<div class="container-fluid" id="topBar">
	<div class="btn-group btn-group-justified">
	  <div class="btn-group" id="listGroupBtn">
	    <button type="button" class="btn customGroup">대선후보 리스트</button>
	  </div>
	  <div class="btn-group" id="graphBtn">
	    <button type="button" class="btn customGroup">지지율 현황</button>
	  </div>
	  <div class="btn-group" id="tooPyooBtn">
	    <button type="button" class="btn customGroup">우리끼리 투표</button>
	  </div>
	  <div class="btn-group" id="presidentTalkBtn">
	    <button type="button" class="btn customGroup">우리의 한마디</button>
	  </div>
	</div>
</div>    
<div class="container presidentDiv" id="fixNextTag">
	<div class="listDiv">
		<div class="row">
				<c:choose>
					<c:when test="${list != null}">
						<c:forEach var="list" items="${list}" varStatus="status">
							<c:choose>
							<c:when test="${status.count % 2 != 0}">
								<div class="col-md-12 firstDiv">
									
									<div class="row">
										<div class="col-md-4">
											<img src="img/president${status.count}.jpg" class="img-rounded" width="70%;" height="300px;">
										</div>
										<div class="col-md-8">
											<h4 class="presidentMemberH4">이름: <span>${list.name}</span></h4>
											<h4 class="presidentMemberH4">정당: <span>${list.jungDang}</span></h4>
											<h4 class="presidentMemberH4">지역구: <span>${list.area}</span></h4>
											<p class="presidentMemberH4">연혁
												<ul class="list-group">
												    <c:set var="customlist" value="${fn:split(list.status,',')}"></c:set> 
													 <c:forEach var="slist" items="${customlist}" varStatus="index">
													 		<li class="list-group-item">${index.count}.${slist}</li>
													</c:forEach>
												 </ul>
											</p>
											<div class="row TFbtnRow">
												<div class="btn-group">
												  <button type="button" class="btn btn-success" id="${list.twitter}">twitter</button>
												  <button type="button" class="btn btn-success" id="${list.facebook}">faceBook</button>
												  <button type="button" class="btn btn-success" id="${list.homepage}">HomePage</button>
												</div>
											</div>
										</div>				
									</div>
								</div>					
							</c:when>
							<c:otherwise>
							<div class="col-md-12 secondDiv">
								<div class="row secondRow">
									<div class="col-md-8">
										<h4 class="presidentMemberH4">이름 : <span>${list.name}</span></h4>
										<h4 class="presidentMemberH4">정당 : <span>${list.jungDang}</span></h4>
										<h4 class="presidentMemberH4">지역구 : <span>${list.area}</span></h4>
										<p class="presidentMemberH4">연혁
												<ul class="list-group">
												    <c:set var="customlist" value="${fn:split(list.status,',')}"></c:set> 
													 <c:forEach var="slist" items="${customlist}" varStatus="index">
													 		<li class="list-group-item">${index.count}.${slist}</li>
													</c:forEach>
												 </ul>
											</p>
									</div>
									<div class="col-md-4">
										<img src="img/president${status.count}.jpg" class="img-rounded" width="70%;" height="300px;">
									</div>											
									<div class="row TFbtnRow">
										<div style="margin-left:3%;">	
											<div class="btn-group">
											  <button type="button" class="btn btn-primary" id="${list.twitter}">twitter</button>
											  <button type="button" class="btn btn-primary" id="${list.facebook}">faceBook</button>
											  <button type="button" class="btn btn-primary" id="${list.homepage}">HomePage</button>
											</div>
										</div>
									</div>
								</div>
							</div>
							</c:otherwise>
							</c:choose>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<div class="jumbotron">
							<h4>죄송합니다. 잠시후 다시 이용해주세요</h4>
						</div>
					</c:otherwise>
				</c:choose>			
		</div>
	</div>
</div>