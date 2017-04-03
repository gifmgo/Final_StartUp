<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<link rel="stylesheet" type="text/css" href="css/sub05.css">
<script src="//cdn.ckeditor.com/4.6.1/standard/ckeditor.js"></script>
<script type="text/javascript" src="js/writeView.js"></script>
<div id="wrap">
   	<h1>글 수정</h1>
   	
   	<form action="boardModify.do" method="POST" id="writeForm" enctype="multipart/form-data">
	   	<input type="hidden" name="no" value="${dto.no }">
	   	<input type="hidden" name="id" value="${dto.id }">
	   	<select id="category" name="category">
	   	<c:if test="${dto.category eq '일상'}">
   			<option selected="selected">일상</option>
   			<option>연예</option>
   			<option>고민</option>
   			<option>영상</option>
	   	</c:if>
	   	<c:if test="${dto.category eq '연예'}">
   			<option>일상</option>
   			<option selected="selected">연예</option>
   			<option>고민</option>
   			<option>영상</option>
	   	</c:if>
	   	<c:if test="${dto.category eq '고민'}">
   			<option>일상</option>
   			<option>연예</option>
   			<option selected="selected">고민</option>
   			<option>영상</option>
	   	</c:if>
	   	<c:if test="${dto.category eq '영상'}">
   			<option>일상</option>
   			<option>연예</option>
   			<option>고민</option>
   			<option selected="selected">영상</option>
	   	</c:if>
	   	</select>
	   	<div id="title">
	        <input type="text" name="title" value="${dto.title }">
	    </div>
	    <div id="file" style="display: none">
           	<input type="file" name="uploadfile" id="uploadfile">
        </div>
	    <div id="content">
	      	<textarea id="ckeditor" name="ckeditor" required>${dto.content }</textarea>
	    </div>
	    
	    <div id="btArray">
	    	<button onclick="contentMod()">등록</button>
	    	<button onclick="location.href='board.do?category=${category}&currentpage=${currentpage}'">취소</button>
	    </div>
    </form>
</div>
