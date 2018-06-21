<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	String nickname =request.getParameter("nickname");

%>
<p id="p"><%=nickname %></p>
<button id="logout" type="button" >logout</button>

<script src='https://developers.kakao.com/sdk/js/kakao.min.js'></script>
<script src="js/kakaologin.js">
</script>
<script>
document.getElementById("logout").onclick = function(){

		
		setTimeout(function() {
		    Kakao.Auth.logout(function() { alert("로그아웃되었습니다"); });
		    location.href="login.jsp";
		}, 1000);
	
	
		//alert("afterLogout:"+Kakao.Auth.getRefreshToken());

	}


</script>

</body>
</html>