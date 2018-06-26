<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
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
	<c:when test="${checkEmailResult==0}">
		<div class="alert alert-warning" role="alert">존재하지 않는 아이디입니다.</div>
		<script>
		location.href="newlogin.jsp";
		</script>		
	</c:when>
	<c:when test="${checkEmailResult==10}">
		<div class="alert alert-warning" role="alert">가입 시 입력하신 이메일이 아닙니다.</div>	
		<script>
		location.href="newlogin.jsp?id=${inputid}";
		</script>		
	</c:when>
	<c:when test="${checkEmailResult==11}">
		location.href="sendtmpPw.do?id=${inputId}&email=${inputEmail}";
		
			
	</c:when>
	
</c:choose>


</body>
</html>