<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
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
<script
	src="source/lib/lightswitch05-table-to-json/jquery.tabletojson.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="source/css/plan_writeNavi.css">
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
			<%@include file="include/otherNavi_login.jsp"%>			
		</c:when>
		<c:otherwise>
			<%@include file="include/otherNavi.jsp"%>			
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
			<button type="button" class="btn btn-outline-primary" id="savebtn">임시 저장</button>
			<button type="button" class="btn btn-primary" id="endbtn">등록</button>
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
    <%@include file="footer1.jsp"%>
    </div>
<script>
$(document).ready(function() {
	$("#endbtn").click(function() {
		if(confirm("등록하시겠습니까?")) {
			location.href = "savePlan.plan";
		}
	});
	
	$("#savebtn").click(function() {
		if(confirm("입력된 일정을 저장하고 나가시겠습니까?")) {
			location.href = "planboard.plan";
		}
	});
	
	budgetcount = 1;
	$("#moneyaddbtn").click(function() {
		budgetcount++;
	 	$("#schedule-boarder>tbody>tr>.budget").append("<div class='input-group mb-1'><input type='text' class='form-control' placeholder='예) 입장료' id='ex"+budgetcount+"'><input type='text' class='form-control' placeholder='10000' id='money"+budgetcount+"'><input type='hidden' class='budget_seq' id='budget"+budgetcount+"'>"
				+"<div class='input-group-prepend'><span class='input-group-text'>원</span><button style='border: none' type='button' class='btn btn-outline-danger' id='moneyxbtn"+budgetcount+"'><i class='far fa-times-circle'></i></button></div></div>");
	});
	
	$("#schedule-boarder").on('click',"button[id^=moneyx]",(function() {
		var delbudseq = $("#scheduleform>input[name='delbudseq']").val();
		if(delbudseq == "") {
			$("#scheduleform>input[name='delbudseq']").val($(this).siblings(".budget_seq").val()+"/");
		} else {
			$("#scheduleform>input[name='delbudseq']").val(delbudseq + $(this).siblings(".budget_seq").val() + "/");
		}
		console.log($("#scheduleform>input[name='delbudseq']").val());
		$(this).parent().parent().remove();
	}));

	

	$("#plan-table").on('click',"button[type='button']",function(event) {
		var index = $(event.currentTarget).closest("tr").index();
		var info = $("#plan-tbody")[0];
		info.deleteRow(index,datecount--);
		$("#plan-table tr:last td:last-child").append("<button type='button' class='btn btn-outline-danger btn-sm'style='float:right'><i class='fa fa-times'></i></button>");
	});

	$("#schedule-plan td:last-child").hide();
	$("#schedule-plan th:last-child").hide();

	$("#delete-table").click(function() {
		if ($("#delete-table").text() == "삭제") {
			$("#delete-table").text("완료");
			$("#delete-table").attr("class","btn btn-outline-primary");
			$("#schedule-plan td:last-child").show();
			$("#schedule-plan th:last-child").show();
		} else {
			$("#delete-table").text("삭제");
			$("#delete-table").attr("class","btn btn-outline-danger");
			$("#schedule-plan td:last-child").hide();
			$("#schedule-plan th:last-child").hide();
		}
	});		
	
	
	$("#schedule-plan").on('click',"button[type='button']",function(event) {
		var index = $(event.currentTarget).closest("tr").index();
		var info = $("#schedule-tbody")[0];
		info.deleteRow(index);
		location.href = "deleteSchedule.plan?plan=${param.plan}&day=${param.day}&delseq=" + $(this).siblings().val();
	});		

	var schedulecount = 1;
	$("#success-primary").click(function() {
		console.log("active:"+ $("#schedule-plan>tbody>.active>th").html());
		con = "";
		if ($("#schedule-plan>tbody>.active>th").html() != "") {
			con = "일정을 수정하시겠습니까?";
			$("#scheduleform").attr("action","modiSchedule.plan");
			
		} else {
			con = "일정을 추가하시겠습니까?";
			$("#scheduleform").attr("action","addSchedule.plan");
		}

		starttime = $("#start-time").val();
		endtime = $("#end-time").val();
		place = $("#place").val();
		mapx = $("#mapx").val();
		mapy = $("#mapy").val()
		schedule = $("#schedule").val();
		
		var budgetn = $("#schedule-boarder>tbody>tr>td.budget>div.input-group").length;
		console.log("등록 예산 갯수" + budgetn);
		budget_seq = "";
		budget_plan = "";
		budget_amount = "";
		for(var i = 0; i < budgetn; i++) {
			budget_seq += $("#schedule-boarder>tbody>tr>.budget div:nth-of-type("+(i+1)+") input[id^='budget']").val()
			budget_seq += "/";
			budget_plan += $("#schedule-boarder>tbody>tr>.budget div:nth-of-type("+(i+1)+") input[id^='ex']").val();
			budget_plan += "/";
			budget_amount += $("#schedule-boarder>tbody>tr>.budget div:nth-of-type("+(i+1)+") input[id^='money']").val();
			budget_amount += "/";
		}
		console.log("seq:"+budget_seq+",plan:"+budget_plan+",amount:"+budget_amount);
		$("#schedule-boarder>tbody>tr>.budget>input[name='budget_seq']").val(budget_seq);
		$("#schedule-boarder>tbody>tr>.budget>input[name='budget_plan']").val(budget_plan);
		$("#schedule-boarder>tbody>tr>.budget>input[name='budget_amount']").val(budget_amount);
		
		reference = $("#reference").val();

		if (starttime == "" || endtime == "") {
			alert("시간을정해주세요");
		} else if (place == "") {
			alert("장소를정해주세요");
		} else if (schedule == "") {
			alert("일정을적어주세요");
		} else if (confirm(con)) {
			$("#scheduleform").submit(); 
			var contents = '';
			contents += '<tr class="clickable-row new active"><th style="height:50px;"></th><td name="place"></td><td name="schedule"></td>';
			contents += '<td name="money"></td>';
			contents += '<td name="reference"></td>';
			contents += '<td><button style="float:left;border:none"type="button"class="btn btn-outline-danger"><i class="far fa-times-circle"></i></button><input type="hidden" name="schedule_seq" value="0"></td>';
			contents += '</tr>';
			
			if ($("#schedule-plan>tbody>.active>th").length == 0) { // 빈칸 = 마지막줄
				$("#schedule-plan>tbody>tr").removeClass('new');
				$("#schedule-plan>tbody>tr").removeClass('active');
				$("#schedule-plan>tbody:last").append(contents);
				$("#schedule-plan td:last-child").hide();

			} else { // 빈칸x = 마지막줄x
				var cursor = "#schedule-plan>tbody>.active";
				$("#schedule-plan>tbody>tr").removeClass('active');
				$("#schedule-plan>tbody>.new").addClass('active');
			}

			$("#start-time").val("");
			$("#end-time").val("");
			$("#place").val("");
			$("#schedule").val("");
			$("#money").val("");
			$("#reference").val("");
		}				
	});
	
	isFirst = true;
	$("#schedule-plan").on('click','.clickable-row',function(event) {
		$(this).addClass('active').siblings().removeClass('active');
		var seq = $(".active .schedule_seq").val();
		$("#plan-board input[name='schedule_seq']").val(seq);
		var timestr = $("#schedule-plan>tbody>.active>th").html().split("~");
		$("#start-time").val(timestr[0]);
		$("#end-time").val(timestr[1]);
		$("#place").val($("#schedule-plan>tbody>.active>td[name='place']").text());
		$("#location_id").val($("#schedule-plan>tbody>.active #planlocation_id").val());
		$("#mapx").val($("#schedule-plan>tbody>.active #planmapx").val());
		$("#mapy").val($("#schedule-plan>tbody>.active #planmapy").val());
		$("#schedule").val($("#schedule-plan>tbody>.active>td[name='schedule']").html());
		
		var budgetnum = $("#schedule-plan>tbody>.active>td[name='money']>div>.budget_plan").length;
		/* var formnum = $("#schedule-boarder>tbody>tr>.budget>div").length; */
		
		$("#schedule-boarder>tbody>tr>.budget>div").remove();
		
	
		for(var i = 0; i < budgetnum; i++) {
			$("#schedule-boarder>tbody>tr>.budget").append("<div class='input-group mb-1'><input type='text' class='form-control' placeholder='예) 입장료' id='ex"+(j+1)+"'><input type='text' class='form-control' placeholder='10000' id='money"+(j+1)+"'><input type='hidden' class='budget_seq'>"
					+"<div class='input-group-prepend'><span class='input-group-text'>원</span><input type='hidden' class='budget_seq' id='budget"+(j+1)+"'><button style='border: none' type='button' class='btn btn-outline-danger' id='moneyxbtn"+(j+1)+"'><j class='far fa-times-circle'></i></button></div></div>");
		}
		
		for(var j = 0; j < budgetnum; j++) {
			var budget_seq = $("#schedule-plan>tbody>.active>td[name='money']>div:nth-of-type("+(j+1)+")>input").val();
			var budget_plan = $("#schedule-plan>tbody>.active>td[name='money']>div:nth-of-type("+(j+1)+")>div.budget_plan").html().split(":")[0];
			var budget_amount = $("#schedule-plan>tbody>.active>td[name='money']>div:nth-of-type("+(j+1)+")>div.budget_amount").html();
			console.log(budget_seq);
			$("#schedule-boarder>tbody>tr>.budget div:nth-of-type("+(j+1)+") input[id^='budget']").val(budget_seq);
			$("#schedule-boarder>tbody>tr>.budget div:nth-of-type("+(j+1)+") input[id^='ex']").val(budget_plan);
			$("#schedule-boarder>tbody>tr>.budget div:nth-of-type("+(j+1)+") input[id^='money']").val(budget_amount);	
		}
		
		$("#reference").val($("#schedule-plan>tbody>.active>td[name='reference']").html());
	});				
    
    $("#searchbtn").click(function() {
    	$("#results").html("");
    	var val = $("#searchlocation").val();
    	$("#searchlocation").val("");
    	
    	$.ajax({
    		url : "searchLocal.sl",
    		type : "post",
    		data : {value : val},
    		
    		success : function(resp) {
    			var results = $("#results")[0];
    			
    			if(resp == null || resp.length < 1) {
                    $("#results").html("<span class='align-middle'  >찾는 결과가 없습니다.</span>");
                    return;
    			}

                for (var i = 0; i < resp.length; i++) {
                    var div = document.createElement("div");
                    var result = resp[i].address + "<br>" + resp[i].title + "<br><span class='category'>" + resp[i].category + "</span>";
                    result += "<span class='mapx' style='display:none'>" + resp[i].mapx + "</span><span class='mapy' style='display:none'>" + resp[i].mapy + "</span>";
                    div.className = "select";
                    div.innerHTML = result;

                    results.appendChild(div);
                }
    		},
    		
            error: function () {
                console.log("에러 발생!");
            }
    	});
    })
    
    // 지역 검색창이 닫힐때 내용 모두 제거
    $("#searchModal").on('hidden.bs.modal', function () {
        $("#results").html("");
    });
    
    // 동적 바인딩(hover) - 검색결과 
    $(document).on('mouseenter', '.select', function (event) {
        $(this).css('background-color', '#e9e9e9');
        $(this).css('cursor', 'pointer');
    }).on('mouseleave', '.select', function () {
        $(this).css('background-color', 'white');
    });
    
    // 클릭시 지역 검색창 닫힘
    $(document).on('click', '.select', function () {
        var search = $(this).html();
        var pattern = /display:none">(.*?)<\/span>/gi;
        var res = "";

        // 배열에 지역의 정보를 담음
        var locationinfo = [];

        // 맵의 x, y 좌표
        while ((res = pattern.exec(search))) {
            locationinfo.push(res[1]);
        }

        // 선택한 장소 이름
        pattern = /<br>(.*?)<br>/gi;
        while ((res = pattern.exec(search))) {
            // 태그 제거한 장소 이름
            var localname = res[1].replace(/<(\/)?([a-zA-Z]*)(\s[a-zA-Z]*=[^>]*)?(\s)*(\/)?>/ig, "");
            locationinfo.push(localname);
        }
        
        $("#mapx").val(locationinfo[0]);
        $("#mapy").val(locationinfo[1]);
		$("#place").val(locationinfo[2]);
        
        $("#searchModal").modal('toggle');
    });

});
</script>
</body>
</html>