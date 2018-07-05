<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Share Plan</title>
<!-- 부트스트랩 CDN -->
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/gijgo@1.9.6/js/gijgo.min.js"
	type="text/javascript"></script>
<link href="https://cdn.jsdelivr.net/npm/gijgo@1.9.6/css/gijgo.min.css"
	rel="stylesheet" type="text/css" />
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css">

<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="source/js/createplan.js"></script>
<link rel="stylesheet" href="source/css/createplan.css">
<!-- 폰트어썸 CDN -->
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.1.0/css/all.css">
<style>

body {
	margin: 0;
}
#searchwrap {
	padding: 0px;
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
	text-align: justify;
	padding: 0px;
}
#search_area{
	margin:0 auto;
	text-align: center;
		
}

#user-plan{
	float:right;
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

.footer {
	height: 300px;
}
#contID{
	margin-top:140px;
}
</style>
</head>
<body>
	<c:choose>
	<c:when test="${user==null}">
	<script>
		$(document).ready(function(){
			$("#user-plan").prop('hidden',true);
		});
	</script>
	</c:when>
	</c:choose>
	<!-- 네비  -->
	<c:choose>
		<c:when test="${sessionScope.user.seq !=null}">
			<%@include file="include/otherNavi.jsp"%>
		</c:when>
		<c:otherwise>
			<%@include file="include/otherNavi_login.jsp"%>
		</c:otherwise>
	</c:choose>
	<div class="container" id="contId">
		<div class="modal fade" id="exampleModalCenter" tabindex="-1"
			role="dialog" aria-labelledby="exampleModalCenterTitle"
			aria-hidden="true">
			<div class="modal-dialog modal-dialog-centered" role="document">
				<div class="modal-content">
					<form method="post" id="plan-form">
						<div class="modal-header">
							<div class="h1" style="margin: 0 auto;">나의 여행계획 세우기</div>
						</div>
						<div class="modal-body">
							<div class="mobile-title">
								<input type="text" id="plan_title" name="plan_title"
									class="from-contol" maxlength=400 placeholder="여행 제목을 입력해주세요">
							</div>
							<div id="picker-div">
								<div id="picker_wrap">
									<div class="picker-pic">
										여행 시작 날짜<input id="datepicker" name="plan_startdate" readonly
											width="170" style="background-color: white;" />
									</div>
									<div class="picker-pic" id="datepicker_endarea">
										여행 종료 날짜<input id="datepicker-end" name="plan_enddate"
											readonly width="170" style="background-color: white;" />
									</div>
								</div>
							</div>
							<div id="start-plan">
								<p id="dayday" style="font-size: 13px; font-style: italic;">여행
									일수</p>
							</div>
						</div>
						<div class="modal-footer">
							<button id="start-btn" type="button" class="btn btn-primary">여행
								계획 시작하기</button>
							<button type="button" class="btn btn-secondary"
								data-dismiss="modal">Close</button>

						</div>
					</form>
				</div>
			</div>
		</div>

		<!-- 검색/ 글쓰기 버튼  -->
		<div class="row col-md-12">
			<div class="input-group " id="search_area">
				<input type="text"
					class=" form-control ml-auto col-4 justify-content-center"
					placeholder="제목 검색" aria-label="reply"
					aria-describedby="basic-addon2" id="search">
				<div class="input-group-append">
					<button class="btn btn-outline-secondary mx-1" type="button"
						id="searchbtn" name="searchbtn">검색</button>
				</div>
				<button type="button" class="btn btn-primary ml-auto"
					data-toggle="modal" data-target="#exampleModalCenter" id="user-plan">나의
					여행 계획 세우기</button>
			</div>
		</div>

		<!-- plan 리스트  -->
		<h1 class="divLine">Plan</h1>
		<hr/>

		<div class="row mt-2 mx-0">
			<c:forEach var="item" items="${planList}">
				<div class="item col-md-3 mb-3">
					<div class="card text-center">
		<a href="planArticle.plan?currentPage=${currentPage}&plan_seq=${item.plan_seq}" style="text-decoration:none;">
						<div class="card-header planTitle" style="line-height:35px;height:55px; overflow:hidden;">${item.plan_title}</div>
		</a>
						<div class="card-body mt-1 text-center">
							<h6 class="text-muted d-inline mr-5" name="subTitle">${item.plan_writerN}</h6>
							<div class="btn-list d-inline">

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


	</div>
	<%@include file="footer1.jsp"%>

	<script>
		$("#searchbtn").click(function() {
			location.href = "planboard.plan?search=" + $("#search").val();
		})
	</script>
</body>
	<c:choose>
		<c:when test="${sessionScope.user.seq !=null}">
			<%@include file="include/multiChat.jsp"%>
		</c:when>
	</c:choose>
</html>