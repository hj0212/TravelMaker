<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>LoginPage</title>
<script type="text/javascript"
	src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.0.js"
	charset="utf-8"></script>
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
						<div class="row forgot-password-row">
							<span class="amber-text text-darken-4 waves-effect">Forgot
								Password?</span>
						</div>
						<div class="row">
							<div id="naverIdLogin"></div>
						</div>
					</div>
				</div>
			</div>
		</div>
		
		<script>
		var naverLogin = new naver.LoginWithNaverId(
				{
					clientId: "3HRTY3M8Ze8wGofvMNTi",
					callbackUrl: "http://localhost:8080/BoardProject/loginProc.html",
					isPopup: false, /* 팝업을 통한 연동처리 여부 */
					loginButton: {color: "green", type: 3, height: 35} /* 로그인 버튼의 타입을 지정 */
				}
		);
			
		/* 설정정보를 초기화하고 연동을 준비 */
		naverLogin.init();
		
		/* (5) 현재 로그인 상태를 확인 */
		window.addEventListener('load', function () {
			naverLogin.getLoginStatus(function (status) {
				if (status) {
					var uniqId = naverLogin.user.getId();
					var name = naverLogin.user.getNickName();
					var email = naverLogin.user.getEmail();
					
					if( email == undefined || email == null) {
						alert("이메일은 필수정보입니다. 정보제공을 동의해주세요.");
						/* (5-1) 사용자 정보 재동의를 위하여 다시 네아로 동의페이지로 이동함 */
						naverLogin.reprompt();
						return;
					}
					
					var member = {id:uniqId, name:name, email:email};
					
					$.ajax({
						url:"navlogin.do",
						type:"get",
						data:member,
						success:function() {
							console.log("전달완료");
						},
						error:function(request,status,error) {
							console.log(request.satus + " : " + request.responseText + " : " + error);
						}
						
					})

					/* (6) 로그인 상태가 "true" 인 경우 로그인 버튼을 없애고 사용자 정보를 출력합니다. */
					
				}
			});
		});

	</script>

		<script
			src='//static.codepen.io/assets/common/stopExecutionOnTimeout-b2a7b3fe212eaa732349046d8416e00a9dec26eb7fd347590fbced3ab38af52e.js'></script>
		<script
			src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.1/jquery.min.js'></script>
		<script
			src='https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.8/js/materialize.min.js'></script>
		<script
			src='https://cdnjs.cloudflare.com/ajax/libs/zxcvbn/4.4.2/zxcvbn.js'></script>
		<script src=js/login.js> </script>
</body>
</html>