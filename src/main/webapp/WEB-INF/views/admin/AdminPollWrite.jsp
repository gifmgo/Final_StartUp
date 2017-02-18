<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="container-fluid">
	<div class="row">
		<h4 class="text-center">설문지를 작성해주세요!</h4>
		<div class="col-md-2">
			<ul class="list-group">
			  <li class="list-group-item" id="addPollLi">문제추가<span class="badge">+</span></li> 
			</ul>
		</div>
		<form class="form-horizontal">
		<div class="col-md-offset-1 col-md-8" id="pollListDiv">
			<div class="well pollWell">
				<div class="dropdown">
				  <button class="btn btn-primary dropdown-toggle" type="button" data-toggle="dropdown">메뉴
				  <span class="caret"></span></button>
				  <ul class="dropdown-menu">
				    <li><a href="#">단답형</a></li>
				    <li><a href="#">체크박스</a></li>
				    <li><a href="#">객관식</a></li>
				  </ul>
				</div>
				<div class="pollStatusDiv">
				   <div class="form-group">
				   		<div class="col-md-12">
				   			<input type="text" class="form-control" placeholder="질문">
				   		</div>
				   </div>
			      <div class="radio">
				      <label>
				      		<input type="radio" name="optradio">
				      		<input type="text" class="form-control answerInput" placeholder="옵션">
				      </label>
				  </div>
				</div>
			</div>
		</div>
		
		</form>
	</div>
</div>