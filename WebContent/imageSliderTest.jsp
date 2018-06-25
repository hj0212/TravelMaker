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


<script
	src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.1/jquery.min.js'></script>
<script src='//cdn.jsdelivr.net/jquery.slick/1.5.0/slick.min.js'></script>
<script src="source/js/imageSlider.js" type="text/javascript"> </script>

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
				<div class="col-md-12 slider-container" id="bestPlan">

					<div class="slider-images-container">
						<img class="slide-image" src="travel1.jpg" /><img
							class="slide-image" src="travel1.jpg" /><img class="slide-image"
							src="travel1.jpg" /><img class="slide-image" src="travel1.jpg" /><img
							class="slide-image" src="travel1.jpg" /><img class="slide-image"
							src="travel1.jpg" /><img class="slide-image" src="travel2.png" />
					</div>



				</div>
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



</body>
</html>