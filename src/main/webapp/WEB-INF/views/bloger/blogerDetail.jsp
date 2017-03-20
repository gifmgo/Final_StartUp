<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<div class="container">
	<div class="row">
		<br/><br/>
		<div class="col-md-12">
			<div class="well customWell2">
				<div class="form-group text-center">
					<div class="row">
						<div class="col-md-2">
							<i class="material-icons" style="font-size:36px" id="backIcon">backspace</i>
						</div>
						<div class="col-md-8">
							<label class="text-center conetntLabel"><img src="blog/${dto.bloger_img}" class="img-circle" width="60px;"></label><br/>
						</div>
					</div>
				</div>
				<div class="form-group text-center">
					<label class="text-center conetntLabel">글쓴이 : ${dto.posting_id} </label><br/>
					<label class="text-center conetntLabel">제목 : ${dto.posting_title}</label><br/>
					<label class="text-center conetntLabel">날짜 : ${dto.posting_date}</label><br/>
				</div>
				<hr/>
				<div class="form-group text-center">
					<label class="conetntLabel2">내용  <br/>${dto.posting_content}</label>
				</div>
				<div class="form-group text-center">
					<a href="${dto.posting_url}" target="_blank" class="btn btn-success">원본글 보기</a>
				</div>
			</div>
			
		</div>
	</div>
</div>