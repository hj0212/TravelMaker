<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
div {
	/*border: 1px dotted black;*/
	box-sizing: border-box;
	top: 0px;
	color: #acacaf;
	font-weight: 400;
}

body {
	width: 970px;
	margin: 0 auto;
	border: 1px solid red;
}

#plan {
	position: absoluete;
	box-sizing: border-box;
}

#menubar {
	width: 10%;
	height: 100%;
	z-index: 100px;
	/* right: 100%; */
	right:-960px;
	margin: auto 0 auto auto;
	padding: 0.5rem;
}

li {
	font-size: 30px;
	font-weight: 400;
	list-style-type: none;
	-webkit-border-radius: 12px;
	-moz-border-radius: 12px;
	border-radius: 12px;
	background-color: rgba(0, 0, 0, 0.3);
	color: #fff;
	height: 50px;
	line-height: 50px;
	text-align: left;
	position: relative;
	width: 5em;
	box-shadow: 3em;
	transition-duration: 2s;
	
}

li:hover {
	transform: translate(-50px);
	transition-duration: 2s;
}

a {
	text-decoration: none;
	color: #fff;
}
</style>
</head>

<body>
	<div id="plan">
		<div id="menubar">
			<ul>
				<li><a href="#">day1</a></li>
				<li><a href="#">day2</a></li>
				<li><a href="#">day3</a></li>
				<li><a href="#">day4</a></li>
				<li><a href="#">day5</a></li>
				<li><a href="#">day6</a></li>
				<li><a href="#">day7</a></li>
			</ul>
		</div>
	</div>
</body>
</html>