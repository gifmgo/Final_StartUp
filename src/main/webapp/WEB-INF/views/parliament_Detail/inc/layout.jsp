<!--  
	작성자 : 박성준
	작성일 : 2016-12-19
	목  적 : 국회의원 상세 정보 보는 페이지
-->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>  
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">	
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="css/final_header3_0119.css">
<link rel="stylesheet" type="text/css" href="paliament/final_sub4_0125.css">
<link rel="stylesheet" href="css/WriteForm.css">

<link rel="stylesheet" type="text/css" href="css/icon.css">
<script src="js/jquery-3.1.1.min.js"></script>
<!--ck 에디터 -->
<script type="text/javascript" src="ckeditor/ckeditor.js"></script>
<script src="css/main_header_modify0120.js"></script>
<script src="paliament/paliamentTalk.js"></script>
<title>의원 상세 정보</title>
</head>
<body>

	<!-- Header -->
	<tiles:insertAttribute name="header" />
	
	<!-- Main Wrapper -->
	<tiles:insertAttribute name="content" />
	
<!--풋터-->
	<tiles:insertAttribute name="footer" />

</body>
</html>