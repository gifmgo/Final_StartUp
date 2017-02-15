<!--  
	작성자 : 박성준
	작성일 : 2016-12-19
	목  적 : 로그인 및 회원가입시 사용
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
<link rel="stylesheet" type="text/css" href="debate/final_header3_0119.css">
<link rel="stylesheet" type="text/css" href="css/icon.css">
<!-- <link rel="stylesheet" type="text/css" href="debate/debate_0203.css"> -->
<link rel="stylesheet" type="text/css" href="loading/loading.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="js/jquery-3.1.1.min.js"></script>
<script src="css/main_header_modify0213.js"></script>
<script src="js/jquery.tubular.1.0.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>개발자 포럼</title>
<script>
$("document").ready(function(){
	$('#loading_form').css("display","none");
});
</script>
</head>
<body>
	<div id="loading_form">
        <div id="loading"></div>
        <p>Loading...</p>  
    </div> 
    
	<!-- Header -->
	<tiles:insertAttribute name="header" />
	<!-- Main Wrapper -->
	<tiles:insertAttribute name="content" />
	<!--풋터-->
	<tiles:insertAttribute name="footer" />

</body>
</html>