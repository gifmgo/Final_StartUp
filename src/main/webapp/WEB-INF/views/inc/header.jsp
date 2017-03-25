<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

	<div class="container-fluid" id="main-header">
	  	<div class="center-block" style="width:80px;">
	  		<a href="index.do">
		  		<img class="img-responsive" src="img/logo.png" id="logo" style="width:100%;">
		  	</a>
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
	<div id="header-padding"></div>
