<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
    <input type="hidden" id="hidden_id" value="${id}">
    <input type="hidden" id="hidden_favorit" value='${favorit}'>
    
    <section id="dashboard">
       <h1>커뮤니티</h1>
       <p>설명 설명 설명</p>
       <article>
           <div>
               <h1 class="dashH">자유게시판<span onclick="location.href='board.do?category=자유게시판'"><i class="fa fa-chevron-circle-right" aria-hidden="true"></i></span></h1>
               <hr class="titleHr"/>
               <ul class="dashList">
               		<c:forEach var="list" items="${free}">
					<li onclick="location.href='boardDetail.do?no=${list.no}&category=${list.category }&currentpage=1'">
						<span>${list.title}</span><hr class="listHr"/>
					</li>
					</c:forEach>
               </ul>
           </div>
           <div>
           	   <h1 class="dashH">오늘의 이슈<span onclick="location.href='board.do?category=오늘의 이슈'"><i class="fa fa-chevron-circle-right" aria-hidden="true"></i></span></h1>
          	   <hr class="titleHr"/>
               <ul class="dashList">
                   <c:forEach var="list" items="${issue}">
					<li onclick="location.href='boardDetail.do?no=${list.no}&category=${list.category }&currentpage=1'">
						<span>${list.title}</span><hr class="listHr"/>
					</li>
					</c:forEach>
				</ul>
           </div>
           <div>
	           	<h1 class="dashH">정치게시판<span onclick="location.href='board.do?category=정치게시판'"><i class="fa fa-chevron-circle-right" aria-hidden="true"></i></span></h1>
	               <hr class="titleHr"/>
	               <ul class="dashList">
	               <c:forEach var="list" items="${politics}">
						<li onclick="location.href='boardDetail.do?no=${list.no}&category=${list.category }&currentpage=1'">
							<span>${list.title}</span><hr class="listHr"/>
						</li>
				   </c:forEach>
	               </ul>
           </div>
           <div>
           		<h1 class="dashH">공지사항/QnA<span onclick="location.href='board.do?category=공지사항/QnA'"><i class="fa fa-chevron-circle-right" aria-hidden="true"></i></span></h1>
               <hr class="titleHr"/>
               <ul class="dashList">
                   <c:forEach var="list" items="${qa}">
					<li onclick="location.href='boardDetail.do?no=${list.no}&category=${list.category }&currentpage=1'">
						<span>${list.title}</span><hr class="listHr"/>
					</li>
					</c:forEach>
               </ul>
           </div>
        </article>
       <!-- <div id="more"><i class="fa fa-angle-double-down" aria-hidden="true"></i></div>-->
	</section>
    
	
	<section id="MyTalk">
		<h1>나의 한마디</h1>
		<p style="color:red; margin-top:-30px;">'최순실'</p>
        <p>여러분들의 의견을 소신껏 말해주세요 !</p><br/><br/>
				<%-- <div id="textAreaDiv">
					<c:if test="${id != null}">
			       	    	<form>
			       	    		<div class="form-group">
				       	    		<input type="radio">진보
				       	    		<input type="radio">보수
			       	    		</div>
			       	    		<br/>
			       	    		<textarea id="myTalkTextArea"></textarea>
			       	    		<button id="myTalkBtn">글쓰기</button>
			       	    	</form>
	       	    	</c:if>
	       	    </div> --%>
		<article>
	       	    <div id="jinboDiv">
	       	   		<h4>나는 진보다.</h4>
	       	   		<br/>
					<div class="jinbo_sub">
						<span class="titleSpan"><a href="#">안녕하세요..</a></span><span class="dateSpan">2017-02-01</span>		
					</div>
				</div>
				
				<div id="bosuDiv">
					<h4>나는 보수다.</h4>
					<br/>
					<div class="bosu_sub">
						<span class="titleSpan"><a href="#">저는 보수청년입니다.</a></span><span class="dateSpan">2017-02-01</span>
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
    
    
    
