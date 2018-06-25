<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<%
	String nickname =request.getParameter("nickname");
	
%>
<script src="https://code.jquery.com/jquery-3.3.1.js"></script>


</head>
<body>

<p id="p"><%=nickname %></p>
<button id="logout" type="button" >logout</button>
<button id="board" type="button" >board</button>
<jsp:include page="chat.jsp" flush="false"/>



<script src='https://developers.kakao.com/sdk/js/kakao.min.js'></script>
<script src="js/kakaologin.js">
</script>

<script>
$("#board").click(function(){
	location.href="freeboardlist.jsp";
	
});
document.getElementById("logout").onclick = function(){	
		setTimeout(function() {
		    Kakao.Auth.logout(function() { alert("로그아웃되었습니다"); });
		    location.href="login.jsp";
		}, 1000);
	
}
</script>
</body>
</html>