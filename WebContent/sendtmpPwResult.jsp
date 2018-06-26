<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:choose>
	
	<c:when test="${mailResult==true}">
		<div class="alert alert-success" role="alert">이메일로 임시비밀번호가
			전송되었습니다.</div>
		<script>login.href="newlogin.jsp";</script>
	</c:when>
	<c:otherwise>
	<div class="alert alert-danger" role="alert">다시 시도해주세요.</div>
	</c:otherwise>
	</c:choose>
</body>
</html>