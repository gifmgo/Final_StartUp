<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>​
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<link rel="stylesheet" type="text/css" href="life/life.css">
<script type="text/javascript" src="life/life.js"></script>

<div class="container">
	<div class="row">
		<h3>생활 이야기</h3>
		<div class="col-sm-6 col-md-3 boardBox">
			<span class="top">일상</span><a href="board.do?category=life" class="top more"><span class="glyphicon glyphicon-plus"></span>더 보기</a>
			<hr/>
			<ul>
				<c:forEach var="list" items="${life}" varStatus="status">
				<li onclick="location.href='boardDetail.do?no=${list.no}&category=${list.category }&currentpage=1'">
					<span class="rank">${status.count }</span>
					<span class="title">${list.title }</span>
					<%-- <c:if test="${list.regdatePO > now }">
						<span class="num">(1)</span>
					</c:if> --%>
					<c:if test="${list.regdatePO > now }">
						<span class="new">N</span>
					</c:if>
				</li>
				</c:forEach>
			</ul>
		</div>
		<div class="col-sm-6 col-md-3 boardBox">
			<span class="top">고민</span><a href="board.do?category=life" class="top more"><span class="glyphicon glyphicon-plus"></span>더 보기</a>
			<hr/>
			<ul>
				<c:forEach var="list" items="${life}" varStatus="status">
				<li onclick="location.href='boardDetail.do?no=${list.no}&category=${list.category }&currentpage=1'">
					<span class="rank">${status.count }</span>
					<span class="title">${list.title }</span>
					<%-- <c:if test="${list.regdatePO > now }">
						<span class="num">(1)</span>
					</c:if> --%>
					<c:if test="${list.regdatePO > now }">
						<span class="new">N</span>
					</c:if>
				</li>
				</c:forEach>
			</ul>
		</div>
		<div class="col-sm-6 col-md-3 boardBox">
			<span class="top">연예</span><a href="board.do?category=life" class="top more"><span class="glyphicon glyphicon-plus"></span>더 보기</a>
			<hr/>
			<ul>
				<c:forEach var="list" items="${life}" varStatus="status">
				<li onclick="location.href='boardDetail.do?no=${list.no}&category=${list.category }&currentpage=1'">
					<span class="rank">${status.count }</span>
					<span class="title">${list.title }</span>
					<%-- <c:if test="${list.regdatePO > now }">
						<span class="num">(1)</span>
					</c:if> --%>
					<c:if test="${list.regdatePO > now }">
						<span class="new">N</span>
					</c:if>
				</li>
				</c:forEach>
			</ul>
		</div>
		<div class="col-sm-6 col-md-3 boardBox">
			<span class="top">영상</span><a href="board.do?category=life" class="top more"><span class="glyphicon glyphicon-plus"></span>더 보기</a>
			<hr/>
			<ul>
				<c:forEach var="list" items="${life}" varStatus="status">
				<li onclick="location.href='boardDetail.do?no=${list.no}&category=${list.category }&currentpage=1'">
					<span class="rank">${status.count }</span>
					<span class="title">${list.title }</span>
					<%-- <c:if test="${list.regdatePO > now }">
						<span class="num">(1)</span>
					</c:if> --%>
					<c:if test="${list.regdatePO > now }">
						<span class="new">N</span>
					</c:if>
				</li>
				</c:forEach>
			</ul>
		</div>
	</div>	
</div>
<div class="container" style="margin-top: 20px;">
	<div class="row">
		<!-- <ul class="nav nav-pills col-sm-offset-1" style="font-size:17px;">
		    <li><a href="#">인기 글</a></li>
		</ul> -->
		<div class="col-md-12">
			<div class="col-md-offset-1 col-md-10 content">
				<h3>인기글</h3>
				<ul>
					<c:forEach var="list" items="${popLife}">
					<li class="list" onclick="location.href='boardDetail.do?no=${list.no}&category=${list.category }&currentpage=1'">	
						<img class="img" src="http://placehold.it/80x80">
						<span class="title">${list.title }</span>
						<ul class="wt">
							<li class="writer">${list.writer }</li>
							<li class="time">${list.regdate }</li>
						</ul>
						<ul class= "gb">
							<li class="glyphicon glyphicon-thumbs-up">${list.good }</li>
							<li class="glyphicon glyphicon-thumbs-down">${list.bed }</li>
						</ul>
					</li>
					</c:forEach>
				</ul>
			</div>
		</div>
	</div>
	<div style="padding:20px;"></div>
</div>
<div style="padding:30px;"></div>