<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="container">
	<br/><br/>
	<div class="row">
  	<div class="col-md-12">
  		<div class="form-group">
  			<h2 class="text-center" style="font-size: 22px;"><i class="material-icons"></i>지지율 현황</h2>
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

	<div class="row">
		<div class="col-md-12">
			<div class="well customWell text-center">
				<span class="iconSpan"><i class="fa fa-circle" style="font-size:15px;color:#1abc9c">국민 의당</i></span>
				<span class="iconSpan"><i class="fa fa-circle" style="font-size:15px;color:#2980b9">더불어 민주당</i></span>
				<span class="iconSpan"><i class="fa fa-circle" style="font-size:15px;color:#3498db">바른정당</i></span>
				<span class="iconSpan"><i class="fa fa-circle" style="font-size:15px;color:#e74c3c">자유한국당</i></span>
				<span class="iconSpan"><i class="fa fa-circle" style="font-size:15px;color:#f1c40f">정 의 당</i></span>
				<span class="iconSpan"><i class="fa fa-circle" style="font-size:15px;color:#95a5a6">무 소 속</i></span>
			</div>
			
			<c:choose>
				<c:when test="${list != null}">
					<c:forEach var="list" items="${list}">
						<div class="progress">
							<label>${list.name} - ${list.jungDang}</label>
							<c:if test="${list.jungDang == '국민의당'}">
								<div class="progress-bar progress-bar-guck" role="progressbar" aria-valuenow="40" aria-valuemin="0" aria-valuemax="100" style="width:${list.pools}%;">
									${list.pools}%
								</div>	
							</c:if>
							
							<c:if test="${list.jungDang == '더불어민주당' || list.jungDang == '더불어민주당 상임고문'}">
								<div class="progress-bar progress-bar-double" role="progressbar" aria-valuenow="40" aria-valuemin="0" aria-valuemax="100" style="width:${list.pools}%;">
									${list.pools}%
								</div>	
							</c:if>
							
							<c:if test="${list.jungDang == '바른정당'}">
								<div class="progress-bar progress-bar-ba" role="progressbar" aria-valuenow="40" aria-valuemin="0" aria-valuemax="100" style="width:${list.pools}%;">
									${list.pools}%
								</div>	
							</c:if>
							
							<c:if test="${list.jungDang == '자유한국당'}">
								<div class="progress-bar progress-bar-ja" role="progressbar" aria-valuenow="40" aria-valuemin="0" aria-valuemax="100" style="width:${list.pools}%;">
									${list.pools}%
								</div>	
							</c:if>			
							
							<c:if test="${list.jungDang == '정의당'}">
								<div class="progress-bar progress-bar-jung" role="progressbar" aria-valuenow="40" aria-valuemin="0" aria-valuemax="100" style="width:${list.pools}%;">
									${list.pools}%
								</div>	
							</c:if>
							
							<c:if test="${list.jungDang == '무소속'}">
								<div class="progress-bar progress-bar-mu" role="progressbar" aria-valuenow="40" aria-valuemin="0" aria-valuemax="100" style="width:${list.pools}%;">
									${list.pools}%
								</div>	
							</c:if>
						</div>
					</c:forEach>
					
					<div class="form-group text-center">
						<br/>
						<h4>출처 - <a href="http://www.gallup.co.kr/" style="color: black;">한국 갤럽</a></h4>
						<br/>
					</div>
					
				</c:when>
				<c:otherwise>
					<div class="well text-center">
						<h4>죄송합니다 잠시후 이용해주세요.</h4>
					</div>
				</c:otherwise>
			</c:choose>
		</div>
	</div>
</div>
