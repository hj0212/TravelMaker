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

.item {
	display: inline-block;
}

.planTitle {
	font-size: 20px;
	font-weight: 650;
}

.card-header span[name="subTitle"] {
	float: right;
}
</style>
</head>
<body>
	<!-- 네비  -->
	<c:choose>
		<c:when test="${sessionScope.userid != null}">
			<%@include file="include/mainNavi_login.jsp"%>
		</c:when>
		<c:otherwise>
			<%@include file="include/mainNavi.jsp"%>
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
			<c:forEach var="item" items="${planList}">
				<div class="item col-md-3">
					<div class="card text-center">
						<div class="card-header planTitle">${item.plan_title}</div>
						
						<div class="card-body mt-1">
							<h6 class="text-muted d-inline" name="subTitle">${item.plan_writerN}</h6>
							<div class="btn-list d-inline justify-content-end">

								<i class="far fa-eye"></i> <span>${item.plan_viewcount}</span> <i
									class="fas fa-hand-holding-heart"></i> <span>${item.plan_good}</span>
							</div>
							<hr>
							<p class="text-center">여기다 뭐넣을까여</p>
						</div>
					</div>
				</div>
			</c:forEach>

		</div>
		<!--plan 카드 영역 row끝  -->


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
			location.href = "planboard.plan?search=" + $("#search").val();
		})
		
	$("#writebtn").click(function(){
	})
</script>

</body>
</html>
