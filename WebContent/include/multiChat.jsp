<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link rel="stylesheet" href="source/css/livechat.css" type="text/css">


<div id="live-chat">
	<header class="clearfix">
		<a href="#" class="chat-close">x</a>
		<h4 class="live4">${sessionScope.nickname}</h4>
	</header>
	<div class="chat" id="chatchat">
		<div class="chat-history" id="livechathistory"></div>
		<!-- end chat-history -->
		<p class="chat-feedback">Messages</p>
		<fieldset>
			<input type="text" placeholder="Type your message…" class="liveinput"
				id="livemsg"> <input type="hidden" class="liveinput">
		</fieldset>
	</div>
</div>	
	<script>
		(function() {
			$('#live-chat header').on('click', function() {
				$('.chat').slideToggle(300, 'swing');
				$('.chat-message-counter').fadeToggle(300, 'swing');
			});

			$('.chat-close').on('click', function(e) {
				e.preventDefault();
				$('#live-chat').html().fadeOut(300);						
			});
		})();
	</script>
	<script>
		if ("WebSocket" in window) {
			var ws = new WebSocket(
					"ws://59.10.249.73/TravelMaker/websocket");
			var str;
			var file ="";
		
			$("#livemsg").keypress(function(event) {
				if (event.keyCode === 13) {
					if($("#livemsg").val() == ""){
						
					}else{
						
						if("${sessionScope.img}" !=""){
							file="${sessionScope.img}";
						}else {		
							file ="/WEB_06_18/file/${sessionScope.file_name}";
						}							
					var nickname = '${sessionScope.nickname}';
					var msg = $("#livemsg").val();	
					
									
					ws.send(JSON.stringify({
						nickname : nickname,
						msg : msg,
						file : file
						
					}));
					$("#livemsg").val("");
					};
				};
			});
			ws.onopen = function() {
				//document.getElementById("contents").innerHTML += str+"님이 입장하셨습니다"+"<br>";
			};

			ws.onmessage = function(msg) {
				var obj = JSON.parse(msg.data);
				var chat = "<hr class=livehr><div class=chat-message clearfix><img src='"+obj.file+"' alt='' width='32' height='32'><div class=chat-message-content clearfix><h5 class=live5>"
						+ obj.nickname
						+ "</h5><p class=livep>"
						+ obj.msg
						+ "</p></div></div>"
				$("#livechathistory").append(chat);
				$("#livechathistory").scrollTop($("#livechathistory")[0].scrollHeight);			 
			};
			
			ws.onclose = function() {

			};
		}
	</script>