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
<script src="firstM/index_final_modify_20170120.js"></script>
<title>생활정치</title>
<style>
	.fb-login-button{
		position:relative;
		margin-top:10px;
		left:40%;
		width:124px;
		height:60px;
	}
</style>
</head>
<body>
<script>
 

/* function startFace(){
	FB.getLoginStatus(function(response) { 
    	statusChangeCallback(response); });
}
 */
// 이 함수는 누군가가 로그인 버튼에 대한 처리가 끝났을 때 호출된다. 
// onlogin 핸들러를 아래와 같이 첨부하면 된다. 
/* function checkLoginState(){
	alert("checkLoginState 호출 ?!!");
	FB.getLoginStatus(function(response) { 
		statusChangeCallback(response); }); 
	} 
 */	
//로그인이 성공한 다음에는 간단한 그래프API를 호출한다. 
// 이 호출은 statusChangeCallback()에서 이루어진다. 
/* function testAPI() { 
	alert("성공하고 난다음 !! ");
	console.log('Welcome! Fetching your information.... '); 
	FB.api('/me', function(response) { 
		console.log('Successful login for: ' + response.id);
		document.getElementById('status').innerHTML = 'Thanks for logging in, ' + response.name + '!'; }); 
}	 
 /* 	  $.ajax({
	 url : "faceBook.do",
	 data : {
		 img : 'http://graph.facebook.com/' + user.id + '/picture',
		 name : user.name,
		 id : user.id
	 },
	 success : function(data){
		 
		 if(data.result == 1){
		alert("로그인 성공했을떄");
			swal(data.msg);
			document.location.reload();
		 }else{
			 alert("로그인 실패했을떄");
			 swal(data.msg);
		 }
	 }
}); */
 
var result = "0"; 
window.fbAsyncInit = function() { 
	FB.init({ 
		appId : '1329013773826112', 
        status : true,          // 로그인 상태를 확인
		cookie : true, 
		// 쿠키가 세션을 참조할 수 있도록 허용 
		xfbml : true, 
		// 소셜 플러그인이 있으면 처리 
		version : 'v2.8' // 버전 2.1 사용 
	});		
		// 자바스크립트 SDK를 초기화 했으니, FB.getLoginStatus()를 호출한다. 
	    //.이 함수는 이 페이지의 사용자가 현재 로그인 되어있는 상태 3가지 중 하나를 콜백에 리턴한다. 
	    // 그 3가지 상태는 아래와 같다. 
	    // 1. 앱과 페이스북에 로그인 되어있다. ('connected') 
	    // 2. 페이스북에 로그인되어있으나, 앱에는 로그인이 되어있지 않다. ('not_authorized') 
	    // 3. 페이스북에 로그인이 되어있지 않아서 앱에 로그인이 되었는지 불확실하다. // 
	    // 위에서 구현한 콜백 함수는 이 3가지를 다루도록 되어있다. 
 	  
	    //로그인 상태 	체크 하는 부분
	    FB.getLoginStatus(function(response) {
          //로그인 했다면 ....
 		  if (response.status === 'connected') {
        	  result = "1";
        	  console.log("window.쪽 if 내부 탐 : "+result);
        	  FB.api('/me', function(user) {
        		 
        		  user.name 
        	  });
        	  //checkLoginState(result);
          } else if (response.status === 'not_authorized') {

          } else {
        	  
        	  result = "0";
        	  console.log("window.쪽 else  탐 : "+result);
        	  //checkLoginState(result);
          }
      });

       FB.Event.subscribe('auth.login', function(response) {
    	   
			alert("로그인 호출 !");
    	   
    	   if(result == "0"){
    		   alert("로그인 호출 후 ");
    		   FB.api('/me', function(user) {
	    	   $.ajax({
	    			 url : "faceBook.do",
	    			 data : {
	    				 img : 'http://graph.facebook.com/' + user.id + '/picture',
	    				 name : user.name,
	    				 id : user.id
	    			 },
	    			 success : function(data){
	    				 alert("success 호출합니다");
	    				 if(data.result == 1){
	    				alert("로그인 성공했을떄");
	    					swal(data.msg);
	    					document.location.reload();
	    				 }else{
	    					 alert("로그인 실패했을떄");
	    					 swal(data.msg);
	    				 }
	    			 }
	    	   	  });
    		   });
    	   }else{
    		   swal("현재 로그인한 상태입니다!");
    	   }
    	  document.location.reload();
      }); 
      
      FB.Event.subscribe('auth.logout', function(response) {
    	  result = "0";
    	  alert("로그아웃 이벤트 발생");
    	  document.location.reload();
      });
      
	}; // SDK를 비동기적으로 호출 
	
/* 
(function(d, s, id) { 
	var js, fjs = d.getElementsByTagName(s)[0]; 
	if (d.getElementById(id)) return; 
	js = d.createElement(s); 
	js.id = id; 
	js.src = "//connect.facebook.net/ko_KR/all.js#xfbml=1&appId=1329013773826112"; 
	fjs.parentNode.insertBefore(js, fjs); 
	}(document, 'script', 'facebook-jssdk')); 
	 */
(function(d){
    var js, id = 'facebook-jssdk', 
    ref = d.getElementsByTagName('script')[0];
    if (d.getElementById(id)) {return;}
    js = d.createElement('script'); 
    js.id = id; 
    js.async = true;
    js.src = "//connect.facebook.net/ko_KR/all.js#xfbml=1";
    ref.parentNode.insertBefore(js, ref);
  }(document));
	 
</script>

	
	
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
            <li><a href="Member_Parliament.do" class="fdMenu">의원</a></li>
            <li><a href="CommunityIndex.do">커뮤니티</a>
            	<ul id="b_menu">
                	<li><a href="board.do?category=오늘의 이슈">오늘의 이슈</a></li>
                	<li><a href="board.do?category=자유게시판">자유게시판</a></li>
                    <li><a href="board.do?category=정치게시판">정치게시판</a></li>
                    <li><a href="board.do?category=이미지 갤러리">이미지 갤러리</a></li>
                    <li><a href="board.do?category=토론방">토론방</a></li>
                	<li><a href="board.do?category=연예게시판">연예게시판</a></li>
                    <li><a href="board.do?category=사회게시판">사회게시판</a></li>
                    <li><a href="board.do?category=공지사항/QnA">공지사항/QnA</a></li>
                </ul>
          </li>
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
                <li>
                    <img src="img/category00.png" alt="의안" width="40%" />
                    <h2 class="hTitle">의안</h2>
                    <button class="btn" id="statuteBtn"><i class="fa fa-chevron-circle-right" aria-hidden="true"></i> 자세히보기</button>
                </li>
                <li>
                    <img src="img/category01.png" alt="의원" width="40%" />
                    <h2 class="hTitle">의원</h2>
                    <button class="btn" id="ParliamentBtn"><i class="fa fa-chevron-circle-right" aria-hidden="true"></i> 자세히보기</button>
                </li>
                <li>
                    <img src="img/category02.png" alt="의안" width="40%" />
                    <h2 class="hTitle">커뮤니티</h2>
                    <button class="btn" id="boardIndexBtn"><i class="fa fa-chevron-circle-right" aria-hidden="true"></i> 자세히보기</button>
                </li>
                <li>
                    <img src="img/category03.png" alt="의안" width="40%" />
                    <h2 class="hTitle">공지사항/<br/>Q&A</h2>
                    <button class="btn" id="noticeIndexBtn"><i class="fa fa-chevron-circle-right" aria-hidden="true"></i> 자세히보기</button>
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
	    </ul>
    </aside>
</body>
</html>