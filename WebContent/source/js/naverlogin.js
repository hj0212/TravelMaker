
		document.getElementById("joinBtn").onclick = function() {
			location.href="joinForm.jsp";
		}
		
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