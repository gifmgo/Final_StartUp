<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- <section style="width:100%; height:100%;"> -->
<div class="container-fluid">
	<h1 class="text-center">${keyWord}에 대하여</h1>
	<br/>
	<div class="row">
		<div class="col-md-1"></div>
		<div class="col-md-5">
			<h4>진보</h4>
			<hr/>
				<ul class="list-group" style="float:none;">
				<c:choose>
					<c:when test="${list != null}">
					<c:forEach var="dto" items="${list}">
						<c:if test="${dto.choose eq '진보'}">
							<li onclick="detailDebate(${dto.debateNo});" class="list-group-item" style="float: none;">${dto.title}<span class="badge col-sm-offset-2">${dto.nickName} ${dto.writeDate}</span></li>
						</c:if>
					</c:forEach>
					</c:when>
					<c:otherwise>
						<li class="list-group-item">의견을 남겨주세요 !</li>
					</c:otherwise>
				</c:choose>
				</ul>
		</div>
		
		<div class="col-md-5" style="left:2%;">
			<h4>보수</h4>
			<hr/>
			<ul class="list-group" style="float:none;">
				<c:choose>
					<c:when test="${list != null}">
						<c:forEach var="dto" items="${list}">
							<c:if test="${dto.choose eq '보수'}">
								<li onclick="detailDebate(${dto.debateNo});" class="list-group-item" style="float: none;">${dto.title}<span class="badge col-sm-offset-2">${dto.nickName} / ${dto.writeDate}</span></li>
							</c:if>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<li class="list-group-item">의견을 남겨주세요 !</li>
					</c:otherwise>
				</c:choose>
			</ul>
		</div>
		<div class="col-md-1"></div>
	</div>
	<hr/>
	
	<div class="col-md-11">
		<c:choose>
			<c:when test="${id != null}">
				<input type="hidden" id="debateWord" value="${keyWord}">
				<input type="hidden" id="loginNickName" value="${memberDTO.nickName}">
				
				<div class="radio col-md-offset-5" style="left:5%;">
					<label>
						<input type="radio" name="choose" value="Bo">보수
					</label>
					
					<label>
						<input type="radio" name="choose" value="Jin">진보
					</label>
				</div>
			
				<div class="col-md-offset-4 col-md-8">
					<form class="form-horizontal">	
						<div class="form-group">
							<label class="control-label col-md-2">제목 </label>
							<div class="col-md-4">
								<input type="text" id="title" class="form-control">
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-md-2">내용 </label>
							<div class="col-md-4">
								<textarea id="debateTextArea" class="form-control"></textarea>
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-md-2" style="left:11%;">
								<input type="button" class="btn btn-success" id="debateWriteBtn" value="글쓰기">
							</label>
						</div>
					</form>	
				</div>
			</c:when>
			<c:otherwise>
				<h4>로그인 하시면 글을 쓸 수 있습니다.</h4>
			</c:otherwise>
		</c:choose>
		</div>
	</div>
	
	
	<br/><br/>

<!-- </section> -->

<!-- 모달 -->
<div id="myModal" class="modal fade" role="dialog">
  <div class="modal-dialog">
    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title">제목 : <span id="dbTitle"></span>&nbsp;&nbsp;<span id="date" class="col-md-offset-4"></span></h4>
      </div>
      <div class="modal-body">
        <p>내용 : <span id="dbcontent"></span></p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      </div>
    </div>

  </div>
</div>
