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
				  <a href="PresidentVote.do" class="btn btn-default" style="border: none;">투표해보기</a>
				 <a href="PresidentTalk.do" class="btn btn-default" style="border: none;">대선 한마디</a>
			</div>
			<hr/>
  		</div>
  		<br/>
  	</div>
  </div>
  
  <div class="row">
  	
  	<div class="col-md-6">
  		<div class="well customWell text-center">
  			<label>우리끼리 투표하기</label>
  			<hr/>
  			<c:choose>
  				<c:when test="${list != null}">
  					<c:forEach var="list" items="${list}">
						<div class="row">
							<div class="col-md-12">
								<div class="radio">
								  <label><input type="radio" name="optradio" value="${list.name}">${list.name} (${list.jungDang})</label>
								</div>  		
							</div>
						</div>			
  					</c:forEach>
  				</c:when>
  				<c:otherwise>
  					<label class="form-control">죄송합니다 잠시후 이용해주세요.</label>
  				</c:otherwise>
  			</c:choose>
  			<hr/>
			<div class="form-group">
				<input type="button" class="btn btn-info" value="투표하기" onclick="voteFunc();">
			</div>
  		</div>
  	</div>
  	
  	<div class="col-md-6">
  		<div class="well customWell text-center">
			<label>우리끼리 투표 현황</label>
			<hr/>
			<div id="resultVote"></div>
			<input type="button" class="btn btn-info" value="현황보기" onclick="showVoteDetail();">
		</div>
	</div>  	
  </div>
  
</div>  