<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>​
    
    <input type="hidden" id="hidden_id" value="${id}">
    <input type="hidden" id="hidden_favorit" value='${favorit}'>
    
    <section id="dashboard">
       <h1>커뮤니티</h1>
       <p>설명 설명 설명</p>
       <article>
           <div>
               <h1 class="dashH">자유게시판<span onclick="location.href='board.do?category=자유게시판'"><i class="fa fa-chevron-circle-right" aria-hidden="true"></i></span></h1>
               <hr/>
               <ul class="dashList">
               		<c:forEach var="list" items="${free}">
					<li onclick="location.href='boardDetail.do?no=${list.no}&category=${list.category }&currentpage=1'">
						${list.title}<span>${list.regdate}</span>
					</li>
					</c:forEach>
               </ul>
           </div>
           <div>
           	   <h1 class="dashH">오늘의 이슈<span onclick="location.href='board.do?category=오늘의 이슈'"><i class="fa fa-chevron-circle-right" aria-hidden="true"></i></span></h1>
               <hr/>
               <ul class="dashList">
                   <c:forEach var="list" items="${issue}">
					<li onclick="location.href='boardDetail.do?no=${list.no}&category=${list.category }&currentpage=1'">
						${list.title}<span>${list.regdate}</span>
					</li>
					</c:forEach>
				</ul>
           </div>
           <div>
	           	<h1 class="dashH">정치게시판<span onclick="location.href='board.do?category=정치게시판'"><i class="fa fa-chevron-circle-right" aria-hidden="true"></i></span></h1>
	               <hr/>
	               <ul class="dashList">
	               <c:forEach var="list" items="${politics}">
						<li onclick="location.href='boardDetail.do?no=${list.no}&category=${list.category }&currentpage=1'">
						${list.title}<span>${list.regdate}</span>
						</li>
				   </c:forEach>
	               </ul>
           </div>
           <div>
           		<h1 class="dashH">이미지 갤러리<span onclick="location.href='board.do?category=이미지 갤러리'"><i class="fa fa-chevron-circle-right" aria-hidden="true"></i></span></h1>
               <hr/>
               <ul class="dashList">
                   <c:forEach var="list" items="${gif}">
					<li onclick="location.href='boardDetail.do?no=${list.no}&category=${list.category }&currentpage=1'">
						${list.title}<span>${list.regdate}</span>
					</li>
					</c:forEach>
               </ul>
           </div>
           <div>
           		<h1 class="dashH">토론방<span onclick="location.href='board.do?category=토론방'"><i class="fa fa-chevron-circle-right" aria-hidden="true"></i></span></h1>
               <hr/>
               <ul class="dashList">
                   <c:forEach var="list" items="${chat}">
					<li onclick="location.href='boardDetail.do?no=${list.no}&category=${list.category }&currentpage=1'">
						${list.title}<span>${list.regdate}</span>
					</li>
					</c:forEach>
               </ul>
           </div>
           <div>
           		<h1 class="dashH">연예게시판<span onclick="location.href='board.do?category=연예게시판'"><i class="fa fa-chevron-circle-right" aria-hidden="true"></i></span></h1>
               <hr/>
               <ul class="dashList">
                   <c:forEach var="list" items="${entertainment}">
					<li onclick="location.href='boardDetail.do?no=${list.no}&category=${list.category }&currentpage=1'">
						${list.title}<span>${list.regdate}</span>
					</li>
					</c:forEach>
               </ul>
           </div>
           <div>
           		<h1 class="dashH">사회게시판<span onclick="location.href='board.do?category=사회게시판'"><i class="fa fa-chevron-circle-right" aria-hidden="true"></i></span></h1>
               <hr/>
               <ul class="dashList">
                   <c:forEach var="list" items="${society}">
					<li onclick="location.href='boardDetail.do?no=${list.no}&category=${list.category }&currentpage=1'">
						${list.title}<span>${list.regdate}</span>
					</li>
					</c:forEach>
               </ul>
           </div>
           <div>
           		<h1 class="dashH">공지사항/QnA<span onclick="location.href='board.do?category=공지사항/QnA'"><i class="fa fa-chevron-circle-right" aria-hidden="true"></i></span></h1>
               <hr/>
               <ul class="dashList">
                   <c:forEach var="list" items="${qa}">
					<li onclick="location.href='boardDetail.do?no=${list.no}&category=${list.category }&currentpage=1'">
						${list.title}<span>${list.regdate}</span>
					</li>
					</c:forEach>
               </ul>
           </div>
        </article>
       <!-- <div id="more"><i class="fa fa-angle-double-down" aria-hidden="true"></i></div>-->
	</section>
    
	
	<section id="MyTalk">
		<h1>나의 한마디</h1>
		<p style="color:red; margin-top:-30px;">'${keyWord}'</p>
        <p>여러분들의 의견을 소신껏 말해주세요 !</p><br/><br/>
		<article>
	       	    <div id="jinboDiv">
	       	   		<h4>나는 진보다.</h4>
	       	   		<br/>
					<div class="jinbo_sub">
						<c:choose>
							<c:when test="${debate != null}">
							<c:forEach var="dto" items="${debate}">
								<c:if test="${dto.choose eq '진보'}">
									<span class="titleSpan"><a href="#">${dto.title}</a></span>
									<span class="dateSpan">
										${dto.writeDate}
									</span>
									<br/>
								</c:if>
							</c:forEach>
							</c:when>
							<c:otherwise>
								<span>의견을 남겨주세요 !</span>
							</c:otherwise>
						</c:choose>
					</div>
				</div>
				
				<div id="bosuDiv">
					<h4>나는 보수다.</h4>
					<br/>
					<div class="bosu_sub">
						<span class="titleSpan"><a href="#">저는 보수청년입니다.</a></span><span class="dateSpan">2017-02-01</span>
						<span class="titleSpan"><a href="#">저는 보수청년입니다2.</a></span><span class="dateSpan">2017-02-01</span>
					</div>
				</div>
		</article>
		
		<article>
			<div id="talkmoreDiv">
				<button type="button" id="talkMoreBtn">보러가기</button>
			</div>
		</article>
		
	</section>
	
    
     <section id="recent">
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
    </section>
    
    <section id="news">
    	<h1>NEWS</h1>
        <p>각 분야별 최신 뉴스를 한눈에 모아보기 !<br/> 회원가입하시고 더많은 정보를 받아보세요.</p>
        <ul id="newsUlTag">

        </ul>
        <article>
			<div>
            	<img src="img/dashimg/ohmyLogo.gif" alt="오마이 뉴스" width="200"/>
                <ul class="dashList" id="OhMyUl">
                   
               </ul>	
            </div>
            <div>	
            	<img src="img/dashimg/mailLogo.jpg" alt="매일경재" width="150"/>
                <ul class="dashList" id="mail">
               </ul>	
            </div>
            <hr>
            <div>
            	<img src="img/dashimg/josunLogo.png" alt="조선닷컴" width="180"/>
                <ul class="dashList" id="josun">
                   
               </ul>	
            </div>
            <div>
            	<img src="img/dashimg/jtbcLogo.png" alt="JTBC 뉴스" width="100"/>
                <ul class="dashList" id="jtbc">
               </ul>	
            </div>
        </article>
    </section>
    
    
    
