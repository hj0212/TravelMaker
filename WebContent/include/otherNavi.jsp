<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%> --%>

<header>
<style>
.logo {
	background: transparent url('source/img/TRAVEL/travelfooterlogo.png') center center no-repeat;
	width: 195px;
	background-size: contain;
	text-indent: 100%;
	white-space: nowrap;
	overflow: hidden;
}
.dropdown-item{
	color:  rgb(52, 52, 52);
}
</style>

	<nav
		class="navbar fixed-top navbar-right navbar-expand-lg navbar-light shadow-sm"
		style="background-color: rgb(52, 52, 52); height:100px;" id="naviId">
		<a class="navbar-brand" href="main.jsp" style="font-size: 30px"><h1 class="logo">Logo</h1></a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarNavDropdown" aria-controls="navbarNavDropdown"
			aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarNavDropdown">
			<ul class="navbar-nav ml-auto">
				<li class="nav-item"><a class="nav-link text-white"  href="planboard.plan">Plan</a></li>
				<li class="nav-item"><a class="nav-link text-white" href="reviewboard.bo">Review</a></li>
				<li class="nav-item"><a class="nav-link text-white" href="freeboard.bo">Free</a></li>
				<li class="nav-item dropdown" style="min-width: 150px;"><a
					class="nav-link dropdown-toggle text-white" href="#"
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
						<li><a class="dropdown-item" href="traveldiary.html">My Plans</a></li>
						<li><a class="dropdown-item" href="#">Message</a></li>
						<li><a class="dropdown-item" href="logout.do">Log Out</a></li>
					</ul></li>
			</ul>
		</div>
	</nav>
	<script>
	$("#navbarNavDropdown>ul").on('click','li',function() {
		$(this).addClass('active').siblings().removeClass('active');
	});
	</script>
</header>