<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<div class="container">
	 <div class="demo-row typography-row">
			<div class="demo-title">
				<ul class="nav nav-tabs">
				  <li class="active"><a href="AdminBanUserList.do">차단 유저 관리</a></li>
				  <li><a href="BanUserMail.do">문의 메일</a></li>
				  <li><a href="AdminPointPlus.do">포인트추가</a></li>
				</ul>
			</div>
	 </div>	
	 <br>	
</div>
  <div class="container">
   		<div class="form-group col-md-offset-5 col-md-7">
			<button type="button" class="btn btn-info" onclick="deleteBan()">차단해제하기</button>
			<button type="button" class="btn btn-danger" onclick="ban()">차단하기</button>		
		</div>
  </div>
<div class="container">
  <div class="row">
  	<div class="col-sm-12">
  		<div class="table-responsive">
  			<table class="table table-hover">
		     <thead>
		     	<tr>
			       <th><label class="checkbox" for="banallCheck"><input type="checkbox" id="banallCheck" data-toggle="checkbox"></label></th>
			       <th>No</th>
			       <th>아이디</th>
			       <th>닉네임</th>
			       <th style="text-align: center;">차단여부</th>
		     	</tr>
		     </thead>
		     <tbody id="banUserList">
		       <c:forEach var="list" items="${userlist}" varStatus="status">
		       	 <tr>
			         <td><label class="checkbox"><input type="checkbox" class="b_checkbox" data-toggle="checkbox" id="${list.id}"></label></td>
			         <td>${status.count}</td>
			         <td>${list.id}</td>
			         <td>${list.nickname}</td>
			         <c:choose>
			          <c:when test="${list.banUserId !=null}">
			             	<td style="text-align: center;"><span class="glyphicon glyphicon-remove" style="font-size: 32px; color: red"></span></td>
			          </c:when>
			          <c:otherwise>
			              <td></td>
			          </c:otherwise>
			         </c:choose>
			     </tr>
		       </c:forEach>
		     </tbody>
		  </table>  
		</div>
  	</div>
  </div>
</div>  