<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="container-fluid">
	<div class="demo-content text-center">
    	<div class="demo-type-example">
     		<h1><span class="demo-heading-note">어서 오세요 관리자님 !!</span></h1>
    	</div>
	</div>    		
</div>
<br/>
<div class="container" style="margin-top: 5%;">
	 <div class="row">
        <div class="col-lg-12">
          <div class="row">
           	  <div class="col-xs-12 col-sm-4 col-md-3 col-lg-3">
	              <div class="tile">
	              	<span class="fui-calendar" style="font-size: 60px;"></span>
	                <h3 class="tile-title">공지사항</h3>
	                <p></p>
	              	<button class="btn btn-primary btn-large btn-block" onclick="noticeAdmin();">메뉴보기</button>
	              </div>
	          </div>
	            <div class="col-xs-12 col-sm-4 col-md-3 col-lg-3">
	              <div class="tile">
	                <span class="fui-chat" style="font-size: 60px;"></span>
	                <h3 class="tile-title">토론주제</h3>
	                <p></p>
	                <button class="btn btn-primary btn-large btn-block" onclick="debateAdmin()">메뉴보기</button>
	              </div>
	            </div>
	            <div class="col-xs-12 col-sm-4 col-md-3 col-lg-3">
	              <div class="tile">
	                <span class="fui-user" style="font-size: 60px;"></span>
	                <h3 class="tile-title">유저보기</h3>
	                <p></p>
	                <button class="btn btn-primary btn-large btn-block" onclick="banUser()">메뉴보기</button>
	              </div>
	            </div>
	             <div class="col-xs-12 col-sm-4 col-md-3 col-lg-3">
	              <div class="tile">
	                <span class="fui-calendar" style="font-size: 60px;"></span>
	                <h3 class="tile-title">게시판</h3>
	                <p></p>
	                <button class="btn btn-primary btn-large btn-block">메뉴보기</button>
	              </div>
	            </div>

    		</div>
    	</div>
    </div>
</div>
<div class="container">
	<div class="row">
        <div class="col-lg-12">
          <div class="row">
           	  <div class="col-xs-12 col-sm-4 col-md-3 col-lg-3">
	              <div class="tile">
	              	<span class="fui-gear" style="font-size: 60px;"></span>
	                <h3 class="tile-title">접속자 수</h3>
	                <p></p>
	              	<button class="btn btn-primary btn-large btn-block" onclick="UserCount();">메뉴보기</button>
	              </div>
	          </div>
	          <div class="col-xs-12 col-sm-4 col-md-3 col-lg-3">
	              <div class="tile">
	              	<span class="fui-new" style="font-size: 60px;"></span>
	                <h3 class="tile-title">포인트 메뉴</h3>
	                <p></p>
	              	<button class="btn btn-primary btn-large btn-block" onclick="PointQuiz();">메뉴보기</button>
	              </div>
	          </div>
	 		</div>
	 	</div>
    </div>
</div>
