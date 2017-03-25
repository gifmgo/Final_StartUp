<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String prevURI = request.getHeader("referer");
%>    
<div class="container LoginDiv">
	<div class="row">
		 <div class="form-group">
			<div class="col-md-offset-3 col-md-6 explaineDiv text-center">
				<img alt="생활정치" src="img/logo.png" width="20%;" height="20%;">
			</div>
		 </div>
		 <div class="col-md-12 LoginMainDiv">
			<div class="col-md-offset-3 col-md-6">
				<div class="well customWell">
					<div class="form-group">
						<div class="col-md-12">
							<div class="row">
								<div class="col-md-8">
									<p class="text-left customP">로그인을 해주세요 <br/>
									<span class="customp_Span">아이디와 비밀번호를 입력해주세요</span>
									</p>
								</div>
								<div class="col-md-offset-1 col-md-2 iconCustomDiv">
									<span class="text-right"><i class="material-icons">no_encryption</i></span></p>
								</div>
							</div>
						</div>
					</div>
					
					<form class="form-horizontal customForm" action="LoginPage.do" method="POST" id="newLoginForm">
					  <input type="hidden" id="prevURI" value="<%=prevURI%>">
					  <div class="form-group">
					    <div class="col-sm-12">
					      <input type="email" class="form-control customInput" id="email" name="id" placeholder="Enter email" required="required">
					    </div>
					  </div>
					  
					  <div class="form-group">
					    <div class="col-sm-12"> 
					      <input type="password" class="form-control customInput" id="pwd" name="pw" placeholder="Enter password" required="required">
					    </div>
					  </div>
					  
					  <div class="form-group">
					    <div class="col-sm-12"> 
					      <label class="form-control btn btn-default customInput" id="loginSubmitLabel">로그인</label>
					    </div>
					  </div>
					</form>
					
					<div class="row">
						<div class="col-sm-12 text-center">
							<a href="index.do" class="btn btn-info">Home</a>
							<a href="#" class="btn btn-info">아이디찾기</a>
							<a href="addMember.do" class="btn btn-info">회원가입</a>
						</div>
					</div>
					
				</div>
			</div>
		</div>
	</div>
</div>

