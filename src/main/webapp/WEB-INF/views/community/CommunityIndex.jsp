<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>​
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
    
    <input type="hidden" id="hidden_id" value="${id}">
    <input type="hidden" id="hidden_favorit" value='${favorit}'>
    
    <section id="dashboard">
       <h1>커뮤니티</h1>
       <!-- <p>이 주 </p> -->
       <article>
       	   <div>
           		<h1 class="dashH">공지사항<span onclick="location.href='board.do?category=qa'"><i class="fa fa-chevron-circle-right" aria-hidden="true"></i></span></h1>
               <hr class="titleHr"/>
               <ul class="dashList">
                   <c:forEach var="list" items="${qa}">
					<li onclick="location.href='boardDetail.do?no=${list.no}&category=${list.category }&currentpage=1'">
						<div>
							<p class="dashtitle">${list.title}</p>
							<c:if test="${list.regdatePO > now }">
								<span class="new">N</span>
							</c:if>
						</div>
					</li>
					</c:forEach>
               </ul>
           </div>
           <div>
               <h1 class="dashH">자유게시판<span onclick="location.href='board.do?category=free'"><i class="fa fa-chevron-circle-right" aria-hidden="true"></i></span></h1>
               <hr class="titleHr"/>
               <ul class="dashList">
               		<c:forEach var="list" items="${free}">	
					<li onclick="location.href='boardDetail.do?no=${list.no}&category=${list.category }&currentpage=1'">
						<div>
							<p class="dashtitle">${list.title}</p>
							<c:if test="${list.regdatePO > now }">
								<span class="new">N</span>
							</c:if>
						</div>
					</li>
					</c:forEach>
               </ul>
           </div>
           <div>
           	   <h1 class="dashH">오늘의 이슈<span onclick="location.href='board.do?category=issue'"><i class="fa fa-chevron-circle-right" aria-hidden="true"></i></span></h1>
          	   <hr class="titleHr"/>
               <ul class="dashList">
                   <c:forEach var="list" items="${issue}">
					<li onclick="location.href='boardDetail.do?no=${list.no}&category=${list.category }&currentpage=1'">
						<div>
							<p class="dashtitle">${list.title}</p>
							<c:if test="${list.regdatePO > now }">
								<span class="new">N</span>
							</c:if>
<<<<<<< HEAD
							<%-- <c:set var="str1" value="${list.content }"/>
							<c:set var="str2" value='src="upload/' />
 							<c:if test="${ fn:contains(str1, str2) }">
								<i class="fa fa-picture-o" aria-hidden="true"></i>
							</c:if> --%>
=======
>>>>>>> 15f5e2e92cd7094a74584bfbfe3d161db0716022
						</div>
					</li>
					</c:forEach>
				</ul>
           </div>
           <div>
	           	<h1 class="dashH">정치게시판<span onclick="location.href='board.do?category=politics'"><i class="fa fa-chevron-circle-right" aria-hidden="true"></i></span></h1>
	               <hr class="titleHr"/>
	               <ul class="dashList">
	               <c:forEach var="list" items="${politics}">
						<li onclick="location.href='boardDetail.do?no=${list.no}&category=${list.category }&currentpage=1'">
							<div>
							<p class="dashtitle">${list.title}</p>
							<c:if test="${list.regdatePO > now }">
								<span class="new">N</span>
							</c:if>
							</div>
						</li>
				   </c:forEach>
	               </ul>
           </div>
        </article>
	</section>
    
    <section id="bloger">
    	<div class="container-fluid text-center">
    		<div class="row">
    			<div class="col-md-12">
    				<h1 id="blogTitle">블로거 이야기</h1>
    				<label id="blogStatus">정치에 관심이 많은 분들의 의견을 볼 수 있습니다 !<br/>
    					   블로그를 하시는 분들 혹은 개인 사이트를<br/> 운영하시는 분들에 한해서<br/>
    					   쓰신 글을 저희가 퍼오고 블로그 주소 및 개인사이트 주소를<br/>
    					   연동하여 더많은 글을 보고싶은분들에게 <br/>
    					   블로그 및 개인 사이트로 연결 해드립니다.<br/>
    				</label>
    				<br/><br/>
    				<div class="form-group">
    						<input type="button" class="btn btn-info" value="신청하기"  data-toggle="modal" data-target="#applyModal">	
    				</div>
    				<div class="row">
    					<c:set var="length" value="${fn:length(blog)}"></c:set>
    					<c:forEach var="blog" items="${blog}" varStatus="Status">
    						<c:choose>
    							<c:when test="${length<2}">
		    						<div class="col-md-3">
		    							<div class="well customWell">
		    								<img src="blog/${blog.bloger_img}" alt="${blog.bloger_id} 님" class="img-circle"/><br/><br/>
		    								<label>${blog.bloger_id} 님</label><br/>
		    								<input type="button" class="btn btn-success" value="사이트보기" onclick="bloger('${blog.bloger_mainUrl}');">	
		    							</div>
		    						</div>
		    						<div class="col-md-3">
		    							<div class="well customWell">
		    								<span><i class="material-icons" style="font-size:160px">person_pin</i></span><br/><br/>
		    								<label>블로거 분들을 기다립니다.</label><br/>
		    								<input type="button" class="btn btn-success" value="신청"  data-toggle="modal" data-target="#applyModal">
		    							</div>
		    						</div>
		    						<div class="col-md-3">
		    							<div class="well customWell">
		    								<span><i class="material-icons" style="font-size:160px">person_pin</i></span><br/><br/>
		    								<label>블로거 분들을 기다립니다.</label><br/>
		    								<input type="button" class="btn btn-success" value="신청"  data-toggle="modal" data-target="#applyModal">
		    							</div>
		    						</div>
		    						<div class="col-md-3">
		    							<div class="well customWell">
		    								<span><i class="material-icons" style="font-size:160px">person_pin</i></span><br/><br/>
		    								<label>블로거 분들을 기다립니다.</label><br/>
		    								<input type="button" class="btn btn-success" value="신청"  data-toggle="modal" data-target="#applyModal">
		    							</div>
		    						</div>
    							</c:when>
    							<c:otherwise>
		    						<div class="col-md-3">
			    							<div class="well customWell">
			    								<img src="blog/${blog.bloger_img}" alt="${blog.bloger_id} 님" class="img-circle" style="width:160px; height: 160px;"/><br/><br/>
			    								<label>${blog.bloger_id} 님</label><br/>
			    								<input type="button" class="btn btn-success" value="사이트보기" onclick="bloger('${blog.bloger_mainUrl}');">	
			    							</div>
			    					</div>
	    						</c:otherwise>	
	    					</c:choose>
    					</c:forEach>
    				</div>
    			</div>
    		</div>
    		
    		<div class="form-group" id="moreBlogerDiv">
    			<input type="button" class="btn btn-default text-center" value="글보기" onclick="blogerIndex();">
    		</div>
    		<br/><br/>
    	</div>
    </section>
	
	<section id="MyTalk">
		<h1>나의 한마디</h1>
		<p class="debateTitle" style="color:red;">'${keyWord}'</p>
        <p class="debateCon">여러분들의 의견을 소신껏 말해주세요 !</p>
		<article>
       	   <div class="talkDiv">
       	   		<h4><span style="color:#a00">좋아요</span></h4>
				<div class="debate">
					<c:choose>
						<c:when test="${debate != null}">
						<ul class="debateList">
						<c:set var="sum" value="0"/>
						<c:forEach var="dto" items="${debate}">
						<c:if test="${dto.choose == '진보' && sum<5}">
							<li>
								<c:set var="sum" value="${sum+1}"/>
								
								<p class="debateText">${dto.title}</p>
								<p class="debateDate">${dto.writeDate}</p>
							</li>
						</c:if>
							<%-- <li>${status.index }</li> --%>
						</c:forEach>
						<c:remove var="count"/>
						</ul>
						</c:when>
						<c:otherwise>
							<span>의견을 남겨주세요 !</span>
						</c:otherwise>
					</c:choose>
				</div>
			</div>
				
			<div class="talkDiv">
       	   		<h4><span style="color:#00a">싫어요</span></h4>
				<div class="debate">
					<c:choose>
						<c:when test="${debate != null}">
						<ul class="debateList">
						<c:set var="sum" value="0"/>
						<c:forEach var="dto" items="${debate}" varStatus="bostatus">
							<c:if test="${dto.choose eq '보수'  && sum<5}">
							<li>
								<c:set var="sum" value="${sum+1}"/>
								<p class="debateText">${dto.title}</p>
								<p class="debateDate">${dto.writeDate}</p>
							</li>
							</c:if>
						</c:forEach>
						</ul>
						</c:when>
						<c:otherwise>
							<span>의견을 남겨주세요 !</span>
						</c:otherwise>
					</c:choose>
				</div> 
			</div>
			
		</article>
		<div id="talkmoreDiv">
			<button type="button" id="talkMoreBtn">보러가기</button>
		</div>
	</section>
	
    
    <!-- <section id="recent">
    	<h1>정부소식</h1>
        <p>대한민국 정부에서 제공하는 데이터 입니다. 창업 및 취업 관련 정보를 제공합니다.</p>
	       <article>
	       	    <div>
	            	<div class="main_news">
	                	<img src="img/dashimg/goverment.jpg" alt="대한민국정부(창업)" width="15%"/>
	                    <h2 id="GoverMenthGoyoung"></h2>
	                </div>
	                <ul class="dashList" id="goUl"></ul>
	            </div>
	            <div>
	            	<div class="main_news">
	                	<img src="img/dashimg/goverment.jpg" alt="대한민국정부(취업)" width="15%"/>
	                    <h2 id="educationHtag"></h2>
	                </div>
	                <ul class="dashList" id="eduli"></ul>
	            </div>
	       </article>
    </section> -->
    
    <section id="news">
    	<h1>NEWS</h1>
        <p>각 분야별 최신 뉴스를 한눈에 모아보기 !<br/> 회원가입하시고 더많은 정보를 받아보세요.</p>
        <ul id="newsUlTag">

        </ul>
        <article>
			<div>
				<div class = "newPadding"></div>
				<div class = "newImg">
            		<img src="img/dashimg/ohmyLogo.gif" alt="오마이 뉴스" width="200"/>
            	</div>
				<div class = "newPadding"></div>
                <ul class="dashList" id="OhMyUl"></ul>	
            </div>
            <div>
            	<div class = "newPadding"></div>
            	<div class = "newImg">	
            		<img src="img/dashimg/mailLogo.jpg" alt="매일경재" width="150"/>
            	</div>
               <div class = "newPadding"></div>
                <ul class="dashList" id="mail"></ul>
            </div>
            <div>
            	<div class = "newPadding"></div>
            	<div class = "newImg">
            		<img src="img/dashimg/josunLogo.png" alt="조선닷컴" width="180"/>
            	</div>
               <div class = "newPadding"></div>
                <ul class="dashList" id="josun"></ul>
            </div>
            <div>
            	<div class = "newPadding"></div>
            	<div class = "newImg">
            		<img src="img/dashimg/jtbcLogo.png" alt="JTBC 뉴스" width="100"/>
            	</div>
               <div class = "newPadding"></div>
                <ul class="dashList" id="jtbc"></ul>
            </div>
        </article>
    </section>
    


<div class="container">
 <div class="modal fade" id="applyModal" role="dialog">
 	<form class="form-horizontal" id="blogerApplyForm" action="BlogerApply.do" method="POST">
    <div class="modal-dialog modal-md">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">감사합니다!</h4>
        </div>
        <div class="modal-body">
          <p class="text-center"><span style="line-height: 30px;">블로그 주소 혹은 개인사이트 주소를 남겨주시면</span> <br/> <span style="line-height: 30px;">확인후 연락 드리겠습니다.</span></p>
          <br/>
        	  <div class="form-group">
			    <label class="control-label col-sm-offset-2 col-sm-2" for="applyUser_email">메일주소</label>
			    <div class="col-sm-6">
			      <input type="email" class="form-control" id="applyUser_email" name="applyUser_email" placeholder="연락받으실 메일" required="required">
			    </div>
			  </div>
			  <div class="form-group">
			    <label class="control-label col-sm-offset-2 col-sm-2" for="applyUser_page">사이트 주소</label>
			    <div class="col-sm-6"> 
			      <input type="text" class="form-control" id="applyUser_page" name="applyUser_page" placeholder="사이트 주소">
			    </div>
			  </div>
			  <div class="form-group">
			    <label class="control-label col-sm-offset-2 col-sm-2" for="applyUser_page">닉네임</label>
			    <div class="col-sm-6"> 
			      <input type="text" class="form-control" id="applyUser_NickName" name="applyUser_NickName" placeholder="사용하실 닉네임">
			    </div>
			  </div>
	      </div>
        <div class="modal-footer">
           <button type="submit" class="btn btn-default">신청</button>	
          <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
        </div>
      </div>
    </div>
    
    </form>
  </div>
</div>    
    
