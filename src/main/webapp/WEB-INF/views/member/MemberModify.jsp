<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    

<input type="hidden" id="nick" value="${dto.nickName}">
<!--중복검사해야지 값들어감 -->
<input type="hidden" id="short_btn_hidden">

<div class="container">
	
	<div class="row">
		
		<div class="col-md-12 memberModifyDiv">
			
			<div class="modifyArticle">
			
				<h4 class="text-center">개인 정보 수정</h4>
				<hr/>
				
				<div class="well myCustomWell">
					
					<form class="form-horizontal" method="POST" id="modifySubmitForm">
					  <div class="form-group">
					  	<div class="col-sm-offset-3">
						    <label class="control-label col-sm-2" for="id">아이디</label>
						    <div class="col-sm-4">
						      <input type="text" class="form-control" id="id" name="id" value="${dto.id}" disabled="disabled">
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
				      				<input type="text" class="form-control" id="newnickName" name="nickName" placeholder="닉네임을 입력해주세요" value="${dto.nickName}">
					    		</div>
					    		<div class="col-sm-4">
					    			<input type="button" class="btn btn-success" value="닉네임 중복확인" onclick="checkNickName();">
					    		</div>
					    </div>
					  </div>
					  
					 <div class="form-group">
					  	<div class="col-sm-offset-3">
					    	<label class="control-label col-sm-2" for="birth">생년월일</label>
				    			<div class="col-sm-4"> 
				      				<input type="text" class="form-control" id="birth" name="birth" value="${dto.birth}" disabled="disabled">
					    		</div>
					    </div>
					  </div>
					  
					  <div class="form-group">
					  	<div class="col-sm-offset-3">
					    	<label class="control-label col-sm-2" for="gender">성별</label>
				    			<c:choose>
				    				<c:when test="${dto.gender eq 'm'}">
				    					<div class="col-sm-4"> 
				    						<label class="form-control">남자</label>	
							    		</div>		
				    				</c:when>
				    				<c:otherwise>
				    					<div class="col-sm-4"> 
				    						<label class="form-control">여자</label>
							    		</div>		
				    				</c:otherwise>
				    			</c:choose>
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
					  <div class="form-group"> 
					    <div class="col-sm-offset-4 col-sm-6">
					      <button type="button" class="btn btn-default" style="margin-left:8%;" onclick="modifyFunc()">수정하기</button>
					    </div>
					  </div>
					</form>
					
				</div>
				
			</div>
			
		</div>
		
	</div>	
	
</div>

