<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
*{
text-align: center;
}
fieldset{
width:30%;
margin: 200px auto;
}
h1{
color:red;
font-weight: 300;
}
h5{
color:black;
font-weight: 100;
}
</style>
</head>
<body>
	<fieldset>
	<legend><h1>Naver 또는 KaKao를 통해 로그인하셨습니다</h1></legend>
	<hr>
	<h5>수정 사항은 Travel Maker 안에서만 활용하며,<br>기타 용도로는 활용하지 않습니다</h5>
	<h5>3초 후 자동으로 정보 변경 페이지로 전환됩니다</h5>
	</fieldset>
	<script>
		//setTimeout(함수,시간); 시간후 함수를 실행한다.
		setTimeout(function() {
			location.href = "editInfoNK.do";
		}, 3000);
	</script>
</body>
</html>