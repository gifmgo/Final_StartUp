<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="container">
	 <div class="demo-row typography-row">
			<div class="demo-title">
				<h3 class="demo-panel-title">퀴즈</h3>
			</div>
	 </div>	
	 <hr>
	 <div class="row">
	   <div class="col-sm-12">
	   		<form class="form-horizontal" action="QuizForm.do" id="quizForm" method="post">
	   		<div class="row">
	   			<div class="col-md-8">
	   				<div class="form-group">
		   				<label class="control-label col-md-offset-2 col-md-4 text-right">문제</label>
		   				<div class="col-md-6">
				   			<input type="text" class="form-control" id="question" name="question">
				   		</div>
		   			</div> 			
		   			
		   			<div class="form-group">
		   				<label class="control-label col-md-offset-2 col-md-4 text-right">보기 1</label>
		   				<div class="col-md-6">
				   			<input type="text" class="form-control" id="option1" name="option1">
				   		</div>
		   			</div>
		   			
		   			<div class="form-group">
		   				<label class="control-label col-md-offset-2 col-md-4 text-right">보기 2</label>
		   				<div class="col-md-6">
				   			<input type="text" class="form-control" id="option2" name="option2">
				   		</div>
		   			</div>
		   		
		   			<div class="form-group">
		   				<label class="control-label col-md-offset-2 col-md-4 text-right">보기 3</label>
		   				<div class="col-md-6">
				   			<input type="text" class="form-control" id="option3" name="option3">
				   		</div>
		   			</div>
		   		</div>
	   		</div>
	   		<br/>
	   		<hr/>
	   		<div class="row">
	   			<div class="col-md-8">
		   			<div class="form-group">
			   				<label class="control-label col-md-offset-2 col-md-4 text-right">정답</label>
			   				<div class="col-md-6">
					   			<input type="text" class="form-control" id="answer" name="answer">
					   		</div>
			   		</div>
			   
			   		<div class="form-group">
			   			<div class="col-md-offset-8 col-md-4">
			   				<input type="button" class="btn btn-success" value="작성" id="quizFormButton">
			   			</div>
			   		</div>
			   		
		   		</div>
	   		</div>
	   		</form>
	   </div>
	   
	 </div>
	 	
</div>