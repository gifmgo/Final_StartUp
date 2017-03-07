<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<input type="hidden" id="hidden_nick">
<!-- 아이디 중복검사 결과 값  -->
<input type="hidden" id="hidden_id">
<!--중복검사해야지 값들어감 -->
<input type="hidden" id="short_btn_hidden">

<div class="container">
	
	<div class="row">
		
		<div class="col-md-12 memberModifyDiv">
			
			<div class="modifyArticle">
			
				<h4 class="text-center">회원 가입</h4>
				<hr/>
				
				<div class="well myCustomWell">
					
					<form class="form-horizontal" method="POST" id="addSubmitForm">
					  <div class="form-group">
					  	<div class="col-sm-offset-3">
						    <label class="control-label col-sm-2" for="id">아이디</label>
						    <div class="col-sm-4">
						      <input type="email" class="form-control" id="id" name="id" placeholder="이메일을 입력해주세요">
						    </div>
						    <div class="col-sm-4">
					    		<input type="button" class="btn btn-success" value="아이디 중복확인" onclick="checkDbId();">
					    	</div>
					    </div>
					  </div>
					  <div class="form-group">
					  	<div class="col-sm-offset-3">
					    	<label class="control-label col-sm-2" for="pw">비밀번호</label>
				    			<div class="col-sm-4"> 
				      				<input type="password" class="form-control" id="pw" name="pw" placeholder="비밀번호를 입력해주세요">
					    		</div>
					    </div>
					  </div>
					  
					  <div class="form-group">
					  	<div class="col-sm-offset-3">
					    	<label class="control-label col-sm-2" for="nickName">닉네임</label>
				    			<div class="col-sm-4"> 
				      				<input type="text" class="form-control" id="newnickName" name="nickName" placeholder="닉네임을 입력해주세요">
					    		</div>
					    		<div class="col-sm-4">
					    			<input type="button" class="btn btn-success" value="닉네임 중복확인" onclick="checkDbNick();">
					    		</div>
					    </div>
					  </div>
					  
					 <div class="form-group">
					  	<div class="col-sm-offset-3">
					    	<label class="control-label col-sm-2" for="birth">생년월일</label>
				    			<div class="col-sm-4"> 
				      				<input type="text" class="form-control" id="birth" name="birth" placeholder="19990102">
					    		</div>
					    </div>
					  </div>
					  
					  <div class="form-group">
					  	<div class="col-sm-offset-3">
					    	<label class="control-label col-sm-2" for="gender">성별</label>
		    					<div class="col-sm-4"> 
		    						<div class="radio col-sm-offset-1">
		    							<input type="radio" name="gender" value="m" checked="checked">남자
		    						</div>
		    						<div class="radio col-sm-offset-1">
		    							<input type="radio" name="gender" value="w">여자
		    						</div>
					    		</div>		
					   	 </div>
					  </div>
					  
					  <div class="form-group">
					  	<div class="col-sm-offset-3">
					    	<label class="control-label col-sm-2" for="birth">취미</label>
				    		 <div class="checkbox" id="favoritCheckDiv">
							 	<label><input type="checkbox" id="favorit0" name="favorit2" onclick="checkBox0(this)">경제</label>
							 	<label><input type="checkbox" id="favorit1" name="favorit2" onclick="checkBox1(this)">사회</label>
							 	<label><input type="checkbox" id="favorit2" name="favorit2" onclick="checkBox2(this)">연예</label>
							 	<label><input type="checkbox" id="favorit3" name="favorit2" onclick="checkBox3(this)">스포츠</label>
						     </div>	
						     <input type="hidden" id="member_favorit" name="favorit">
					    </div>
					  </div>
					  <div class="form-group text-center"> 
					    <div class="col-sm-offset-3 col-sm-4 text-center">
					      <button type="button" class="btn btn-default" onclick="addMemberFnc();">가입하기</button>
					    </div>
					  </div>
					</form>
					
				</div>
				
			</div>
			
		</div>
		
	</div>	
	
</div>

    