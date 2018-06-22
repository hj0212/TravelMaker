<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="source/lib/materialize/css/materialize.css">
<script src="source/lib/materialize/js/materialize.jss"></script>

<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<script type="text/javascript"
	src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.0.js"
	charset="utf-8"></script>
<script src="source/js/kakaologin.js"></script>
<style>
#container {
	width: 800px;
	margin: 0 auto;
}

#loginbox {
	width: 400px;
	height: 700px;
	margin: 50px auto;
}

#loginbtn {
	
}
</style>
</head>
<body>
	<div id="container">
		<div class="row">
			<h1 id="title" class="center">TRAVEL MAKER</h1>
			<div id="loginarea">
				<div class="card white hoverable" id="loginbox">
					<div class="card-content black-text">
						<div class="row card-title">
							<div class="col s6 left-align login-link">
								<span>Log in</span>
							</div>
							<div class="col s6 right-align signup-link active">
								<span>Sign up</span>
							</div>
						</div>
						<div class="row">
							<div class="input-field email-field col s12">
								<input id="email" type="email" class="validate white-text">
								<label for="email" class="grey-text text-lighten-1">Email</label>
							</div>
						</div>
						<div class="row">
							<div class="input-field email-field col s12">
								<input id="email" type="password" class="validate">
								<label for="email" class="grey-text text-lighten-1">password</label>
							</div>
						</div>

						<div class="card-action">
							<div class="row">
								<a class="btn-login btn blue lighten-1 waves-effect white-text"
									id="loginbtn">Log In</a>
							</div>
							<div id="kakao_btn_changed">
								<a id="kakao-login-btn"></a> <a
									href="http://developers.kakao.com/logout"></a>
							</div>
							<div id="naverIdLogin"></div>

						</div>
					</div>
				</div>
			</div>
		</div>

	</div>

</body>
</html>