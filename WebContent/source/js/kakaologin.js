Kakao.init('cf3c8a92c56d57b527e32f7519a7a4f6');
function loginWithKakao() {
	// 로그인 창을 띄웁니다.
	Kakao.Auth.login({
		success: function(authObj) {
			Kakao.API.request({
				url: '/v1/user/me',
				success: function(res) {
					//   alert(JSON.stringify(res));
					$.ajax({
						type:"post",
						dataType:"json",
						url:"/kakao.do",
						data : {
							"email":res.kaccount_email,
							"id":res.id,
							"nickname":res.properties.nickname,
						},
						success:function(data){
							if(data.login == "success"){
								alert("로그인되었습니다");
								location.href="/";
							}
						},
						error:function(data){
							alert('error:'+data.result);
						}
					});
				},
				fail: function(error) {
					alert(JSON.stringify(error));
				}
			});
		},
		fail: function(err) {
			alert(JSON.stringify(err));
		}
	});
	Kakao.Auth.loginForm(function(){
		persistAccessToken : true;	
	});