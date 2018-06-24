<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="source/lib/materialize/css/materialize.css">
<script src="source/lib/materialize/js/materialize.js"></script>
	
<script type="text/javascript"
	src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>

<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
<style>
#container {
	width: 800px;
	margin: 0 auto;
	padding-top: 40px;
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
	});
	
	const showLogin = () => {
		 $(".login-link").addClass("active");
		 $(".signup-link").removeClass("active");
		 $("#loginbox").height(560);
		 $(".confirm-password-row").hide();
		 $(".btn-login").text("Log in");
		 $(".forgot-password-row").show();
	};

	const showSignup = () => {
		 $(".signup-link").addClass("active");
		 $(".login-link").removeClass("active");
		 $("#loginbox").height(610);
		 $(".btn-login").text("Sign up");
		 $(".forgot-password-row").hide();
		 $(".confirm-password-row").show();
	};

</script>
</head>
<body>
	<div id="container">
		<div class="row">
			<h1 id="title" class="center">TRAVEL MAKER</h1>
			<div id="loginarea">
				<div class="card white hoverable" id="loginbox">
					<div class="card-content black-text">
						<div class="row card-title" id="card-title">
							<div class="col s6 left-align login-link active">
								<span>Log in</span>
							</div>
							<div class="col s6 right-align signup-link">
								<span>Sign up</span>
							</div>
						</div>
						<div class="row">
							<div class="input-field col s12">
								<input id="user_id" type="text"> <label for="user_id">id</label>
							</div>
						</div>
						<div class="row">
							<div class="input-field col s12">
								<input id="password" type="password"> <label
									for="password" class="grey-text text-lighten-1">password</label>
							</div>
						</div>
						<div class="row confirm-password-row">
							<div class="input-field confirm-password-field col s12">
								<input id="confirm-password" type="password" class="validate">
								<label for="confirm-password">confirm password</label>
							</div>
						</div>

						<div class="row confirm-password-row">
							<div class="input-field confirm-password-field col s12">
								<input id="email" type="email" class="validate"> <label
									for="email">Email</label>

							</div>
						</div>

						<div class="card-action center" id="card_bottom">
							<div class="row_margin">
								<a class="btn-login btn blue lighten-1 waves-effect white-text"
									id="loginbtn">Log In</a>
							</div>
							<div class="row_margin forgot-password-row">
								<div id="kakao_btn_changed">
									<a id="kakao-login-btn"></a> <a
										href="http://developers.kakao.com/logout"></a>
								</div>
							</div>
							<div class="row_margin forgot-password-row">
								<div id="naver_id_login"></div>
								<script type="text/javascript">
								  	var naver_id_login = new naver_id_login("3HRTY3M8Ze8wGofvMNTi", "http://59.10.249.73/Test/loginProc.html");
								  	var state = naver_id_login.getUniqState();
								  	naver_id_login.setButton("green", 3, 48);
								  	naver_id_login.setDomain("http://59.10.249.73/");
								  	naver_id_login.setState(state);
								  	naver_id_login.init_naver_id_login();
  								</script>
							</div>
							<div class="row forgot-password-row">
								<span class="blue-text text-lighten-1 waves-effect">Forgot
									Password?</span>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
<script src="source/js/kakaologin.js"></script>
</html>