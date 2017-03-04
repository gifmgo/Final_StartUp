<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="container LoginDiv">
	<div class="row">
		<!-- <div class="form-group">
			<div class="col-md-offset-3 col-md-6 explaineDiv text-center">
				<label class="titleLabel">생활정치</label>
				<p>재미있는 정치, 직접 찾아보고 알아가는 정치</p>
				<p>다양한 정보가 있는 생활정치에 오신 여러분들을 환영합니다.</p>
			</div>
		</div> -->
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
									<p class="text-left customP">로그인을 해주세요<br/>
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
						<div class="col-md-offset-1 col-md-3">
							<a href="index.do">Home</a>
						</div>
						<div class="col-md-offset-1 col-md-3">
							<a href="#">아이디 찾기</a>
						</div>
						<div class="col-md-offset-1 col-md-3">
							<a href="#">회원가입</a>
						</div>
					</div>
					
				</div>
			</div>
		</div>
	</div>
</div>

