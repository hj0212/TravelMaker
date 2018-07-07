<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.3/css/bootstrap.min.css">
<script
	src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.3/js/bootstrap.min.js"></script>
<script type="text/javascript"
	src="https://openapi.map.naver.com/openapi/v3/maps.js?clientId=nNEs9epKfyUEcdwyisTe&submodules=geocoder"></script>

<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.1.0/css/all.css"
	integrity="sha384-lKuwvrZot6UHsBSfcMvOkWwlCMgc0TaWr+30HWe3a4ltaBwTZhyTEggF5tJv8tbt"
	crossorigin="anonymous">

<title>TravelMaker</title>

<style>
@import url(https://fonts.googleapis.com/css?family=Raleway:200);

body {
	font-family: Raleway, sans-serif;
	font-size: 16px;
	/*font-weight: 200;*/
	/*color: #858585;*/
	overflow-x: hidden;
}

a {
	color: #6d6d6d;
	text-decoration: none;
}
a:hover, a:focus {
	/*color: #6d6d6d;*/
	text-decoration: underline
}


.container {
	margin-left: auto;
	margin-right: auto;
	padding-left: 15px;
	padding-right: 15px;
	width: 970px;
	padding-top : -135px !important;
}

.big-text {
	font-size: 58px;
	font-weight: 900;
	line-height: 62px;
	letter-spacing: 0.01em;
	word-spacing: 0.15em;
	text-transform: uppercase;
	color:rgb(52, 52, 52) !important;
}

.smallintro {
	font-size: 15px;
	font-weight: 900px;
}

.deepspace {
	visibility: hidden;
	width: 100%;
	height: 70px;
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

	<div class="container" style="margin-bottom: 48px;">
		<h1 class="big-text">
			Travel Maker<small class="smallintro"><small
				style="font-size: 30px">에</small>서 <a href="teamprofile1.jsp"
				style="text-decoration: underline; color: #858585;">함께하는 사람들 </a></small>
		</h1>
		<br>
		<p>
			팀 <strong style="font-weight: bold">TravelMaker</strong>는 훈남, 훈녀 6명이
			모인 프로젝트 그룹입니다.
		</p>
		<br>
		<P>
			팀 <strong style="font-weight: bold">TravelMaker</strong>는 <strong
				style="font-weight: bold"> HTML, JSP, ORACLE</strong>등을 이용해 자료 조사,
			계획작성, 사용자의 여행계획, 그것에 대한 피드백 등을 하나의 페이지에서 토탈케어가 가능하도록 돕고, 그로 하여금 사용자에게
			최고의 경험을 선사하도록 하는 것을 목표로 하고 있습니다.
		</P>
		<br>
		<P>
			팀 <strong style="font-weight: bold">TravelMaker</strong>는 소셜여행플랫폼인 웹
			어플리케이션 <strong style="font-weight: bold">'TravelMaker'</strong>를 통해
			사용자 모두에게 최고의 서비스를 제공하기 위해 팀 모두가 최선의 노력을 하고 있습니다.
		</P>
		<br> <br>
		<h5>오시는 길</h5>

		<div id="map" style="width: 100%; height: 300px; border-radius: 5px;"></div>

		<h6>
			주소 <small>서울특별시 영등포구 선유동2로 57 19층 B클래스</small>
		</h6>
		<h6>
			전화 <small>02-000-0000</small>
		</h6>
		<h6>
			팩스 <small>02-000-0000</small>
		</h6>

	</div>


	<script>
		var map = new naver.maps.Map('map');
		var myaddress = '서울 영등포구 선유동2로 57';// 도로명 주소나 지번 주소만 가능 (건물명 불가!!!!)
		naver.maps.Service
				.geocode(
						{
							address : myaddress
						},
						function(status, response) {
							if (status !== naver.maps.Service.Status.OK) {
								return alert(myaddress
										+ '의 검색 결과가 없거나 기타 네트워크 에러');
							}
							var result = response.result;
							// 검색 결과 갯수: result.total
							// 첫번째 결과 결과 주소: result.items[0].address
							// 첫번째 검색 결과 좌표: result.items[0].point.y, result.items[0].point.x
							var myaddr = new naver.maps.Point(
									result.items[0].point.x,
									result.items[0].point.y);
							map.setCenter(myaddr); // 검색된 좌표로 지도 이동
							// 마커 표시
							var marker = new naver.maps.Marker({
								position : myaddr,
								map : map
							});
							// 마커 클릭 이벤트 처리
							naver.maps.Event.addListener(marker, "click",
									function(e) {
										if (infowindow.getMap()) {
											infowindow.close();
										} else {
											infowindow.open(map, marker);
										}
									});
							// 마크 클릭시 인포윈도우 오픈
							var infowindow = new naver.maps.InfoWindow(
									{
										content : '<h4>TeamTravelMaker</h4><a href="#" target="_blank"><img src="test1.jpg" style="width: 120px; height: 120px;"></a>'
									});
						});
	</script>
	<div id="footer">
		<%@include file="footer1.jsp"%>
		</div>
</body>
</html>