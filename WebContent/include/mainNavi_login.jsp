<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%> --%>

<header>

	<nav class="navbar fixed-top navbar-right navbar-expand-lg navbar-light shadow-sm"
		style="background-color: #e3f2fd; height=100px" id="naviId">
		<a class="navbar-brand" href="main.jsp" style="font-size:30px">TravelMaker</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarNavDropdown" aria-controls="navbarNavDropdown"
			aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarNavDropdown">
			<ul class="navbar-nav ml-auto ">
				<li class="nav-item active"><a class="nav-link" href="#">Plans
						<span class="sr-only">(current)</span>
				</a></li>
				<li class="nav-item"><a class="nav-link" href="#">Schedules</a>
				</li>
				<li class="nav-item"><a class="nav-link" href="#">Review</a></li>
				<li class="nav-item"><a class="nav-link" href="freeboard.bo">Board</a></li>
				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" href="#"
					id="navbarDropdownMenuLink" data-toggle="dropdown"
					aria-haspopup="true" aria-expanded="false"> userId <span
						class="caret"></span></a>
					<ul class="dropdown-menu mt-1 mr-5"
						aria-labelledby="navbarDropdownMenuLink">
						<li><a class="dropdown-item" href="mypage.jsp">MyPage</a></li>
						<li><a class="dropdown-item" href="traveldiary.html">MyPlans</a></li>
					</ul>
		</li>
		</ul>
						<li><a class="dropdown-item" href="#">LogOut</a></li>
		</div>
	</nav>

</header>
