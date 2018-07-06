<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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

<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.1.0/css/all.css"
	integrity="sha384-lKuwvrZot6UHsBSfcMvOkWwlCMgc0TaWr+30HWe3a4ltaBwTZhyTEggF5tJv8tbt"
	crossorigin="anonymous">
	
<link rel="stylesheet" href="source/css/mainPage.css">


<title>TravelMaker</title>

<style>
@import url(https://fonts.googleapis.com/css?family=Raleway:200);

h4, .h4 {
	font-size: 18px;
	font-weight: bold;
}

body {
	color: #858585;
	font-family: 'Raleway', sans-serif;
	font-size: 16px;
	font-weight: 200;
	overflow-x: hidden;
}

.container {
	margin-left: auto;
	margin-right: auto;
	padding-left: 15px;
	padding-right: 15px;
	width: 970px;
}

.team {
	width: 30%;
	min-height: 100%;
	border: 1px solid rgba(133, 133, 133, .15);
	background-color: #fff;
	-moz-box-shadow: 0 0 8px rgba(0, 0, 0, .09);
	-webkit-box-shadow: 0 0 8px rgba(0, 0, 0, .09);
	box-shadow: 0 0 8px rgba(0, 0, 0, .09);
	float: left;
	margin-left: 16px;
}

.teamimg {
	display: block;
	margin-left: auto;
	margin-right: auto;
	position: relative;
	margin-top: -80px;
	width: 170px;
	height: 170px;
	background: #1bbc9d;
	box-shadow: 0 0 8px rgba(0, 0, 0, 0.09);
}

.teamsocial {
	height: 48px;
	background-color: #f7f5f5;
	position: relative;
	bottom: -14px;
	left: 0;
}

.big-text {
	font-size: 58px;
	font-weight: 900;
	line-height: 62px;
	letter-spacing: 0.01em;
	word-spacing: 0.15em;
	text-transform: uppercase;
}

.smallintro {
	font-size: 20px;
	font-weight: 900px;
}

.deepspace {
	visibility: hidden;
	width: 100%;
	height: 70px;
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
	<c:choose>
		<c:when test="${sessionScope.user.seq !=null}">
			<%@include file="include/mainNavi_login.jsp"%>
		</c:when>
		<c:otherwise>
			<%@include file="include/mainNavi.jsp"%>
		</c:otherwise>
	</c:choose>
	<div class="container" style="padding-top: 145px; margin-bottom: 48px;">
		<h1 class="big-text">
			Travel Maker<small class="smallintro">를 소개합니다!</small>
		</h1>
		<div class="deepspace"></div>
		<div class="row">
			<div class="team">
				<div class="teamimg"
					style="background-image: url('test1.jpg'); background-size: 170px;"></div>
				<h4
					style="text-align: center; margin-bottom: 2px; margin-top: 25px;">권혜진</h4>
				<p style="text-align: center;">Team Manager</p>
				<p
					style="text-align: center; margin-top: -14px; margin-bottom: -8px; padding: 23px;">
					안녕하세요</p>
				<div class="teamsocial">
					<ul>
						<li
							style="margin-left: 35px; float: left; list-style: none outside none;">
						</li>
						<li style="float: left; list-style: none outside none;"></li>
						<li style="float: left; list-style: none outside none;"></li>
						<li style="float: left; list-style: none outside none;"></li>
					</ul>
				</div>
			</div>
			<div class="team">
				<div class="teamimg"
					style="background-image: url('source/img/profile/kimchang.gif'); background-size: 170px;"></div>
				<h4
					style="text-align: center; margin-bottom: 2px; margin-top: 25px;">김창영</h4>
				<p style="text-align: center;">Team Member</p>
				<p
					style="text-align: center; margin-top: -14px; margin-bottom: -8px; padding: 23px;">
					안녕하세요</p>
				<div class="teamsocial">
					<ul>
						<li
							style="margin-left: 35px; float: left; list-style: none outside none;">
						</li>
						<li style="float: left; list-style: none outside none;"></li>
						<li style="float: left; list-style: none outside none;"></li>
						<li style="float: left; list-style: none outside none;"></li>
					</ul>
				</div>
			</div>
			<div class="team">
				<div class="teamimg"
					style="background-image: url('test1.jpg'); background-size: 170px;"></div>
				<h4
					style="text-align: center; margin-bottom: 2px; margin-top: 25px;">김형섭</h4>
				<p style="text-align: center;">Team Member</p>
				<p
					style="text-align: center; margin-top: -14px; margin-bottom: -8px; padding: 23px;">
					안녕하세요</p>
				<div class="teamsocial">
					<ul>
						<li
							style="margin-left: 35px; float: left; list-style: none outside none;">
						</li>
						<li style="float: left; list-style: none outside none;"></li>
						<li style="float: left; list-style: none outside none;"></li>
						<li style="float: left; list-style: none outside none;"></li>
					</ul>
				</div>
			</div>

			<div class="team">
				<div class="teamimg"
					style="background-image: url('test1.jpg'); background-size: 170px;"></div>
				<h4
					style="text-align: center; margin-bottom: 2px; margin-top: 25px;">김호연</h4>
				<p style="text-align: center;">Team Member</p>
				<p
					style="text-align: center; margin-top: -14px; margin-bottom: -8px; padding: 23px;">
					안녕하세요</p>
				<div class="teamsocial">
					<ul>
						<li
							style="margin-left: 35px; float: left; list-style: none outside none;">
						</li>
						<li style="float: left; list-style: none outside none;"></li>
						<li style="float: left; list-style: none outside none;"></li>
						<li style="float: left; list-style: none outside none;"></li>
					</ul>
				</div>
			</div>

			<div class="team">
				<div class="teamimg"
					style="background-image: url('source/img/profile/madong2.gif'); background-size: 170px;"></div>
				<h4
					style="text-align: center; margin-bottom: 2px; margin-top: 25px;">송호진</h4>
				<p style="text-align: center;">Team Member</p>
				<p
					style="text-align: center; margin-top: -14px; margin-bottom: -8px; padding: 23px;">
					안녕하세요</p>
				<div class="teamsocial">
					<ul>
						<li
							style="margin-left: 35px; float: left; list-style: none outside none;">
						</li>
						<li style="float: left; list-style: none outside none;"></li>
						<li style="float: left; list-style: none outside none;"></li>
						<li style="float: left; list-style: none outside none;"></li>
					</ul>
				</div>
			</div>

			<div class="team">
				<div class="teamimg"
					style="background-image: url('test1.jpg'); background-size: 170px;"></div>
				<h4
					style="text-align: center; margin-bottom: 2px; margin-top: 25px;">우인혜</h4>
				<p style="text-align: center;">Team Member</p>
				<p
					style="text-align: center; margin-top: -14px; margin-bottom: -8px; padding: 23px;">
					안녕하세요</p>
				<div class="teamsocial">
					<ul>
						<li
							style="margin-left: 35px; float: left; list-style: none outside none;">
						</li>
						<li style="float: left; list-style: none outside none;"></li>
						<li style="float: left; list-style: none outside none;"></li>
						<li style="float: left; list-style: none outside none;"></li>
					</ul>
				</div>
			</div>

		</div>
	</div>
	<div id="footer">
		<%@include file="footer1.jsp"%>
		</div>
</body>
</html>