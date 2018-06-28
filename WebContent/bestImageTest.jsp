<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html;" charset="UTF-8">
<title>Insert title here</title>

<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>


<style>
body{ min-height:1200px;
/* background:url(https://img4.goodfon.com/original/2560x1600/4/2e/zima-sneg-fon-minamilizm-snezhinki-olen.jpg) fixed; */
background-size:contain;}
img {
	max-width: 100%;
	height: auto;
}
ul li {
	list-style: none;
}
a, a:hover {
	text-decoration: none;
	box-shadow: none;
	outline: none;
	-moz-transition: all 0.2s ease-in;
	-o-transition: all 0.2s ease-in;
	-webkit-transition: all 0.2s ease-in;
	transition: all 0.2s ease-in;
}
h1{ text-align:left; margin:30px 0; color:black;}
.hls_sol li {
	width: 25%;
	max-width: 100%;
	display: inline-block;
	float: left;
	text-align: center;
	overflow: hidden;
	position: relative;
	height: 500px
}
.hls_sol li img {
	height: 100%;
}
.hls_sol ul {
	padding: 0;
	display: flow-root;
}
.hls_sol li:hover img {
	-moz-transform: scale(1.1);
	-webkit-transform: scale(1.1);
	-ms-transform: scale(1.1);
	-o-transform: scale(1.1);
	transform: scale(1.1);
}
.hls_sol li img {
	-webkit-transition: transform 0.5s ease;
	-o-transition: transform 0.5s ease;
	transition: transform 0.5s ease;
}
.hls_sol .hls_sol_data {
	position: absolute;
	left: 0;
	right: 0;
	bottom: 0;
	top: 0;
	transition: 0.3s ease-in-out;
	background: rgba(0,0,0,0.28);
	visibility: hidden;
}
.hls_sol ul li:hover .hls_sol_data {
	background: rgba(76, 74, 74,0.5);
	transition: 0.3s ease-in-out;
	visibility: visible;
}
.hls_data {
	position: absolute;
	left: 0;
	right: 0;
	bottom: 0;
	padding: 60px 20px;
}
.hls_data a {
	display: block;
}
.hls_title {
	text-align: right;
	font-size: 22px;
	border-bottom: 2px solid #c5eff9;
	padding: 10px 0;
	margin: 10px 0;
	color: #fff;
}
.hls_title:hover {
	color: #fff;
}
.hls_sol_data h3 {
	color: #fff;
	transition: 0.5s
}
.hls_sol_data:hover h3 {
	transition: 0.5s ease;
	margin-top: 100px;
}
.btn-pro {
	border-radius: 0;
	color: #222;
	background: #fff;
	display: inline-block !important;
	float: right;
}
.btn-pro:hover {
	color: #fff;
	background: #222;
}
.sec_title {
	text-align: center;
	margin: 30px 0 30px;
}
.hls_data {
	left: unset;
	right: -310px;
	transition: 1s ease
}
.hls_sol_data:hover .hls_data {
	left: 0;
	right: 0;
	transition: 1s ease
}
</style>

</head>
<body>



<!------ Include the above in your HEAD tag ---------->

<h1>BEST IMAGE</h1>
<div class="hls_sol">
<ul>
	<li>
	<img src="travel1.jpg" alt="">
	<div class="hls_sol_data">
		<h3>1위</h3>
		<div class="hls_data">
			<a href="https://500px.com/ravi7284007" target="_blank" class="hls_title">여행자님</a>
			<a href="#https://www.facebook.com/ravi7284007" class="btn btn-pro" target="_blank"> 여행기록 보러가기</a>
		</div>
	</div>
	</li>
		<li>
	<img src="travel1.jpg" alt="">
		<div class="hls_sol_data">
		<h3>2위</h3>
		<div class="hls_data">
			<a href="https://500px.com/ravi7284007" target="_blank" class="hls_title">여행자님</a>
			<a href="https://www.facebook.com/ravi7284007" class="btn btn-pro" target="_blank"> 여행기록 보러가기</a>
		</div>
	</div>
	</li>
		<li>
	<img src="travel1.jpg" alt="">
		<div class="hls_sol_data">
		<h3>3위</h3>
		<div class="hls_data">
			<a href="https://500px.com/ravi7284007" target="_blank" class="hls_title">여행자님</a>
			<a href="https://www.facebook.com/ravi7284007" class="btn btn-pro" target="_blank"> 여행기록 보러가기</a>
		</div>
	</div>
	</li>
		<li>
	<img src="travel1.jpg" alt="">
		<div class="hls_sol_data">
		<h3>4위</h3>
		<div class="hls_data">
			<a href="https://500px.com/ravi7284007" target="_blank" class="hls_title">여행자님</a>
			<a href="https://www.facebook.com/ravi7284007" class="btn btn-pro" target="_blank"> 여행기록 보러가기</a>
		</div>
	</div>
	</li>
</ul>
	
</div>



</body>
</html>