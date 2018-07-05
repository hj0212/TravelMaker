<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<head>
<title>일정 확인</title>

<link rel="stylesheet"
	href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.3/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/gijgo@1.9.6/js/gijgo.min.js"
	type="text/javascript"></script>
<link href="https://cdn.jsdelivr.net/npm/gijgo@1.9.6/css/gijgo.min.css"
	rel="stylesheet" type="text/css" />
<script
	src="//cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.3/js/bootstrap.min.js"></script>
<script type="text/javascript"
	src="https://openapi.map.naver.com/openapi/v3/maps.js?clientId=h6OAt0uXG7GgMxCgzJWa&submodules=geocoder"></script>
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.1.0/css/all.css">
<script src="../source/js/jquery.roadmap.min.js"></script>
<link rel="stylesheet" href="../source/css/jquery.roadmap.min.css">
<script src="../source/js/createplan.js"></script>
<link rel="stylesheet" href="../source/css/createplan.css" />
<%@ page session="true"%>
<meta charset="utf-8">

<style type="text/css">
* {
	padding: 0;
	margin: 0;
}

.container {
	width: 960px;
	margin-top: 120px;
}

.wrapper {
	margin: 13px 0 10px;
	height: 100%;;
}

.schedule {
	margin-top: 10px;
}
.col-md-12, .col-lg-6 {
	padding-right: 0;
	padding-left: 0;
}

.left_half {
	padding-right: 5px;
	padding-left: 5px;
	height: 400px;
	float: left;
}

#timeline {
	margin: 0;
	width: 100%;
}

.right_half {
	padding-left: 5px;
	padding-right: 5px;
	float: right;
	height: 400px;
}

.event__date, .event__content {
	height: 30px;
}

.wrapper .right_half div {
	height: 100%;
}

.form-control {
	position: absoulte;
	float: left;
}

.pagination {
	position: absoulte;
	float: left;
}

#schedule-table .budget_plan, .budget_amount {
	display: inline;
}

#btnarea {
	margin-bottom: 20px;
}

#plantitle {
	margin-bottom: 10px;
}

#plan_title {
	background-color: white;
}

#planinfoarea {
	text-align: left;
	height: 36px;
}

#planinfoarea p {
	display: inline;
	margin-right: 15px;
}

#planbtnarea {
	display: inline;
	float: right;
}

#getmyplanbtn {
	float: left;
}

.mapsinfo {
	position: absolute;
	font-weight: bold;
	background-color: white;
	line-height: 30px;
	top: -50px;
	border-left: 1px solid black;
	border-right: 1px solid black;
	border-top: 1px solid black;
}

#schedule-table .select {
	background-color: #eee;
}

#timeline li .select {
	font-weight: bold;
}

#totalbudgetarea {
	float:right;
}

#totalbudgetarea, #budgetarea {
	width: 220px;
}

#budgetarea>input, #totalbudgetarea>input {
	background-color: white;
}

#budgetarea input, #budgetarea span, #totalbudgetarea input, #totalbudgetarea span {
	font-size: medium;
	height: 35px;
	line-height: 19px;
}

.schedule>.nav-tabs {
	width: 700px;
	float: left;
	border: none;
	padding-bottom: 6px;
}
</style>

<script>
	$(document).ready(function() {

		$("#goodbtn").click(function() {

			var article = "${plan_seq}";

			$.ajax({
				type : 'POST',
				url : "plangood.btns",
				data : {
					article : article
				},
				success : function(good) {
					console.log("asdasd");
					$("#goodbtn").html("");
					$("#goodbtn").html('<i class="fas fa-heart"></i>' + good);
				}
			});

		});
		$("#badbtn").click(function() {
			var article = "${plan_seq}";

			$.ajax({
				type : 'POST',
				url : "planbad.btns",
				data : {
					article : article
				},
				success : function(bad) {
					console.log("asdasd");
					$("#badbtn").html("");
					$("#badbtn").html('<i class="far fa-frown"></i>' + bad);
				}
			});

		});

	});
</script>
</head>
<body>
	<c:choose>
		<c:when test="${empty sessionScope.user.seq}">
			<script>
				location.href = "error.jsp"
			</script>
		</c:when>
		<c:otherwise>
			<%@include file="../include/otherNavi.jsp"%>
		</c:otherwise>
	</c:choose>

	<div class="container text-center">
		<div class="input-group input-group-lg" id="plantitle">
			<div class="input-group-prepend">
				<span class="input-group-text" id="inputGroup-sizing-lg">여행</span>
			</div>
			<input type="text" class="form-control" aria-label="Large"
				aria-describedby="inputGroup-sizing-sm" id="plan_title"
				name="plantitle" value="${plan_title}" readonly>
		</div>

		<div id="planinfoarea">
			<p>작성자 | ${plan.plan_writerN }</p>
			<c:if test="${plan.plan_writer eq sessionScope.user.seq}">
				<p>여행 기간 | ${plan.plan_startdate } ~ ${plan.plan_enddate }</p>
			</c:if>
			<p>조회수 | ${plan.plan_viewcount }
			<p>
			<div id="planbtnarea">
				<c:if test="${plan.plan_writer eq sessionScope.user.seq}">
					<button class="btn btn-outline-secondary" id="modibtn">수정</button>
					<button class="btn btn-outline-secondary" id="remobtn">삭제</button>
				</c:if>
				<button class="btn btn-outline-secondary" id="listbtn">목록</button>
			</div>
		</div>
		<c:if test="${!empty scheduleList }">
		<div id="view" class="wrapper row">
			<div class="left_half col-sm-12 col-lg-6">
				<div id="timeline" style="border: 1px solid gray;"></div>
			</div>
			<div class="right_half col-sm-12 col-lg-6">
				<div id="map" style="border: 1px solid gray;"></div>
			</div>
		</div>
		</c:if>
		<div class="schedule">
			<ul class="nav nav-tabs" role="tablist">
				<c:forEach var="day" begin="1" end="${plan_period}" step="1">
					<li class="nav-item"><a class='nav-link' href='#Day${day}'
						role='tab' data-toggle='tab'>Day${day}</a></li>
				</c:forEach>
			</ul>
			<div class="input-group input-group-lg budgetarea" id="totalbudgetarea">
				<div class="input-group-prepend">
					<span class="input-group-text" id="inputGroup-sizing-lg">총 예산</span>
				</div>
				<input type="text" class="form-control" aria-label="Large"
					aria-describedby="inputGroup-sizing-sm" value="${totalBudget}원"
					readonly>
			</div>
			<div class="tab-content">
				<c:set var="isFirst" value="true" />
				<c:forEach var="day" begin="1" end="${plan_period}" step="1">
					<input type="hidden" id="plan_seq" value="${plan_seq}">
					<div role="tabpanel" class="tab-pane fade show" id="Day${day}">
						<table class="table" id="schedule-table">
							<c:if test="${isFirst }">
								<thead>
									<tr>
										<th scope="col" style="width: 160px;">시간</th>
										<th scope="col" style="width: 190px;">장소</th>
										<th scope="col">일정</th>
										<th scope="col">예산</th>
										<th scope="col">참고</th>
									</tr>
								</thead>
								<c:set var="isFirst" value="false" />
							</c:if>
							<c:if test="${not isFirst}">
								<tbody id="schedule-tbody"
									style="table-layout: fixed; word-break: break-all;">
									<c:forEach var="item" items="${scheduleList}">

										<c:if test="${item.day_seq eq day }">
											<tr class="clickable-row">
												<th scope="row" style="height: 50px;">${item.schedule_starttime}~${item.schedule_endtime}</th>
												<td name="place">${item.location_name}<input
													type="hidden" value="${item.location_id}"></td>
												<td name="schedule">${item.schedule_plan}</td>

												<c:if test="${!empty budgetList}">
													<c:set var="loop_flag" value="false" />
													<c:set var="count" value="1" />
													<c:forEach var="bitem" items="${budgetList}"
														varStatus="index">
														<c:if test="${not loop_flag }">
															<c:if test="${item.schedule_seq == bitem.schedule_seq}">
																<c:choose>
																	<c:when test="${count == 1}">
																		<td name="money">
																			<div>
																				<div class="budget_plan">${bitem.budget_plan}:</div>
																				<div class="budget_amount">${bitem.budget_amount}</div>
																			</div> <c:set var="count" value="2" />
																	</c:when>
																	<c:otherwise>
																		<div>
																			<div class="budget_plan">${bitem.budget_plan}:</div>
																			<div class="budget_amount">${bitem.budget_amount}</div>
																		</div>
																	</c:otherwise>
																</c:choose>
															</c:if>
															<c:if
																test="${index.last && count == 1 && item.schedule_seq != bitem.schedule_seq}">
																<td name="money"></td>
																<c:set var="loop_flag" value="true" />
															</c:if>
														</c:if>
													</c:forEach>
												</c:if>
												<c:if test="${empty budgetList}">
													<td name="money"></td>
												</c:if>
												<td name="reference">${item.schedule_ref}</td>
											</tr>
										</c:if>
									</c:forEach>
									<c:forEach var="bud" items="${daytotalBudget}"
										varStatus="status">
										<c:if test="${status.count eq day}">
											<tr>
												<td colspan=5>
													<div class="input-group input-group-lg .budgetarea" id="budgetarea">
														<div class="input-group-prepend">
															<span class="input-group-text" id="inputGroup-sizing-lg">일별
																예산</span>
														</div>
														<input type="text" class="form-control" aria-label="Large"
															aria-describedby="inputGroup-sizing-sm" value="${bud}원"
															readonly>
													</div>
											</tr>
										</c:if>
									</c:forEach>
								</tbody>
							</c:if>
						</table>
					</div>
					<c:set var="isFirst" value="true" />
				</c:forEach>
			</div>
		</div>

		<div id="btnarea">
			<button type="button" class="btn btn-outline-danger" id="goodbtn">
				<i class="fas fa-heart"></i>${good}
			</button>
			<button type="button" class="btn btn-outline-primary" id="badbtn">
				<i class="far fa-frown"></i>${bad}
			</button>
			<!-- <button type="button" class="btn btn-outline-success"
					data-toggle="modal" data-target="#exampleModalCenter" id="getmyplanbtn">내 일정으로 가져가기</button>
			 -->
			<button class="btn btn-default" style="float: right;">신고</button>
		</div>

		<div class="comments">
		 <button type="button" style="border: none; background-color: white;"
            id="comment-bnt">댓글보기▼</button>
		 <form method="post"  action="insertPlanComment.plan?plan_seq=${plan_seq}" id="planCommentForm" name="planCommentForm" >
	         <div style="width: 100%; margin: 0px;">
	            <div style="width: 80%">
	               <textarea class="form-control" rows="3" id="comment" style="resize: none; width: 100%; margin: 0px; float: left;" maxlength="65" name="comment_text" id="comment_text"></textarea>
	               <input type="text" readonly value="" name="articlenum" style="display:none">
	            </div>
	            <div
	               style="width: 20%; float: left; height: 86px; margin-bottom: 30px;">
	               <button style="width: 100%; height: 86px;background-color: white" id="commentbtn" name="commentbtn" >
	               <i class="fa fa-comments">댓글 작성</i></button>
	            </div>
	         </div>
		 </form>
			<div id="planCommentList">
				<table class="table" id="comment-table">
					<thead id="comment-thead">
						<tr>
							<th scope="col" style="width: 15%;">작성자</th>
							<th scope="col" style="width: 70%">댓 글 내 용</th>
							<th scope="col" style="width: 15%;">Last</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="pc" items="${result1}">
							<tr>
								<th scope="row"
									style="width: 15%; max-width: 15%; max-height: 51px;"
									class='writer'>${pc.comment_writerN}</th>
								<td style="width: 70%">${pc.comment_text}</td>
								<td style="width: 15%; font-size: 10px;">${pc.comment_time}

									<c:if test="${pc.comment_writer eq sessionScope.user.seq}">
										<button type="button" class="close" aria-label="Close"
											id="deleteComment">
											<a href="deletePlanComment.plan?comment_seq=${pc.comment_seq}&plan_seq=${pc.plan_seq}">
												<span aria-hidden="true">&times;</span>
											</a>
										</button>
									</c:if>

								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>
<script>
	$(".schedule ul li:first").addClass('active');
	$("div[id='Day1']").addClass('active');
   /*댓글관련 버튼들*/
   /*댓글 작성*/
   $('#commentbtn').click(function() {
	   var comment_text = $("#comment_text").val(); 
	   if(comment_text != null){
       $('#planCommentForm').submit();
	   }else{
		  alert("내용을 입력해주세요");
	   }
    });
    /*댓글보기*/
      var commentBntCount = 2;
      $("#comment-bnt").click(function() {
         var writer = $(".writer").text();
         if (commentBntCount == 1) {
            $("#comment-bnt").text("댓글감추기▲");
            $("#comment-table").show();
            commentBntCount++;
         } else {
            $("#comment-bnt").text("댓글보기▼");
            $("#comment-table").hide();
            commentBntCount--;
         }
      });
	$("#modibtn").click(function() {
		location.href = "selectSchedule.plan?plan=${plan_seq}&day=1&create=f";
	})
	
	$("#remobtn").click(function() {
		if(confirm("여행 계획을 삭제하시겠습니까?")) {
			location.href = "removePlan.plan?plan=${plan_seq}";
		}
	})
	
	$("#listbtn").click(function() {	
			location.href = "planboard.plan?currentPage=${currentPage}";
	});
	
	$("#schedule-table").on('click','.clickable-row',function(event) {
		$(this).addClass('select').siblings().removeClass('select');
		var index = $(event.currentTarget).closest("tr").index();
		map.panTo(new naver.maps.Point(markerlocation[index].location_x,markerlocation[index].location_y));
	});
	
	$("#timeline").on('click','.event',function(event) {
		$(this).addClass('select').parent().siblings().children('.event').removeClass('select');
		var index = $(event.currentTarget).closest("li").index();
		map.panTo(new naver.maps.Point(markerlocation[index].location_x,markerlocation[index].location_y));
	});
	
	plan_seq = $("input[id='plan_seq']").val();
	markerlocation = [];
	
	map = new naver.maps.Map('map', {
	    center: new naver.maps.Point(37.3595704, 127.105399),
	    zoom: 5,
	    mapTypeId: 'normal',
	    mapTypes: new naver.maps.MapTypeRegistry({
	        'normal': naver.maps.NaverMapTypeOption.getNormalMap({
	            projection: naver.maps.TM128Coord
	        }),
	    })
	});
	
	$.ajax({
		url:"planviewlist.Ajax",
		type:"post",
		data:{"plan_seq":$("input[id='plan_seq']").val()},
		success:function(data){		
			var obj = JSON.parse(data);
			
		   	timeline = [];

		// 다중 마커에 정보창 띄우기
			var markers = [],
		    infoWindows = [];


		// 받아온 jsonArry 정보를 이용해 배열에 넣음 
		var makeMarkerArray = function () {
		    if (obj.jLocationList[0] == null && obj.jTimeLine[0] == null) {
		    	$(".wrapper").hide();
		        return;
		    }
		    
		    var jsonArray = obj.jLocationList;
		    timelineArray = obj.jTimeLine;

		    for (var i = jsonArray.length-1; i >=0 ; i--) {
		        let markerObj = {
		            location_name: jsonArray[i].location_name,
		            location_x: jsonArray[i].location_x,
		            location_y: jsonArray[i].location_y
		        }
		        markerlocation.push(markerObj);
		    }

		    for (var i = timelineArray.length-1; i >= 0; i--) {
		        let timelineObj = {
		            date: timelineArray[i].day_seq+"일차",
		            content: timelineArray[i].location_name,
		        }
		        timeline.push(timelineObj);
		    }
		};
		makeMarkerArray();

		// 네이버 지도 생성
		map = new naver.maps.Map('map', {
		    center: new naver.maps.Point(markerlocation[0].location_x, markerlocation[0].location_y),
		    zoom: 9,
		    mapTypeId: 'normal',
		    mapTypes: new naver.maps.MapTypeRegistry({
		        'normal': naver.maps.NaverMapTypeOption.getNormalMap({
		            projection: naver.maps.TM128Coord
		        }),
		    })
		});

		// 정보창의 위치를 위한 변수
		var bounds = map.getBounds();

		// 타임라인을 생성함
		$("#timeline").roadmap(timeline, {
		    eventsPerSlide: 4,
		    slide : 1,
		    prevArrow : '<i class="fas fa-angle-left"></i>',
		    nextArrow : '<i class="fas fa-angle-right"></i>',
		});

		// 좌표에 마커를 찍고 정보를 보여줌
		var makeMarkerAndInfoWindow = function (markerArray) {
		    for (var i = 0; i < markerArray.length; i++) {
		        var marker = new naver.maps.Marker({
		            map: map,
		            position: new naver.maps.Point(markerArray[i].location_x, markerArray[i].location_y),
		            zIndex: 100
		        });

		        var infoWindow = new naver.maps.InfoWindow({
		            content: '<div class="mapsinfo" style="position:absolute;width:180px; height:50px;text-align:center;padding:10px;"><p>' + markerArray[i].location_name + '</p></div>'
		        });
		        
		        
		        markers.push(marker);
		        infoWindows.push(infoWindow);
		    };

		};
		makeMarkerAndInfoWindow(markerlocation);

		// 지도가 멈췄을때 발생하는 이벤트
		naver.maps.Event.addListener(map, 'idle', function () {
		    updateMarkers(map, markers);
		})
	
		// 지도가 멈췄을때 마커가 경계 밖에 있으면 보이지 않음
		function updateMarkers(map, markers) {
		    var mapBounds = map.getBounds();
		    var marker, position;

		    for (var i = 0; i < markers.length; i++) {
		        marker = markers[i]
		        position = marker.getPosition();

		        if (mapBounds.hasPoint(position)) {
		            showMarker(map, marker);
		        } else {
		            hideMarker(map, marker);
		        }
		    }
		}

		// 마커 보이기
		function showMarker(map, marker) {
		    if (marker.setMap()) return;
		    marker.setMap(map);
		}

		// 마커 숨기기
		function hideMarker(map, marker) {
		    if (!marker.setMap()) return;
		    marker.setMap(null);
		}

		// 해당 마커의 인덱스를 seq라는 클로저 변수로 저장하는 이벤트 핸들러를 반환
		function getClickHandler(seq) {
		    return function (e) {
		        var marker = markers[seq],
		            infoWindow = infoWindows[seq];
				
		        if (infoWindow.getMap()) {
		            infoWindow.close();
		        } else {
		            infoWindow.open(map, marker);
		        }
		    }
		}

		for (var i = 0, ii = markers.length; i < ii; i++) {
		    naver.maps.Event.addListener(markers[i], 'click', getClickHandler(i));
		}
		}
		
		
	});	
 
   </script>
</body>
</html>