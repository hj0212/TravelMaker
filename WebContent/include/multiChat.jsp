<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link rel="stylesheet" href="source/css/livechat.css" type="text/css">


<div id="live-chat">

	<header class="clearfix">

		<a href="#" class="chat-close">x</a>

		 <h4 class="live4">${sessionScope.nickname}</h4>

		<span class="chat-message-counter">!</span>

	</header>

	<div class="chat" id="chatchat">

		<div class="chat-history" id="livechathistory"></div>
		<script>
			$(".chat-history").scrollTop($(".chat-history").height());
		</script>


		<!-- end chat-history -->

		<p class="chat-feedback">Messages</p>



		<fieldset>

			<input type="text" placeholder="Type your message…" class="liveinput"
				id="livemsg"> <input type="hidden" class="liveinput">

		</fieldset>



	</div>
	<script src="https://code.jquery.com/jquery-3.3.1.js"></script>
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
	<script>
	
				
		if ("WebSocket" in window) {
			var ws = new WebSocket("ws://192.168.20.15:8080/WEB_06_18/websocket");		
			var str;
					
			 $("input").keydown(function(event) {
		            if (event.which === 13) {
		            	var nickname ='${sessionScope.nickname}';
		            	var msg = $("#livemsg").val();
		            	
		    			ws.send(JSON.stringify({nickname:nickname,msg:msg}));
		    			$("#livemsg").val("");
		    			  
		            }
		        });

					
			ws.onopen = function() {
			
				//document.getElementById("contents").innerHTML += str+"님이 입장하셨습니다"+"<br>";
			};
			ws.onmessage = function(msg) {
				var obj = JSON.parse(msg.data);
				console.log(obj.nickname + ":" + obj.msg);
				$("#livechathistory").append("<hr class=livehr><div class=chat-message clearfix><img src=https://gravatar.com/avatar/2c0ad52fc5943b78d6abe069cc08f320?s=32 alt='' width='32' height='32'><div class=chat-message-content clearfix><h5 class=live5>" + obj.nickname + "</h5><p class=livep>" + obj.msg + "</p></div></div>");
			};
			ws.onclose = function() {
			
			};
	
		}

	</script>