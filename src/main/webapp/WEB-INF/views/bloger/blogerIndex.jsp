<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="container">
	<div class="row">
		<br/><br/>
		<div class="col-md-12 text-center">
			<div class="row">
				<div class="col-md-12">
					 <div class="col-md-2">
						<div class="well customWell2">
							 <img src="blog/${profileImg}" alt="${profileId} 님" class="img-circle" width="100px;"/><br/><br/>
							 <p>글쓴이 :${profileId}</p> 
							 <a href="${mainUrl}" class="btn btn-success">블로그</a>
						 </div>
					 </div>
					 
					 <div class="col-md-2">
						 <div class="well customWell2">
							 <img src="blog/${profileImg}" alt="${profileId} 님" class="img-circle" width="100px;"/><br/><br/>
							 <p>글쓴이 :${profileId}</p> 
							 <a href="${mainUrl}" class="btn btn-success">블로그</a>
						 </div>
					 </div>
					 
					 <div class="col-md-2">
						 <div class="well customWell2">
							 <img src="blog/${profileImg}" alt="${profileId} 님" class="img-circle" width="100px;"/><br/><br/>
							 <p>글쓴이 :${profileId}</p> 
							 <a href="${mainUrl}" class="btn btn-success">블로그</a>
						 </div>
					 </div>
					 
					 <div class="col-md-2">
						 <div class="well customWell2">
							 <img src="blog/${profileImg}" alt="${profileId} 님" class="img-circle" width="100px;"/><br/><br/>
							 <p>글쓴이 :${profileId}</p> 
							 <a href="${mainUrl}" class="btn btn-success">블로그</a>
						 </div>
					 </div>
				</div>
			</div>
			<div class="row">	
				<div class="col-md-12">
					
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
									<td class="text-center">${list.posting_title}</td>
									<td class="text-center">${list.posting_date}</td>
								</tr>
								<tr>	
									<td class="text-center"><img src="blog/${list.bloger_img}" class="img-circle" width="50px;"></td>
									<td class="text-center"><input type="hidden" value="${list.posting_seq}"></td>
									<td class="text-center">${list.posting_title}</td>
									<td class="text-center">${list.posting_date}</td>
								</tr>
								<tr>	
									<td class="text-center"><img src="blog/${list.bloger_img}" class="img-circle" width="50px;"></td>
									<td class="text-center"><input type="hidden" value="${list.posting_seq}"></td>
									<td class="text-center">${list.posting_title}</td>
									<td class="text-center">${list.posting_date}</td>
								</tr>
								</c:forEach>
								</tr>			
							</tbody>
						</table>
						
						<ul class="pagination">
						  <li><a href="#">1</a></li>
						  <li class="active"><a href="#">2</a></li>
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