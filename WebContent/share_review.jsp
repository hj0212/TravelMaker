<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Share Review</title>
<!-- 부트스트랩 CDN -->
<script src="https://code.jquery.com/jquery-3.3.1.js"></script>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>

<style>
.container {
	padding-top: 140px;
}

div {
	box-sizing: border-box;
}

#cardArea .card .card-img-top {
	height: 250px;
	padding: 0px;
}

.card-body .card-title, .card-text {
	text-align: center;
}

.card-body {
	text-align: right;
	padding: 0px;
}

#search_area[type="button"] {
	align: right;
}
</style>
</head>
<body>
	<%@include file="include/mainNavi.jsp"%>
	<div class="container">
		<h1 class="divLine">계획, 그리고</h1>
		<hr />
		<!--review 카드 모음영역 -->
		<div class="row" id="cardArea">
			<div class="col-md-12 card-deck">
				<div class="card col-md-3">
					<img class="card-img-top" src="Charlie-Chaplin-PNG-Image-17681.png"
						alt="Card image cap">
					<div class="card-body">
						<h5 class="card-title">제주여행</h5>
						<p class="card-text">3일</p>
						<a href="#" class="btn btn-primary">읽기</a>
						<div class="card-footer bg-transparent">
							<small class="text-muted">Last updated 3 mins ago</small>
						</div>
					</div>
				</div>

				<div class="card col-md-3">
					<img class="card-img-top" src="Charlie-Chaplin-PNG-Image-17681.png"
						alt="Card image cap">
					<div class="card-body">
						<h5 class="card-title">제주여행</h5>
						<p class="card-text">3일</p>
						<a href="#" class="btn btn-primary ml-auto">읽기</a>
						<div class="card-footer bg-transparent">
							<small class="text-muted">Last updated 3 mins ago</small>
						</div>
					</div>

				</div>
				<div class="card col-md-3">
					<img class="card-img-top" src="Charlie-Chaplin-PNG-Image-17681.png"
						alt="Card image cap">
					<div class="card-body">
						<h5 class="card-title">제주여행</h5>
						<p class="card-text">3일</p>
						<a href="#" class="btn btn-primary">읽기</a>
						<div class="card-footer bg-transparent">
							<small class="text-muted">Last updated 3 mins ago</small>
						</div>
					</div>
				</div>
				<div class="card col-md-3">
					<img class="card-img-top" src="travel1.jpg" alt="Card image cap">
					<div class="card-body">
						<h5 class="card-title">제주여행</h5>
						<p class="card-text">3일</p>
						<a href="#" class="btn btn-primary">읽기</a>
						<div class="card-footer bg-transparent">
							<small class="text-muted">Last updated 3 mins ago</small>
						</div>
					</div>
				</div>

			</div>
		</div>
		<!-- review 카드 모음영역 끝 -->

		<!-- 검색/ 글쓰기 버튼  -->
		<div class="row col-md-12">
			<div class="input-group mt-2 col-md-12" id="search_area">
				<input type="text"
					class="form-control ml-auto col-4 justify-content-center"
					placeholder="제목 검색" aria-label="reply"
					aria-describedby="basic-addon2" id="search">
				<div class="input-group-append">
					<button class="btn btn-outline-secondary mx-1" type="button"
						id="searchbtn" name="searchbtn">검색</button>
				</div>
				<button type="button" class="btn btn-primary ml-auto" id="writebtn">글쓰기</button>
			</div>
		</div>

		<!-- 페이지 네비 -->
		<div class="row col-md-12">
			<nav aria-label="Page navigation">
				<ul class="pagination">${pageNavi}
				</ul>
			</nav>
		</div>
		<h1 class="divLine">푸터올 곳</h1>
		<hr />
		<div class="row">
			<div class="col-md-12" id="foot"></div>
		</div>
	</div>
</body>
</html>