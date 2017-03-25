<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
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
<link rel="stylesheet" type="text/css" href="firstM/index_0324.css">
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
<div class="container">
	<div class="row">
		<div class="col-sm-12">
			<div class="jumbotron customJumboTron">
				
				<div class="left_jumbotron">
					<div class="center_block">
			  			<img class="img-responsive" src="img/logo2.png" id="logo" style="height:200px;">
	    			</div>
	    			<div class="title_text">
		    			<h3 style="margin-bottom:30px;font-weight:bold;">어서오세요 생활정치입니다.</h3>
						<p><i class="fa fa-check" style="font-size:20px"></i> 정치 관련 이야기는  <span class="btn btn-info ">정치 이야기</span></p>
						<p><i class="fa fa-check" style="font-size:20px"></i> 일상, 웃긴 이야기는   <span class="btn btn-info ">생활 이야기</span></p>
	    			</div>
					
				</div>
				<div class="right_jumbotron text-center">
					<div class="well indexWell2 indexwell_top">
					 	<p style="font-weight:bold;font-size:25px;"><i class="fa fa-thumbs-o-up" style="font-size:30px"></i> <label style="vertical-align:middle;">접속자 현황</label></p>
					 	<hr class="customHr_two"/>
			          	<p style="font-size:20px !important;">오늘 접속자 : <span style="color:#f44336;">${todayUser_dto.todayTotalUser}</span> 명</p>
			          	<p style="font-size:20px !important;">누적 접속 : <span style="color:#4CAF50;">${todayUser_dto.totalUser}</span> 명</p>
			        </div>
				</div>
			</div>
		</div>
	</div>
</div> 
<!-- 메인 컨텐츠 상단 부분 -->    

<div class="container">
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
				        <span class="pull-left"><strong><a class="titleAtag">대선 후보</a></strong></span>
				        <span class="pull-right"><a href="PresidentTalk.do" class="jstlAtag"><span class="glyphicon glyphicon-plus"></span>더보기</a></span>
				        <div style="padding: 3px;"></div>
				        <hr class="customHr"/>
				          <ul class="boardUl">
				          	<c:choose>
				          		<c:when test="${president_list != null}">
				          			<c:forEach var="president_list" items="${president_list}">
				          				<li>
				          					<span><a href="PresidentTalk.do" class="jstlAtag" style="text-decoration: none; color: black;">${president_list.title}</a></span>
				          					<span class="pull-right">${president_list.writeDate}</span>
				          				</li>
				          			</c:forEach>
				          		</c:when>
				          		<c:otherwise>
				          			<li>글이 없습니다 !<li>
				          			<li><a href="#">글쓰러 가기</a></li>
				          		</c:otherwise>
				          	</c:choose>
				          </ul>     
				      </div>
			      </div>
			      <div class="col-sm-4">
		          	  <div class="well indexWell">
				         <span class="pull-left"><strong><a class="titleAtag">토론 하기</a></strong></span>
				         <span class="pull-right"><a href="moreCommunityTalk.do" class="jstlAtag"><span class="glyphicon glyphicon-plus"></span>더보기</a></span>
				         <div style="padding: 3px;"></div> 
				          <hr class="customHr"/> 
				          <ul class="boardUl">
				          	<c:choose>
				          		<c:when test="${debate_list != null}">
				          			<c:forEach var="debate_list" items="${debate_list}">
				          				<li>
				          					<span>
				          						<a href="moreCommunityTalk.do" class="jstlAtag">
				          						[${debate_list.choose}] 
				          						${fn:substring(debate_list.title,0,10)}
				          						</a>
				          					</span>
				          					<span class="pull-right">${debate_list.writeDate}</span>
				          				</li>
				          			</c:forEach>
				          		</c:when>
				          		<c:otherwise>
				          			<li class="text-center">글이 없습니다 !<li>
				          			<br/>
				          			<li class="text-center"><a href="moreCommunityTalk.do" class="btn btn-default">글쓰러 가기</a></li>
				          		</c:otherwise>
				          	</c:choose>
				          </ul>     
				      </div>
			      </div>
			      
			      
			      <div class="col-sm-4">
		          	<div class="well indexWell">
				         <span class="pull-left"><strong><a class="titleAtag">오늘의 이슈</a></strong></span>
				         <span class="pull-right"><a href="board.do?category=issue" class="jstlAtag"><span class="glyphicon glyphicon-plus"></span>더보기</a></span>
				         <div style="padding: 3px;"></div>
				        <hr class="customHr"/>
				        <ul class="boardUl">
				        	<c:choose>
				        		<c:when test="${todayIssue_list != null}">
				        			<c:forEach var="todayIssue_list" items="${todayIssue_list}">
				        			<li>
				        				<span>
				        					<a href="boardDetail.do?no=${todayIssue_list.no}&currentpage=1" class="jstlAtag">
				        					${fn:substring(todayIssue_list.title,0,10)} 
				        					</a>
				        				</span>
				          				<span class="pull-right">${todayIssue_list.regdate}</span>
				          			</li>
				          			</c:forEach>
				        		</c:when>
				        		<c:otherwise>
				        			<li class="text-center">글이 없습니다 !<li>
				        			<br/>
				          			<li class="text-center"><a href="#" class="btn btn-default">글쓰러 가기</a></li>
				        		</c:otherwise>
				        	</c:choose>
				        </ul>
				      </div>
		          </div>
		          
		          <div class="col-sm-4">
		          	<div class="well indexWell">
				         <span class="pull-left"><strong><a class="titleAtag">정치 게시판</a></strong></span>
				         <span class="pull-right"><a href="board.do?category=politics" class="jstlAtag"><span class="glyphicon glyphicon-plus"></span>더보기</a></span>
				         <div style="padding: 3px;"></div>
				        <hr class="customHr"/>
				        <ul class="boardUl">
				        	<c:choose>
				        		<c:when test="${jungChi_list != null}">
				        			<c:forEach var="jungChi_list" items="${jungChi_list}">
				        			<li>
				        				<span>
				        					<a href="boardDetail.do?no=${jungChi_list.no}&currentpage=1" class="jstlAtag">
				        					${fn:substring(jungChi_list.title,0,10)} 
				        					</a>
				        				</span>
				          				<span class="pull-right">${jungChi_list.regdate}</span>
				          			</li>
				          			</c:forEach>
				        		</c:when>
				        		<c:otherwise>
				        			<li class="text-center">글이 없습니다 !<li>
				        			<br/>
				          			<li class="text-center"><a href="#" class="btn btn-default">글쓰러 가기</a></li>
				        		</c:otherwise>
				        	</c:choose>
				        </ul>
				      </div>
		          </div>
		          
		          <div class="col-sm-4">
		          	<div class="well indexWell">
				         <span class="pull-left"><strong><a class="titleAtag">공지사항</a></strong></span>
				         <span class="pull-right"><a href="board.do?category=qa" class="jstlAtag"><span class="glyphicon glyphicon-plus"></span>더보기</a></span>
				         <div style="padding: 3px;"></div>
				        <hr class="customHr"/>
				        <ul class="boardUl">
				        	<c:choose>
				        		<c:when test="${notice_list != null}">
				        			<c:forEach var="notice_list" items="${notice_list}">
				        			<li>
				        				<span>
				        					<a href="boardDetail.do?no=${notice_list.no}&currentpage=1" class="jstlAtag">
				        					${fn:substring(notice_list.title,0,10)} 
				        					</a>
				        				</span>
				          				<span class="pull-right">${notice_list.regdate}</span>
				          			</li>
				          			</c:forEach>
				        		</c:when>
				        		<c:otherwise>
				        			<li class="text-center">글이 없습니다 !<li>
				        			<br/>
				          			<li class="text-center"><a href="#" class="btn btn-default">글쓰러 가기</a></li>
				        		</c:otherwise>
				        	</c:choose>
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
			 	<div class="panel-heading customPanel-heading">킬링 타임</div>
			 	<div class="panel-body">	
					 <div class="col-sm-4 customVideoDiv">
					   <div class="embed-responsive embed-responsive-16by9">
							<iframe class="embed-responsive-item" src="https://www.youtube.com/embed/DLgeIw74Ktg" frameborder="0" allowfullscreen></iframe>
					   		<p class="videoP"><span class="videoTitleSpan">종꾹형한테 맞으면</span><br/><span class="videoContentSpan">골로간다.</span></p>
					   </div>
			      	</div>
			      	
		      	    <div class="col-sm-4 customVideoDiv">
				      <div class="embed-responsive embed-responsive-16by9">
						<iframe class="embed-responsive-item" src="https://www.youtube.com/embed/DLgeIw74Ktg" frameborder="0" allowfullscreen></iframe>
				        <p class="videoP"><span class="videoTitleSpan">종꾹형한테 맞으면</span><br/><span class="videoContentSpan">골로간다.</span></p>
				     </div>
		      	   </div>
		      	   
		      	    <div class="col-sm-4 customVideoDiv">
					   <div class="embed-responsive embed-responsive-16by9">
							<iframe class="embed-responsive-item" src="https://www.youtube.com/embed/DLgeIw74Ktg" frameborder="0" allowfullscreen></iframe>
							<p class="videoP"><span class="videoTitleSpan">종꾹형한테 맞으면</span><br/><span class="videoContentSpan">골로간다.</span></p>
					   </div>
			      	</div>
		      	   
		       </div>
	      	</div>
		</div>
	</div>
	
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
							          <c:choose>
							          	<c:when test="${point_list != null}">
							          		<c:forEach var="point_list" items="${point_list}" varStatus="p_Status">
							          			<p><a href="#"><span style="font-family:sans-serif;">${p_Status.count}.${point_list.nickName}</span></a></p>			
							          		</c:forEach>	
							          	</c:when>
							          	<c:otherwise>
							          		<p>죄송합니다 잠시후 다시 이용해주세요</p>
							          	</c:otherwise>
							          </c:choose>
							        </div>
							    </div>
					        </div>
					        <div class="col-sm-3">
								<div class="alert alert-info fade in">
							        <p><strong>베스트 국회의원</strong></p>
							        <div class="well indexWell2">
							          <c:choose>
							          	  <c:when test="${pal_list != null}">
							          			<c:forEach var="pal_list" items="${pal_list}" varStatus="Paliament">
						          				<p>
						          				<a href="PaliamentDetail.do?num=${pal_list.num2}&dept_cd=${pal_list.deptCd}&img=${pal_list.jpgLink}&name=${pal_list.empNm}">${Paliament.count}.${pal_list.empNm}</a>
						          				</p>
							          			</c:forEach>	  
							          	  </c:when>
							          	  <c:otherwise>
							          	  	<p>죄송합니다. 잠시후 다시 이용해주세요</p>
							          	  </c:otherwise>
							          </c:choose>
							        </div>
							    </div>
					        </div>
					        
				          	<div class="col-sm-6">
								<div class="alert alert-info fade in">							
							        <p><strong>기재중인 블로거</strong></p>
							        <div class="well indexWell2 bloger">
							          <c:choose>
							          	  <c:when test="${bloger_list != null}">
							          			<c:forEach var="bloger_list" items="${bloger_list}" varStatus="Paliament">
							          				<p>
								          				<img src="blog/${bloger_list.bloger_img}" alt="${bloger_list.bloger_id} 님" class="img-circle" width="30px;" height="30px;"/>
								          				<a href="${bloger_list.bloger_mainUrl }" target="_blank">${bloger_list.bloger_id} 님</a>
								          			</p>
								          			
							          			</c:forEach>	  
							          	  </c:when>
							          	  <c:otherwise>
							          	  	<p>죄송합니다. 잠시후 다시 이용해주세요</p>
							          	  </c:otherwise>
							          </c:choose>
							          <div style="clear:both;"></div>
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
			          	 	<a href="PresidentMember.do" class="btn btn-default">대선 후보 보기</a>
			          	 </div>				
	      			</div>
	      			<div class="col-sm-4">
	      				<div class="well indexWell">
		          	    	<i class="material-icons" style="font-size:80px">record_voice_over</i><br/><br/>
		          	 	    <p>나의 생각을 말해봐</p>
		          	 	    <a href="moreCommunityTalk.do" class="btn btn-default">토론 하기</a>
		          	    </div>
	      			</div>
	      			<div class="col-sm-4">
	      				<div class="well indexWell">
			          	 	<i class="fa fa-dollar" style="font-size:80px"></i><br/><br/>
			          	 	<p>주식과 비슷하지만 모든것이 공짜</p>
			          	 	<a href="point.do" class="btn btn-default">생활 포인트</a>
			          	 </div>	
	      			</div>
	      			<div class="col-sm-4">
	      				<div class="well indexWell">
			          	 	<i class="fa fa-institution" style="font-size:80px"></i><br/><br/>
			          	 	<p>국회 의원 및 법안을 한눈에</p>
			          	 	<a href="Member_Parliament.do" class="btn btn-default">국회</a>
			          	 </div>			
	      			</div>
	      			
	      			
	      			<div class="col-sm-4">
	      				<div class="well indexWell">
			          	 	<i class="fa fa-smile-o" style="font-size:80px"></i><br/><br/>
			          	 	<p>#일상#소통#웃긴영상</p>
			          	 	<a href="#" class="btn btn-default">생활 이야기</a>
			          	 </div>			
	      			</div>
	      			
	      			<div class="col-sm-4">
	      				<div class="well indexWell">
			          	 	<i class="fa fa-book" style="font-size:80px"></i><br/><br/>
			          	 	<p>정치에 관심이 많아요!!</p>
			          	 	<a href="CommunityIndex.do" class="btn btn-default">정치 이야기</a>
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
			        	<li class="recoment"><a href="PresidentMember.do" class="label label-default">대선후보</a></li>
			        	<li class="recoment"><a href="point.do" class="label label-primary">생활포인트</a></li>
			        	<li class="recoment"><a href="moreCommunityTalk.do" class="label label-success">토론하기</a></li>
			        	<li class="recoment"><a href="blogerPosting.do" class="label label-warning">블로거보기</a></li>
			        </ul> 
	    		</div>
    		</div>
    		<div class="form-group">
    			<div class="well sideWell">
			        <label>인기 메뉴</label>
			        <hr/>
			        <p id="favoritP">
			          <a href="PresidentMember.do" class="label label-default">대선후보</a>
			          <a href="point.do" class="label label-primary">생활포인트</a>
			          <a href="moreCommunityTalk.do" class="label label-success">토론하기</a>
			          <a href="" class="label label-info">웃긴영상</a>
			          <a href="" class="label label-warning">게임영상</a>
			          <a href="" class="label label-danger">고민있어요</a>
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
  	 <form action="indexConcat.do" method="POST">
		  <div class="row">
		    <div class="col-md-4">
		      <p><span class="glyphicon glyphicon-map-marker"></span>Gss : 판교</p>
		      <p><span class="glyphicon glyphicon-phone"></span>Phone : 010-9590-3710</p>
		      <p><span class="glyphicon glyphicon-envelope"></span>Email : stpark89@gmail.com</p>
		    </div>
		    <div class="col-md-8">
		      <div class="row">
		        <div class="col-sm-6 form-group">
		          <input class="form-control" id="name" name="concatName" placeholder="Name" type="text" required>
		        </div>
		        <div class="col-sm-6 form-group">
		          <input class="form-control" id="email" name="concatEmail" placeholder="Email" type="email" required>
		        </div>
		      </div>
		      <textarea class="form-control" id="comments" name="concatComments" placeholder="Comment" rows="5"></textarea>
		      <br>
		      <div class="row">
		        <div class="col-md-12 form-group">
		          <button class="btn btn-default pull-right" type="submit">문의하기</button>
		        </div>
		      </div>
		    </div>
		  </div>
	  </form>
  </div>
</div>
    
    
    
    <footer id="footer">
       <p>(주)GSS&nbsp;|&nbsp;대표이사 : 박성준&nbsp;|&nbsp;주소 : 경기도 용인시 수지구 죽전동&nbsp;|&nbsp;연락처 : 010-9590-3710&nbsp;|&nbsp;이메일 : stpark89@gmail.com<br>
           Copyright by GSS, Ltd. All Rights Reserved.
        </p>
    </footer>
</body>
</html>