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
		  if($(".btn-login").text()=="Log in") {
			  console.log("로그인");
			  $("#userform").attr('action','login.do').submit();
		  } else if($(".btn-login").text()=="Sign up"){
			  console.log("사인업");
			  $("#userform").attr('action','join.do').submit();
		  }
	  })
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
		 $("#loginbox").height(700);
		 $(".btn-login").text("Sign up");
		 $(".forgot-password-row").hide();
		 $(".confirm-password-row").show();
	};

</script>
<script>
		$(document).ready(function(){
			Kakao.init("cf3c8a92c56d57b527e32f7519a7a4f6");
			function getKakaotalkUserProfile(){
				Kakao.API.request({
					url: '/v1/user/me',
					success: function(res) {
						$("#kakao-profile").append(res.properties.nickname);
						$("#kakao-profile").append($("<img/>",{"src":res.properties.profile_image,"alt":res.properties.nickname+"님의 프로필 사진"}));
					},
					fail: function(error) {
						console.log(error);
					}
				});
			}
			function createKakaotalkLogin(){
				$("#kakao-logged-group .kakao-logout-btn,#kakao-logged-group .kakao-login-btn").remove();
				var loginBtn = $("<a/>",{"class":"kakao-login-btn","text":"로그인"});
				loginBtn.click(function(){
					Kakao.Auth.login({
						persistAccessToken: true,
						persistRefreshToken: true,
						success: function(authObj) {
							getKakaotalkUserProfile();
							createKakaotalkLogout();
						},
						fail: function(err) {
							console.log(err);
						}
					});
				});
				$("#kakao-logged-group").prepend(loginBtn)
			}
			function createKakaotalkLogout(){
				$("#kakao-logged-group .kakao-logout-btn,#kakao-logged-group .kakao-login-btn").remove();
				var logoutBtn = $("<a/>",{"class":"kakao-logout-btn","text":"로그아웃"});
				logoutBtn.click(function(){
					Kakao.Auth.logout();
					createKakaotalkLogin();
					$("#kakao-profile").text("");
				});
				$("#kakao-logged-group").prepend(logoutBtn);
			}
			if(Kakao.Auth.getRefreshToken()!=undefined&&Kakao.Auth.getRefreshToken().replace(/ /gi,"")!=""){
				createKakaotalkLogout();
				getKakaotalkUserProfile();
			}else{
				createKakaotalkLogin();
			}
		});
	</script>
</head>
<body>
	
	<div id="container">
		<div class="row">
			<h1 id="title" class="center col s12">
		<a href="main.jsp">TRAVEL MAKER</a>
	</h1>
		</div>
		<div class="row">
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
						<form id="userform" method="post">
							<div class="row">
								<div class="input-field col s12">
									<input id="user_id" type="text" class="validate" name="id">
									<label for="user_id">id</label>
								</div>
							</div>
							<div class="row">
								<div class="input-field col s12">
									<input id="password" type="password" class="validate" name="pw">
									<label for="password" class="grey-text text-lighten-1">password</label>
								</div>
							</div>
							<div class="row confirm-password-row">
								<div class="input-field confirm-password-field col s12">
									<input id="confirm-password" type="password" class="validate"
										name="cpw"> <label for="confirm-password">confirm
										password</label>
								</div>
							</div>
							<div class="row confirm-password-row">
								<div class="input-field confirm-password-field col s12">
									<input id="nickname" type="text" class="validate"
										name="nickname"> <label for="nickname">name</label>
								</div>
							</div>
							<div class="row confirm-password-row">
								<div class="input-field confirm-password-field col s12">
									<input id="email" type="email" class="validate" name="email">
									<label for="email">Email</label>
								</div>
							</div>
						</form>
						<div class="card-action center" id="card_bottom">
							<div class="row_margin">
								<a class="btn-login btn blue lighten-1 waves-effect white-text"
									id="loginbtn">Log In</a>
							</div>
							
							<div class="row_margin forgot-password-row">
								<div id="kakao_btn_changed">
									<a id="kakao-login-btn"></a> <a
										href="http://developers.kakao.com/logout"></a>
									<script>
									Kakao.init('cf3c8a92c56d57b527e32f7519a7a4f6');
								    // 카카오 로그인 버튼을 생성합니다.
								    Kakao.Auth.createLoginButton({
								      	container: '#kakao-login-btn',
								      	success: function(authObj) {
								    	 	 Kakao.API.request({
								    	       	url: '/v1/user/me',
								    	      	success: function(res) {								    	             
								    	            $.ajax({
								    	            	type:"post",
								    	            	dataType:"json",
								    	            	url:"kakaologin.do",
								    	            	data:{
								    	            		id:res.id,
								    	            		name:res.properties.nickname,
								    	            		email:res.kaccount_email
								    	             	},
								    	            	success:function(data) {
								    	            		location.href = "main.jsp";
								    	            	},
								    	            	error:function(data) {
								    	            		location.href = "main.jsp";
								    	            	}
													})
												},
								      			fail: function(err) {
								         			alert(JSON.stringify(err));
								      			}
								    		});
								    	}
								     });
									</script>
								</div>
								<script>
									Kakao.init('cf3c8a92c56d57b527e32f7519a7a4f6');
									Kakao.Auth.createLoginButton({
								          container: '#kakao-login-btn',
								          success: function(authObj) {
								            alert(JSON.stringify(authObj));
								          },
								          fail: function(err) {
								             alert(JSON.stringify(err));
								          }
								        });
									</script>
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
								<span class="blue-text text-lighten-1 waves-effect"><a href="findPw.jsp">Forgot
									Password?</a></span>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>