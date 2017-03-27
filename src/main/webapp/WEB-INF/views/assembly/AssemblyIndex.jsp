<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="container">
<br/><br/>
   <div class="row">
		<div class="col-sm-12 col-xs-12">
			<div class="well jumboWell">
				<h4 class="text-center"><i class="fa fa-institution" style="font-size:36px"></i>&nbsp;&nbsp;생활 국회</h4><br/>
				<p class="text-center">생활정치 사이트에 저장되어 있는 국회의원 정보 및 의안 정보를 손쉽게 찾아보는 페이지 입니다.</p>
				<p class="text-center">정부에서 제공하는 데이터를 바탕으로 의안,국회의원의 정보를 쉽게 찾아 볼 수 있습니다.</p>
				<p class="text-center" style="color:#c0392b">아는것이 힘 입니다.</p>
			</div>
		</div>

	<div class="col-sm-12 col-xs-12">
		<div class="row">
			<div class="col-sm-12">
				<div class="panel panel-info">
			      <div class="panel-heading"><span>원별 댓글 현황  <i class="fa fa-plus-circle" style="font-size:20px"></i></span></div>
			      <div class="panel-body">
				<c:choose>
					<c:when test="${clist != null}">
						<c:forEach var="clist" items="${clist}" varStatus="clistStatus">
							<c:if test="${clistStatus.count < 4}">
								<div class="col-sm-3 col-xs-6">
									<div class="well whiteWell text-center">
										<span>
										 	<img src="${clist.img}" class="img-circle" style="width:40px; height: 60px;">
										</span><br/><br/>
										<span style="font-size: 12px;">${clist.orignm}</span><br/>
									    <span style="font-size: 12px;">${clist.name}</span>
								    </div>
							    </div>
							    <div class="col-sm-3 col-xs-6">
									<div class="well whiteWell text-center">
										<span>
										 	<img src="${clist.img}" class="img-circle" style="width:40px; height: 60px;">
										</span><br/><br/>
										<span style="font-size: 12px;">${clist.orignm}</span><br/>
									    <span style="font-size: 12px;">${clist.name}</span>
								    </div>
							    </div>
							    <div class="col-sm-3 col-xs-6">
									<div class="well whiteWell text-center">
										<span>
										 	<img src="${clist.img}" class="img-circle" style="width:40px; height: 60px;">
										</span><br/><br/>
										<span style="font-size: 12px;">${clist.orignm}</span><br/>
									    <span style="font-size: 12px;">${clist.name}</span>
								    </div>
							    </div>
					    	</c:if>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<h4>아더와이즈 입니다.??</h4>
					</c:otherwise>
				</c:choose>
				</div>
			</div>
		</div>
			<div class="col-sm-12">
				<div class="panel panel-success">
			      <div class="panel-heading"><p>국회의원 현황 <span>(정당별 국회의원)</span></p></div>
			      <div class="panel-body">
			      		<div class="row">
					      	<div class="col-sm-12">
						      	<div class="well whiteWell text-center">
						      	<span class="iconSpan"><i class="fa fa-circle" style="font-size:15px;color:#1abc9c">국민 의당</i></span>
								<span class="iconSpan"><i class="fa fa-circle" style="font-size:15px;color:#2980b9">더불어 민주당</i></span>
								<span class="iconSpan"><i class="fa fa-circle" style="font-size:15px;color:#3498db">바른정당</i></span>
								<span class="iconSpan"><i class="fa fa-circle" style="font-size:15px;color:#e74c3c">자유한국당</i></span>
								<span class="iconSpan"><i class="fa fa-circle" style="font-size:15px;color:#f1c40f">정 의 당</i></span>
								<span class="iconSpan"><i class="fa fa-circle" style="font-size:15px;color:#95a5a6">무 소 속</i></span>
								</div>
							</div>
							<hr/>
							<div class="col-sm-12">
								<div class="well whiteWell">
									<div class="row">
										<div class="col-sm-2">
											<p>국민 의당 (<span id="guckSpan"></span>)</p>
											<p id="guckDiv"></p>
										</div>
										<div class="col-sm-2">
											<p>더불어 민주당 (<span id="doubSpan"></span>)</p>
											<p id="doubDiv"></p>
										</div>
										<div class="col-sm-2">
											<p>바른 정당 (<span id="baSpan"></span>)</p>
											<p id="baDiv"></p>
										</div>
										<div class="col-sm-2">
											<p>자유 한국당 (<span id="freeSpan"></span>)</p>
											<p id="freeDiv"></p>
										</div>
										<div class="col-sm-2">
											<p>정의당 (<span id="jungSpan"></span>)</p>
											<p id="jungDiv"></p>
										</div>
										<div class="col-sm-2">
											<p>무소속 (<span id="muSpan"></span>)</p>
											<p id="muDiv"></p>
										</div>
									</div>
								</div>
							</div>				
						</div>
					</div>
				</div>
		   </div>
	   </div>
   </div> 
 </div>   
</div>
<br/><br/>
<div class="container">
	<div class="col-sm-12 col-xs-12">
      <div class="row">
      	 <div class="col-sm-12">
      	 	<div class="panel panel-warning">
			      <div class="panel-heading"><p>의안 현황<span>(법안)</span></p></div>
			      <div class="panel-body">
			      	<ul class="nav nav-tabs" id="tabMenu">
					  <li class="active"><a id="oneTab">최근 통과안</a></li>
					</ul>
				      <div class="form-group">
					     <div class="well whiteWell">
					     	<br/>
						      <div class="table-responsive">
						      	<table class="table">
						      		<thead>
						      			<tr>
						      				<th>제안일</th>
						      				<th>의안명</th>
						      				<th>상임위원회</th>
						      				<th>진행 상황</th>
						      			</tr>
						      		</thead>
						      		<tbody id="statuteTbody">
						      			
						      		</tbody>
						      	</table>
						      	<hr/>
						      	<label class="pull-right"><input type="button" class="btn btn-success" value="더보기" id="moreStatueBtn"></label>
				      	 	</div>
			      	 	</div>
		      	 	</div>
		      </div>
			</div>
      	 </div>
      </div>
   </div>
</div>