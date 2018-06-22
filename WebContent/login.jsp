<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>LoginPage</title>
<script
	src='//static.codepen.io/assets/editor/live/console_runner-ce3034e6bde3912cc25f83cccb7caa2b0f976196f2f2d52303a462c826d54a73.js'></script>
<script
	src='//static.codepen.io/assets/editor/live/css_live_reload_init-890dc39bb89183d4642d58b1ae5376a0193342f9aed88ea04330dc14c8d52f55.js'></script>
<meta charset='UTF-8'>
<meta name="robots" content="noindex">
<link rel="shortcut icon" type="image/x-icon"
	href="//static.codepen.io/assets/favicon/favicon-8ea04875e70c4b0bb41da869e81236e54394d63638a1ef12fa558a4a835f1164.ico" />
<link rel="mask-icon" type=""
	href="//static.codepen.io/assets/favicon/logo-pin-f2d2b6d2c61838f7e76325261b7195c27224080bc099486ddd6dccb469b8e8e6.svg"
	color="#111" />
<link rel="canonical" href="https://codepen.io/TylerMoeller/pen/PbdrJV" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel='stylesheet prefetch'
	href='https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.8/css/materialize.min.css'>
<link rel="stylesheet" href="css/login.css" type="text/css">
</head>
<body>
	<h1 id="title">TRAVEL MAKER</h1>
	<div class="container">
		<div class="row">
			<div class="col s12 m6 offset-m3">
				<div class="card hoverable">
					<div class="card-content grey-text text-lighten-1">
						<div class="row card-title">
							<div class="col s6 left-align login-link">
								<span>Log in</span>
							</div>
							<div class="col s6 right-align signup-link active">
								<span>Sign up</span>
							</div>
						</div>
						<div class="row confirm-password-row">
							<div class="input-field email-field col s12">
								<input id="name" type="text" class="validate white-text">
								<label for="text" class="grey-text text-lighten-1">Name</label>
							</div>
						</div>
						<div class="row">
							<form action="." class="col s12 password-form"
								autocomplete="nope">
								<div class="row">
									<div class="input-field confirm-password-field col s12">
										<input id="id" type="text" class="validate"> <label
											for="text">UserID</label>
									</div>
								</div>
								<div class="row">
									<div class="input-field password-field col s12">
										<input id="password" type="password" class="validate">
										<span id="password-strength"></span> <label for="password">Password</label>
										<p class="help-text"></p>
									</div>
								</div>
								<div class="row confirm-password-row">
									<div class="input-field confirm-password-field col s12">
										<input id="confirm-password" type="password" class="validate">
										<label for="confirm-password">Confirm Password</label>
									</div>
								</div>

								<div class="row confirm-password-row">
									<div class="input-field confirm-password-field col s12">
										<div class="input-field confirm-password-field col s12">
											<input id="email" type="email" class="validate"> <label
												for="email">Email</label>
										</div>
									</div>
								</div>
							</form>
						</div>
					</div>
					<div class="card-action center-align">
						<div class="row">
							<a class="btn-login btn amber darken-4 waves-effect white-text">Log
								In</a>
						</div>
						<div id="kakao_btn_changed">
							<a id="kakao-login-btn"></a> <a
								href="http://developers.kakao.com/logout"></a>

						</div>
						<div class="row forgot-password-row">
							<span class="amber-text text-darken-4 waves-effect">Forgot
								Password?</span>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<script
		src='//static.codepen.io/assets/common/stopExecutionOnTimeout-b2a7b3fe212eaa732349046d8416e00a9dec26eb7fd347590fbced3ab38af52e.js'></script>
	<script
		src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.1/jquery.min.js'></script>
	<script
		src='https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.8/js/materialize.min.js'></script>
	<script
		src='https://cdnjs.cloudflare.com/ajax/libs/zxcvbn/4.4.2/zxcvbn.js'></script>
	<script src=js/login.js></script>
	<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
	<script src="js/kakaologin.js">	</script>





</body>
</html>