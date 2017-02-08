<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<link rel="stylesheet" type="text/css" href="paliament/final_sub4_0125.css">
<link rel="stylesheet" type="text/css" href="loading/loadingDiv.css">
<link rel="stylesheet" type="text/css" href="paliament/comment.css">
<link rel="stylesheet" href="css/WriteForm.css">
<script src="paliament/paliament_api.js"></script>
<script src="js/comment.js"></script>

<input type="hidden" id="detail_img" value="${img}">
<input type="hidden" id="detailHiden_num" value="${num}">
<input type="hidden" id="detailHiden_dept_cd" value="${dept_cd}">
<input type="hidden" id="detailName" value="${name}">
<input type="hidden" id="detailHiden_dept_cd" value="${dept_cd}">
<input type="hidden" id="tid" value="${tid}">

 <!----------------------------------------------------------------------------------->
	<div id="pDetail">
		<ul data-select="1">
			 <li data-num="1"> 기본정보  </li>
			 <li data-num="2"> 법안발의  </li>
			 <li data-num="3"> 상임의원회 활동  </li>
		</ul>
	</div>
	<div id="loading_form" data-setData="0">
        <div id="loading"></div>
        <p>Loading...</p>  
    </div>
		<section id="parliamentInfo">
			<div class="parliamentImg">
	    		<img src="http://placehold.it/150x200" alt="의원사진" id="paliamentDetail_img"/>
	    	</div>
	        <table id="info">
	        	<tr>
	            	<th>이름</th><td id="nameTd"></td><th>정당</th><td id="jungTd"></td>
	            </tr>
	            <tr>
	            	<th>소속위원회</th><td id="shrtNmTd"></td><th>당선횟수</th><td id="electionNumTd"></td>
	            </tr>
	            <tr>
	            	<th>연락처</th><td id="phoneTd"></td><th>이메일</th><td id="emailTd"></td>
	            </tr>
	        </table>
	    </section>
	    <section id="bill">
	        <div id="statusDiv"></div>
	        <button id="statusDivMore">더보기</button>
	    </section>
	    <section id="attendance">
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
	    </section>
    <section id="activity">
    	<hr/>
        <h2>바라는점을 써주세요!</h2>
		<span id="commButton" data-id="${sessionScope.id }" style="cursor: pointer;">글 쓰기</span>
		<div>
			<div id="comm">
		    	<div id="talkWrite">
		    	<c:if test="${sessionScope.id != null}">
			        <textarea name="content" style="resize:none;" placeholder="댓글을 적어주세요" maxlength="500"></textarea>
			        <button class="commButton" data-depth="0" data-cono="0">등록</button>
	    		</c:if>
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
    </section>
    