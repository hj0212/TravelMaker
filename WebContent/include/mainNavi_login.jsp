<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%> --%>

<header>
	<style>
.logo {
	background: transparent url('source/img/travellogo2.png') center center
		no-repeat;
	width: 195px;
	background-size: contain;
	text-indent: 100%;
	white-space: nowrap;
	overflow: hidden;
}

a {
	color: #6d6d6d;
	text-decoration: none;
}

.rslides {
	position: relative;
	list-style: none;
	overflow: hidden;
	width: 100%;
	padding: 0;
	margin: 0;
}

.rslides li {
	-webkit-backface-visibility: hidden;
	position: absolute;
	display: none;
	width: 100%;
	left: 0;
	top: 0;
}

.rslides li:first-child {
	position: relative;
	display: block;
	float: left;
}

.rslides img {
	display: block;
	height: 550px;
	float: left;
	width: 100%;
	border: 0;
}

.navbar-fixed-top.scrolled {
	background-color: #fff !important;
	transition: background-color 200ms linear;
}

.nav-link {
	font-size: 15pt;
	font-family: menufont;
}
</style>

	<ul class="rslides">
		<li><img src="source/img/TRAVEL/travel10.png" alt=""></li>
		<li><img src="source/img/TRAVEL/travel11.png" alt=""></li>
		<li><img src="source/img/TRAVEL/travel12.png" alt=""></li>
		<li><img src="source/img/TRAVEL/travel13.png" alt=""></li>
		<li><img src="source/img/TRAVEL/travel14.png" alt=""></li>
		<li><img src="source/img/TRAVEL/travel15.png" alt=""></li>
		<li><img src="source/img/TRAVEL/travel16.png" alt=""></li>
	</ul>

	<nav
		class="navbar fixed-top navbar-right navbar-expand-lg navbar-fixed-top navbar-light"
		style="height: 100px" id="naviId">
		<a class="navbar-brand" href="main.jsp" style="font-size: 30px"><h1
				class="logo">Logo</h1></a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarNavDropdown" aria-controls="navbarNavDropdown"
			aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarNavDropdown">
			<ul class="navbar-nav ml-auto ">
				<li class="nav-item active"><a class="nav-link"
					href="planboard.plan">Plans <span class="sr-only">(current)</span>
				</a></li>
				<li class="nav-item"><a class="nav-link" href="reviewboard.bo">Review</a></li>
				<li class="nav-item"><a class="nav-link" href="freeboard.bo">Board</a></li>
				<li class="nav-item dropdown" style="min-width: 150px;"><a
					class="nav-link dropdown-toggle" href="#"
					id="navbarDropdownMenuLink" data-toggle="dropdown"
					aria-haspopup="true" aria-expanded="false"> <c:choose>
							<c:when test="${!empty sessionScope.user.userid}">
					${sessionScope.user.userid}
					</c:when>
							<c:when test="${!empty sessionScope.user.kakao_nickname}">
					${sessionScope.user.kakao_nickname}
					</c:when>
							<c:when test="${!empty sessionScope.user.naver_nickname}">
					${sessionScope.user.naver_nickname}
					</c:when>
						</c:choose> <span class="caret"></span></a>
					<ul class="dropdown-menu mt-1 "
						aria-labelledby="navbarDropdownMenuLink">
						<li><a class="dropdown-item" href="mypage.do">My Page</a></li>
						<li><a class="dropdown-item" href="traveldiary.html">My
								Plans</a></li>
						<li><a class="dropdown-item" href="#">Message</a></li>
						<li><a class="dropdown-item" href="logout.do">Log Out</a></li>
					</ul></li>
			</ul>
		</div>
	</nav>

	<script>
		$(function() {
			$(".rslides").responsiveSlides();
		});
		$(function() {
			$(document).scroll(
					function() {
						var $nav = $(".navbar-fixed-top");
						$nav.toggleClass('scrolled', $(this).scrollTop() > $nav
								.height());
					});
		});
	</script>
</header>
