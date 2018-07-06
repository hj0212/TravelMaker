<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css"
	integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB"
	crossorigin="anonymous">

<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
	integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
	crossorigin="anonymous"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"
	integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"
	crossorigin="anonymous"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"
	integrity="sha384-smHYKdLADwkXOn1EmN1qk/HfnUcbVRZyYmZ4qpPea6sjB/pTJ0euyQp0Mk8ck+5T"
	crossorigin="anonymous"></script>
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.1.0/css/all.css">
<style>
*{
text-align: center;
}
fieldset{
width:30%;
margin: 150px auto;
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
	<legend><h2>Naver 또는 KaKao를 통해 로그인하셨습니다</h2></legend>
	<hr>
	<h5>수정 사항은 Travel Maker 안에서만 활용하며,<br>기타 용도로는 활용하지 않습니다</h5>
	<!-- <h5>3초 후 자동으로 정보 변경 페이지로 전환됩니다</h5> -->
	<h5>확인을 누르면 수정 페이지로 전환됩니다</h5>
	<button class="btn btn-outline-primary" id="toEdit">확인</button>
	</fieldset>
	<!-- <script>
		//setTimeout(함수,시간); 시간후 함수를 실행한다.
		setTimeout(function() {
			location.href = "editInfoNK.do";
		}, 3000);
	</script> -->
	
	<script>
	$("#toEdit").click(function(){
		location.href = "editInfoNK.do";
	})
	</script>
	
</body>
</html>