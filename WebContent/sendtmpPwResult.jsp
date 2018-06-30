<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css">

<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>

</head>
<body>
	<c:choose>	
	<c:when test="${mailResult==true}">
		<script>
		alert("이메일로 임시비밀번호가전송되었습니다.");
		location.href="newlogin.jsp";</script>
	</c:when>
	<c:otherwise>
	
	<script>
	alert("다시 시도해 주세요.");
	location.href="newlogin.jsp";</script>
	</c:otherwise>
	</c:choose>
</body>
</html>