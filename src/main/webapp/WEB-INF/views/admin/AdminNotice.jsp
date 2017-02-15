<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="container">
	<div class="demo-row typography-row">
		<div class="demo-title">
			<h3 class="demo-panel-title">공지사항</h3>
		</div>
		<div class="demo-content">
			<div class="demo-type-example">
	      		<span class="demo-text-note"></span>
	          <blockquote>
	            <small>현재 기재되어 있는 공지사항 입니다.</small>
	          </blockquote>
      		</div>
		</div>
	</div>
	
	<select data-toggle="select" class="form-control select select-success mrs mbm" id="chooseNoticeSelect">
        <option value="0" disabled>개수 선택</option>
        <option value="1">10개</option>
        <option value="2">30개</option>
        <option value="3">50개</option>
        <option value="4">100개</option>
    </select>
</div>
<div class="container">
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
	<div class="form-group">
		<button type="button" class="btn btn-info" onclick="NoticeWrite()">글쓰기</button>		
	</div>
</div>