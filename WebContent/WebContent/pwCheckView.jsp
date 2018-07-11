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
		 opener.location.href="homeMemInfo.do";
	 	close(); 
	 
	 /* location.href="homeMemInfo.do"; */
}else{
	alert("비밀번호가 일치하지 않습니다 \n\t다시입력해주세요");
	/* opener.location.href="mypage.do";
	 close(); */ 
 location.href="toPwCheck.do";
}
</script>
</body>
</html>