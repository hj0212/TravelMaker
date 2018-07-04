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
	location.href ="mypage.do?user_seq="+"${user_seq}";
	console.log("넘어옴");
}else{
	alert("프로필이미지 변경을 실패하였습니다 \n\t관계자에게 문의해주세요");
	location.href ="mypage.do?user_seq="+"${user_seq}";
}
</script>
</body>
</html>