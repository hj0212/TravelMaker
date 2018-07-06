<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script src="https://code.jquery.com/jquery-3.3.1.js" integrity="sha256-2Kok7MbOyxpgUVvAk/HJ2jigOSYS2auK4Pfzbm7uH60=" crossorigin="anonymous"></script>
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
		<legend><h1>페이지를 찾을 수 없습니다.</h1></legend>
		<h5>지금 입력하신 페이지는 없는 페이지입니다. 주소를 다시 확인해주세요</h5>
		<button type="button" class="btn" id="back">뒤로가기</button>
		<button type="button" class="btn" id="main">메인으로 가기</button>
		<hr>
	</fieldset>
	<script>
		$("#back").click(function(){
			history.go(-1);
		})
		
		$("#main").click(function(){
			location.href="main.bo";
		})
	</script>
</body>
</html>