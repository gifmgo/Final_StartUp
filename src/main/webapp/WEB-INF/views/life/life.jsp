
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<!-- <link rel="stylesheet" type="text/css" href="css/sub04_0124.css"> -->
<link rel="stylesheet" type="text/css" href="life/life0403.css">
<script type="text/javascript" src="life/life.js"></script>

<div class="container" style="margin-top:20px;">
	<div class="row">
		<div class="col-sm-12 text-center" id="lifeJdiv">
			<p id="lifePtitleTag">생활 이야기</p>
			<p id="lifePsecondTag">가벼운 마음으로.</p>
			<p>일상, 연애 고민 등 다양한 컨텐츠를 즐겨보세요</p>
		</div>
	</div>
	<div class="panel panel-default">
	  	<div class="panel-heading">영상보기 <span class="pull-right"><i class="fa fa-plus" style="font-size:22px"></i></span></div>
	  	  <div class="panel-body">	
			<div class="row">
				<div class="col-sm-4">
					<div class="well customWell">
						<div class="embed-responsive embed-responsive-16by9">
					   		<iframe width="560" height="315" src="https://www.youtube.com/embed/UOr_M2B0J80" frameborder="0" allowfullscreen></iframe>
					   		<p class="videoP"><span class="videoTitleSpan">1박 2일</span><br/><span class="videoContentSpan">레전드</span></p>
					   </div>
				   </div>	
				</div>
				<div class="col-sm-4">
					<div class="well customWell">
						<div class="embed-responsive embed-responsive-16by9">
					   		<iframe width="560" height="315" src="https://www.youtube.com/embed/UOr_M2B0J80" frameborder="0" allowfullscreen></iframe>
					   		<p class="videoP"><span class="videoTitleSpan">1박 2일</span><br/><span class="videoContentSpan">레전드</span></p>
					   </div>
				   </div>
				</div>
				<div class="col-sm-4">
					<div class="well customWell">
						<div class="embed-responsive embed-responsive-16by9">
					   		<iframe width="560" height="315" src="https://www.youtube.com/embed/UOr_M2B0J80" frameborder="0" allowfullscreen></iframe>
					   		<p class="videoP"><span class="videoTitleSpan">1박 2일</span><br/><span class="videoContentSpan">레전드</span></p>
					   </div>	
				   </div>
				</div>
			</div>
		</div>
	</div>
</div>

<div class="container">
	<div class="panel panel-default">
	  <div class="panel-heading">Best 게시글 <span class="pull-right"><i class="fa fa-plus" style="font-size:22px"></i></span></div>
	   <div class="panel-body">
			<div class="row">
				<div class="col-sm-6 col-md-4 boardBox">
					<span class="top">일상</span><a href="lifeBoard.do?category=life" class="top more"><span class="glyphicon glyphicon-plus"></span></a>
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
				<div class="col-sm-6 col-md-4 boardBox">
					<span class="top">연예</span><a href="lifeBoard.do?category=star" class="top more"><span class="glyphicon glyphicon-plus"></span></a>
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
				<div class="col-sm-6 col-md-4 boardBox">
					<span class="top">고민</span><a href="lifeBoard.do?category=wor" class="top more"><span class="glyphicon glyphicon-plus"></span></a>
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

<%-- 
<div class="container" style="margin-top: 20px; margin-bottom:20px">

	<input type="hidden" id="category" value="${title }">
	<input type="hidden" id="cpage" value="${cpage }">
	
	<div class="row">
		<ul class="breadcrumb">
		    <li><a href="life.do">전체</a></li>
		    <li><a href="life.do?category=life">일상</a></li>
		    <li><a href="life.do?category=star">연예</a></li>
		    <li><a href="life.do?category=wor">고민</a></li>
		    <li><a href="life.do?category=fun">영상</a></li>
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
							<img class="img" src="http://placehold.it/80x80"  onclick="location.href='boardDetail.do?no=${list.no}&category=${list.category }&currentpage=1'">
						</c:when>
						<c:otherwise>
							<img class="img" src="${list.img }"  onclick="location.href='boardDetail.do?no=${list.no}&category=${list.category }&currentpage=1'">
						</c:otherwise>
						</c:choose>
						<span class="title"  onclick="location.href='boardDetail.do?no=${list.no}&category=${list.category }&currentpage=1'">[${list.category}]${list.title }
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
							<li class="glyphicon glyphicon-thumbs-up">&nbsp;${list.good}</li>
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
					<li class="paging" onclick="location.href='life.do?category=${title}&currentpage=${cpage-1}&pagesize=${pgsize}'"></li>
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
	                	<li class="pgNum" onclick="location.href='life.do?category=${title}&currentpage=${i}&pagesize=${pgsize}'">${i}</li>
	             	</c:otherwise>
	       			</c:choose>
	       		</c:forEach>
	       		<c:choose>
		       	<c:when test="${cpage < pagecount}">
		          	<li onclick="location.href='life.do?category=${title}&currentpage=${cpage+1}&pagesize=${pgsize}'">></li>
		       	</c:when>
	        	<c:otherwise>
	        	</c:otherwise>
	       		</c:choose>					        
	        </ul>
        </div>
    </div>
</div> --%>