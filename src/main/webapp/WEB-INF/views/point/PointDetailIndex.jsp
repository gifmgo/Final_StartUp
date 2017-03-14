<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="container">
	<div class="row articlerow">
		<div class="container text-center">
			<div class="row">
				<div class="col-md-4 text-center">
					 <div class="panel panel-info">
					    <div class="panel-heading text-left" style="height:55.09px;">
					    	<label class="customPlabel">유저 포인트 랭킹</label>
					    </div>
					    <div class="panel-body">
					    	<table class="table">
							<thead>
								<tr>
									<th class="text-center">No.</th>
									<th class="text-center">닉네임</th>
									<th class="text-center">포인트</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="list" items="${pointRank}" varStatus="Status">
									<c:if test="${Status.count <= 5}">
										<tr>
											<td class="text-center">${Status.count}</td>
											<td class="text-center">${list.nickName}</td>
											<td class="text-center">${list.point}</td>
										</tr>		
									</c:if>
								</c:forEach>
							</tbody>
						</table>
							<input type="button" class="btn btn-info" value="상세보기">
					    </div>
					  </div>
				</div>
				<div class="col-md-4 text-center">
					 <div class="panel panel-info">
					    <div class="panel-heading text-left" style="height: 55.09px;">
					    	<label class="customPlabel">인기의원</label>
					    </div>
					    <div class="panel-body">
					    	<table class="table">
							<thead>
								<tr>
									<th class="text-center">No.</th>
									<th class="text-center">이름</th>
									<th class="text-center">구매횟수</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="lList" items="${lovePal}" varStatus="lStatus">
									<c:if test="${lStatus.count <= 5}">
										<tr>
											<input type="hidden" value="${lList.deptCd}">
											<td class="text-center">${lStatus.count}</td>
											<td class="text-center">${lList.empNm}</td>
											<td class="text-center">${lList.pointCount}</td>
										</tr>
									</c:if>
								</c:forEach>
							</tbody>
						</table>
						<input type="button" class="btn btn-info" value="상세보기">
					    </div>
					  </div>
				</div>
				<div class="col-md-4 text-center">
					  <div class="panel panel-info">
					    <div class="panel-heading">
					    	<div class="row">
					    		<div class="col-md-4">
					    			<label class="text-left customPlabel" style="margin-top:5px;">인기)정당별</label>
					    		</div>
					    		<div class="col-md-6">
					    			<select class="form-control" id="polyNmSelect">
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
					    <div class="panel-body">
					    	<table class="table">
							<thead>
								<tr>
									<th class="text-center">No.</th>
									<th class="text-center">이름</th>
									<th class="text-center">구매횟수</th>
								</tr>
							</thead>
							<tbody id="favoritPaliamentTbody">
								<c:forEach var="baseList" items="${baseJungDang}" varStatus="jungDangStatus">
									<c:if test="${jungDangStatus.count<=5}">
										<tr>
											<td class="text-center">${jungDangStatus.count}</td>
											<td class="text-center">${baseList.empNm}</td>
											<td class="text-center">${baseList.pointCount}</td>
										</tr>
									</c:if>
								</c:forEach>
							</tbody>
						</table>
						<input type="button" class="btn btn-info" value="상세보기">
					  </div>
				  </div>
				</div>
			</div>
		<br/><br/>	
			
			<div class="row text-center">
				<div class="col-md-12">
					<div class="well customWell">
						
						<label>구매한 국회의원</label>
						
						<div class="table-responsive" style="margin-top:2%;">
						<table class="table">
							<thead>
								<tr class="success">
									<th class="text-center">이름</th>
									<th class="text-center">정당</th>
									<th class="text-center">수량</th>
									<th class="text-center">포인트</th>
									<th/>
								</tr>
							</thead>
							<tbody>
								<c:choose>
									<c:when test="${sessionScope.id != null}">
									<c:forEach var="buyList" items="${buyPaliament}" varStatus="SellStatus">
										<tr>
											<td class="text-center">${buyList.empNm}</td>
											<td class="text-center">${buyList.polyNm}</td>
											<td class="text-center">${buyList.totalCount}</td>
											<td class="text-center">${buyList.point}</td>
											<td class="text-center"><input type="hidden" value="${buyList.deptCd}"><input type="button" id="${SellStatus.count}" class="btn btn-info" value="판매" onclick="sellPaliament(this);"></td>
										</tr>
									</c:forEach>
										<tr>
											<td colspan="5"><input type="button" class="btn btn-info" value="그래프 보기" onclick="grapFunc();"></td>
										</tr>
									</c:when>
									<c:otherwise>
										<tr class="danger"><td class="text-center" colspan="5">로그인을 해주세요</tr>
									</c:otherwise>
								</c:choose>
							</tbody>
						</table>
						</div>
						<div class="form-group">
							<ul class="pagination">
							  <li><a href="#">1</a></li>
							  <li><a href="#">2</a></li>
							  <li><a href="#">3</a></li>
							  <li><a href="#">4</a></li>
							  <li><a href="#">5</a></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
						
			<div class="row text-center">
				<div class="col-md-12">
					<div class="well customWell">
						<label class="myPointLabel">그래프 보기</label><hr/>
						<span class="iconSpan"><i class="fa fa-circle" style="font-size:15px;color:#1abc9c">국민의당</i></span>
						<span class="iconSpan"><i class="fa fa-circle" style="font-size:15px;color:#2980b9">더불어 민주당</i></span>
						<span class="iconSpan"><i class="fa fa-circle" style="font-size:15px;color:#3498db">바른정당</i></span>
						<span class="iconSpan"><i class="fa fa-circle" style="font-size:15px;color:#e74c3c">자유한국당</i></span>
						<span class="iconSpan"><i class="fa fa-circle" style="font-size:15px;color:#f1c40f">정의당</i></span>
						<span class="iconSpan"><i class="fa fa-circle" style="font-size:15px;color:#95a5a6">무소속</i></span>
						<hr/>
						<br/><br/>
						<div id="progressDiv">
						
						</div>
					</div>
				</div>
			</div>

		</div>
	</div>
</div>

<div id="paliamentSellModal" class="modal fade" role="dialog">
  <div class="modal-dialog modal-lg">
    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title">국회의원 상세보기</h4>
      </div>
      <div class="modal-body text-center">
        <div class="row">
          	<div class="col-md-4">
		          <div class="well customWell">
						<img id="sellpaliamentImg" src="" class="img-circle" alt="Cinque Terre" width="100" height="100">
						<br/><br/>
						<label>이름 : <span id="sellmodalName"></span></label><br/>
						<label>정당 : <span id="sellmodalPolyNm"></span></label><br/>
						<label>포인트 : <span class="pointSpan" id="sellmodalPoint">&nbsp;Point</span></label> <br/>
						<br/>
						<div class="form-group">
							<input type="button" class="btn btn-default" value="상세보기" onclick="detailView();">
						</div>
					</div>
				</div>
				<div class="col-md-8">
					<div class="well customWell">
						<p>나의 포인트 : <span class="pointSpan" id="deleteMyPoint">${memberDTO.point}</span>&nbsp;Point</p><br/>
						<span class="explainSpan">많은 사용자들이 동일한 국회의원 포인트를 구매시,<br/> 해당 국회의원의 포인트는 증가하게 됩니다.</span><br/>
						<form class="form-horizontal" id="pointForm">
							<div class="form-group">
								<label class="control-label col-sm-offset-2 col-sm-2" for="sellCount">수량 : </label>
								<div class="col-md-5">
									<input type="number" class="form-control" id="sellCount" placeholder="수량을 입력해주세요!" min="0">
								</div>	
							</div>
							<br/>
							<div class="form-group">
								<input type="button" class="btn btn-default" value="판매" onclick="sellPoint();">
							</div>
						</form>
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

<script>
	
	function grapFunc(){
	var dtoList = new Array();
	var scriptDto;
	<c:forEach items="${buyPaliament}" var="dto">
	scriptDto = {
		empNm : "${dto.empNm}",
		polyNm : "${dto.polyNm}",
		totalCount : "${dto.totalCount}",
		point : "${dto.point}"
	};
	dtoList.push(scriptDto);
	</c:forEach>
	
	makeGrap(dtoList);
	}
</script>