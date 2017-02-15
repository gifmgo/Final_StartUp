<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="container">
	<div class="demo-row typography-row">
		<div class="demo-title">
			<h3 class="demo-panel-title">토론하기</h3>
		</div>
		<div class="demo-content">
			<div class="demo-type-example">
	      		<span class="demo-text-note"></span>
	          <blockquote>
	          	<p style="margin-top:5%;">현재 키워드는 <span style="color: red;">최순실</span>입니다.</p>
				<p class="text-center" style="margin-top:5%;">키워드를 입력하세요</p>
	          </blockquote>
      		</div>
		</div>


      <div class="row" style="margin-top:5%;">
           <div class="col-md-offset-4 col-md-4">
			  <div class="form-group has-success">
	               <div class="input-group">
              		<input type="text" class="form-control">
              			<span class="input-group-btn">
                			<button class="btn btn-success" type="button">등록</button>
              			</span>
            	</div>  
	          </div>
		   </div>
	   </div>
	   
	   <div class="row text-center">
	   		<div class="col-md-offset-4 col-md-4">
				<input type="button" class="btn btn-primary" value="게시글보기" onclick="AdminDebateList();">
			</div>
	   </div>
	</div>
</div>
