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
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css">

<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="source/js/createplan.js"></script>
<link rel="stylesheet" href="source/css/createplan.css">
<!-- 폰트어썸 CDN -->
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.1.0/css/all.css">
<style>

body {
	margin: 0;
}
#searchwrap {
	padding: 0px;
}
.container {
	padding-top: 140px;
	min-height: 570px;
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
	padding-top: 30px;
}

#search_area{
	margin: 10px auto;
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
#naviarea {
	margin-bottom: 150px;
}
.divLine {
	margin-top: 30px;
}

.container h1, .container  h6 {
	display: inline;
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

.card .profileimg img {
	width: 120px;
	height: 120px;
	-moz-border-radius: 50%;
	-webkit-border-radius: 50%;
	border-radius: 50%;
}

.card .content {
	background-color: transparent;
	-moz-box-shadow: none;
	-webkit-box-shadow: none;
	box-shadow: none;
	padding: 10px 20px 20px;
}

div.card-body {
	height: 100px;
	color: black;
	text-align: center;
}

div.card-body h6 {
	margin-bottom:10px;
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
	height: 300px;
	top: 0;
	left: 0;
	z-index: 2;
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
			<%@include file="../include/otherNavi.jsp"%>
		</c:when>
		<c:otherwise>
			<%@include file="../include/otherNavi_login.jsp"%>
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
		<div class="row col-md-12" id="search_area">
			<div class="input-group">
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
		<h1 class="divLine">Plan</h1> <h6> : 여행 계획을 공유해 주세요</h6>
		<hr/>

		<div class="row mt-2 mx-0" id="planlistarea">
			<c:forEach var="item" items="${planList}">
				<div class="item col-sm-6 col-md-4 col-lg-3 mb-3" style="width: 300px; height: 300px; padding: 5px;">
					<div class="card col-md-12 col-sm-12 w-100" style="height: 100%; padding: 0px;">
						<div class="front">
							<div class="cover">
								<img src="source/img/back1.png" />
							</div>
							<div class="profileimg">
							<c:choose>
								<c:when test="${item.part eq 'kakao'}">
									<span ><img src="${item.file_name}"></span>
								</c:when>
								<c:otherwise>
									<span ><img src="/TravelMaker/file/${item.file_name}"></span>
								</c:otherwise>
							</c:choose>
							</div>
							<div class="card-body">
								<h4 style="max-height: 29px; overflow: hidden;">
								<a href="planArticle.plan?currentPage=${currentPage}&plan_seq=${item.plan_seq}" style="text-decoration: none;">${item.plan_title}</a></h4>
								<h6 class="text-muted">${item.plan_writerN}
									<i class="far fa-eye"></i> <span>${item.plan_viewcount}</span>
									<i class="fas fa-hand-holding-heart"></i> <span>${item.plan_good}</span>
								</h6>
							</div>
						</div>
					</div>
				</div> 
			</c:forEach>
		</div>
		<!--plan 카드 영역 row끝  -->


		<!-- 페이지 네비 -->
		<div class="col-md-12 mt-2" id="naviarea">
			<nav aria-label="Page navigation example">
				<ul class="pagination justify-content-center">${pageNavi}</ul>
			</nav>
		</div>
	</div>
	
	<%@include file="../footer1.jsp"%>

	<script>
		$("#searchbtn").click(function() {
			location.href = "planboard.plan?search=" + $("#search").val();
		})
	</script>
	
</body>
	<c:choose>
		<c:when test="${sessionScope.user.seq !=null}">
			<%@include file="../include/multiChat.jsp"%>
		</c:when>
	</c:choose>	

</html>