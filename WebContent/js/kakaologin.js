Kakao.init('2c205f24f7f3e2f81b610f588097146a');
Kakao.Auth.createLoginButton({
    container: '#kakao-login-btn',
    success: function(authObj) {
    	 alert(JSON.stringify(authObj));
    	
      // 로그인 성공시, API를 호출합니다.
      Kakao.API.request({
        url: '/v1/user/me',
        success: function(res) {
        location.href="index.jsp?nickname="+res.properties.nickname;
          alert(JSON.stringify(res));
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
})