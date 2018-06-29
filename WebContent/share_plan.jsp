<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Share Plan</title>
<!-- 부트스트랩 CDN -->
<script src="https://code.jquery.com/jquery-3.3.1.js"></script>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 폰트어썸 CDN -->
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.1.0/css/all.css">
<style>
body {
	margin: 0 auto;
}

#searchwrap {
	padding: 0;
}

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
	<!-- 네비  -->
	<c:choose>
		<c:when test="${sessionScope.userid ==null}">
			<%@include file="include/mainNavi.jsp"%>
		</c:when>
		<c:otherwise>
			<%@include file="include/mainNavi_login.jsp"%>
		</c:otherwise>
	</c:choose>
	<div class="container">
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
				<button type="button" class="btn btn-primary ml-auto" id="writebtn">
					계획 작성</button>
			</div>
		</div>

		<!-- plan 리스트  -->
		<h1 class="divLine">Plan</h1>
		<hr />

		<div class="row mt-5 mx-0">
			<div class="item col-md-3 col-sm-3 w-25">
				<div class="card">
					<div class="card-header">Plan title</div>
					<div class="card-body">
						<!--  <a href="#" class="badge badge-primary">후기</a>
                 <a href="#" class="badge badge-success">조회수</a> -->
						<h6 class="text-muted d-inline">Subtitle</h6>
						<div class="btn-list w-30 ml-1 d-inline">
							<button type="button"
								class="btn-review btn-outline-primary btn-sm ">
								<i class="fas fa-pencil-alt"></i>
							</button>
							<button type="button"
								class="btn-view btn-outline-success btn-sm ">
								<i class="far fa-caret-square-right"></i>
							</button>
							<button type="button" class="btn-like btn-outline-danger btn-sm">
								<i class="far fa-heart"></i>
							</button>
						</div>
						<hr>
						<p>Some quick example text to build on the card title .</p>
					</div>
				</div>
			</div>
		</div>
		<div class="row mt-5 mx-0">
			<div class="item col-md-3 col-sm-3 w-25">
				<div class="card">
					<div class="card-header">Plan title</div>
					<div class="card-body">
						<!--  <a href="#" class="badge badge-primary">후기</a>
                 <a href="#" class="badge badge-success">조회수</a> -->
						<h6 class="text-muted d-inline">Subtitle</h6>
						<div class="btn-list w-30 ml-1 d-inline">
							<button type="button"
								class="btn-review btn-outline-primary btn-sm ">
								<i class="fas fa-pencil-alt"></i>
							</button>
							<button type="button"
								class="btn-view btn-outline-success btn-sm ">
								<i class="far fa-caret-square-right"></i>
							</button>
							<button type="button" class="btn-like btn-outline-danger btn-sm">
								<i class="far fa-heart"></i>
							</button>
						</div>
						<hr>
						<p>Some quick example text to build on the card title .</p>
					</div>
				</div>
			</div>
		</div>

		<div class="row mt-5 mx-0">
			<div class="item col-md-3 col-sm-3 w-25">
				<div class="card">
					<div class="card-header">Plan title</div>
					<div class="card-body">
						<!--  <a href="#" class="badge badge-primary">후기</a>
                 <a href="#" class="badge badge-success">조회수</a> -->
						<h6 class="text-muted d-inline">Subtitle</h6>
						<div class="btn-list w-30 ml-1 d-inline">
							<button type="button"
								class="btn-review btn-outline-primary btn-sm ">
								<i class="fas fa-pencil-alt"></i>
							</button>
							<button type="button"
								class="btn-view btn-outline-success btn-sm ">
								<i class="far fa-caret-square-right"></i>
							</button>
							<button type="button" class="btn-like btn-outline-danger btn-sm">
								<i class="far fa-heart"></i>
							</button>
						</div>
						<hr>
						<p>Some quick example text to build on the card title .</p>
					</div>
				</div>
			</div>
		</div>
		<!-- review 카드 모음영역 끝 -->


		<!-- 페이지 네비 -->
		<div class="col-md-12 mt-2">
			<nav aria-label="Page navigation example">
				<ul class="pagination justify-content-center">${pageNavi}</ul>
			</nav>
		</div>


		<h1 class="divLine">푸터올 곳</h1>
		<hr />
		<div class="row">
			<div class="col-md-12" id="foot"></div>
		</div>
	</div>
	<script>
		$("#searchbtn").click(function() {
			location.href = "reviewboard.bo?search=" + $("#search").val();
		});

		$('.btn-review').click(function() {
			location.href = "#"
		})
		$('.btn-view')
				.mouseover(
						function() {
							$('.btn-view')
									.html(
											'<span class="btn-viewtext style="font-size:8px;"">123</span>');
						})
		$('.btn-view').mouseleave(function() {
			$('.btn-view').html('<i class="far fa-caret-square-right"></i>');

		})
		var num = 1;
		$('.btn-like').click(function() {
			if (num == 1) {
				$('.btn-like').html('<i class="fas fa-heart"></i>');
				num++;
			} else {
				$('.btn-like').html('<i class="far fa-heart"></i>');
				num--;
			}
		});
	</script>
</body>
</html>
