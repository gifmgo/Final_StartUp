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
<link rel="stylesheet" type="text/css" href="firstM/index_0322_03.css">
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
<style>

.carousel-control.right, .carousel-control.left {
    background-image: none;
    color: #2c3e50;
}

/* 겉에 o  */
.carousel-indicators li {
    border-color: #7f8c8d;
}

/* 채워지는 색 */
.carousel-indicators li.active {
    background-color: #2c3e50;
}

.item h4 {
    font-size: 19px;
    line-height: 1.375em;
    font-weight: 400;
    font-style: normal;
    margin: 70px 0;
}

.item span {
    font-style: normal;
}
</style>
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
       <div></div>
    </section>
    <br/><br/>
<div class="container text-center">
	<div class="row">
		<div class="col-sm-12">
			<div class="jumbotron customJumboTron">
				<label>어서오세요 생활정치입니다. 대문 작업중입니다.
				</label>
				<div class="row">
					<div class="col-sm-offset-4 col-sm-4">
						<input type="text" class="form-control">
					</div>
				</div>
			</div>
		</div>
	</div>
</div> 
<!-- 메인 컨텐츠 상단 부분 -->    

<div class="container text-center">
	<div class="row">
		<div class="col-sm-12 boradListDiv">
		    <div class="row">
				<div class="col-sm-4">
		          	<div class="well indexWell">
				        <span class="pull-left"><a href="#">베스트 게시글</a></span>
				        <span class="pull-right"><span class="glyphicon glyphicon-plus"></span>더보기</span>
				        <div style="padding: 3px;"></div>
				        <hr class="customHr"/>
				        <ul class="boardUl">
				        	<li>[토론]사드</li>
				        	<li>[생활]좋아요 너가..</li>
				        	<li>[포인트]문재인 포인트..</li>
				        	<li>[생활]이거보면 배꼽...</li>
				        	<li>[포인트]문재인 포인트..</li>
				        </ul>
				      </div>
		          </div>
		          <div class="col-sm-4">
		          	  <div class="well indexWell">
				        <span class="pull-left"><a href="#">대선 후보</a></span>
				        <span class="pull-right"><span class="glyphicon glyphicon-plus"></span>더보기</span>
				        <div style="padding: 3px;"></div>
				        <hr class="customHr"/>
				          <ul class="boardUl">
				          	<li>[대선]대선후보</li>
				          	<li>[대선]대선후보</li>
				          	<li>[대선]대선후보</li>
				          	<li>[대선]대선후보</li>
				          	<li>[대선]대선후보</li>
				          </ul>     
				      </div>
			      </div>
			      <div class="col-sm-4">
		          	  <div class="well indexWell">
				         <span class="pull-left"><a href="#">생활 포인트</a></span>
				         <span class="pull-right"><span class="glyphicon glyphicon-plus"></span>더보기</span>
				         <div style="padding: 3px;"></div> 
				          <hr class="customHr"/> 
				          <ul class="boardUl">
				          	<li>[대선]대선후보</li>
				          	<li>[대선]대선후보</li>
				          	<li>[대선]대선후보</li>
				          	<li>[대선]대선후보</li>
				          	<li>[대선]대선후보</li>
				          </ul>     
				      </div>
			      </div>
			      
			      
			      <div class="col-sm-4">
		          	<div class="well indexWell">
				         <span class="pull-left"><a href="#">토론 하기</a></span>
				         <span class="pull-right"><span class="glyphicon glyphicon-plus"></span>더보기</span>
				         <div style="padding: 3px;"></div>
				        <hr class="customHr"/>
				        <ul class="boardUl">
				        	<li>[토론]사드</li>
				        	<li>[토론]우리나라 정부는..</li>
				        	<li>[토론]동남아로...</li>
				        	<li>[토론]중국은진짜...</li>
				        	<li>[토론]우리나라 정부는..</li>
				        </ul>
				      </div>
		          </div>
		          <div class="col-sm-4">
		          	  <div class="well indexWell">
				         <span class="pull-left"><a href="#">생활 이야기</a></span>
				         <span class="pull-right"><span class="glyphicon glyphicon-plus"></span>더보기</span>
				         <div style="padding: 3px;"></div>
				          <hr class="customHr"/>  
				          <ul class="boardUl">
				          	<li>[대선]대선후보</li>
				          	<li>[대선]대선후보</li>
				          	<li>[대선]대선후보</li>
				          	<li>[대선]대선후보</li>
				          	<li>[대선]대선후보</li>
				          </ul>     
				      </div>
			      </div>
			      <div class="col-sm-4">
		          	  <div class="well indexWell">
				         <span class="pull-left"><a href="#">정치 이야기</a></span>
				         <span class="pull-right"><span class="glyphicon glyphicon-plus"></span>더보기</span>
				         <div style="padding: 3px;"></div>
				         <hr class="customHr"/>
				          <ul class="boardUl">
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
 	</div>
</div>

<br/><br/>
<div class="container text-center">
	<div class="row">
		<div class="col-sm-12">
		    <div class="panel panel-success">
		  		<div class="panel-heading">랭킹 순위 + 블로거</div>
			  		<div class="panel-body">
			      		<div class="row">
							<div class="col-sm-3">
								<div class="alert alert-info fade in">
							        <p><strong>베스트 포인터</strong></p>
							        <div class="well indexWell2">
							          <p><a href="#"><span style="font-family:sans-serif;">1.자이하</span></a></p>
								      <p><a href="#">2.서짱</a></p>
								      <p><a href="#">3.성준</a></p>
								      <p><a href="#">4.재현</a></p>
								      <p><a href="#">5.기성</a></p>
							        </div>
							    </div>
					        </div>
					        <div class="col-sm-3">
								<div class="alert alert-info fade in">
							        <p><strong>베스트 국회의원</strong></p>
							        <div class="well indexWell2">
							          <p><a href="#">1.김경진</a></p>
								      <p><a href="#">2.안철수</a></p>
								      <p><a href="#">3.Luffy</a></p>
								      <p><a href="#">4.SangDi</a></p>
								      <p><a href="#">5.Luffy</a></p>
							        </div>
							    </div>
					        </div>
					        <div class="col-sm-3">
						      <div class="alert alert-info fade in">
							      <p><strong>기재중인 블로거</strong></p>
							      <div class="well indexWell2">
								      <p><a href="#">1.Dean</a></p>
								      <p><a href="#">2.성준</a></p>
								      <p><a href="#">3.Luffy</a></p>
								      <p><a href="#">4.SangDi</a></p>
								      <p><a href="#">5.Luffy</a></p>
							      </div>
						      </div>
					      	</div>
					      	<div class="col-sm-3">
					      		<div class="alert alert-info fade in">
							        <p><strong>접속자 보기</strong></p>
							        <div class="well indexWell2">
							        	<p style="margin-top:20%; margin-bottom:20%;"><span>오늘 접속자 : 39 명</span></p>
							        	<p><span>누적 접속자 : 2030 명</span></p>
							        </div>
							    </div>
					      	</div>
			      		</div>
		      		</div>
			  </div>
		</div> 
	</div>
</div>
<br/><br/>
<div class="container text-center">    
  <div class="row">
    <div class="col-sm-12">
      <div class="row">
        <div class="col-sm-9">
            <div class="panel panel-success">
		      <div class="panel-heading">모아보자 생활정치</div>
		      <div class="panel-body">	
	      		<div class="row">
	      			<div class="col-sm-4">
	      				<div class="well indexWell">
			          	 	<i class="fa fa-bar-chart-o" style="font-size:80px"></i><br/><br/>
			          	 	<p>20대 대통령은 누구?</p>
			          	 	<label class="btn btn-default">대선 후보 보기</label>
			          	 </div>				
	      			</div>
	      			<div class="col-sm-4">
	      				<div class="well indexWell">
		          	    	<i class="material-icons" style="font-size:80px">record_voice_over</i><br/><br/>
		          	 	    <p>나의 생각을 말해봐</p>
		          	 	    <label class="btn btn-default">토론 하기</label>
		          	    </div>
	      			</div>
	      			<div class="col-sm-4">
	      				<div class="well indexWell">
			          	 	<i class="fa fa-dollar" style="font-size:80px"></i><br/><br/>
			          	 	<p>주식과 비슷하지만 모든것이 공짜</p>
			          	 	<label class="btn btn-default">생활 포인트</label>
			          	 </div>	
	      			</div>
	      			<div class="col-sm-4">
	      				<div class="well indexWell">
			          	 	<i class="fa fa-institution" style="font-size:80px"></i><br/><br/>
			          	 	<p>국회 의원 및 법안을 한눈에</p>
			          	 	<label class="btn btn-default">국회</label>
			          	 </div>			
	      			</div>
	      			
	      			
	      			<div class="col-sm-4">
	      				<div class="well indexWell">
			          	 	<i class="fa fa-smile-o" style="font-size:80px"></i><br/><br/>
			          	 	<p>#일상#소통#웃긴영상</p>
			          	 	<label class="btn btn-default">국회</label>
			          	 </div>			
	      			</div>
	      			
	      			<div class="col-sm-4">
	      				<div class="well indexWell">
			          	 	<i class="fa fa-book" style="font-size:80px"></i><br/><br/>
			          	 	<p>정치에 관심이 많아요!!</p>
			          	 	<label class="btn btn-default">국회</label>
			          	 </div>			
	      			</div>
	      			
	      		</div>
		      </div>
		    </div>
        </div>
    	
    	<div class="col-sm-3">
    		<div class="form-group" style="height: 50%;">
    			  <div class="alert alert-success fade in">
			        <a href="#" class="close" data-dismiss="alert" aria-label="close">×</a>
			        <p><strong>처음오셨어요?</strong></p>
			      </div>
    			<div class="well sideWell">
			        <label>추천 컨텐츠!</label>
			        <hr/>
			        <ul>
			        	<li class="recoment"><span class="label label-default">대선후보</span></li>
			        	<li class="recoment"><span class="label label-primary">생활포인트</span></li>
			        	<li class="recoment"><span class="label label-success">토론하기</span></li>
			        	<li class="recoment"><span class="label label-warning">블로거보기</span></li>
			        </ul> 
	    		</div>
    		</div>
    		<div class="form-group">
    			<div class="well sideWell">
			        <label>인기 메뉴</label>
			        <hr/>
			        <p id="favoritP">
			          <span class="label label-default">대선후보</span>
			          <span class="label label-primary">생활포인트</span>
			          <span class="label label-success">토론하기</span>
			          <span class="label label-info">웃긴영상</span>
			          <span class="label label-warning">게임영상</span>
			          <span class="label label-danger">고민있어요</span>
			        </p>
	    		</div>
    		</div>
    	</div>
       </div>
    </div>
  </div>
</div>


<!-- Container (Contact Section) -->
<div class="container">
  <h3 class="text-center">문의하기</h3>
  <div class="jumbotron concatJumbo">	
	  <div class="row">
	    <div class="col-md-4">
	      <p><span class="glyphicon glyphicon-map-marker"></span>Gss : 판교</p>
	      <p><span class="glyphicon glyphicon-phone"></span>Phone : 010-9590-3710</p>
	      <p><span class="glyphicon glyphicon-envelope"></span>Email : stpark89@gmail.com</p>
	    </div>
	    <div class="col-md-8">
	      <div class="row">
	        <div class="col-sm-6 form-group">
	          <input class="form-control" id="name" name="name" placeholder="Name" type="text" required>
	        </div>
	        <div class="col-sm-6 form-group">
	          <input class="form-control" id="email" name="email" placeholder="Email" type="email" required>
	        </div>
	      </div>
	      <textarea class="form-control" id="comments" name="comments" placeholder="Comment" rows="5"></textarea>
	      <br>
	      <div class="row">
	        <div class="col-md-12 form-group">
	          <button class="btn btn-default pull-right" type="submit">문의하기</button>
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