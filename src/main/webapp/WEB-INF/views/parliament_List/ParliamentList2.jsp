<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<link rel="stylesheet" type="text/css" href="paliament/paliamentList.css">
<script src="paliament/pal-list.js"></script>
<div class="container text-center">
	<div class="row" style="margin-bottom:10px;">
		 <div class="form-group">
			<span><i class="fa fa-address-book-o" style="font-size:36px"></i> 의원 검색</span>
		 </div>
		<div class="well customWell">
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
					<button type="button" id="searchBtn" class="btn btn-default">검색</button>
				</div>
			</form>
			</div>
		
	</div>
</div>	

<!--검색 결과 나올 Div 영역-->
<div class="container">
	<div class="row">	
		<div class="well customWell">
			<div class="row" id="resultDiv">		
		<c:choose>
			<c:when test="${list != null}">
				<c:if test="${jungDang=='국민의당'}">
					<c:forEach var="list" items="${list}">
						<div class="col-sm-3">
							<div class="well jstlGuck text-center">
								<input type="hidden" id="${list.empNm}">
               					<input type="hidden" id="${list.deptCd}">
               				    <input type="hidden" id="${list.num2}">
               				    <span><img class="img-circle" style="width:100px; height:100px;" src="${list.jpgLink}"></span><br/><br/>
               				    <span>이름 : ${list.empNm}</span><br/>
         						<span>정당 : ${list.polyNm}</span><br/>
         						<c:if test="${list.origNm == '비례대표'}">
         							<span>지역구 : ${list.origNm}</span><br/>
         						</c:if>
                				<c:if test="${list.origNm != '비례대표'}">
	                				<c:set var="gorigNm" value="${list.origNm}"></c:set>
	         						<span>지역구 : ${fn:substring(gorigNm,0,6)}</span><br/>
         						</c:if>
         						<span>당선 회수 : ${list.reeleGbnNm}</span><br/><br/>
								<input type="button" class="btn detail_btn" style="color:#fff; background-color:#79b394;" onclick="detailPaliament(this)" value="상세보기">
							</div>
						</div>
					</c:forEach>
				</c:if>
				<c:if test="${jungDang=='더불어민주당'}">
					<c:forEach var="list" items="${list}">
						<div class="col-sm-3">
							<div class="well jstlDouble text-center">
								<input type="hidden" id="${list.empNm}">
               					<input type="hidden" id="${list.deptCd}">
               				    <input type="hidden" id="${list.num2}">
               				    <span><img class="img-circle" style="width:100px; height:100px;" src="${list.jpgLink}"></span><br/><br/>
               				    <span>이름 : ${list.empNm}</span><br/>
         						<span>정당 : ${list.polyNm}</span><br/>
         						<c:if test="${list.origNm == '비례대표'}">
         							<span>지역구 : ${list.origNm}</span><br/>
         						</c:if>
                				<c:if test="${list.origNm != '비례대표'}">
	                				<c:set var="dorigNm" value="${list.origNm}"></c:set>
	         						<span>지역구 : ${fn:substring(dorigNm,0,6)}</span><br/>
         						</c:if>
         						<span>당선 회수 : ${list.reeleGbnNm}</span><br/><br/>
								<input type="button" class="btn detail_btn" style="color:#fff; background-color:#1870b9;" onclick="detailPaliament(this)" value="상세보기">
							</div>
						</div>
					</c:forEach>
				</c:if>
				<c:if test="${jungDang=='바른정당'}">
					<c:forEach var="list" items="${list}">
						<div class="col-sm-3">
							<div class="well jstlBa text-center">
								<input type="hidden" id="${list.empNm}">
               					<input type="hidden" id="${list.deptCd}">
               				    <input type="hidden" id="${list.num2}">
               				    <span><img class="img-circle" style="width:100px; height:100px;" src="${list.jpgLink}"></span><br/><br/>
               				    <span>이름 : ${list.empNm}</span><br/>
         						<span>정당 : ${list.polyNm}</span><br/>
         						<c:if test="${list.origNm == '비례대표'}">
         							<span>지역구 : ${list.origNm}</span><br/>
         						</c:if>
                				<c:if test="${list.origNm != '비례대표'}">
	                				<c:set var="borigNm" value="${list.origNm}"></c:set>
	         						<span>지역구 : ${fn:substring(borigNm,0,6)}</span><br/>
         						</c:if>
         						<span>당선 회수 : ${list.reeleGbnNm}</span><br/><br/>
               				    <input type="button" class="btn detail_btn" style="color:#fff; background-color:#01B1EC;" onclick="detailPaliament(this)" value="상세보기">
							</div>
						</div>
					</c:forEach>
				</c:if>
				<c:if test="${jungDang=='자유한국당'}">
					<c:forEach var="list" items="${list}">
						<div class="col-sm-3">
							<div class="well jstlJa text-center">
								<input type="hidden" id="${list.empNm}">
               					<input type="hidden" id="${list.deptCd}">
               				    <input type="hidden" id="${list.num2}">
               				    <span><img class="img-circle" style="width:100px; height:100px;" src="${list.jpgLink}"></span><br/><br/>
               				    <span>이름 : ${list.empNm}</span><br/>
         						<span>정당 : ${list.polyNm}</span><br/>
         						<c:if test="${list.origNm == '비례대표'}">
         							<span>지역구 : ${list.origNm}</span><br/>
         						</c:if>
                				<c:if test="${list.origNm != '비례대표'}">
	                				<c:set var="jaorigNm" value="${list.origNm}"></c:set>
	         						<span>지역구 : ${fn:substring(jaorigNm,0,6)}</span><br/>
         						</c:if>
         						<span>당선 회수 : ${list.reeleGbnNm}</span><br/><br/>
               				    <input type="button" class="btn detail_btn" style="color:#fff; background-color:#dc5356;" onclick="detailPaliament(this)" value="상세보기">
							</div>
						</div>
					</c:forEach>
				</c:if>
				<c:if test="${jungDang=='정의당'}">
					<c:forEach var="list" items="${list}">
						<div class="col-md-3">
							<div class="well jstlJung text-center">
								<input type="hidden" id="${list.empNm}">
               					<input type="hidden" id="${list.deptCd}">
               				    <input type="hidden" id="${list.num2}">
               				    <span><img class="img-circle" style="width:100px; height:100px;" src="${list.jpgLink}"></span><br/><br/>
               				    <span>이름 : ${list.empNm}</span><br/>
         						<span>정당 : ${list.polyNm}</span><br/>
         						<c:if test="${list.origNm == '비례대표'}">
         							<span>지역구 : ${list.origNm}</span><br/>
         						</c:if>
                				<c:if test="${list.origNm != '비례대표'}">
	                				<c:set var="jorigNm" value="${list.origNm}"></c:set>
	         						<span>지역구 : ${fn:substring(jorigNm,0,6)}</span><br/>
         						</c:if>
         						<span>당선 회수 : ${list.reeleGbnNm}</span><br/><br/>
               				    <input type="button" class="btn detail_btn" style="color:#fff; background-color:#f2c755;" onclick="detailPaliament(this)" value="상세보기">
							</div>
						</div>
					</c:forEach>
				</c:if>
				<c:if test="${jungDang=='무소속'}">
					<c:forEach var="list" items="${list}">
						<div class="col-md-3">
							<div class="well jstlMu text-center">
								<input type="hidden" id="${list.empNm}">
               					<input type="hidden" id="${list.deptCd}">
               				    <input type="hidden" id="${list.num2}">
               				    <span><img class="img-circle" style="width:100px; height:100px;" src="${list.jpgLink}"></span><br/><br/>
               				    <span>이름 : ${list.empNm}</span><br/>
         						<span>정당 : ${list.polyNm}</span><br/>
         						<c:if test="${list.origNm == '비례대표'}">
         							<span>지역구 : ${list.origNm}</span><br/>
         						</c:if>
                				<c:if test="${list.origNm != '비례대표'}">
	                				<c:set var="morigNm" value="${list.origNm}"></c:set>
	         						<span>지역구 : ${fn:substring(morigNm,0,6)}</span><br/>
         						</c:if>
         						<span>당선 회수 : ${list.reeleGbnNm}</span><br/><br/>
               				    <input type="button" class="btn detail_btn" style="color:#fff; background-color:#a6a6a6;" onclick="detailPaliament(this)" value="상세보기">
							</div>
						</div>
					</c:forEach>
				</c:if>
			</c:when>
			<c:otherwise>
				<div class="col-md-offset-4 col-md-4">
					<div class="well customWell text-center">
						<span class="text-center"><i class="fa fa-meh-o" style="font-size:48px;color:red"></i></span><br/><br/>
						<p>선택하신 정당이 없습니다.</p>
					</div>
				</div>
			</c:otherwise>
		</c:choose>
			</div>
		</div>
	</div>
</div>
