<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../css/stampButton.css" type="text/css">
<script src="../js/stampButton.js"></script>
</head>
<body>
	<c:forEach var="item" items="${list}">
		<p>${item.no}</p>
		<p>${item.title}</p>
		<p>${item.maintext}</p>
	</c:forEach>
	
	<button id="stamp-button" class="off" onclick="stampbutton()">찜</button>
	
</body>
</html>