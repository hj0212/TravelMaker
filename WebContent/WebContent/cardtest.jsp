<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
* {
	-moz-box-sizing: border-box;
	-webkit-box-sizing: border-box;
	box-sizing: border-box;
}

body {
	padding-top: 50px;
	padding-bottom: 20px;
	background: #F2F2F2;
}

.card-holder {
	margin-top: 50px;
}

.card-container {
	-moz-perspective: 800px;
	-webkit-perspective: 800px;
	perspective: 800px;
	-moz-transform-style: preserve-3d;
	-webkit-transform-style: preserve-3d;
	transform-style: preserve-3d;
	-moz-border-radius: 4px;
	-webkit-border-radius: 4px;
	border-radius: 4px;
	margin-bottom: 30px;
	width: 100%;
	height: 350px;
}


.card {
	-moz-transform-style: preserve-3d;
	-webkit-transform-style: preserve-3d;
	transform-style: preserve-3d;
	-moz-border-radius: 4px;
	-webkit-border-radius: 4px;
	border-radius: 4px;
	-moz-transition: -moz-transform 1s
		cubic-bezier(0.175, 0.885, 0.32, 1.275);
	-o-transition: -o-transform 1s cubic-bezier(0.175, 0.885, 0.32, 1.275);
	-webkit-transition: -webkit-transform 1s
		cubic-bezier(0.175, 0.885, 0.32, 1.275);
	transition: transform 1s cubic-bezier(0.175, 0.885, 0.32, 1.275);
	position: relative;
	background: none repeat scroll 0 0 #fff;
	color: #444444;
	max-width: 320px;
	margin: 0 auto;
}

.card .cover {
	-moz-border-radius: 4px 4px 0 0;
	-webkit-border-radius: 4px;
	border-radius: 4px 4px 0 0;
	height: 105px;
	overflow: hidden;
	z-index: -2;
}

.card .cover img {
	width: 100%;
}

.card .profileimg {
	position: relative;
	background: #fff;
	-moz-border-radius: 50%;
	-webkit-border-radius: 50%;
	border-radius: 50%;
	display: block;
	height: 120px;
	margin: -55px auto 0;
	width: 120px;
	text-align: center;
}

.card .content {
	background-color: transparent;
	-moz-box-shadow: none;
	-webkit-box-shadow: none;
	box-shadow: none;
	padding: 10px 20px 20px;
}

.card .content .main {
	min-height: 140px;
}

.card .use-for {
	font-size: 22px;
	text-align: center;
}

.card h5 {
	margin: 5px 0;
	font-weight: 400;
	line-height: 20px;
}

.card .footer {
	color: #999;
	padding: 10px 0 0;
	text-align: center;
}

.card .footer .btn-simple {
	margin-top: -6px;
}

.card .header {
	padding: 15px 20px;
	height: 90px;
}

.front {
	-moz-backface-visibility: hidden;
	-webkit-backface-visibility: hidden;
	backface-visibility: hidden;
	-moz-transition: -moz-transform 1s
		cubic-bezier(0.175, 0.885, 0.32, 1.275);
	-o-transition: -o-transform 1s cubic-bezier(0.175, 0.885, 0.32, 1.275);
	-webkit-transition: -webkit-transform 1s
		cubic-bezier(0.175, 0.885, 0.32, 1.275);
	transition: transform 1s cubic-bezier(0.175, 0.885, 0.32, 1.275);
	-moz-transform-style: preserve-3d;
	-webkit-transform-style: preserve-3d;
	transform-style: preserve-3d;
	-moz-transform: rotateY(0deg);
	-ms-transform: rotateY(0deg);
	-webkit-transform: rotateY(0deg);
	transform: rotateY(0deg);
	-moz-box-shadow: 0 1px 3px 0 rgba(0, 0, 0, 0.14);
	-webkit-box-shadow: 0 1px 3px 0 rgba(0, 0, 0, 0.14);
	box-shadow: 0 1px 3px 0 rgba(0, 0, 0, 0.14);
	-moz-border-radius: 4px;
	-webkit-border-radius: 4px;
	border-radius: 4px;
	position: absolute;
	background-color: #fff;
	width: 100%;
	height: 350px;
	top: 0;
	left: 0;
	z-index: 2;
}


.qr canvas {
	-moz-backface-visibility: hidden;
	-webkit-backface-visibility: hidden;
	backface-visibility: hidden;
	margin: 0 auto;
}

.title {
	color: #506a85;
	text-align: center;
	font-weight: 300;
	font-size: 44px;
	margin-bottom: 90px;
	line-height: 90%;
}
</style>
</head>
<body>
	<div class="container">
		<div class="row">
			<div class="item">
				<div class="card-container col-md-12 col-sm-12">
					<div class="card">
						<div class="front">
							<div class="cover">
								<img
									src="https://bilbo.surge.sh/codepen/download-cards/apple.png" />
							</div>
							<div class="profileimg">
								<span class="fa fa-apple"></span>
							</div>
							<div class="content">
								<div class="main">
									
								</div>
								<div class="footer">
									<button class="btn " onclick="rotateCard(this)">
										<i class="fa fa-mail-forward"></i> Get QR Code
									</button>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>