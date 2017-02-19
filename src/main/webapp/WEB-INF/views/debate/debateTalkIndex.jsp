<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- <section style="width:100%; height:100%;"> -->
<div class="container-fluid">
	<div class="jumbotron" style="width:100%; margin-top:1%; background-color: #ecf0f1">
		<div class="row">
			<div class="col-md-offset-4 col-md-4" style="margin-top:-2%;">
				<div class="panel panel-default text-center"> 
					<div class="panel-body" style="background-color: #1abc9c;"><span style="color:#fff">이달의 키워드</span><br/><span class="text-right" style="color:#fff">'${keyWord.admin_debate_debateword}'</span></div> 
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-md-1"></div>
			<div class="col-md-5 text-center">
				<div class="embed-responsive embed-responsive-16by9">
					<iframe class="embed-responsive-item" src="${keyWord.firstvideo}" frameborder="0" allowfullscreen></iframe>
				</div><br/>
				<span>JTBC 뉴스</span>
			</div>
			
			<div class="col-md-5 text-center">
				<div class="embed-responsive embed-responsive-16by9">
					<iframe class="embed-responsive-item" src="${keyWord.secondvideo}" frameborder="0" allowfullscreen></iframe>
				</div>
				<br/>
				<span>Chosun 뉴스</span>
			</div>
			<div class="col-md-1"></div>
		</div>
	</div>
<br/><br/>
	<div class="row">
			<div class="col-md-offset-4 col-md-4" style="margin-top:-2%;">
				<div class="panel panel-default text-center"> 
					<div class="panel-body" style="background-color: #1abc9c;"><span style="color:#fff">여러분의 한마디</span></div> 
				</div>
			</div>
	</div>
	<div class="container">
		<div id="debateListDiv" style="min-height: 500px;">
			<div class="row">
				<div class="col-md-1"></div>
				<div class="col-md-5" style="border-right: 5px solid gray;">
					<h4 class="text-center">진보</h4>
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
				
				<div class="col-md-5">
					<h4 class="text-center">보수</h4>
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
		</div>
	</div>
	<hr/>
</div>
<div class="container">
	<div class="col-md-12">
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
			
				<div class="col-md-offset-2 col-md-8">
					<form class="form-horizontal">	
						<div class="form-group">
							<label class="control-label col-md-2">제목 </label>
							<div class="col-md-10">
								<input type="text" id="title" class="form-control">
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-md-2">내용 </label>
							<div class="col-md-10">
								<textarea id="debateTextArea" class="form-control" rows="15"></textarea>
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-md-offset-1 col-md-2">
								<input type="button" class="btn btn-success" id="debateWriteBtn" value="글쓰기">
							</label>
						</div>
					</form>	
				</div>
			</c:when>
			<c:otherwise>
				<h4 class="text-center">로그인 하시면 글을 쓸 수 있습니다.</h4>
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

