<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div id="dataView">
	<c:forEach var="list" items="${list}">
		<div>${list.no } // ${list.adate} // ${list.todayTotalUser} // ${list.totalUser} </div>
	</c:forEach>
</div>