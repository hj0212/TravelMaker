Kakao.init('2c205f24f7f3e2f81b610f588097146a');
Kakao.Auth.createLoginButton({
    container: '#kakao-login-btn',
    success: function(authObj) {
    	 alert(JSON.stringify(authObj));
    	 
    	 
      // 로그인 성공시, API를 호출합니다.
      Kakao.API.request({
        url:'/v1/user/me',
        data:{
        	propertyKeys: ["kaccount_email"]
      		
        },
        success: function(res) {   	
        	
        	alert(JSON.stringify(res));
        	alert(kaccount_email);
        	
            $.ajax({
            	url:"kakao.do",
            	type:"post",
            	data:{
            	id:res.id,
            	email:kaccount_email,
            	nickname:res.properties.nickname
            	},
            	
            	success:function(data){
            		alert("로그인되었습니다");
            		
            	},
            	error:function(data){
            		alert("로그인 실패");
            	}
            	
            })
          
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
	throughTalk : false;
})

