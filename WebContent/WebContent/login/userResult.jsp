<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<body>
	<script>
		console.log("여기");
		if(${proc=="login"}) {
			if(${loginResult==true}) {
				console.log("로그인 성공");
				if(${sessionScope.user.block == "y"}) {
					location.href = "errorBlock.jsp";
				} else if(${sessionScope.user.block == "n" || sessionScope.user.block =='x'}) {
					location.href="main.bo";
				}
				
			} else {
				console.log("로그인 실패");
				location.href="newlogin.jsp";
			}
		} else if(${proc=="join"}){
			if(${joinResult==1}) {
				alert("가입 성공");
				location.href="newlogin.jsp";
			} else {
				alert("가입 실패");
				location.href="newlogin.jsp";
			}
		}
	
	</script>

</body>
</html>