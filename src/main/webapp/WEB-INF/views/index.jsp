<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html xmlns:fb="http://ogp.me/ns/fb#">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="keywords" content="정치,생활,커뮤니티,진보,보수,중립"/>
<meta name="description" content="생활정치,커뮤니티"/>
<link rel="stylesheet" type="text/css" href="firstM/M_header_Final4_0119.css">
<link rel="stylesheet" type="text/css" href="css/icon.css">
<link rel="stylesheet" type="text/css" href="sweet/sweetalert.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="js/jquery-3.1.1.min.js"></script>
<script src="sweet/sweetalert.min.js"></script>
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
	
	<input type="hidden" id="check_Id_value">
	<input type="hidden" id="hidden_nick">
	<aside id="login_bg">
    	
    </aside>
	
	 <div id="loginForm">
    	<div id="login">
	    	<h1>로그인</h1>
	        <input type="email" id="loginIdInput" placeholder="아이디 입력"/>
	        <input type="password" id="loginPwInput" placeholder="비밀번호 입력"/>
	        <button class="long_btn" id="loginBtn">로그인</button>
	        <button class="long_btn" id="addMemberBtn">회원가입</button>
	        <div class="fb-login-button" data-max-rows="1" data-size="xlarge" data-show-faces="false"  data-auto-logout-link="true"></div> 
	        <!-- <fb:login-button scope="public_profile,email" > </fb:login-button> -->
	        <div id="status"></div>
	        <p>아이디 또는 비밀번호 찾기</p>
		</div>
    
     	<div id="register">
            <h1>회원가입</h1>
            <label>이메일 입력</label>
            <input type="email" id="member_Id" placeholder="이메일 입력"/>
            <button class="short_btn" id="id_check_btn" onclick="check_Id();">중복확인</button>
            <label>비밀번호 입력</label>
            <input type="password" id="member_Pw" placeholder="비밀번호 입력"/>
            <input type="password" id="member_Repw" placeholder="한 번 더 입력"/>
            <label>닉네임 입력</label>
            <input type="text" class="nick" id="member_nickName" placeholder="닉네임 입력"/>
            <button class="short_btn" onclick="check_Nick();">중복확인</button>
            <label>생년월일 입력</label>
            <input type="text" placeholder="년도입력 ex)xxxx" id="member_Birth"/>
            <label>성별</label>
            <ul id="gender">
            	<li id="m">남자</li>
                <li id="w">여자</li>
            </ul>
            <label>관심사</label>
            <ul id="interest">
            	<li id="gyung">경제</li>
                <li id="sa">사회</li>
                <li id="love">연예</li>
                <li id="sport">스포츠</li>
            </ul>
            <button class="long_btn">가입하기</button>
        </div>
        
        <div id="find_password">
        	<h1>비밀번호 찾기</h1>
            <input type="email" placeholder="이메일을 입력하세요"/>
            <input type="text" placeholder="이름을 입력하세요"/>		
            <button class="long_btn">비밀번호 찾기</button>
        </div>
    	<span>×</span>
        </div>
        
        

	<nav id="nav">
    	<div><i class="fa fa-bars" aria-hidden="true"></i></div>
  		<img src="img/logo.png" id="logo" style="width: 80px;">
        <ul id="mainMenu">
        	<li><a href="explanation.do">소개</a></li>
            <li><a href="statute.do" class="fdMenu">의안</a></li>
            <li><a href="Member_Parliament.do" class="fdMenu">국회의원</a></li>
            <li><a href="CommunityIndex.do">커뮤니티</a>
            	<ul id="b_menu">
                    <li><a href="board.do?category=공지사항">공지사항</a></li>
                	<li><a href="board.do?category=오늘의 이슈">오늘의 이슈</a></li>
                	<li><a href="board.do?category=자유게시판">자유게시판</a></li>
                    <li><a href="board.do?category=정치게시판">정치게시판</a></li>
                    <li><a href="moreCommunityTalk.do">토론방</a></li>
                </ul>
          	</li>
          	<li><a href="Programmer.do" class="fdMenu">개발자 포럼</a></li>
   		</ul>
        
       	<c:choose>
			<c:when test="${id == null}">					
       			<div id="s_loginDiv"><i class="fa fa-sign-in" aria-hidden="true"></i> 로그인</div>
			</c:when>
		<c:otherwise>
			<div id="s_logOutDiv">
				<i id="s_MyInfoIcon" class="fa fa-user" aria-hidden="true"></i>
				<i id="s_logOutIcon" class="fa fa-sign-out" aria-hidden="true"></i>
			</div>
		</c:otherwise>
		</c:choose>
        
        <aside id="menu_bg"></aside>
        
	</nav>
	
	
	<section id="banner">
    	<div>
            <h2>대한민국 헌법 1조 1항</h2>
            <p>대한민국은 민주공화국이다.</p>
        </div>
        <div>
        	<div id="bott_menu"><i class="fa fa-angle-double-up" aria-hidden="true"></i></div>
            <ul>
                <li id="statuteBtn">
                    <img src="img/category00.png" alt="의안" width="40%" />
                    <h2 class="hTitle">의안</h2>
                    <button class="btn"><i class="fa fa-chevron-circle-right" aria-hidden="true"></i> 자세히보기</button>
                </li>
                <li id="ParliamentBtn">
                    <img src="img/category01.png" alt="의원" width="40%" />
                    <h2 class="hTitle">의원</h2>
                    <button class="btn"><i class="fa fa-chevron-circle-right" aria-hidden="true"></i> 자세히보기</button>
                </li>
                <li id="boardIndexBtn">
                    <img src="img/category02.png" alt="의안" width="40%" />
                    <h2 class="hTitle">커뮤니티</h2>
                    <button class="btn"><i class="fa fa-chevron-circle-right" aria-hidden="true"></i> 자세히보기</button>
                </li>
                <li id="noticeIndexBtn">
                    <img src="img/category03.png" alt="의안" width="40%" />
                    <h2 class="hTitle">개발자<br/>포럼</h2>
                    <button class="btn"><i class="fa fa-chevron-circle-right" aria-hidden="true"></i> 자세히보기</button>
                </li>
            </ul>
        </div>
    </section>
    
  	<footer id="footer">
       <p>(주)GSS&nbsp;|&nbsp;대표이사 : 박성준&nbsp;|&nbsp;주소 : 경기도 용인시 수지구 죽전동&nbsp;|&nbsp;연락처 : 010-9590-3710&nbsp;|&nbsp;이메일 : contact@gss.com<br>
           Copyright by GSS, Ltd. All Rights Reserved.
        </p>
    </footer>
    
	<aside id="side_menu">
		<span>×</span>
		<ul id="m_menu">
	    	<li><a href="explanation.do">소개</a></li>
	        <li><a href="statute.do">의안</a></li>
	        <li><a href="Member_Parliament.do">의원</a></li>
	        <li><a href="CommunityIndex.do">커뮤니티</a></li>
	        <li><a href="Programmer.do">개발자 포럼</a></li>
	    </ul>
    </aside>
</body>
</html>