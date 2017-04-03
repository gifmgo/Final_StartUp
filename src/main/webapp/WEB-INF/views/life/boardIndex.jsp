<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<script type="text/javascript" src="life/Board.js"></script> 
<!-- <link rel="stylesheet" type="text/css" href="css/sub04_0124.css"> -->
<link rel="stylesheet" type="text/css" href="life/life0403.css">
<script type="text/javascript" src="life/life.js"></script>

<div class="container" style="margin-top:20px;">
	<div class="row">
		<div class="col-sm-6 col-md-3 boardBox">
			<span class="top">영상</span><a href="lifeBoard.do?category=fun" class="top more"><span class="glyphicon glyphicon-plus"></span>더 보기</a>
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
		<div class="col-sm-6 col-md-3 boardBox">
			<span class="top">고민</span><a href="lifeBoard.do?category=wor" class="top more"><span class="glyphicon glyphicon-plus"></span>더 보기</a>
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
		<div class="col-sm-6 col-md-3 boardBox">
			<span class="top">연예</span><a href="lifeBoard.do?category=star" class="top more"><span class="glyphicon glyphicon-plus"></span>더 보기</a>
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
		<div class="col-sm-6 col-md-3 boardBox">
			<span class="top">영상</span><a href="lifeBoard.do?category=life" class="top more"><span class="glyphicon glyphicon-plus"></span>더 보기</a>
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
	</div>	
</div>	
<div class="container" style="margin-top: 20px; margin-bottom:20px">

	<input type="hidden" id="category" value="${title }">
	<input type="hidden" id="cpage" value="${cpage }">
	
	<div class="row">
		<ul class="nav nav-pills" style="font-size:17px; maring-left:10px;">
		    <li><a href="lifeBoard.do?category=alllife">전체</a></li>
		    <li><a href="lifeBoard.do?category=life">일상</a></li>
		    <li><a href="lifeBoard.do?category=star">연예</a></li>
		    <li><a href="lifeBoard.do?category=wor">고민</a></li>
		    <li><a href="lifeBoard.do?category=fun">영상</a></li>
		    <!-- <li><a href="#">기타</a></li> -->
		</ul>
		
		<div class="col-md-12">
			<div class="col-md-offset-1 col-md-10 content">
				<ul>
					<c:forEach var="list" items="${list}">
					<li class="list" onclick="location.href='lifeBoardDetail.do?no=${list.no}&category=${list.category }&currentpage=1'">	
						<img class="img" src="http://placehold.it/80x80">
						<span class="title">[${list.category}]${list.title }
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
		<div class="center-block col-sm-4">
			<ul id="board_page">
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
       	<c:if test="${id != null}">
       		<c:choose>
       		<c:when test='${title == "공지사항" }'>
       			<c:if test='${admin == "superAdmin"}'> <!-- 운영자일때 -->
            		<button onclick="writeContentView()">글쓰기</button>
            	</c:if>
            </c:when>
            <c:otherwise>
            	<button onclick="writeContentView()">글쓰기</button>
            </c:otherwise>		
            </c:choose>
       	</c:if>
    </div>
</div>
