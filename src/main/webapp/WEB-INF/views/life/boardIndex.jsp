<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<!-- <link rel="stylesheet" type="text/css" href="css/sub04_0124.css"> -->
<link rel="stylesheet" type="text/css" href="life/life0403.css">
<script type="text/javascript" src="life/life.js"></script>

<div class="container" style="margin-top:20px;">
<div class="panel panel-default">
	  <div class="panel-heading">Best 게시글</div>
	   <div class="panel-body">
	<div class="row">
		<div class="col-sm-4 boardBox">
			<span class="top">일상</span>
			<hr/>
			<ul>
				<c:forEach var="list" items="${life}" varStatus="status">
				<li onclick="location.href='lifeBoardDetail.do?no=${list.no}&category=${list.category }&currentpage=1'">
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
		<div class="col-sm-4 boardBox">
			<span class="top">연예</span>
			<hr/>
			<ul>
				<c:forEach var="list" items="${star}" varStatus="status">
				<li onclick="location.href='lifeBoardDetail.do?no=${list.no}&category=${list.category }&currentpage=1'">
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
		<div class="col-sm-4 boardBox">
			<span class="top">고민</span>
			<hr/>
			<ul>
				<c:forEach var="list" items="${wor}" varStatus="status">
				<li onclick="location.href='lifeBoardDetail.do?no=${list.no}&category=${list.category }&currentpage=1'">
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
	</div>	
</div>	
<div class="container" style="margin-top: 20px; margin-bottom:20px">

	<input type="hidden" id="category" value="${title }">
	<input type="hidden" id="cpage" value="${cpage }">
	
	<div class="row">
		<ul class="breadcrumb">
		    <li><a href="lifeBoard.do">전체</a></li>
		    <li><a href="lifeBoard.do?category=life">일상</a></li>
		    <li><a href="lifeBoard.do?category=star">연예</a></li>
		    <li><a href="lifeBoard.do?category=wor">고민</a></li>
		    <!-- <li><a href="#">기타</a></li> -->
		</ul>
		
		<div class="col-md-12">
			<div class="col-md-offset-1 col-md-10 content">
				<div class="head">
					<h3 class="title">${title}</h3>
					<c:if test="${id != null}">
			            <button class="btn btn-primary" onclick="writeContentView()">글쓰기</button>
			       	</c:if>
		       	</div>
				<ul>
					<c:forEach var="list" items="${list}">
					<li class="list">
						<c:choose>
						<c:when test="${list.img==null }">
							<img class="img" src="http://placehold.it/80x80"  onclick="location.href='lifeBoardDetail.do?no=${list.no}&category=${list.category }&currentpage=1'">
						</c:when>
						<c:otherwise>
							<img class="img" src="${list.img }"  onclick="location.href='lifeBoardDetail.do?no=${list.no}&category=${list.category }&currentpage=1'">
						</c:otherwise>
						</c:choose>
						<span class="title"  onclick="location.href='lifeBoardDetail.do?no=${list.no}&category=${list.category }&currentpage=1'">[${list.category}]${list.title }
							<c:if test="${list.regdatePO > now }">
								<span class="new">N</span>
							</c:if>
						</span>
						<ul class="wt">
							<li class="writer">${list.writer }</li>
							<li class="time">${list.regdate }</li>
							<li class="viewcnt">조회수 : ${list.viewcnt }</li>
						</ul>
						<ul class= "gb">
							<li class="glyphicon glyphicon-thumbs-up">${list.good }</li>
						</ul>
					</li>
					</c:forEach>
				</ul>
			</div>
		</div>
	</div>
</div>
<div class="container">
	<div class="row">
		<div style="text-align: center;">
			<ul class="pagination">
	        	<c:choose>
	            <c:when test="${cpage > 1}">
					<li class="paging" onclick="location.href='lifeBoard.do?category=${title}&currentpage=${cpage-1}&pagesize=${pgsize}'"></li>
	        	</c:when>
	        	<c:otherwise>
				</c:otherwise>
	       		</c:choose>
	    		<c:forEach var="i" begin="1" end="${pagecount}" step="1">
	          		<c:choose>
	           		<c:when test="${cpage==i}">
	                	<li class="pgNum" style="font-weight:bold; font-size:18px;">${i}</li>
	             	</c:when>
	             	<c:otherwise>
	                	<li class="pgNum" onclick="location.href='lifeBoard.do?category=${title}&currentpage=${i}&pagesize=${pgsize}'">${i}</li>
	             	</c:otherwise>
	       			</c:choose>
	       		</c:forEach>
	       		<c:choose>
		       	<c:when test="${cpage < pagecount}">
		          	<li onclick="location.href='lifeBoard.do?category=${title}&currentpage=${cpage+1}&pagesize=${pgsize}'">></li>
		       	</c:when>
	        	<c:otherwise>
	        	</c:otherwise>
	       		</c:choose>					        
	        </ul>
        </div>
    </div>
</div>