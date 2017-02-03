<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<section id="debateSection">
	<h1>${keyWord}에 대하여</h1>
	<br/>
	<article>
		<div>
			<h1 class="dashH">진보</h1>
			<ul class="dashList">
				<li>안녕<span>2017-02-01</span></li>
			</ul>
		</div>
		
		<div>
			<h1 class="dashH">보수</h1>
			<ul class="dashList">
					<li>안녕<span>2017-02-01</span></li>
			</ul>
		</div>
		
		<c:choose>
				<c:when test="${id != null}">
				<input type="hidden" id="debateWord" value="${keyWord}">
				<input type="hidden" id="loginNickName" value="${memberDTO.nickName}">
				<input type="radio" name="choose" value="Bo">보수
				<input type="radio" name="choose" value="Jin">진보
				<textarea id="debateTextArea"></textarea>
				<input type="button" id="debateWriteBtn" value="글쓰기">
				</c:when>
				<c:otherwise>
					<h4>로그인 하시면 글을 쓸 수 있습니다.</h4>
				</c:otherwise>
			</c:choose>	
		</article>
</section>