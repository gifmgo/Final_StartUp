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
<link rel="stylesheet" type="text/css" href="firstM/index_0321_02.css">
<link rel="stylesheet" type="text/css" href="css/footer.css">

<link rel="stylesheet" type="text/css" href="css/icon.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">

<script src="firstM/index_final_modify_0321.js"></script>
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
	<section class="main-content">
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
	
   		<!-- <div id ="posts">
           <h2>대한민국 헌법 1조 1항</h2>
           <p>대한민국은 민주공화국이다.</p>
       </div> -->
       <div></div>
    </section>
    <br/><br/>
    
<div class="container text-center">    
  <div class="row">
    <div class="col-sm-12">
      <div class="row">
      	<div class="col-sm-1"></div>
        <div class="col-sm-9">
          <div class="row">
          	  <div class="col-sm-6">
	          	 <div class="well indexWell">
	          	 	<i class="fa fa-bar-chart-o" style="font-size:50px"></i><br/><br/>
	          	 	<span>20대 대통령은 누구?</span>
	          	 	<br/>
	          	 	<hr/>
	          	 	<label class="btn btn-info">대선 후보 보기</label>
	          	 </div>				
	          </div>
	          <div class="col-sm-6">
	          	 <div class="well indexWell">
	          	 	<i class="material-icons" style="font-size:50px">record_voice_over</i><br/><br/>
	          	 	<span>나의 생각을 말해봐</span>
	          	 	<br/><hr/>
	          	 	<label class="btn btn-info">토론 하기</label>
	          	 </div>				
	          </div>
          </div>
          <div class="row">
          	  <div class="col-sm-6">
	          	 <div class="well indexWell">
	          	 	<i class="fa fa-dollar" style="font-size:50px"></i><br/><br/>
	          	 	<span>주식? 기능은 비슷하지만 모든것이 공짜</span>
	          	 	<br/><hr/>
	          	 	<label class="btn btn-info">생활 포인트</label>
	          	 </div>				
	          </div>
	          <div class="col-sm-6">
	          	 <div class="well indexWell">
	          	 	<i class="fa fa-institution" style="font-size:50px"></i><br/><br/>
	          	 	<span>국회 의원 및 법안을 한눈에</span>
	          	 	<br/><hr/>
	          	 	<label class="btn btn-info">국회</label>
	          	 </div>				
	          </div>
          </div>
          <div class="row">
          	  <div class="col-sm-6">
	          	 <div class="well indexWell">
	          	 	
	          	 	<label>메뉴</label>
	          	 </div>				
	          </div>
	          <div class="col-sm-6">
	          	 <div class="well">
	          	 	<label>메뉴</label>
	          	 </div>				
	          </div>
          </div>
          <div class="row">
          	  <div class="col-sm-6">
	          	 <div class="well">
	          	 	<label>메뉴</label>
	          	 </div>				
	          </div>
	          <div class="col-sm-6">
	          	 <div class="well">
	          	 	<label>메뉴</label>
	          	 </div>				
	          </div>
          </div>
          
           <div class="row">
	          <div class="col-sm-6">
	          	<div class="well">
			        <p><a href="#">베스트 게시글</a></p>
			        <ul>
			        	<li>[토론]사드</li>
			        	<li>[생활]좋아요 너가..</li>
			        	<li>[포인트]문재인 포인트..</li>
			        	<li>[생활]이거보면 배꼽...</li>
			        </ul>
			      </div>
	          </div>
	          <div class="col-sm-6">
	          	  <div class="well">
			        <p><a href="#">New 게시글</a></p>
			          <ul>
			          	<li>[대선]대선후보</li>
			          	<li>[대선]대선후보</li>
			          	<li>[대선]대선후보</li>
			          	<li>[대선]대선후보</li>
			          	<li>[대선]대선후보</li>
			          </ul>     
			      </div>
		      </div>
          </div>
          
        </div>
    	
    	
    	  <div class="col-sm-2 well" style="background-color: #fff;">
		      <div class="well">
		        <p><a href="#">어서오세요</a></p>
		        <label>추천 컨텐츠!</label>
		        <ul>
		        	<li><span class="label label-primary">대선후보</span></li>
		        	<li><span class="label label-primary">생활포인트</span></li>
		        	<li><span class="label label-primary">토론하기</span></li>
		        	<li><span class="label label-primary">블로거보기</span></li>
		        </ul>
		      </div>
		      <div class="well">
		        <p><a href="#">인기메뉴</a></p>
		        <p>
		          <span class="label label-default">대선후보</span>
		          <span class="label label-primary">생활포인트</span>
		          <span class="label label-success">토론하기</span>
		          <span class="label label-info">국회</span>
		          <span class="label label-warning">생활이야기</span>
		          <span class="label label-danger">일상</span>
		        </p>
		      </div>
		      <div class="alert alert-success fade in">
		        <p><strong>베스트 유저</strong></p>
		        <div class="well" style="background-color: #fff;">
		        	<label>1.자이하</label><br/>
		        	<label>2.서짱</label><br/>
		        	<label>3.성준</label><br/>
		        	<label>4.재현</label><br/>
		        	<label>5.기성</label><br/>
		        </div>
		      </div>
		      <div class="alert alert-info fade in">
			      <div class="well" style="background-color: #fff;">
			      	  <p><strong>블로거</strong></p>
			      	  <hr/>
				      <p><a href="#">1.Dean</a></p>
				      <p><a href="#">2.성준</a></p>
				      <p><a href="#">3.Luffy</a></p>
			      </div>
		      </div>
		</div>
    	
      </div>
    </div>
  </div>
</div>
    
    
    
    <footer id="footer">
       <p>(주)GSS&nbsp;|&nbsp;대표이사 : 박성준&nbsp;|&nbsp;주소 : 경기도 용인시 수지구 죽전동&nbsp;|&nbsp;연락처 : 010-9590-3710&nbsp;|&nbsp;이메일 : stpark89@gmail.com<br>
           Copyright by GSS, Ltd. All Rights Reserved.
        </p>
    </footer>
</body>
</html>