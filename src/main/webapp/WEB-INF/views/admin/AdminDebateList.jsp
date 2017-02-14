<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<div class="container">
	<div class="demo-row typography-row">
		<div class="demo-title">
			<h3 class="demo-panel-title">토론하기</h3>
		</div>
		<div class="demo-content text-center">
			<div class="demo-type-example">
	      		<span class="demo-text-note"></span>
	          <blockquote>
	          	<p style="margin-top:5%;">현재 키워드는 <span style="color: red;">최순실</span>입니다.</p>
	          </blockquote>
      		</div>
		</div>
		<div class="form-group col-md-offset-5 col-md-7">
			<button type="button" class="btn btn-info" onclick="NoticeWrite()">글쓰기</button>
			<button type="button" class="btn btn-danger" onclick="NoticeDelete()">글삭제</button>		
		</div>
	</div>
</div>
<hr/>
<div class="container">
	<select data-toggle="select" class="form-control select select-success mrs mbm" id="chooseNoticeSelect">
		<option value="0" disabled>키워드 선택</option>
		<option>선택</option>
		<option>최순실</option>
	</select>
	<select data-toggle="select" class="form-control select select-success mrs mbm" id="chooseNoticeSelect">
        <option value="0" disabled>개수 선택</option>
        <option>선택</option>
        <option value="1">10개</option>
        <option value="2">30개</option>
        <option value="3">50개</option>
        <option value="4">100개</option>
    </select>
    <input type="submit" value="검색" class="btn btn-warning">
</div>
<div class="container">
	<div class="table-responsive">
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