<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<section style="width:100%; height:100%;">
<div class="container-fluid">
	<h1 class="text-center">${keyWord}에 대하여</h1>
	<br/>
	<div class="row">
		<div class="col-md-offset-2 col-md-4" style="border:4px solid #aaaaaa; border-radius:20px;">
			<h1 class="dashH">진보</h1>
			<hr/>
			<ul class="dashList" id="jinboUl">
				<c:choose>
					<c:when test="${list != null}">
					<c:forEach var="dto" items="${list}">
						<c:if test="${dto.choose eq '진보'}">
							<li onclick="detailDebate(${dto.debateNo}, $(this));">${dto.title}<span>${dto.nickName} / ${dto.writeDate}</span></li>
						</c:if>
					</c:forEach>
					</c:when>
					<c:otherwise>
						<li>의견을 남겨주세요 !</li>
					</c:otherwise>
				</c:choose>
			</ul>
		</div>
		<div class="col-md-offset-1 col-md-4" style="border:4px solid #aaaaaa; border-radius:20px;">
			<h1 class="dashH">보수</h1>
			<hr/>
			<ul class="dashList" id="bosuUl">
				<c:choose>
					<c:when test="${list != null}">
						<c:forEach var="dto" items="${list}">
							<c:if test="${dto.choose eq '보수'}">
								<li onclick="detailDebate(${dto.debateNo});">${dto.title}<span>${dto.nickName} / ${dto.writeDate}</span></li>
							</c:if>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<li>의견을 남겨주세요 !</li>
					</c:otherwise>
				</c:choose>
			</ul>
		</div>
		<div class="col-md-1"></div>
	</div>
	<hr/>
	
	<div class="col-md-12">
		<c:choose>
			<c:when test="${id != null}">
			<input type="hidden" id="debateWord" value="${keyWord}">
			<input type="hidden" id="loginNickName" value="${memberDTO.nickName}">
				
		<div class="radio col-md-offset-2">
			<label>
				<input type="radio" name="choose" value="Bo">보수
			</label>
			
			<label>
				<input type="radio" name="choose" value="Jin">진보
			</label>
		</div>
		
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
				<label class="control-label col-md-offset-1 col-md-2">
					<input type="button" class="btn btn-success" id="debateWriteBtn" value="글쓰기">
				</label>
			</div>
		</form>	
			</c:when>
			<c:otherwise>
				<h4>로그인 하시면 글을 쓸 수 있습니다.</h4>
			</c:otherwise>
		</c:choose>
	</div>
	<br/><br/>
</div>
</section>