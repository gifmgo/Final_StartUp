<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<link rel="stylesheet" type="text/css" href="css/sub05.css">
<script src="//cdn.ckeditor.com/4.6.1/standard/ckeditor.js"></script>
<script type="text/javascript" src="js/writeView.js"></script>

<div id="wrap">
   	<h1>글쓰기</h1>
   	
   	<form action="writelife.do" method="POST" id="writeForm" enctype="multipart/form-data" onkeydown="return captureReturnKey(event)">
	   	<select id="category" name="category">
   			<option>일상</option>
   			<option>연예</option>
   			<option>고민</option>
   			<option>영상</option>
	   	</select>
	   	<div id="title">
	        <input type="text" name="title" placeholder="제목을 입력하세요">
	    </div>
	    <div id="file" style="display: none">
           	<input type="file" name="uploadfile" id="uploadfile">
        </div>
        <div id="img">
        	<input type="hidden" name="img">
        </div>
	    <div id="content">
	      	<textarea id="ckeditor" name="ckeditor" required></textarea>
	    </div>
	    <div id="btArray">
	    	<button type="button" onclick="successImg()">확인</button>
	    	<button type="button" onclick="writeContent()">작성완료</button>
	    	<button onclick="location.href='life.do?category=${category}&currentpage=${currentpage}'">취소</button>
	    </div>
    </form>
</div>
