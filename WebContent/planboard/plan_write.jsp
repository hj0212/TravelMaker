<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>일정 등록</title>
<script type="text/javascript"
	src="https://openapi.map.naver.com/openapi/v3/maps.js?clientId=h6OAt0uXG7GgMxCgzJWa&submodules=geocoder"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.1.0/css/all.css">
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.22.2/moment.min.js"></script>
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/tempusdominus-bootstrap-4/5.0.0/js/tempusdominus-bootstrap-4.min.js"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/tempusdominus-bootstrap-4/5.0.0/css/tempusdominus-bootstrap-4.min.css" />
<script src="source/js/plan_write.js"></script>
	
<link rel="stylesheet" type="text/css" href="source/css/plan_writeNavi.css">
<style>
#title-board {
	font-size: 15px;
}

.container {
	margin-top: 120px;
}

.input-group {
	margin-bottom: 10px;
}

#plan-board {
	margin-top: 20px;
	width: 70%;
	/* float: left; 여기가 문제가 됨. */
	margin-bottom: 50px;
}
/* 플랜보드가 문제됨 */

#plan-div {
	margin-top: 20px;
}


#end-bt:hover {
	background-color: #e9e9e9;
}

#plus-plan:hover {
	background-color: #e9e9e9;
}

.col-10 {
	padding: 0px;
	width: 150px;
	float: left;
	margin-left: 24px;
}

.cococo {
	box-sizing: border-box;
	width: 10px;
	margin-left: 24px;
	float: left;
	text-align: center;
	vertical-align: middle;
}

#schedule-plan {
	padding: 0px;
	text-align: center;
	vertical-align: middle;
	margin-bottom: 10px;
}

#schedule-plan .active {
	background-color: #eee;
}

#schedule-plan div {
	display: inline;
}

/* #schedulearea {
	height: 300px;
	overflow: auto;
} */
#extraarea {
	height: 38px;;
}

#totalbudget {
	width: 150px;
	float: left;
	text-align: right;
}

#delete-table {
	float: right;
}

#title-board {
	background: white;
}

#results {
    position: relative;
    height: 300px;
    overflow-y: auto;
}

 /* 검색된 각 결과들 */
 .select {
     padding-top: 10px;
     padding-bottom: 10px;
     border-bottom: 1px solid #e9e9e9;
 }

 /* 카테고리 */
 .category {
     color: dodgerblue;
     font-size: 12px;
 }
 
 input[type="time"] {
 	display: inline;
 	width: 152px;
 }
 
 #savebtn {
 	margin: 0 3px;
 }
</style>

</head>

<body>
	<c:choose>
		<c:when test="${sessionScope.user.seq !=null}">
			<%@include file="../include/otherNavi_login.jsp"%>			
		</c:when>
		<c:otherwise>
			<%@include file="../include/otherNavi.jsp"%>			
		</c:otherwise>
	</c:choose>
	<div class="container">
		<div class="input-group input-group-lg">

			<div class="input-group-prepend">
				<span class="input-group-text" id="inputGroup-sizing-lg">여행</span>
			</div>
			<input type="text" class="form-control" aria-label="Large"
				aria-describedby="inputGroup-sizing-sm" id="title-board"
				name="plantitle" value="${plan_title}" readonly>
			<c:if test="${plan_state eq false}">
			<button type="button" class="btn btn-outline-primary" id="savebtn">임시 저장</button>
			</c:if>
			<button type="button" class="btn btn-primary" id="endbtn">작성 완료</button>
		</div>
		<!-- 여기 몇일 여행인지 받아서 개수만큼 돌리기 -->
		<div class="row col-md-12 days mt-0">
			<div style="display: inline-block; width: 100%; overflow-y: auto;">
				<ul class="timeline timeline-horizontal">
					<c:forEach var="day" begin="1" end="${plan_period}" step="1">
						<li class="timeline-item">
							<div class="timeline-badge">
								<i class="dayCount">${day}</i>
							</div>
							<c:if test="${day eq param.day }">
							<div class="timeline-panel">
								<div class="timeline-heading">
									<h5 class="timeline-title text-center">${plan_startdate}</h5>
										<p>
											<small class="text-muted"><i
												class="glyphicon glyphicon-time"></i>현재 작성중</small>
										</p>	
									
								</div>
							</div>
							</c:if>
						</li>
					</c:forEach>

				</ul>
			</div>
		</div>
		<script>
			$(".timeline-item .timeline-badge").click(function() {
				var t = $(this);
				var isClicked = $('.timeline-horizontal li').find('.active');
				console.log(isClicked);
				if (isClicked == null) {
					t.addClass("active");
				} else {
					isClicked.removeClass("active");
					t.addClass("active");
				}
				var day = $(this).children().html().split("일")[0];
				console.log(day);
				$(location).attr('href',"selectSchedule.plan?plan=${param.plan}&day="+day+"&create=f");
			})
			
			$("#endbtn").click(function() {
				if(confirm("작성 완료 하시겠습니까?")) {
					location.href = "savePlan.plan?plan=${param.plan}";
				}
			});
		</script>

		<!-- 일차 페이징 끝 -->
		<div id="schedulearea">
			<table class="table table-bordered" id="schedule-plan">
				<thead>
					<tr>
						<th scope="col">시간</th>
						<th scope="col">장소</th>
						<th scope="col">일정</th>
						<th scope="col">예산</th>
						<th scope="col">참조</th>
						<th scope="col" style="width: 20px;">삭제</th>
					</tr>
				</thead>

				<tbody id="schedule-tbody"
					style="table-layout: fixed; word-break: break-all;">
					<c:if test="${create == 'f'}">
						<c:forEach var="item" items="${scheduleList}">
							<tr class="clickable-row">
								<th scope="row" style="height: 50px;">${item.schedule_starttime}~${item.schedule_endtime}</th>
								<td name="place">${item.location_name}
									<input type="hidden" id="planlocation_id" value="${item.location_id}">
									<input type="hidden" id="planmapx" name="x" value="${item.location_x}">
									<input type="hidden" id="planmapy" name="y" value="${item.location_y}">
									</td>
								<td name="schedule">${item.schedule_plan}</td>

								<c:if test="${!empty budgetList}">
									<c:set var="loop_flag" value="false" />
									<c:set var="count" value="1" />
									<c:forEach var="bitem" items="${budgetList}" varStatus="index">
										<c:if test="${not loop_flag }">
											<c:if test="${item.schedule_seq == bitem.schedule_seq}">
												<c:choose>
													<c:when test="${count == 1}">
														<td name="money">
														<div>
														<input type="hidden" class="budget_seq" value="${bitem.budget_seq }">
														<div class="budget_plan">${bitem.budget_plan}:</div>
														<div class="budget_amount">${bitem.budget_amount}</div>
														</div><br>
														<c:set var="count" value="2" />
													</c:when>
													<c:otherwise>
														<div>
														<input type="hidden" class="budget_seq" value="${bitem.budget_seq }">
														<div class="budget_plan">${bitem.budget_plan}:</div>
														<div class="budget_amount">${bitem.budget_amount}</div>
														</div><br>
													</c:otherwise>
												</c:choose>
											</c:if>
											<c:if test="${index.last && count == 1 && item.schedule_seq != bitem.schedule_seq}">
												<td name="money"><input type="hidden" class="budget_seq" value="0"></td>
												<c:set var="loop_flag" value="true" />
											</c:if>
										</c:if>
									</c:forEach>
								</c:if>
								<c:if test="${empty budgetList}">
									<td name="money"></td>
								</c:if>
								<td name="reference">${item.schedule_ref}</td>
								<td><button style="float: left; border: none;"
										type="button" class="btn btn-outline-danger">
										<i class="far fa-times-circle"></i>
									</button> 
									<input type="hidden" class="schedule_seq" value="${item.schedule_seq}">
									
								</td>
							</tr>
						</c:forEach>
					</c:if>
					<tr class="clickable-row active new">
						<th scope="row" style="height: 50px;"></th>
						<td name="place"></td>
						<td name="schedule"></td>
						<td name="money"></td>
						<td name="reference"></td>
						<td><button style="float: left; border: none;" type="button"
								class="btn btn-outline-danger">
								<i class="far fa-times-circle"></i>
							</button> <input type="hidden" class="schedule_seq" value="0"></td>

					</tr>
				</tbody>
			</table>

			<div id="extraarea">
				<input type="text" id="totalbudget" class="form-control"
					value="${totalBudget}원" readonly>
				<button type="button" class="btn btn-outline-danger"
					id="delete-table">삭제</button>
			</div>
			<script></script>
		</div>
		<div class="row" style="padding-left:15px;">
		<div id="plan-board">
			<form method="post" id="scheduleform">
				<input type="hidden" name="plan" value="${param.plan}"> 
				<input type="hidden" name="day" value="${param.day}"> 
				<input type="hidden" name="schedule_seq" value="">
				<input type="hidden" name="delseq" value="">
				<input type="hidden" name="delbudseq" value="">
				<table class="table table-bordered" id="schedule-boarder">
					<thead>
					</thead>
					<tbody>
						<tr>
							<th scope="row"
								style="background-color: #e9e9e9; text-align: center; vertical-align: middle;">시간</th>
							<td style="width: 70%; text-align: center;">

							<div class="col-12">
								<input class="form-control" type="time"
									id="start-time" name="starttime"/> ~
								<input class="form-control" type="time"
									id="end-time" name="endtime"/>
							</div>	
						</td>
					</tr>
					<tr>
						<th scope="row" style="background-color: #e9e9e9; text-align: center; vertical-align: middle">장소</th>
						<td>
							<div class="input-group">
								<input type="text" class="form-control" placeholder="Search" readonly id="place" name="place">
								<div class="input-btn">
									<!-- 맨 아래에 모달 창 있음 -->
									<button class="btn btn-default" type="button" style="height: 100%; border: 1px" data-toggle="modal" data-target="#searchModal">
										<i class="fa fa-search"></i>
									</button>
								</div>
							</div>
						</td>
					</tr>
					<tr style="display:none">
						<td>
							<input type="text" id="location_id" name="location_id">
							<input type="text" id="mapx" name="mapx">
							<input type="text" id="mapy" name="mapy">
						</td>
					</tr>
					<tr>
						<th scope="row"
							style="background-color: #e9e9e9; text-align: center; vertical-align: middle">일정</th>
						<td><input class="form-control" id="schedule" name="schedule"></td>

						</tr>
						<tr>
							<th scope="row"
								style="background-color: #e9e9e9; text-align: center; vertical-align: middle">예산
								<button type='button' class='btn btn-outline-primary btn-sm'
								style='float: right' id="moneyaddbtn">
								<i class='fa fa-plus'></i>
							</button>
							</th>
							<td class="budget">
								<input type="hidden" name="budget_seq">
								<input type="hidden" name="budget_plan">
								<input type="hidden" name="budget_amount">
								<div class="input-group mb-1">
									<input type="text" class="form-control" id="ex1"
										placeholder="예) 입장료"> <input type="text"
										class="form-control" id="money1" placeholder="10000">
										<input type="hidden" class="budget_seq">
									<div class="input-group-prepend">
										<span class="input-group-text" >원</span>
									</div>
								</div>
							</td>

						</tr>
						<tr>
							<th scope="row"
								style="background-color: #e9e9e9; text-align: center; vertical-align: middle">참조</th>
							<td><input type="text" class="form-control" id="reference"
								name="reference"></td>
						</tr>
					</tbody>
				</table>
				<div style="text-align:center;">
					<button type="button" class="btn btn-outline-primary"
						id="success-primary" style="width:100px;">등록</button>
				</div>
			</form>
		</div>
		</div>
		<!-- <div style="width: 40%; float: right" id="plan-div">
			<div style="text-align: right">
				<button class="btn btn-inline-primary btn-lg" id="endbtn">여행계획
					완료</button>

			</div>
		</div> -->
	</div>
	
	
	<!-- 장소 찾기 모달 창 -->
    <div class="modal text-center" id="searchModal">
        <div class="modal-dialog">
            <div class="modal-content">
                <!-- Modal Header -->
                <div class="modal-header">
                    <h4 class="modal-title">주소 찾기</h4>
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>

                <!-- Modal body -->
                <div class="modal-body">
                    <!-- 검색 버튼과 검색 창 -->
                    <div class="input-group">
                        <input type="text" placeholder="Search.." class="form-control" id="searchlocation">
                        <div class="input-group-append">
                            <button type="submit" id="searchbtn" class="btn btn-primary">
                                <i class="fa fa-search"></i>
                            </button>
                        </div>
                    </div>
                    <div id="results">

                    </div>
                </div>

                <!-- Modal footer -->
                <div class="modal-footer">
                    <button type="button" class="btn btn-danger" data-dismiss="modal" id="btnclose">Close</button>
                </div>
            </div>
        </div>
    </div>
    <div class="footer" style="height: 300px;">
    <%@include file="../footer1.jsp"%>
    </div>
</body>
<c:choose>
		<c:when test="${sessionScope.user.seq !=null}">
			<%@include file="../include/multiChat.jsp"%>
		</c:when>
	</c:choose>	
</html>