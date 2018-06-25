<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>Scroll Fixed Navigation</title>

<meta name="viewport" content="width=device-width, maximum-scale=1.0" />
<link rel="stylesheet"
	href="source/lib/bootstrap-3.3.2-dist/css/bootstrap.css">
<link rel="stylesheet"
	href="source/lib/bootstrap-3.3.2-dist/css/bootstrap-theme.css">
<script src="source/lib/bootstrap-3.3.2-dist/js/bootstrap.js"></script>
<script src="https://code.jquery.com/jquery-3.3.1.js"></script>

<link rel="stylesheet" href="source/css/codepenNavi.css">
</head>
<!-- <div class="shadow-none p-3 mb-5 bg-light rounded">No shadow</div>
<div class="shadow-sm p-3 mb-5 bg-white rounded">Small shadow</div>
<div class="shadow p-3 mb-5 bg-white rounded">Regular shadow</div>
<div class="shadow-lg p-3 mb-5 bg-white rounded">Larger shadow</div> -->


<body>
	<header id="top-head">
		<div class="naviclass navbar-collapse role=navigation navbar-fixed-top" id="navidiv">
			 <h1 class="logo">TravelMaker</h1> 
			<nav id="main-nav">
				<ul>
					<li><a href="#">Plans</a></li>
					<li><a href="#">Schedules</a></li>
					<li><a href="#">Logo</a></li>
					<li><a href="#">Review</a></li>
					<li><a href="#">Board</a></li>
				</ul>
			</nav>
		</div>
	</header>
	<div class="container">
		<div id="main-visual">
			<div class="row">
				<div class="col-md-12" id="bestPlan">베스트 여행계획 이미지 슬라이더</div>
			</div>

			<div class="row">
				<div class="col-md-12" id="bests">베스트 사진, 베스트 장소, 베스트 후기</div>
			</div>

			<div class="row">
				<div class="col-md-12" id="foot">
					<h1>푸터올 곳</h1>
				</div>
			</div>

		</div>

	<!-- 	<article></article> -->
		<footer> </footer>


	</div>


	<script>
		(function($) {
			$(function() {
				var $header = $('#top-head');
				$(window).scroll(function() {
					if ($(window).scrollTop() > 50) {
						$header.addClass('fixed');
					} else {
						$header.removeClass('fixed');
					}
				});
			});
		})(jQuery);
	</script>
</body>
</html>