<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="${path}/css/test.css" rel="stylesheet" type="text/css"/>
</head>
<body>
	<h1>index</h1>
	
	<script type="text/javascript" src="${path}/js/test.js"></script>
	
	<a href="GB_MakeBoard">게시판작성 눌러봐</a>
	<a href="GB_BulletinBoard">게시판 눌러봐</a>
</body>
</html>