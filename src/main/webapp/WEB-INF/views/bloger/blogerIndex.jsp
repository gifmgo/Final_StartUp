<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="container">
	<div class="row">
		<br/><br/>
		<div class="col-md-12 text-center">
			<div class="row">
				<div class="col-md-12">
					 <div class="form-group">
					 	<label class="text-center"><span><i class="fa fa-edit" style="font-size:36px"></i></span>현재 기재중인 유저분</label>
					 	<hr/>
				     </div>
				     <c:forEach var="bloger" items="${blogerId_List}">
				     	 <div class="col-md-2">
							<div class="well customWell2">
								 <img src="blog/${bloger.bloger_img}" alt="${bloger.bloger_id} 님" class="img-circle" width="100px;" height="100px;"/><br/><br/>
								 <p>글쓴이 :${bloger.bloger_id}</p> 
								 <a href="${bloger.bloger_mainUrl}" class="btn btn-success" target="_blank">블로그</a>
							 </div>
						 </div>
				     </c:forEach>
				</div>
			</div>
			<hr/>
			<div class="row">	
				<div class="col-md-12">
					    <div class="form-group">
					    	<div class="col-md-offset-10 col-md-2">
						    	<select class="form-control">
						    		<option>선택</option>
						    		<c:forEach var="blogerId" items="${blogerId_List}">
						    			<option value="${blogerId.bloger_id}">${blogerId.bloger_id}</option>
						    		</c:forEach>
						    	</select>
					    	</div>
					    </div>
					    <br/><br/>
						<table class="table">
							<thead>
							<tr>
								<th class="text-center">글쓴이</th>
								<th/>
								<th class="text-center">제목</th>
								<th class="text-center">날짜</th>
							</tr>
							</thead>
							<tbody>
								<c:forEach var="list" items="${list}">
								<tr>
									<td class="text-center"><img src="blog/${list.bloger_img}" class="img-circle" width="50px;"></td>
									<td class="text-center"><input type="hidden" value="${list.posting_seq}"></td>
									<td class="text-center"><a href="blogContentDetail.do?seq=${list.posting_seq}">${list.posting_title}</a></td>
									<td class="text-center">${list.posting_date}</td>
								</tr>
								</c:forEach>
							</tbody>
						</table>
						
						<ul class="pagination">
						  <li class="active"><a href="#">1</a></li>
						  <li><a href="#">2</a></li>
						  <li><a href="#">3</a></li>
						  <li><a href="#">4</a></li>
						  <li><a href="#">5</a></li>
						</ul>
				</div>
			</div>
			<br/><br/><br/><br/><br/><br/><br/><br/>
		</div>
	</div>
</div>