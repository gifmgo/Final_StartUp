<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="flatUi/dist/css/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<!-- Loading Flat UI -->
<link href="flatUi/dist/css/flat-ui.min.css" rel="stylesheet">
<link href="css/poll/Poll_0218_02.css" rel="stylesheet">
<link rel="shortcut icon" href="flatUi/dist/img/favicon.ico">
<link href="admin/AdminUi.css" rel="stylesheet">
<title>Insert title here</title>
</head>
<body>
	<!-- Header -->
	<tiles:insertAttribute name="header"/>
	<!-- Main Wrapper -->
	<tiles:insertAttribute name="content"/>
	<!--풋터-->
	<%-- <tiles:insertAttribute name="footer"/> --%>
	
	<!-- jQuery (necessary for Flat UI's JavaScript plugins) -->
    <script src="flatUi/dist/js/vendor/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="flatUi/dist/js/vendor/video.js"></script>
    <script src="flatUi/dist/js/flat-ui.min.js"></script>
    <script src="flatUi/assets/js/application.js"></script>
	<script src="admin/Admin_0307.js"></script>
	<script src="admin/Admin_Poll_Notice_0220.js"></script>
</body>
</html>