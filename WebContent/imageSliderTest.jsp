<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>Scroll Fixed Navigation</title>
<style class="cp-pen-styles"></style>
<meta name="viewport" content="width=device-width, maximum-scale=1.0" />

<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>


<script src="https://code.jquery.com/jquery-3.3.1.js"></script>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>


<link rel="stylesheet" href="source/css/codepenNavi.css">
<link rel='stylesheet prefetch' href='source/css/normalize.min_main.css'>
<link rel='stylesheet prefetch' href='source/css/slick.css'>
<link rel='stylesheet prefetch'
	href='source/css/slick-theme_mainnavi.css'>

<link rel="stylesheet" type="text/css" href="source/lib/slick/slick.css" />
<link rel="stylesheet" type="text/css"
	href="source/lib/slick/slick-theme.css" />
<link rel="stylesheet" href="mypage.css" type="text/css">

<script
	src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.1/jquery.min.js'></script>
<script src='//cdn.jsdelivr.net/jquery.slick/1.5.0/slick.min.js'></script>
<script src="source/js/imageSlider.js" type="text/javascript">
	
</script>

<style>
.data, .data div {
	height: 300px;
}

.slide_item {
	height: 300px;
	width: 240px;
}
</style>
</head>
<!-- <div class="shadow-none p-3 mb-5 bg-light rounded">No shadow</div>
<div class="shadow-sm p-3 mb-5 bg-white rounded">Small shadow</div>
<div class="shadow p-3 mb-5 bg-white rounded">Regular shadow</div>
<div class="shadow-lg p-3 mb-5 bg-white rounded">Larger shadow</div> -->


<body>
	<c:choose>
		<c:when test="${sessionScope.loginId !=null}">
			<%@include file="include/mainNavi_login.jsp"%>
		</c:when>
		<c:otherwise>
			<%@include file="include/mainNavi.jsp"%>
		</c:otherwise>
	</c:choose>
	<div class="container">
		<div id="main-visual">
			<h3>Best Plans</h3>
			<div class="row">
				<div class="col-md-12" id="bestPlan">
					<div class="data"
						data-slick='{"slidesToShow": 3, "slidesToScroll": 1}'>
						<div class="slide_item">
							<div class="card col-md-12 col-sm-12">
								<div class="card-header">Header</div>
								<div class="card-body">
									<h4>Card title</h4>
									<h6 class="text-muted">Subtitle</h6>
									<p>Some quick example text to build on the card title .</p>
								</div>
							</div>
						</div>
						<div class="slide_item">
							<div class="card col-md-12 col-sm-12">
								<div class="card-header">Header</div>
								<div class="card-body">
									<h4>Card title</h4>
									<h6 class="text-muted">Subtitle</h6>
									<p>Some quick example text to build on the card title .</p>
								</div>
							</div>
						</div>
						<div class="slide_item">
							<div class="card col-md-12 col-sm-12">
								<div class="card-header">Header</div>
								<div class="card-body">
									<h4>Card title</h4>
									<h6 class="text-muted">Subtitle</h6>
									<p>Some quick example text to build on the card title .</p>
								</div>
							</div>
						</div>
						<div class="slide_item">
							<div class="card col-md-12 col-sm-12">
								<div class="card-header">Header</div>
								<div class="card-body">
									<h4>Card title</h4>
									<h6 class="text-muted">Subtitle</h6>
									<p>Some quick example text to build on the card title .</p>
								</div>
							</div>
						</div>
						<div class="slide_item">
							<div class="card col-md-12 col-sm-12">
								<div class="card-header">Header</div>
								<div class="card-body">
									<h4>Card title</h4>
									<h6 class="text-muted">Subtitle</h6>
									<p>Some quick example text to build on the card title .</p>
								</div>
							</div>
						</div>
						<div class="slide_item">
							<div class="card col-md-12 col-sm-12">
								<div class="card-header">Header</div>
								<div class="card-body">
									<h4>Card title</h4>
									<h6 class="text-muted">Subtitle</h6>
									<p>Some quick example text to build on the card title .</p>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<div class="row" id="bestImage">
			<h1>BEST IMAGE</h1>
			<div class="col-md-12">
				<div class="hls_sol">
					<ul>
						<li><img src="travel1.jpg" alt="">
							<div class="hls_sol_data">
								<h3>1위</h3>
								<div class="hls_data">
									<a href="https://500px.com/ravi7284007" target="_blank"
										class="hls_title">여행자님</a> <a
										href="#https://www.facebook.com/ravi7284007"
										class="btn btn-pro" target="_blank"> 여행기록 보러가기</a>
								</div>
							</div></li>
						<li><img src="travel1.jpg" alt="">
							<div class="hls_sol_data">
								<h3>2위</h3>
								<div class="hls_data">
									<a href="https://500px.com/ravi7284007" target="_blank"
										class="hls_title">여행자님</a> <a
										href="https://www.facebook.com/ravi7284007"
										class="btn btn-pro" target="_blank"> 여행기록 보러가기</a>
								</div>
							</div></li>
						<li><img src="travel1.jpg" alt="">
							<div class="hls_sol_data">
								<h3>3위</h3>
								<div class="hls_data">
									<a href="https://500px.com/ravi7284007" target="_blank"
										class="hls_title">여행자님</a> <a
										href="https://www.facebook.com/ravi7284007"
										class="btn btn-pro" target="_blank"> 여행기록 보러가기</a>
								</div>
							</div></li>
						<li><img src="travel1.jpg" alt="">
							<div class="hls_sol_data">
								<h3>4위</h3>
								<div class="hls_data">
									<a href="https://500px.com/ravi7284007" target="_blank"
										class="hls_title">여행자님</a> <a
										href="https://www.facebook.com/ravi7284007"
										class="btn btn-pro" target="_blank"> 여행기록 보러가기</a>
								</div>
							</div></li>
					</ul>
				</div>

			</div>
		</div>

		<div class="row">
			<div class="col-md-12" id="foot">
				<h1>푸터올 곳</h1>
			</div>
		</div>

	</div>

	<!-- 	<article></article> -->
	<footer> </footer>




	<script src='source/lib/slick/slick.js'></script>
	<script>
		$('.data').slick({
			dots : true,
			infinite : true,
			slidesToShow : 3,
			slidesToScroll : 1,
			variableWidth : true,
			autoplay : true,
			speed : 500,
			autoplaySpeed : 5000
		});
	</script>
</body>
</html>