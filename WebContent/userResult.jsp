<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<script>
		if(${proc=="login"}) {
			if(${loginResult==true}) {
				console.log("�α��� ����");
				location.href="main.jsp";
			} else {
				console.log("�α��� ����");
				location.href="newlogin.jsp";
			}
		} else if(${proc=="join"}){
			if(${joinResult==1}) {
				console.log("���� ����");
				location.href="newlogin.jsp";
			} else {
				console.log("���� ����");
				location.href="newlogin.jsp";
			}
		}
	
	</script>

</body>
</html>