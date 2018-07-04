<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>TravelMaker</title>
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
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
  <link rel="stylesheet" type="text/css"
	href="source/lib/slick/slick-theme.css" /> 
	<script src="include/slider/responsiveslides.min.js"></script>	
	
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.1.0/css/all.css">
<style>
div {
	box-sizing: border-box;
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
		<c:when test="${sessionScope.user.seq !=null}">
			<%@include file="include/mainNavi_login.jsp"%>

		</c:when>
		<c:otherwise>
			<%@include file="include/mainNavi.jsp"%>
		</c:otherwise>
	</c:choose>
	<div class="container"  style="margin-top:-140px;">

		<h1 class="divLine">BEST PLAN</h1>
		<hr />
		<div class="row" id="bestPlanRow">
			<div class="col-md-12" id="bestPlan"">
				<div class="data"
					data-slick='{"slidesToShow": 3, "slidesToScroll": 1}'
					style="max-height: 250px; min-height: 250px; height: 250px;">

					<c:forEach var="tmp" items="${main}">
						<div class="item"
							style="width: 400px; max-width: 400px; min-width: 400px; max-height: 250px; min-height: 250px; height: 250px; padding: 5px;">
							<div class="card col-md-12 col-sm-12 w-100"
								style="height: 100%; padding: 0px;">
								<div class="card-header">사진</div>
								<div class="card-body">
									<a href="planArticle.plan?plan_seq=${tmp.plan_seq}"
										style="text-decoration: none; padding: 0px;"><h4>${tmp.plan_title }</h4></a>
									<h6 class="text-muted">${tmp.plan_writerN}</h6>
									<div class="btn-list d-inline">

										<i class="far fa-eye"></i> <span>${tmp.plan_viewcount}</span>
										<i class="fas fa-hand-holding-heart"></i> <span>${tmp.plan_good}</span>

									</div>
								</div>
							</div>
						</div>
					</c:forEach>



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
	</div>
	<div id="footer">
		<%@include file="footer1.jsp"%>
	</div>

	<c:if test="${main==null}">
		<script>
			location.href = "main.bo";
		</script>
	</c:if>
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
	<c:choose>
		<c:when test="${sessionScope.user.seq !=null}">
			<%@include file="include/multiChat.jsp"%>
		</c:when>
	</c:choose>
</body>


</html>