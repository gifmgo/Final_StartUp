<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    

<div class="container">
	<div class="row articlerow">
		<div class="col-sm-12 text-center">
			<h4 class="text-center titleH4">생활 포인트 <span><i id="moreIcon" class="fa fa-angle-double-down" style="font-size:20px"></i></span></h4>
			<p class="point_explainePtag text-center">생활정치 사이트에서 제공하는 포인트를 나타내며<br/>
			     간단한 주식이라 보시면 됩니다.<br/>의안을 발행하는 의원, 한줄토크에서 많은 지지를 받는 의원<br/>
			     또는 많은 사용자들이 특정 국회의원의 포인트를 구매시 <br/>
			     해당 국회의원의 포인트는 증가하게 됩니다.<br/>
			   <span class="pointSpan">매월 포인트가 제일 높으신 10분은 문화상품권을 드립니다!</span></p>
			<br/>
			<div class="row text-center">
				<br/>
				
				<div class="col-md-offset-1 col-md-4 statusDiv">
					<h4>베스트 국회의원</h4><br/>
					<table class="table">
						<thead>
							<tr>
								<th class="text-center">No.</th>
								<th class="text-center">이름</th>
								<th class="text-center">정당</th>
								<th colspan="2"/>
							</tr>
						</thead>
						<tbody>
							<c:choose>
								<c:when test="${list != null}">
									<c:forEach var="list" items="${list}" varStatus="status">
										<tr>
											<input type="hidden" id="deptCd" value="${list.deptCd}">
											<input type="hidden" id="num2" value="${list.num2}">
											<input type="hidden" id="${list.jpgLink}">
											<input type="hidden" id="name" value="${list.empNm}">
											<input type="hidden" id="jungDang" value="${list.polyNm}">
											<input type="hidden" id="point" value="${list.point}">
											<td>${status.count}</td>
											<td>${list.empNm}</td>
											<td>${list.polyNm}</td>
											<td><input type="button" class="btn btn-success" value="상세보기" onclick="detailPointPaliament(this);"></td>
										</tr>
									</c:forEach>
								</c:when>
								<c:otherwise>
									<div class="col-sm-12">
										<h4>현재 순위를 알 수 없습니다. 잠시후 이용해주세요.</h4>
									</div>
								</c:otherwise>
						</c:choose>			
						</tbody>
					</table>
				</div>
				<div class="col-md-1"></div>
				<div class="col-md-offset-1 col-md-4 statusDiv">
					<h4>구매 현황<span><i class="fa fa-chevron-circle-right" style="font-size:20px"></i></span></h4>
					<br/>
					<table class="table">
						<thead>
						<tr>
								<th class="text-center">No.</th>
								<th class="text-center">이름</th>
								<th class="text-center">보유량</th>
								<th colspan="1"/>
						</tr>
						</thead>
						<tbody>
							<c:choose>
								<c:when test="${pointList != null}">
									<c:forEach var="buylist" items="${pointList}" varStatus="count">
										<c:if test="${count.count <= 5}">
											<tr>
												<td class="text-center">${count.count}</td>
												<td>${buylist.empNm}</td>
												<td>${buylist.totalCount}</td>
												<td><input type="hidden" value="${buylist.deptCd}"><input type="button" class="btn btn-success" value="상세보기" onclick="myPointDetail(this);"></td>
											</tr>
										</c:if>
									</c:forEach>
								</c:when>
								<c:otherwise>
									<tr>
										<td class="text-center" colspan="5">보유한 의원 리스트가 없습니다</td>
									</tr>
								</c:otherwise>
							</c:choose>
						</tbody>
					</table>
				</div>
			</div>
			<br/>
			<div class="row">
				<div class="col-md-offset-4 col-sm-4 col-md-4 col-lg-4">
					<input type="button" class="btn btn-info" value="상세보기" onclick="PointDetailFunc();">
				</div>
			</div>
			
		</div>
		
		<div class="col-md-12" style="">
			<hr/>
				<div class="row">
				<h4 class="text-center titleH4">의원 검색</h4>
					<div class="col-md-offset-4 col-md-4">
						<select class="form-control" onchange="chooseSearchFun();" id="chooseSelectSearch">
							<option value="0">선택</option>
							<option value="1">이름 검색</option>
							<option value="2">지역별 검색</option>
						</select>	
					</div>
				</div>
	     </div>
		     
		     <div class="col-md-12">
		     	 <br/>
		     	 <div class="row">
			     	 <div id="searchPaliamentDiv">
				     	 <div class="col-md-offset-4 col-md-4">
					     	 <div class="input-group">
								    <input type="text" class="form-control" placeholder="국회의원 이름을 검색하세요" id="searchPaliamentNameInput">
								    <div class="input-group-btn">
								      <button class="btn btn-default" type="button" id="searchPaliamentBtn">
								        <i class="glyphicon glyphicon-search"></i>
								      </button>
								    </div>
								</div>
						 </div>
					 </div>
					 <div id="selectPaliamentDiv">
					 	 <div class="col-md-offset-4 col-md-2">
					     	 <select class="form-control" id="areaSelect" onchange="areaSelectFunc()">
					     	 	<option disabled="disabled">지역구</option>
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
						 <div class="col-md-2" id="jungDangDiv">
					     	 <select class="form-control" id="jungDangSelect" onchange="jungDangFunc();">
					     	 	<option disabled="disabled">정당</option>
					     	 	<option>국민의당</option>
			      				<option>더불어민주당</option>
			      				<option>무소속</option>
			      				<option>바른정당</option>
			      				<option>자유한국당</option>
			      				<option>정의당</option>
					     	 </select>
						 </div>
					 </div>
				</div>
		     </div>
		     
		</div>
	<br/>
</div>
<div class="container">
	<div class="row">
		<div class="col-sm-12 text-center searchPaliamentDiv">
			<div class="row" id="searchResultDiv">
				<div class="col-sm-offset-4 col-sm-4 col-md-4">
					<div class="well customWell" style="min-height: 300px;">
						<h4 class="text-center">검색하신 정보가 없습니다.</h4>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<div class="container-fluid secondPointDiv">
	<div class="row">
		<div class="col-md-12 text-center secondPointCol">
			<div class="row">
			<div class="col-sm-offset-2 col-sm-8">
				<div class="well customSecondWell">
					<div class="textDiv">
						<i class="fa fa-pencil-square-o"></i><br/>
						<p class="secondTitleP">Quiz.</p>
						<p class="secondPointP">부족한 포인트를 위한, 포인트 퀴즈 입니다 ~ </p>
					</div>
			<form>
				<div class="row">
						<div class="col-sm-offset-4 col-sm-4 col-md-4 col-lg-4">
							<div class="form-group">
								<label class="form-control">${quizdto.question}</label>
							</div>
						</div>
					</div>
					<div class="form-group">	
						<label class="radio-inline"><input type="radio" name="optradio" value="1">${quizdto.option1}</label>
						<label class="radio-inline"><input type="radio" name="optradio" value="2">${quizdto.option2}</label>
						<label class="radio-inline"><input type="radio" name="optradio" value="3">${quizdto.option3}</label>
					</div>
					<input type="hidden" id="hidden_no" value="${quizdto.quiz_no}">	
				 <c:choose>
				   <c:when test="${memberDTO !=null}">
				   		<input type="button" class="btn btn-default" value="문제풀기" id="solveQuizBtn">
				   </c:when>
				   <c:otherwise>
				        로그인 하시면 문제를 푸실 수 있습니다.
				   </c:otherwise>
				 </c:choose>
			</form>			
				
					</div>
				</div>
			</div>
		</div>
		<div class="container">
			<div class="col-md-12 text-center secondPointCol" style="margin-top:-2%;">
				<div class="row">
					<div class="col-md-offset-2 col-md-4 col-sm-4 col-md-4 col-lg-4">
						<div class="well customSecondWell">
							<i class="fa fa-comments-o"></i><br/>
							<span class="iconTitle">토론방</span>
							<p class="secondPtag"><br/>토론방에 자신의 의견을 쓰시면<br/>포인트가 증가합니다.</p>
							<input type="button" class="btn btn-success" value="보러가기" onclick="debateFunc();">
						</div>
					</div>
					<div class="col-md-4 col-sm-4 col-md-4 col-lg-4">
						<div class="well customSecondWell">
							<i class="fa fa-address-card-o"></i><br/>
							<span class="iconTitle">의원</span>
							<p class="secondPtag"><br/>상승세가 높은 의원의 포인트를<br/>미리 구매하세요</p>
							<input type="button" class="btn btn-success" value="보러가기" onclick="paliamentFunc();">
						</div>
					</div>
		
				</div>
			  </div>
		</div>
	</div>
</div>



<!-- 모달용 div -->
<div class="container">
	<div class="modal fade" id="myModal" role="dialog" style="z-index: 999999999;">
    <div class="modal-dialog modal-lg">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">국회의원 상세보기</h4>
        </div>
        <div class="modal-body text-center">
          <div class="row">
          	<div class="col-md-4">
		          <div class="well customWell">
						<input type="hidden" id="modalHiddenDeptCd">
						<input type="hidden" id="modalHiddenNum2">
						<img id="paliamentImg" src="" class="img-circle" alt="Cinque Terre" width="100" height="100">
						<input type="hidden" id="modalHiddenEmpNm">
						<br/><br/>
						<label>이름 : <span id="modalName"></span></label><br/>
						<label>정당 : <span id="modalPolyNm"></span></label><br/>
						<label>포인트 : <span class="pointSpan" id="modalPoint">&nbsp;Point</span></label> <br/>
						<br/>
						<div class="form-group">
							<input type="button" class="btn btn-default" value="상세보기" onclick="detailView();">
						</div>
					</div>
				</div>
				<div class="col-md-8">
					<input type="hidden" id="hiddenModalPoint">
					<input type="hidden" id="hiddenModalPaliamentName">
					<div class="well customWell">
						<p>나의 포인트 : <span class="pointSpan" id="deleteMyPoint">${memberDTO.point}</span>&nbsp;Point</p><br/>
						<span class="explainSpan">많은 사용자들이 동일한 국회의원 포인트를 구매시,<br/> 해당 국회의원의 포인트는 증가하게 됩니다.</span><br/>
						<form class="form-horizontal" id="pointForm">
							<div class="form-group">
								<label class="control-label col-sm-offset-2 col-sm-2" for="count">수량 : </label>
								<div class="col-md-5">
									<input type="number" class="form-control" id="count" placeholder="수량을 입력해주세요!" min="0">
								</div>	
							</div>
							<br/>
							<div class="form-group">
								<input type="button" class="btn btn-default" value="구매" onclick="buyPoint(this);">
							</div>
						</form>
					</div>
				</div>
			</div>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-success" data-dismiss="modal">닫기</button>
        </div>
      </div>
    </div>
  </div>
</div>

<!-- 내가 구매한 의원 상세정보 div -->
<div class="container">
	<div class="modal fade" id="BuyModal" role="dialog" style="z-index: 999999999;">
    <div class="modal-dialog modal-lg">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">국회의원 상세보기</h4>
        </div>
        <div class="modal-body text-center">
          <div class="row">
          	<div class="col-md-4">
		          <div class="well customWell">
						<img id="myPointImg" src="" class="img-circle" alt="Cinque Terre" width="100" height="100">
						<br/><br/>
						<label>이름 : <span id="myPointEmpNm"></span></label><br/>
						<label>정당 : <span id="myPointPolyNm"></span></label><br/>
						<label>포인트 : <span class="pointSpan" id="myPointPoint">&nbsp;Point</span></label> <br/>
						<input type="hidden" id="PointIndexDeptCd">
						<input type="hidden" id="PointIndexNum2">
						<br/>
						<div class="form-group">
							<input type="button" class="btn btn-default" value="상세보기" onclick="myPaliamentDetailView();">
						</div>
					</div>
				</div>
				<div class="col-md-8">
					<div class="well customWell">
						<p>나의 포인트 : <span class="pointSpan" id="BuyModalMyPoint"></span>&nbsp;Point</p><br/>
						<p>보유중인 포인트 : <span class="pointSpan" id="myGetCount"></span>&nbsp;Point</p>
						<hr/>
						<form class="form-horizontal" id="pointForm">
							<div class="form-group">
								<label>보유중인 의원 포인트를 판매시, 나의 포인트는 증가합니다.</label>
							</div>
							<div class="form-group">
								<div class="col-md-offset-4 col-md-4">
									<input type="number" id="pointIndexsellCount" class="form-control" placeholder="판매수량" min="1">
								</div>
							</div>
							<div class="form-group">
								<input type="button" class="btn btn-warning" value="판매" onclick="PointIndexSellPoint();">
							</div>
						</form>
					</div>
				</div>
			</div>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-success" data-dismiss="modal">닫기</button>
        </div>
      </div>
    </div>
  </div>
</div>

