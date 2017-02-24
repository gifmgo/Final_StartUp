<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="container">
	<div class="demo-row typography-row">
		<div class="demo-title">
			<h3 class="demo-panel-title">토론하기</h3>
		</div>
		<div class="demo-content text-center">
			<div class="demo-type-example">
	      		<span class="demo-text-note">현재 키워드는 최순실 입니다.</span>
	          <blockquote>
	          	<small class="text-center" style="margin-top:5%;">변경하실 키워드와 영상주소를 입력하세요</small>
	          </blockquote>
      		</div>
		</div>

      <div class="row">
      <form action="insertSubject.do" method="POST" id="insertSubjectForm">     
           <div class="col-md-offset-4 col-md-4">
			  <div class="form-group">
				   <div class="input-group">
	    				<span class="input-group-addon">첫번째 영상</span><input type="text" class="form-control" id="firstvideo" name="firstvideo" placeholder="유투브 주소를 입력해주세요">
            	   </div>  
			  </div>
			  <div class="form-group">
				   <div class="input-group">
	    				<span class="input-group-addon">두번째 영상</span><input type="text" class="form-control" id="secondvideo" name="secondvideo" placeholder="유투브 주소를 입력해주세요">
	    		   </div>
	    	  </div>
			  <div class="form-group">
	               <div class="input-group">
              		<input type="text" class="form-control" id="admin_debate_debateword" name="admin_debate_debateword" placeholder="키워드를 등록해주세요">
              			<span class="input-group-btn">
                			<button class="btn btn-default" type="submit">등록</button>
              			</span>
            	   </div>
	          </div>
		   </div>
	   </form>	   
	   </div>
	   <hr/>
	   
	   <div class="demo-content">
			<div class="demo-type-example">
	      		<span class="demo-text-note"></span>
	          <blockquote>
	          	<p class="text-center" style="margin-top:5%;">토론 게시판 보러가기</p>
	          </blockquote>
      		</div>
		</div>
	   	
	   	<div class="row text-center">
	   		<div class="col-md-offset-4 col-md-4">
				<input type="button" class="btn btn-primary" value="게시글보기" onclick="AdminDebateList();">
			</div>
	   </div>
	   
	   	
	</div>
</div>
