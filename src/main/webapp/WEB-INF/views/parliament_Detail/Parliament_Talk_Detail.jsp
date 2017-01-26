<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" type="text/css" href="css/sub02.css">
<script type="text/javascript" src="js/comment.js"></script>

    <!--
       작성자 : 박성준
       작성일 : 2017-01-12
       목 적  : 게시글 상세보기 페이지.
       num, name, dept_cd, img 를 가지고 댕겨야하는 이 불편함...
    -->
   
    <input type="hidden" id="seq" value="${detail.paliament_talk_seq}">
    <input type="hidden" id="dept_cd" value="${dept_cd}">
    <input type="hidden" id="img" value="${img}">
    <input type="hidden" id="name" value="${detail.catego}">
    <input type="hidden" id="num" value="${detail.num}">
        
  
  <!--위에있는 4개 + content + id 가지고 가야한다...-->
    <div id="wrap">
       <c:choose>
          
          <c:when test="${detail ne null}">
                <h1 id="category">${detail.catego} 님에게 한마디!</h1>
                <hr/>
                <br/>
                <%-- 첨부파일 :<a href="paliament_talk_fileDown.do?name=${detail.filename}">${detail.filename}</a>  --%>
                     <div id="title">
                      <h2>${detail.title}&nbsp;&nbsp;&nbsp;<span class="nick">작성자 : ${detail.writer}</span></h2>
                       <p>작성일 : ${detail.writeDate}</p><br>
                   </div>
                <div id="content">
                   ${detail.content}
                </div>
                <div id="comm">
			    	<div>
			    		<span id="commButton" data-id="${sessionScope.id }" style="cursor: pointer;">댓글 쓰기</span>
			    		<div>
			    		<c:if test="${sessionScope.id != null}">
					        <textarea name="content" style="resize:none;" placeholder="댓글을 적어주세요" maxlength="500"></textarea>
					        <button class="commButton" data-depth="0" data-cono="0">등록</button>
			    		</c:if>
			    		</div>
			        </div>
			    	<ul id="commList">
			        <c:forEach var="comment" items="${comment}">
			           	<li class="comment">
			            	<h4>${comment.writer}</h4>
			               	<p class="content">${comment.content}</p>
			                <span>${comment.regdate}</span>
							<ul>
			               		<li class="cocobutton" value="0" data-no="${comment.co_no }" data-grpno="${comment.grpno}">답글</li>
			               	<c:if test="${comment.id == sessionScope.id}">                	
			                	<li class="commmod" data-depth="0" data-cono="${comment.co_no}" data-writer="${comment.writer }">수정</li>
			   	            	<li class="commdel" data-depth="0" data-cono="${comment.co_no}">삭제</li>
			        		</c:if>
			               	</ul>
						</li>
						<c:forEach var="list" items="${list}">
						<c:if test="${comment.co_no == list.grpno}">
						<li class="double_comm comm${comment.grpno }">
			            	<h4>${list.writer}</h4>
			            	<p class="content">${list.content}</p>
			            	<span>${list.regdate}</span>
							<ul>
			               	<c:if test="${list.id == id}">                	
			                	<li class="commmod" data-depth="1" data-cono="${list.co_no}">수정</li>
			   	            	<li class="commdel" data-depth="1" data-cono="${list.co_no}">삭제</li>
			        		</c:if>
			               	</ul>
						</li>
						</c:if>
						</c:forEach>
						<li class="double_comm comm${comment.grpno }">
							<textarea style="resize:none;" placeholder="답글을 적어주세요" maxlength="500"></textarea>
							<button class="commButton" data-depth="1" data-cono="${comment.co_no }">등록</button>
						</li>
					</c:forEach>
			        </ul>
			    </div>
               
               <div id="btArray">
                      <c:if test="${detail.id == sessionScope.id}"> 
                         <button onclick="modifyTalk(${detail.paliament_talk_seq});">수정</button>
                         <input type="hidden" id="session_id" value="${sessionScope.id}">
                         <button onclick="deleteTalk()">삭제</button>
                       </c:if>
                       <button onclick="PaliamentDetail.do?num=${detail.num}&dept_cd=${dept_cd}&img=${img}&name=${detail.catego}'">목록</button>
               </div>                 
          </c:when>
          <c:otherwise>
             <h4>잘못된 접근입니다!</h4>
          </c:otherwise>
       </c:choose>
    </div>   