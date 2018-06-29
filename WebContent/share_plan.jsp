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
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/gijgo@1.9.6/js/gijgo.min.js"
	type="text/javascript"></script>
<link href="https://cdn.jsdelivr.net/npm/gijgo@1.9.6/css/gijgo.min.css"
	rel="stylesheet" type="text/css" />

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

.card-body{
	text-align:justify;
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


.mobile-wrap {
	text-align: center;
	margin: auto;
	width: 400px;
	height: 534px;
	overflow: hidden;
	position: relative;
	background-color: white;
	box-shadow: 0 12px 15px 0 rgba(0, 0, 0, .24), 0 17px 50px 0
		rgba(0, 0, 0, .19);
	box-sizing: border-box;
}

.mobile-header {
	width: 100%;
	height: 15%;
	text-align: center;
	margin: 0px auto;
	display: block;
	text-align: center;
}

.mobile-title {
	width: 100%;
	height: 30px;
	text-align: center;
	margin: 0px auto;
	box-sizing: border-box;
	margin-top: 30px;
}

.mobile-title>input {
	text-align: center;
	width: 70%;
	height: 90%;
	border: none;
	box-sizing: border-box;
	border-color: white;
	border: none;
	border-bottom: 1px solid gray;
	border-top: 1px solid gray;
	font-size: 15px;
	font-style: italic;
	color: gray;
}

#picker-div {
	width: 100%;
	height: 80px;
	text-align: center;
	margin: 0 auto;
	box-sizing: border-box;
	margin-top: 25px;
}

.picker-pic {
	width: 175px;
	height: 100%;
	text-align: center;
	margin: 0 auto;
	box-sizing: border-box;
	margin-left: 15px;
	float: left;
	padding-top: 4px;
	box-sizing: border-box;
	color: gray;
}

#picker_wrap {
	width: 390px; height : 100%;
	margin: 0 auto;
	height: 100%;
}

#start-plan {
	width: 100%;
	height: 10%;
	text-align: center;
	margin: 0 auto;
	box-sizing: border-box;
	margin-top: 30px;
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
			<div class="input-group mt-2 col-md-12" id="search_area">
				<input type="text"
					class="form-control ml-auto col-4 justify-content-center"
					placeholder="제목 검색" aria-label="reply"
					aria-describedby="basic-addon2" id="search">
				<div class="input-group-append">
					<button class="btn btn-outline-secondary mx-1" type="button"
						id="searchbtn" name="searchbtn">검색</button>
				</div>
				<button type="button" class="btn btn-primary ml-auto" data-toggle="modal"
			data-target="#exampleModalCenter">나의 여행 계획 세우기</button>
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

		$("#writebtn").click(function() {
		})
	</script>
	<script>
		$(document).ready(
				function() {
					var minDate = new Date();
					var maxDate = new Date();

					var mm = minDate.getDate() - 1;
					var dd = maxDate.getDate() + 62;
					minDate.setDate(mm);
					maxDate.setDate(dd);

					$("#datepicker").datepicker({
						uiLibrary : 'bootstrap4',
						format : 'yyyy-mm-dd',
						language : "ko",
						minDate : minDate,
						maxDate : maxDate,
					});

					$("#datepicker-end").datepicker({
						uiLibrary : 'bootstrap4',
						format : 'yyyy-mm-dd',
						language : "ko",
						constrainInput : true,
						minDate : minDate,
						maxDate : maxDate,
					});

					var todate = "";
					var enddate = "";

					var formdt = null;
					var todt = null;
					var datepage = "";

					$("#datepicker").change(
							function() {
								todate = $(this).val();
								$("#datepicker-end").val("");
								
								if (enddate != "") {
									var arrtodate = todate.split("/");
									var arrenddate = enddate.split("/");
									formdt = new Date(arrtodate[0],
											arrtodate[1], arrtodate[2]);
									todt = new Date(arrenddate[0],
											arrenddate[1], arrenddate[2]);
									console.log((todt.getTime() - formdt
											.getTime())
											/ (24 * 60 * 60 * 1000));
									datepage = (todt.getTime() - formdt
											.getTime())
											/ (24 * 60 * 60 * 1000);
									if (datepage == 0) {
										$("#dayday").html("당일 여행");
									} else if (datepage < 0) {
										$("#dayday").html("출발일이 더늦을수없습니다");
									} else {
										$("#dayday")
												.html(datepage + 1 + "일 여행");
									}
								}
							});

					$("#datepicker-end").change(
							function() {
								if (todate != "") {
									enddate = $(this).val();
									console.log(todate + ":" + enddate);
									
									var arrtodate = todate.split("-");
									var arrenddate = enddate.split("-");
									formdt = new Date(arrtodate[0], arrtodate[1],
											arrtodate[2]);
									todt = new Date(arrenddate[0], arrenddate[1],
											arrenddate[2]);
									console.log((todt.getTime() - formdt.getTime())
											/ (24 * 60 * 60 * 1000));
									datepage = (todt.getTime() - formdt.getTime())
											/ (24 * 60 * 60 * 1000);
									if (datepage == 0) {
										$("#dayday").html("당일 여행");
									} else if (datepage < 0) {
										$("#dayday").html("출발일이 더늦을수없습니다");
									}else {									
										$("#dayday").html(datepage+1 + "일 여행");
									}
								} else {
									alert("시작 날짜를 먼저 입력하세요.");
									$(this).val("");
								}
							});

					$("#start-btn").click(
							function() {
								if (datepage < 0) {
									alert("여행일을 제대로 설정해주세요.");
								} else if ($("#plan_title").val() == "") {
									alert("여행 제목을 지어주세요.")
								} else {
									$("#plan-form").attr("action",
											"createPlan.plan").submit();
								}
					});

					$('#myModal').on('shown.bs.modal', function() {
						$('#myInput').trigger('focus')
					});

				});
	</script>
</body>
</html>
