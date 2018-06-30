<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<!-- 부트 스트랩 코드-->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css">

<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>

<link rel="stylesheet" href="source/css/mainPage.css">



<link rel="stylesheet" type="text/css" href="source/lib/slick/slick.css" />
<link rel="stylesheet" type="text/css"
	href="source/lib/slick/slick-theme.css" />


<style>
div {
	box-sizing: border-box;
}

.container {
	height: 100%;
}

#bestPlan {
	height: 400px;
}

#bests {
	height: 400px;
}

#foot {
	height: 100px;
}

.data, .data div {
	height: 400px;
}

.item {
	width: 300px;
}

.hls_sol_data {
	text-align: center;
}

.hls_sol a {
	left: 50%;
	transform: translateX(-50%);
}

.hls_sol .btn {
	bottom: 10px;
}
</style>

</head>
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

		<h1 class="divLine">BEST PLAN</h1>
		<hr />
		<div class="row" id="bestPlanRow">
			<div class="col-md-12" id="bestPlan">
				<div class="data"
					data-slick='{"slidesToShow": 3, "slidesToScroll": 1}'>
					<div class="item">
						<div class="card col-md-12 col-sm-12 w-100">
							<div class="card-header">Header</div>
							<div class="card-body">
								<h4>Card title</h4>
								<h6 class="text-muted">Subtitle</h6>
								<p>Some quick example text to build on the card title .</p>
							</div>
						</div>
					</div>
					<div class="item">
						<div class="card col-md-12 col-sm-12 w-100">
							<div class="card-header">Header</div>
							<div class="card-body">
								<h4>Card title</h4>
								<h6 class="text-muted">Subtitle</h6>
								<p>Some quick example text to build on the card title .</p>
							</div>
						</div>
					</div>
					<div class="item">
						<div class="card col-md-12 col-sm-12 w-100">
							<div class="card-header">Header</div>
							<div class="card-body">
								<h4>Card title</h4>
								<h6 class="text-muted">Subtitle</h6>
								<p>Some quick example text to build on the card title .</p>
							</div>
						</div>
					</div>
					<div class="item">
						<div class="card col-md-12 col-sm-12 w-100">
							<div class="card-header">Header</div>
							<div class="card-body">
								<h4>Card title</h4>
								<h6 class="text-muted">Subtitle</h6>
								<p>Some quick example text to build on the card title .</p>
							</div>
						</div>
					</div>
					<div class="item">
						<div class="card col-md-12 col-sm-12 w-100">
							<div class="card-header">Header</div>
							<div class="card-body">
								<h4>Card title</h4>
								<h6 class="text-muted">Subtitle</h6>
								<p>Some quick example text to build on the card title .</p>
							</div>
						</div>
					</div>
					<div class="item">
						<div class="card col-md-12 col-sm-12 w-100">
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

		<h1 class="divLine">BEST IMAGE</h1>
		<hr />
		<div class="row col-md-12 mx-0" id="bestImage">
			<div class="col-md-3 hls_sol px-1">
				<img src="travel1.jpg" alt="">
				<div class="hls_sol_data">
					<h1>1</h1>
					<div class="hls_data">
						<a href="" target="" class="hls_title">여행자님</a> <a href=""
							class="btn btn-pro">여행계획보기</a>
					</div>
				</div>
			</div>

			<div class="hls_sol col-md-3 px-1">
				<img src="travel1.jpg" alt="">
				<div class="hls_sol_data">
					<h1>2</h1>
					<div class="hls_data">
						<a href="" target="" class="hls_title">여행자님</a> <a href=""
							class="btn btn-pro">여행계획보기</a>
					</div>
				</div>
			</div>
			<div class="col-md-3 hls_sol px-1">
				<img src="travel1.jpg" alt="">
				<div class="hls_sol_data">
					<h1>3</h1>
					<div class="hls_data">
						<a href="" target="" class="hls_title">여행자님</a> <a href=""
							class="btn btn-pro">여행계획보기</a>
					</div>
				</div>
			</div>
			<div class="col-md-3 hls_sol px-1">
				<img src="travel1.jpg" alt="">
				<div class="hls_sol_data">
					<h1>4</h1>
					<div class="hls_data">
						<a href="" target="" class="hls_title">여행자님</a> <a href=""
							class="btn btn-pro">여행계획보기</a>
					</div>
				</div>
			</div>

		</div>
		<!--bestImage 영역 끝 -->
		<h1 class="divLine">푸터</h1>
		<hr />
		<!-- <div class="row">
			<div class="col-md-12" id="foot"></div>
		</div> -->

	</div>
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
			autoplaySpeed : 2000
		});
	</script>
</body>

</html>