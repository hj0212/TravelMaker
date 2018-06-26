<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="source/lib/materialize/css/materialize.css">
<script src="source/lib/materialize/js/materialize.js"></script>
<link rel="stylesheet" href="source/css/codepenNavi.css">

<script type="text/javascript"
	src="http://code.jquery.com/jquery-1.11.3.min.js"></script>

<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<script type="text/javascript"
	src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js"
	charset="utf-8"></script>
<style>
#container {
	width: 800px;
	margin: 0 auto;
	padding-top: 100px;
}

#loginbox {
	width: 400px;
	height: 560px;
	margin: 50px auto;
}

#loginbtn {
	width: 222px;
	height: 49px;
}

#naver_id_login a, #kakao_btn_changed a {
	margin: 0 auto;
}

#loginbtn {
	line-height: 49px;
}

#card_bottom {
	padding-top: 40px;
}

#card-title {
	margin-bottom: 20px;
}

.login-link.active span, .signup-link.active span {
	border-bottom: 2px solid #42a5f5;
}

.card-action span:hover {
	text-decoration: underline;
}

/* label focus color */
.input-field input[type=text]:focus+label {
	color: #64b5f6;
}
/* label underline focus color */
.input-field input[type=text]:focus {
	border-bottom: 1px solid #64b5f6;
	box-shadow: 0 1px 0 0 #64b5f6;
}

.login-link span:hover, .signup-link span:hover {
	border-bottom: 2px solid #64b5f6;
}

.row_margin {
	margin-left: auto;
	margin-right: auto;
	margin-bottom: 10px;
}

#kakao_btn_changed {
	height: 49px;
}
</style>
<script>
	$(document).ready(() => {
	  $(".login-link").on("click", showLogin);
	  $(".signup-link").on("click", showSignup);
	  $(".confirm-password-row").hide();
	  $(".btn-login").text("Log in");
	  
	  $(".btn-login").click(function() { 		  
			  $("#userCheckform").attr('action','checkEmail.do').submit();	  
	  })
	  
	});
	
	const showSignup = () => {
		 $(".signup-link").addClass("active");
		 $(".login-link").removeClass("active");
		 $("#loginbox").height(700);
		 $(".btn-login").text("Sign up");
		 $(".forgot-password-row").hide();
		 $(".confirm-password-row").show();
	};

</script>

</head>
<body>

	<div id="container">
		<div class="row">
			<h1 id="title" class="center col s12">
				<a href="main.jsp">TRAVEL MAKER</a>
			</h1>
		</div>


		<div class="col s6 right-align signup-link active">
		</div>
		<form id="userCheckform" method="post">
			<div class="row">
				<div class="input-field col s12">
					<input id="user_id" type="text" class="validate" name="id">
					<label for="user_id">id</label>
				</div>
			</div>
<!-- 			<div class="row confirm-password-row">
				<div class="input-field confirm-password-field col s12">
					<input id="confirm-password" type="password" class="validate"
						name="cpw"> <label for="confirm-password">가입할 때
						입력하신 이메일을 입력해주세요</label>
				</div>
			</div> -->

			<div class="row confirm-password-row">
				<div class="input-field confirm-password-field col s12">
					<input id="email" type="email" class="validate" name="email">
					<label for="email">Email (가입할 때
						입력하신 이메일을 입력해주세요)</label>
				</div>
			</div>
		</form>
		<div class="card-action center" id="card_bottom">
			<div class="row_margin">
				<a class="btn-login btn blue lighten-1 waves-effect white-text"
					id="findbtn">FIND</a>
			</div>


			<div class="row forgot-password-row">
				<span class="blue-text text-lighten-1 waves-effect">Log in으로
					가기</span>
			</div>
		</div>
	</div>
</body>
</html>