<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<script>
if(${result}>0){
	alert("회원 정보 수정이 완료되었습니다");
	location.href ="mypage.do";
}else{
	alert("접근 경로가 잘못되었습니다");
	location.href = "error.jsp";
}
</script>
</body>
</html>