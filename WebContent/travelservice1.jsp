<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

	<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css">
<script
	src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>

<link rel="stylesheet" href="source/css/mainPage.css">
	
	
<title>TravelMaker</title>

<style>

@import url(https://fonts.googleapis.com/css?family=Raleway:200);

body {
	font-family: 'Raleway', sans-serif;
	font-size: 16px;
	font-weight: 200;
	color: #858585;
	overflow-x: hidden;
}


.container {
	margin-left: auto;
	margin-right: auto;
	padding-left: 15px;
	padding-right: 15px;
	width: 970px;
	
}

.card {
	widht: 100%;
	back-ground: whitesmoke;
	border: none;
	outline: none;
	text-align: left;
	font-size: 18px;
	cursour: pointer;
	trasition: background-color 0.2s linear;	
}

.question {
	background-color: #f0f0f5;
}


.changefont {	
	color : default;
	cursour : pointer;		
}
.changefont:hover{
	color : green;
}

.fsize1 {
	font-size: 13px;
	font-color: black;
}

.fsize2 {
	font-size: 10px;
	font-color: gray;
}
.card-header{
	background-color : white;
}
a {
	color: #6d6d6d;
	text-decoration: none;
}

h5, .h5{
	font-weight: 300;
}

</style>
</head>
<body>
<%@include file="mainNavi.jsp"%>
	<div class="container">	
		<div id="accordion" style="padding-top:50px; padding-bottom:70px;" >
			<div class="card">
				<div class="card-header">
					<a class="card-link" data-toggle="collapse" href="#collapse1">
						<li class="changefont">TravelMaker는 어떤 서비스 인가요?</li>
					</a>
				</div>
				<div id="collapse1" class="collapse" data-parent="#accordion">
					<div class="card-body question">
						<font class="fsize1">TravelMaker는 매일 새롭게 등록되는 유저 리얼후기로 유저들에
							의해 소개되는 새로운 장소, 숙소, 맛집들을 모아놓은 소셜여행서비스입니다. 후기를 누르면 사람들의 여행일지를
							보여주며, 여행을 하면서 쉽게 후기를 작성하여 여행지에서의 현재 느낌에서 감성까지 공유 할 수 있다는 점이
							특징입니다.</font>
					</div>
				</div>
			</div>

			<div class="card">
				<div class="card-header">
					<a class="collapsed card-link" data-toggle="collapse"
						href="#collapse2">
						<li class="changefont">TravelMaker를 이용하려면 어떻게 해야 하나요?</li>
					</a>
				</div>
				<div id="collapse2" class="collapse" data-parent="#accordion">
					<div class="card-body question">
						<font class="fsize1">TravelMaker는 회원제 서비스로서 간단한 회원가입 절차를 통해
							가입한 후 사용하실 수 있습니다.</font><br> <font class="fsize2">(카카오톡,
							네이버 로그인으로도 가입 가능합니다.)</font><br> <img src="loginmain.JPG">
					</div>

				</div>
			</div>

			<div class="card">
				<div class="card-header">
					<a class="collapsed card-link" data-toggle="collapse"
						href="#collapse3">
						<li class="changefont">여행기란 무엇인가요?</li>
					</a>
				</div>
				<div id="collapse3" class="collapse" data-parent="#accordion">
					<div class="card-body question">
						<font class="fsize1">여행기란 TravelMaker의 핵심 기능으로써 사용자가 여행을 다니면서
							자신의 여행 후기를 작성할 수 있도록 해주는 기능입니다. 물론 다녀오신 후에도 작성하실 수 있습니다. 사용자가 각
							여행후기마다 자신의 느낌이나 사진을 저장하면 하나의 여행기가 완성됩니다. </font><br> 이미지 넣을것
					</div>
				</div>
			</div>

			<div class="card">
				<div class="card-header">
					<a class="collapsed card-link" data-toggle="collapse"
						href="#collapse4">
						<li class="changefont">내가 작성한 여행기는 어디서 확인할 수 있나요?</li>
					</a>
				</div>
				<div id="collapse4" class="collapse" data-parent="#accordion">
					<div class="card-body question">
						<font class="fsize1">내가 작성한 여행기는[마이페이지]-[내 글 보기]에서 볼 수 있습니다. </font><br> 이미지 넣을것
					</div>
				</div>
			</div>
			
			<div class="card">
				<div class="card-header">
					<a class="collapsed card-link" data-toggle="collapse"
						href="#collapse5">
						<li class="changefont">로그아웃은 어떻게 하나요?</li>
					</a>
				</div>
				<div id="collapse5" class="collapse" data-parent="#accordion">
					<div class="card-body question">
						<font class="fsize1">화면 오른쪽 상단의 [로그아웃]을 선택하시면 로그아웃 하실 수 있습니다. </font><br> 이미지 넣을것
					</div>
				</div>
			</div>

			<div class="card">
				<div class="card-header">
					<a class="collapsed card-link" data-toggle="collapse"
						href="#collapse6">
						<li class="changefont">좋아요(하트)는 어떤 기능인가요?</li>
					</a>
				</div>
				<div id="collapse6" class="collapse" data-parent="#accordion">
					<div class="card-body question">
						<font class="fsize1">좋아요는 타인의 여행기를 보고나서 좋아요(하트)를 터치하면 자동으로 스크랩 하는 기능입니다.<br>
						여행기를 보시고 좋아요를 많이 눌러주세요~  </font><br> 이미지 넣을것
					</div>
				</div>
			</div>
			
			<div class="card">
				<div class="card-header">
					<a class="collapsed card-link" data-toggle="collapse"
						href="#collapse7">
						<li class="changefont">나의 여행기를 수정/삭제하고 싶어요.</li>
					</a>
				</div>
				<div id="collapse7" class="collapse" data-parent="#accordion">
					<div class="card-body question">
						<font class="fsize1"> 내 여행기에서 수정하고 싶은 여행기를 클릭해보시면 수정버튼이 있습니다.<br>
						이 버튼을 누르시면 여행기를 수정하실 수 있습니다. </font><br> 이미지 넣을것
					</div>
				</div>
			</div>

		</div>

	</div>
	
	<div id="footer">
		<%@include file="footer1.jsp"%>
		</div>
	
	<script>
	
	</script>
</body>
</html>