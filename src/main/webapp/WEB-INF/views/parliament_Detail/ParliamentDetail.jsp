<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<link rel="stylesheet" type="text/css" href="loading/loadingDiv.css">
<link rel="stylesheet" type="text/css" href="paliament/comment.css">
<link rel="stylesheet" type="text/css" href="paliament/paliament_detail.css">
<link rel="stylesheet" href="css/WriteForm.css">
<script src="paliament/paliament_api.js"></script>
<script src="js/comment.js"></script>

<input type="hidden" id="detail_img" value="${img}">
<input type="hidden" id="detailHiden_num" value="${num}">
<input type="hidden" id="detailHiden_dept_cd" value="${dept_cd}">
<input type="hidden" id="detailName" value="${name}">
<input type="hidden" id="tid" value="${tid}">

 <!----------------------------------------------------------------------------------->

	<div id="loading_form" data-setData="0">
		<div id="loading"></div>
		<p>Loading...</p>  
	</div>
    
    <div class="container" style="padding:50px 0 30px 0;" id="tabMenu">
		<ul class="nav nav-tabs">
		    <li class="active"><a data-toggle="tab" href="#menu1"> 기본정보 </a></li>
		    <li><a data-toggle="tab" href="#menu2"> 법안발의  </a></li>
		    <li><a data-toggle="tab" href="#menu3"> 상임의원회 활동  </a></li>
		</ul>
	</div>
	
     <div class="container tab-content">
	    <div id="menu1" class="row tab-pane fade in active">
	    	<div class="col-sm-offset-1 col-sm-3">
	     		<img class="img-responsive img-circle" src="http://placehold.it/158x216" alt="의원사진" id="paliamentDetail_img" style="margin:0 auto; width:158px; heigth:216px;"/>	     	
	     	</div>
	     	<div class="col-sm-offset-1 col-sm-6 table-responsive" style="padding:10px 0;">
		        <table class="table" id="info">
		        	<tr><th>이름</th><td id="nameTd"></td></tr>
		            <tr><th>정당</th><td id="jungTd"></td></tr>
		            <tr><th>소속위원회</th><td id="shrtNmTd"></td></tr>
		            <tr><th>당선횟수</th><td id="electionNumTd"></td></tr>
		            <tr><th>연락처</th><td id="phoneTd"></td></tr>
		            <tr><th>이메일</th><td id="emailTd"></td></tr>
		        </table>
	        </div>
	    </div>
	    <div id="menu2" class="tab-pane fade">
	      	<div id="statusDiv" class="table-responsive"></div>
	        <button class="btn" id="statusDivMore">더보기</button>
	    </div>
	    <div id="menu3" class="tab-pane fade">
	       <h2 id="detailSangim_Name"></h2>
	        <article>
	        	<h3 id="chulsuck_Sang"></h3>
	        	<div id="progress"><div></div></div>
			</article>
	        <div>
	            <table id="attendance_table">
					<tbody id="resultTbody">
					
					</tbody>
					<tfoot>
	                	<tr>
	                        <td colspan="6" id="ulTd">
	                            
	                        </td>
	                    <tr>
	                </tfoot>
	            </table>
	        </div>
	    </div>
	  </div>
    
		
    <div class="container" id="activity">
    	<hr/>
        <h2>바라는점을 써주세요!</h2>
		<span id="commButton" data-id="${sessionScope.id }">글 쓰기</span>
		<div>
			<div id="comm">
		    	<div id="talkWrite">
			        <textarea name="content" style="resize:none;" placeholder="로그인이 필요합니다." maxlength="500"></textarea>
			        <button class="commButton" data-depth="0" data-cono="0">등록</button>
	    		</div>
		    	<ul id="commList">
		        <c:forEach var="comment" items="${comment}">
		           	<li class="comment">
		            	<h4>${comment.writer}</h4>
		               	<p class="content">${comment.content}</p>
		                <span>${comment.regdate}</span>
						<ul>
		               	<c:if test="${comment.id == sessionScope.id}">                	
		                	<li class="commmod" data-depth="0" data-cono="${comment.co_no}" data-writer="${comment.writer }">수정</li>
		   	            	<li class="commdel" data-depth="0" data-cono="${comment.co_no}">삭제</li>
		        		</c:if>
		               	</ul>
					</li>
				</c:forEach>
		        </ul>
		    </div>
        </div>
    </div>
    