<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<!-- 부트 스트랩 코드-->
<script src="https://code.jquery.com/jquery-3.3.1.js"></script>
<link rel="stylesheet"
	href="source/lib/bootstrap-3.3.2-dist/css/bootstrap.css">
<link rel="stylesheet"
	href="source/lib/bootstrap-3.3.2-dist/css/bootstrap-theme.css">
<script src="source/lib/bootstrap-3.3.2-dist/js/bootstrap.js"></script>
<link rel="stylesheet" href="source/css/codepenNavi.css">



<link rel="stylesheet" type="text/css" href="source/lib/slick/slick.css" />
<link rel="stylesheet" type="text/css"
	href="source/lib/slick/slick-theme.css" />

<link rel="stylesheet" href="mypage.css" type="text/css">

<style>
div {
	border: 1px solid black;
	box-sizing: border-box;
}

.container {
	height: 100%;
}

#navi {
	height: 70px;
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

.data, .data div{
	height: 400px;
}

.item {
	width: 300px;
}
</style>

</head>
<body>

	<%@include file="include/mainNavi.jsp"%>
	<div class="container">
		<div class="row">
			<div class="col-md-12" id="bestPlan">
				<div class="data" data-slick='{"slidesToShow": 3, "slidesToScroll": 1}'>
				<div class="item">
					<div class="card col-md-12 col-sm-12 w-100">
                <div class="card-header"> Header </div>
                <div class="card-body">
                  <h4 >Card title</h4>
                  <h6 class="text-muted">Subtitle</h6>
                  <p>Some quick example text to build on the card title .</p>
                </div>
              </div>
				</div>
				<div class="item">
					<div class="card col-md-12 col-sm-12 w-100">
                <div class="card-header"> Header </div>
                <div class="card-body">
                  <h4 >Card title</h4>
                  <h6 class="text-muted">Subtitle</h6>
                  <p>Some quick example text to build on the card title .</p>
                </div>
              </div>
				</div>
				<div class="item">
					<div class="card col-md-12 col-sm-12 w-100">
                <div class="card-header"> Header </div>
                <div class="card-body">
                  <h4 >Card title</h4>
                  <h6 class="text-muted">Subtitle</h6>
                  <p>Some quick example text to build on the card title .</p>
                </div>
              </div>
				</div>
				<div class="item">
					<div class="card col-md-12 col-sm-12 w-100">
                <div class="card-header"> Header </div>
                <div class="card-body">
                  <h4 >Card title</h4>
                  <h6 class="text-muted">Subtitle</h6>
                  <p>Some quick example text to build on the card title .</p>
                </div>
              </div>
				</div>
				<div class="item">
					<div class="card col-md-12 col-sm-12 w-100">
                <div class="card-header"> Header </div>
                <div class="card-body">
                  <h4 >Card title</h4>
                  <h6 class="text-muted">Subtitle</h6>
                  <p>Some quick example text to build on the card title .</p>
                </div>
              </div>
				</div>
				<div class="item">
					<div class="card col-md-12 col-sm-12 w-100">
                <div class="card-header"> Header </div>
                <div class="card-body">
                  <h4 >Card title</h4>
                  <h6 class="text-muted">Subtitle</h6>
                  <p>Some quick example text to build on the card title .</p>
                </div>
              </div>
				</div>
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
	<script
		src='source/lib/slick/slick.js'></script>
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