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
	<c:choose>
		<c:when test="${proc==login}">
			<c:choose>
				<c:when test="${loginResult==true}">
					<script>
						alert("�α��� ����");
						location.href = "index.jsp";
					</script>
				</c:when>
				<c:otherwise>
					<script>
						alert("�α��� ����");
						location.href = "login.jsp";
					</script>
				</c:otherwise>
			</c:choose>
		</c:when>
		<c:otherwise>
			<c:choose>
				<c:when test="${addResult==1}">
					<script>
						alert("������ �����մϴ�! �α������ּ���");
						location.href = "login.jsp";
					</script>
				</c:when>
				<c:otherwise>
					<script>
						alert("�ٽ� �õ��� �ּ���.");
						location.href = "login.jsp";
					</script>
				</c:otherwise>
			</c:choose>
		</c:otherwise>
	</c:choose>

</body>
</html>