<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<section style="width:100%; min-height:300px;">
	<div class="container">
		<div class="demo-row typography-row">
			<div class="demo-title text-center">
				<h3 class="demo-panel-title">토론하기</h3>
				<span class="demo-text-note">현재 키워드는 
		      			<c:forEach var="keyword" items="${keyword}" begin="0" end="0">
		      				<span style="color: red;">${keyword.admin_debate_debateword}</span>입니다.	
		      			</c:forEach>
				</span>
			</div>
			<br/>
			<div class="demo-content text-center">
				<div class="demo-type-example">
					<div class="col-md-offset-4 col-md-4">
						<div class="well">
							<select id="keywordSelect" data-toggle="select" class="form-control select select-success mrs mbm">
								<option value="-1">키워드 선택</option>
								<c:forEach var="dto" items="${keyword}">
									<option value="${dto.admin_debate_debateword}">${dto.admin_debate_debateword}</option>
								</c:forEach>
							</select>
							<select id="wordNumbering" data-toggle="select" class="form-control select select-success mrs mbm" id="chooseNoticeSelect">
						        <option value="-1">글개수 선택</option>
						        <option value="1">10개</option>
						        <option value="2">30개</option>
						        <option value="3">50개</option>
						        <option value="4">100개</option>
						    </select>
						</div>
						<input type="button" value="검색" class="btn btn-warning" id="searchDebateBtn">
					</div>			      			
	      		</div>
			</div>
		</div>
	</div>
</section>
<hr/>
<div class="container text-center" id="notChooseResultDiv">
  	<h4>키워드와 글 개수를 선택해 주세요 !!</h4>
</div>
<div class="container-fluid" style="background-color: #ecf0f1; height:100%;">
  <div class="container" id="chooseResultDiv">
	<div class="table-responsive">
		<div id="resultTableTbody">
			<table class="table table-hover">
			    <thead>
			      <tr>
			      	<th><label class="checkbox" for="checkbox1"><input type="checkbox" value="" id="checkbox1" data-toggle="checkbox"></label></th>
			        <th>제목</th>
			        <th>글쓴이</th>
			        <th>날짜</th>
			      </tr>
			    </thead>
			    <tbody>
			      <tr>
			      	<td><label class="checkbox" for="checkbox2"><input type="checkbox" value="" id="checkbox2" data-toggle="checkbox" checked=""></label></td>
			        <td>안녕하세요</td>
			        <td>관리자1</td>
			        <td>2017-02-13</td>
			      </tr>
			    </tbody>
			</table> 
		</div>
		<div class="row">
			<div class="col-md-4">
				<button type="button" class="btn btn-info" onclick="NoticeWrite()">글쓰기</button>
				<button type="button" class="btn btn-danger" onclick="NoticeDelete()">글삭제</button>		
			</div>
		</div>
		<div class="row text-center">
			<div>
	            <a href="#fakelink" class="btn btn-success previous">
	              <i class="fui-arrow-left"></i>
	              OLDER
	            </a>
	            <ul class="pagination pagination-success">
	              <li><a href="#fakelink">1</a></li>
	              <li><a href="#fakelink">2</a></li>
	              <li><a href="#fakelink">3</a></li>
	              <li><a href="#fakelink">4</a></li>
	              <li><a href="#fakelink">5</a></li>
	            </ul>
	            <a href="#fakelink" class="btn btn-success next">
	              NEWER
	              <i class="fui-arrow-right"></i>
	            </a>
          		</div>
			</div>
		</div>
	</div>
</div>    