<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="container">
	  <ul class="nav nav-tabs">
	    <li class="active" id="noticeTab"><a href="#">공지사항</a></li>
	    <li id="pollTab"><a href="#">설문조사</a></li>
	  </ul>
</div>
<div id="noticeDiv">
	<div class="container">	
		<div class="demo-row typography-row">
			<div class="demo-title">
			</div>
			<div class="demo-content">
				<div class="demo-type-example">
		      		<span class="demo-text-note"></span>
		      	  <br/>
		          <blockquote>
		            <small>현재 기재되어 있는 공지사항 입니다.</small>
		          </blockquote>
	      		</div>
	      		<select data-toggle="select" class="form-control select select-success mrs mbm" id="chooseNoticeSelect">
				        <option value="0" disabled>개수 선택</option>
				        <option value="1">10개</option>
				        <option value="2">30개</option>
				        <option value="3">50개</option>
				        <option value="4">100개</option>
				</select>
			</div>
		</div>
	</div>
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<div class="table-responsive">
					<table class="table table-hover">
					    <thead>
					      <tr>
					        <th>제목</th>
					        <th>글쓴이</th>
					        <th>날짜</th>
					      </tr>
					    </thead>
					    <tbody>
					      <tr>
					        <td>안녕하세요</td>
					        <td>관리자1</td>
					        <td>2017-02-13</td>
					      </tr>
					    </tbody>
					</table> 
				</div>
			</div>
		</div>
		<div class="form-group">
			<button type="button" class="btn btn-info" onclick="NoticeWrite()">글쓰기</button>		
		</div>
	</div>
</div>
<div id="pollDiv">
	<div class="container">
	   <div class="row" style="margin-top:2%;">
	   	   <div class="col-md-8">
			   <div class="btn-group">
				  <button type="button" class="btn btn-primary">전체</button>
				  <button type="button" class="btn btn-primary">진행중</button>
				  <button type="button" class="btn btn-primary">완료</button>
				</div>
		   </div>
		   <div class="col-md-4">
		   		<div class="btn-group">
		   			<button type="button" class="btn btn-primary" onclick="pollWrite()">설문지 작성</button>
		   		</div>	
		   </div>
	   </div>
	   
	   <div class="row" style="margin-top:3%;">
	   		<div class="col-md-12">
	   			<table class="table">
	   				<tr>
	   					<th class="text-center"><input type="checkbox"></th>
	   					<th class="text-center">No.</th>
	   					<th class="text-center">제목</th>
	   					<th class="text-center">작성일</th>
	   				</tr>
	   				<tr>
	   					<td class="text-center">
	   						<input type="checkbox">
	   					</td>
	   					<td class="text-center">1</td>
	   					<td class="text-center">테스트</td>
	   					<td class="text-center">2017-02-18</td>
	   				</tr>
	   			</table>
	   		</div>
	   		<div class="col-md-offset-4 col-md-4">
		   		<ul class="pagination">
				  <li><a href="#">1</a></li>
				  <li><a href="#">2</a></li>
				  <li><a href="#">3</a></li>
				  <li><a href="#">4</a></li>
				  <li><a href="#">5</a></li>
				</ul>
			</div>
	   </div>
	   
	</div>
</div>