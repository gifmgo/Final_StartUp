<!-- 
	작성일 : 2017-02-18
	목  적 : 설문지 작성하는 페이지.
	작성자 : 박성준 
 -->
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
			<div class="well pollWell" id="firstWell">			
				<div class="pollStatusDiv">
				   	   	<div class="form-group col-md-2 customSelectDiv">
							  <select class="form-control customSelect" id="sel1"  onchange="selectChange(this.options[this.selectedIndex].value, $(this));">
							    <option value="1">단답형</option>
							    <option value="2">체크박스</option>
							    <option value="3">객관식</option>
							  </select>
						</div>	
					   <div class="form-group">
					   		<div class="col-md-12">
					   			<input type="text" class="form-control" placeholder="질문">
					   		</div>
					   </div>
				      <div class="form-group">
				      	<div class="col-md-12">
				      		<div class="input-group">
				      				<span class="input-group-addon chooseDiv"></span>
			      		    		<input type="text" class="form-control answerInput" placeholder="옵션">
						    		<span class="input-group-addon" onclick="plusSpan($(this));"><i class="glyphicon glyphicon-plus"></i></span>
						    </div>
						</div>
				     </div>
				</div>
			</div>
		</div>
		
		</form>
	</div>
</div>