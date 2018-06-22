<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<%
	String nickname =request.getParameter("nickname");

%>
<script src="https://code.jquery.com/jquery-3.3.1.js"></script>
<script>
	window.onload = function() {
				
		if ("WebSocket" in window) {
			var ws = new WebSocket(
					" ws://localhost:8080/WEB_06_18/websocket ");
		
			var str;
		
			
			function enter_check(){
				if(event.keyCode == 13){

					var msg = $("#livemsg").val();
					ws.send(str+":"+msg);
					$("#livemsg").val("");
				}
			};



			
			ws.onopen = function() {
			
				//document.getElementById("contents").innerHTML += str+"님이 입장하셨습니다"+"<br>";
			};
			ws.onmessage = function(msg) {
				$("#livechathistory").append("<hr class=livehr><div class=chat-message clearfix><img src=https://gravatar.com/avatar/2c0ad52fc5943b78d6abe069cc08f320?s=32 alt= width=32 height=32><div class=chat-message-content clearfix><h5 class=live5>"+<%=nickname%>+"</h5><p class=livep>"+msg+ "</p></div></div>");
				
			
					
			};
			ws.onclose = function() {

			};
		

		} else {
			alert("브라우저가 웹소켓을 지원하지 않습니다");
		}
	}
</script>
</head>
<body>

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
	
	
		

	}


</script>
<link rel="stylesheet" href="css/livechat.css" type="text/css">

        <div id="live-chat">

            <header class="clearfix">

                <a href="#" class="chat-close">x</a>

                <h4 class="live4">John Doe</h4>

                <span class="chat-message-counter">3</span>

            </header>

            <div class="chat">

                <div class="chat-history" id="livechathistory">

                    <div class="chat-message clearfix">

                        <img src="http://lorempixum.com/32/32/people" alt="" width="32" height="32">

                        <div class="chat-message-content clearfix">

                            <span class="chat-time">13:35</span>

                            <h5 class="live5">John Doe</h5>

                            <p class="livep">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Error, explicabo quasi ratione odio dolorum harum.</p>

                        </div>
                        <!-- end chat-message-content -->

                    </div>
                    <!-- end chat-message -->

                    <hr class="livehr">

                    <div class="chat-message clearfix">

                        <img src="https://gravatar.com/avatar/2c0ad52fc5943b78d6abe069cc08f320?s=32" alt="" width="32" height="32">

                        <div class="chat-message-content clearfix">

                            <span class="chat-time">13:37</span>

                            <h5 class="live5">Marco Biedermann</h5>

                            <p class="livep">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Blanditiis, nulla accusamus magni vel debitis numquam qui tempora rem voluptatem delectus!</p>

                        </div>
                        <!-- end chat-message-content -->

                    </div>
                    <!-- end chat-message -->

                    <hr class="livehr">

                    <div class="chat-message clearfix">

                        <img src="http://lorempixum.com/32/32/people" alt="" width="32" height="32">

                        <div class="chat-message-content clearfix">

                            <span class="chat-time">13:38</span>

                            <h5 class="live5">John Doe</h5>

                            <p class="livep">Lorem ipsum dolor sit amet, consectetur adipisicing.</p>

                        </div>
                        <!-- end chat-message-content -->

                    </div>
                    <!-- end chat-message -->

                    <hr class="livehr">

                </div>
                <!-- end chat-history -->

                <p class="chat-feedback">Your partner is typing…</p>

          

                    <fieldset>

                        <input type="text" placeholder="Type your message…" class="liveinput" id="livemsg" onkeydown=enter_Check()>
                        <input type="hidden" class="liveinput" >

                    </fieldset>

        

            </div>
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
</script>




</body>
</html>