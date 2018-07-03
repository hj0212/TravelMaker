<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link rel="stylesheet" href="source/css/livechat.css" type="text/css">


<div id="live-chat">

	<header class="clearfix">

		<a href="#" class="chat-close">x</a>

		<%--     <h4 class="live4"><%=nickname %></h4> --%>

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
	<script>


(function() {
	
	  $('#live-chat').on('click', function() {

          $('.chat').slideToggle(300, 'swing');
          $('.chat-message-counter').fadeToggle(300, 'swing');

      });
	  $('.chat-close').on('click', function(e) {

          e.preventDefault();
          $('#live-chat').fadeOut(300);

      });

})();
</script>