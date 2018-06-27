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
<<<<<<< HEAD
<script>
	window.onload = function() {
				
		if ("WebSocket" in window) {
			var ws = new WebSocket(

					" ws://192.168.20.31:8080/WEB_SOCKET_0611/websocket ");

		
			var str;
		
			
			 $("input").keydown(function(event) {
		            if (event.which === 13) {
		            	var id = "<%=nickname%>";
		            	var msg = $("#livemsg").val();
		            	
		    			ws.send(JSON.stringify({id:id, msg:msg}));
		    			$("#livemsg").val("");
		    			  
		            }
		        });

					
			ws.onopen = function() {
			
				//document.getElementById("contents").innerHTML += str+"님이 입장하셨습니다"+"<br>";
			};
			ws.onmessage = function(msg) {
				var obj = JSON.parse(msg.data);
				console.log(obj.id + ":" + obj.msg);
				$("#livechathistory").append("<hr class=livehr><div class=chat-message clearfix><img src=https://gravatar.com/avatar/2c0ad52fc5943b78d6abe069cc08f320?s=32 alt='' width='32' height='32'><div class=chat-message-content clearfix><h5 class=live5>" + obj.id + "</h5><p class=livep>" + obj.msg + "</p></div></div>");
			};
			ws.onclose = function() {
=======
>>>>>>> KakaoAPI


</head>
<body>

<p id="p">${sessionScope.loginId }</p>
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


        <div id="live-chat">

            <header class="clearfix">

                <a href="#" class="chat-close">x</a>

                <h4 class="live4"><%=nickname %></h4>

                <span class="chat-message-counter">!</span>

            </header>

            <div class="chat"  id="chatchat">

                <div class="chat-history" id="livechathistory">
				
                   
                </div>
                <script>
                $(".chat-history").scrollTop($(".chat-history").height());
                </script>
                
                
                <!-- end chat-history -->

                <p class="chat-feedback">Messages</p>

          

                    <fieldset>

                        <input type="text" placeholder="Type your message…" class="liveinput" id="livemsg" >
                        <input type="hidden" class="liveinput"  >

                    </fieldset>

        

            </div>
            <button id="admin">admin</button>
            <button id="mypage">mypage</button>
            <!-- end chat -->

        </div>
        <!-- end live-chat -->
    </body>
<script>


(function() {
	
	  $('#live-chat header').on('click', function() {

          $('.chat').slideToggle(300, 'swing');
          $('.chat-message-counter').fadeToggle(300, 'swing');

      });
	  $('.chat-close').on('click', function(e) {

          e.preventDefault();
          $('#live-chat').fadeOut(300);

      });

})();

$("#admin").click(function(){
	location.href = "admin.do";
});
$("#mypage").click(function(){
	location.href="mypage.do";
})
=======
>>>>>>> KakaoAPI
</script>
</body>
</html>