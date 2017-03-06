<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html xmlns:fb="http://ogp.me/ns/fb#">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="keywords" content="정치,생활,커뮤니티,진보,보수,중립,의원,토론,gss,생활정치,정치커뮤니티,정치토론"/>
<meta name="description" content="정치,생활,커뮤니티,진보,보수,중립,의원,토론,gss,생활정치,정치커뮤니티,정치토론"/>

<link rel="stylesheet" href="css/core2.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<link rel="stylesheet" type="text/css" href="sweet/sweetalert.css">
<script src="sweet/sweetalert.min.js"></script>

<link rel="stylesheet" type="text/css" href="css/header.css">
<link rel="stylesheet" type="text/css" href="firstM/index.css">
<link rel="stylesheet" type="text/css" href="css/footer.css">

<link rel="stylesheet" type="text/css" href="css/icon.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="firstM/index_final_modify_20170213.js"></script>
<script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<script>
  (adsbygoogle = window.adsbygoogle || []).push({
    google_ad_client: "ca-pub-6344194409071079",
    enable_page_level_ads: true
  });
</script>
<title>생활정치</title>
</head>
<body>
	<section id="banner" class="main-content">
	    <div class="container-fluid" id="main-header">
	    	<div class="center-block" style="width:80px;">
			  	<img class="img-responsive" src="img/logo.png" id="logo" style="width:80px;">
	    	</div>
		  	<ul>
		  	<c:choose>
			<c:when test="${id == null}">
	   			<li id="s_loginDiv"><a href="LoginP.do"><span class="glyphicon glyphicon-log-in"></span> 로그인</a></li>
			</c:when>
			<c:otherwise>
				<li id="s_MyInfoIcon"><a href="infoView.do"><span class="glyphicon glyphicon-user"></span> 내 정보 수정</a></li>
	        	<li id="s_logOutIcon"><a href="LogOut.do"><span class="glyphicon glyphicon-log-out"></span> 로그아웃</a></li>
			</c:otherwise>
			</c:choose>
	     	</ul>
		</div>
		<nav class="navbar navbar-inverse" id="header-navBar">
		  <div class="container-fluid">
		    <div class="navbar-header">
		      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#header-navi">
		        <span class="glyphicon glyphicon-menu-down"></span>                      
		      </button>
		    </div>
		    <div class="collapse navbar-collapse" id="header-navi">
		      <ul class="nav navbar-nav" id="header-menu">
		      	<li><a href="explanation.do">소개</a></li>
	            <li><a href="statute.do">의안</a></li>
	            <li><a href="Member_Parliament.do">국회의원</a></li>
		        <li><a href="PresidentMember.do">대선후보</a></li>
	          	<li><a href="point.do">생활 포인트</a></li>
	          	<li id="community"><a href="CommunityIndex.do">커뮤니티</a>
		        </li>
		        <li class="dropdown" id="sub-navi">
		          	<a class="dropdown-toggle" data-toggle="dropdown" href="#"><span class="glyphicon glyphicon-chevron-down"></span></a>
		          	<ul class="dropdown-menu">
		            	<li><a href="board.do?category=qa">공지사항</a></li>
			           	<li><a href="board.do?category=issue">오늘의 이슈</a></li>
			           	<li><a href="board.do?category=free">자유게시판</a></li>
			            <li><a href="board.do?category=politics">정치게시판</a></li>
			            <li><a href="moreCommunityTalk.do">토론방</a></li>
			        </ul>
		        </li>
		      </ul>
		      <ul class="nav navbar-nav navbar-right" id="mobile-login">
			  <c:choose>
		  	  <c:when test="${id == null}">
	  			<li id="s_loginDiv"><a href="LoginP.do"><span class="glyphicon glyphicon-log-in"></span> 로그인</a></li>
			  </c:when>
			  <c:otherwise>
				<li id="s_MyInfoIcon"><a href="infoView.do"><span class="glyphicon glyphicon-user"></span> 내 정보 수정</a></li>
	       		<li id="s_logOutIcon"><a href="LogOut.do"><span class="glyphicon glyphicon-log-out"></span> 로그아웃</a></li>
			  </c:otherwise>
			  </c:choose>
	     	  </ul>
		    </div>
		  </div>
		</nav>
	
   		<div id ="posts">
           <h2>대한민국 헌법 1조 1항</h2>
           <p>대한민국은 민주공화국이다.</p>
       </div>
       <div>
       </div>
    </section>
    
  	<footer id="footer">
       <p>(주)GSS&nbsp;|&nbsp;대표이사 : 박성준&nbsp;|&nbsp;주소 : 경기도 용인시 수지구 죽전동&nbsp;|&nbsp;연락처 : 010-9590-3710&nbsp;|&nbsp;이메일 : stpark89@gmail.com<br>
           Copyright by GSS, Ltd. All Rights Reserved.
        </p>
    </footer>
</body>
</html>