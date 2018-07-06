<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>TravelMaker</title>
<!-- 부트 스트랩 코드-->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="source/css/mainPage.css">
<link rel="stylesheet" type="text/css" href="source/lib/slick/slick.css" />
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
  <link rel="stylesheet" type="text/css" href="source/lib/slick/slick-theme.css" /> 
<script src="include/slider/responsiveslides.min.js"></script>	
	
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.1.0/css/all.css">

<link href="https://fonts.googleapis.com/css?family=Black+Han+Sans"
	rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Nanum+Pen+Script"
	rel="stylesheet">


<style>
div {
	box-sizing: border-box;
}

#bestPlan {
	height: 300px;
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
#bestImage {
	margin-bottom: 15px;
}
.divLine a{
	text-decoration: none;
	color: black;
}

.container-fulid {
	margin-right: auto;
	margin-left: auto;
}

.rounded-circle.go {
	width: 120px;
	height: 120px;
}

.rounded-circle.go:hover {
	opacity: 0.8;
}

.travelgo {
	display: flex;
	align-items: center;
	justify-content: center;
	transition: all 0.4s ease-in-out;
}

.travelgo:hover {
	display: flex;
	align-items: center;
	justify-content: center;
	opacity: 0.8;
	transform: scale(1.1);
	overflow: hidden;
}

.travelch {
	font-size: 30pt;
	text-sadow: 1px 1px 8px #000000;
	color: white;
}

.travelsummer {
	display: flex;
	align-items: center;
	justify-content: center;
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
	
	
	<div class="mainintro" style="margon-top: -100px;">
		<!--  background-color: rgb(241,243,245); -->
		<p
			style="text-align: center; font-size: 40pt; font-family: 'Nanum Pen Script', cursive;">TRAVELMAKER로
			상상속 여행을 현실로 만들어보세요!</p>
	</div>

	<div class="container">

		<!-- 메인  트래블메이커 안내 div 시작-->
		<div class="container-fluid text-center"
			style="height: 300px; background-color: rgb(241, 243, 245); padding: 40px; margin-top: -140px;">
			<div class="d-flex">
				<div class="p-2 flex-fill">
					<i class="fas fa-map fa-7x" style="color: gray"></i>
					<h3>최적 루트</h3>
					다양한 여행기로<br> 일정,교통편 최적화
				</div>
				<div class="p-2 flex-fill">
					<i class="far fa-calendar-alt fa-7x" style="color: gray"></i>
					<h3>여행기 관리</h3>
					나만의 여행기로<br>그날, 그날 여행 기록
				</div>
				<div class="p-2 flex-fill">
					<i class="far fa-comments fa-7x" style="color: gray"></i>
					<h3>유저 채팅</h3>
					실시간 채팅으로<br> 계획에 대한 빠른 피드백
				</div>
			</div>
		</div>
		<!-- 메인  트래블메이커 안내 div 종료-->

		<h1 class="divLine"><a href="planboard.plan">BEST PLAN</a></h1>
		<hr />
		<div class="row" id="bestPlanRow">
			<div class="col-md-12" id="bestPlan">
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
										style="text-decoration: none; padding: 0px;"><h4 style=" max-height:29px; overflow:hidden;">${tmp.plan_title }</h4></a>
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

		<h1 class="divLine">NEW IMAGE</h1>
		<hr />
		<div class="row col-md-12 mx-0" id="bestImage">
<!-- 카드 시작 -->				
			<c:set var="i" value="1"/>
			<c:forEach var="item" items="${photoList}">		
				<div class="col-md-3 hls_sol px-1">
				<img src="${pageContext.request.contextPath}/files/${item.system_file_name}" alt="">
				<div class="hls_sol_data">
					<h1>${i}</h1>
					<div class="hls_data">
						<a href="" target="" class="hls_title">${item.review_title}</a> 
						<a href="reviewArticle.bo?review_seq=${item.article_no}" class="btn btn-pro">여행계획보기</a>
					</div>
				</div>
			</div>
			<c:set var="i" value="${i+1}"/>
			</c:forEach>
		</div>
		<!--bestImage 영역 끝 -->
		
		<!--  트레블메이커 광고 여행 시작 -->
		<h1 class="divLine" style="font-family: 'Black Han Sans', sans-serif;">TRAVELMAKER에서
			보장하는 재밌는 여행</h1>
		<hr>
		<div class="container-fluid text-center" style="margin: auto;">
			<div class="row">
				<hr style="color: gray">

				<div class="col">
					<a href="#"><img src="source/img/TRAVEL/wonju.jpg"
						class="rounded-circle go" alt="원주 뮤지엄산" title="원주 뮤지엄산"></a><br>
					<b>원주 뮤지엄산</b><br>
					<p style="font-size: 10pt">
						세계적인 건축가 <br> 안도 타다오가 설계한<br> 전원형 뮤지엄 여행
					</p>
				</div>
				<div class="col">
					<a href="#"><img src="source/img/TRAVEL/iksan.jpg"
						class="rounded-circle go" alt="미륵사지석탑" title="익산 미륵사지석탑"></a><br>
					<b>익산 미륵사지석탑</b><br>
					<p style="font-size: 10pt">
						복원을 끝낸<br> 익산 미륵사지 석탑여행
					</p>
				</div>
				<div class="col">
					<a href="#"><img src="source/img/TRAVEL/damyang.jpg"
						class="rounded-circle go" alt="기차여행" title="남도 명소 .별미"></a><br>
					<b>남도 명소 .별미</b><br>
					<p style="font-size: 10pt">
						1박2일<br> KTX/SRT 기차여행
					</p>
				</div>

				<div class="col">
					<a href="#"><img src="source/img/TRAVEL/haesu.jpg"
						class="rounded-circle go" alt="해수욕장" title="전국 유명 해수욕장"></a><br>
					<b>전국 유명 해수욕장</b><br>
					<p style="font-size: 10pt">왕복 셔틀 버스로 교통비 절약 해수욕장 당일 여행!</p>
				</div>

				<div class="col">
					<a href="#"><img src="source/img/TRAVEL/bosung.jpg"
						class="rounded-circle go" alt="보성 녹차" title="보성 녹차"></a> <br>
					<b>보성 녹차</b><br>
					<p style="font-size: 10pt">
						바베큐코스가 포함된<br> 녹차 투어 패키지
					</p>
				</div>
				<div class="col">
					<a href="#"><img src="source/img/TRAVEL/jeonju.jpg"
						class="rounded-circle go" alt="맛있는 전주" title="맛있는 전주"></a><br>
					<b>맛있는 전주</b><br>
					<p style="font-size: 10pt">
						먹으러가자!<br> 유명 맛집투어 패키지!
					</p>
				</div>



			</div>
		</div>
		<!--  트레블메이커 광고 여행 종료 -->

		<!-- 트레블 메이커 추천 여행 시작  -->
		<h1 class="divLine" style="font-family: 'Black Han Sans', sans-serif;">TRAVELMAKER에서
			추천하는 재밌는 여행</h1>
		<hr>
		<div class="container-fluid">
			<a href="#" style="text-decoration: none;">
				<div class="travelgo"
					style="width: 100%; height: 300px; background-image: url(source/img/TRAVEL/irez.png);">
					<h5 class="travelch" style="text-shadow: 1px 1px 8px #000000;">
						당산 투어</h5>
				</div>
			</a> <br> <a href="#" style="text-decoration: none;">
				<div class="travelgo"
					style="width: 100%; height: 300px; background-image: url(source/img/TRAVEL/sheepz.png);">
					<h5 class="travelch" style="text-shadow: 1px 1px 8px #000000;">
						강원도 투어</h5>
				</div>
			</a> <br> <a href="#" style="text-decoration: none;">
				<div class="travelgo"
					style="width: 100%; height: 300px; background-image: url(source/img/TRAVEL/daejeonz.png);">
					<h5 class="travelch" style="text-shadow: 1px 1px 8px #000000;">
						대전 성심당 투어</h5>
				</div>
			</a>

			<hr>
			<!--  	<p
				style="color: gray; text-align: center; font-size: 30pt; font-family: 'Nanum Pen Script', cursive;">지금
				당신의 TRAVELMAKER를 시작해보세요!!</p>
			<hr style="color: gray">
			-->
		</div>
		<!-- 트레블 메이커 추천 여행 시작  -->
	</div>


	<p
		style="font-size: 50pt; color: white; font-family: 'Nanum Pen Script', cursive; text-align: center; background-color: gray;">
		지금 당신의 TRAVELMAKER를 시작해보세요!!</p>


	<div class="container"
		style="width: 1110px; margin-top: -160px; text-align: left;">
		<h1 class="divLine" style="font-family: 'Black Han Sans', sans-serif;">TRAVELMAKER에서
			추천하는 이달의 여행</h1>
	</div>
	<div class="container-fluid" style="height: 300px;">
		<div class="row" style="width: 970px; margin: auto;">
			<div class="col" style="text-align: right;">
				<h5 style="">7월, 여행을 떠나세요!!!</h5>
			</div>
			<div class="col" style="">
				<iframe width="560" height="315"
					src="https://www.youtube.com/embed/RHaYh6KHowY?rel=0&amp;controls=0&amp;showinfo=0"
					frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe>

			</div>
			<!--  	<p
				style="color: gray; text-align: center; font-size: 30pt; font-family: 'Nanum Pen Script', cursive;">지금
				당신의 TRAVELMAKER를 시작해보세요!!</p>
			<hr style="color: gray">
			-->
		</div>
	</div>
	<!-- 트레블 메이커 추천 여행 종료  -->

		
		
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
			centerMode: true,
			dots : true,
			infinite : true,
			slidesToShow : 3,
			slidesToScroll : 1,
			variableWidth : true,
			autoplay : true,
			speed : 500,
			autoplaySpeed : 1000
		});
	</script>
	<c:choose>
		<c:when test="${sessionScope.user.seq !=null}">
			<%@include file="include/multiChat.jsp"%>
		</c:when>
	</c:choose>
</body>


</html>