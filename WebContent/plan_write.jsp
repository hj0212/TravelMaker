<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
	float: left
}

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

.active {
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
	<div class="container">
		<div class="input-group input-group-lg">

			<div class="input-group-prepend">
				<span class="input-group-text" id="inputGroup-sizing-lg">여행</span>
			</div>
			<input type="text" class="form-control" aria-label="Large"
				aria-describedby="inputGroup-sizing-sm" id="title-board"
				name="plantitle" value="${plan_title}" readonly>

		</div>
		<!-- 여기 몇일 여행인지 받아서 개수만큼 돌리기 -->
		<div class="row col-md-12 days mt-0">
			<div style="display: inline-block; width: 100%; overflow-y: auto;">
				<ul class="timeline timeline-horizontal">
					<c:forEach var="day" begin="1" end="5" step="1">
						<li class="timeline-item">
							<div class="timeline-badge">
								<i class="dayCount">${day}일차</i>
							</div>
							<div class="timeline-panel">
								<div class="timeline-heading">
									<h5 class="timeline-title text-center">${plan_startdate}</h5>
									<p>
										<small class="text-muted"><i
											class="glyphicon glyphicon-time"></i>입력된 일정 수: 0</small>
									</p>
								</div>
							</div>
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
				$(location).attr('href',"plan_write.jsp");
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
								<td name="place">${item.schedule_place}</td>
								<td name="schedule">${item.schedule_plan}</td>

								<c:if test="${!empty budgetList}">
									<c:set var="loop_flag" value="false" />
									<c:forEach var="bitem" items="${budgetList}" varStatus="index">
										<c:if test="${not loop_flag }">
											<c:if test="${item.schedule_seq == bitem.schedule_seq}">
												<td name="money">
													<div class="budget_plan">${bitem.budget_plan}:</div>
													<div class="budget_amount">${bitem.budget_amount}</div>
												</td>
												<c:set var="loop_flag" value="true" />
											</c:if>
											<c:if
												test="${index.last && item.schedule_seq != bitem.schedule_seq}">
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
								<td><button style="float: left; border: none;"
										type="button" class="btn btn-outline-danger">
										<i class="far fa-times-circle"></i>
									</button> <input type="hidden" class="schedule_seq"
									value="${item.schedule_seq}"></td>
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

		<div id="plan-board">
			<form action="addSchedule.plan" method="post" id="scheduleform">
				<input type="hidden" name="plan" value="${param.plan}"> <input
					type="hidden" name="day" value="${param.day}"> <input
					type="hidden" name="schedule_seq" value="0">
				<table class="table table-bordered" id="schedule-boarder">
					<thead>
					</thead>
					<tbody>
						<tr>
							<th scope="row"
								style="background-color: #e9e9e9; text-align: center; vertical-align: middle;">시간</th>
							<td style="width: 70%; text-align: center;">

							<div class="col-10">
								<input class="form-control" type="time"
									id="start-time" name="starttime"/>
							</div>
							<div class="cococo">~</div>
							<div class="col-10">
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
							<input type="text" readonly id="mapx" name="mapx">
							<input type="text" readonly id="mapy" name="mapy">
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
								<!-- <button type='button' class='btn btn-outline-primary btn-sm'
								style='float: right' id="moneyaddbtn">
								<i class='fa fa-plus'></i>
							</button> -->
							</th>
							<td><input type="text" class="form-control" id="money"
								name="money"></td>

						</tr>
						<tr>
							<th scope="row"
								style="background-color: #e9e9e9; text-align: center; vertical-align: middle">참조</th>
							<td><input type="text" class="form-control" id="reference"
								name="reference"></td>
						</tr>
					</tbody>
				</table>
				<div style="text-align: right">
					<button type="button" class="btn btn-outline-primary"
						id="success-primary">등록</button>
				</div>
			</form>
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
<script>
$(document).ready(function() {
	$("#endbtn").click(function() {
		/*$("#schedule-plan tr:last").remove();
		$("#schedule-plan thead tr th:last").remove();
		$("#schedule-plan tbody tr td:last").remove();
        
		var table = $("#schedule-plan").tableToJSON();
		var table_json = JSON.stringify(table);
		alert(table_json);
		
		 $.ajax({
			url:"saveschedules.plan",
			dataType:"json",
			type:"POST",
			data:table_json,
			contentType:"application/x-www-form-urlencoded",
			success: function() {
			},
			error:function() {
        	}
		}) */
	});
	
	
	/* budgetcount = 1;
	$("#moneyaddbtn").click(function() {
		budgetcount++;
	 	$("#schedule-boarder>tbody>tr>td[name='budget']").append("<div class='input-group mb-1'><input type='text' class='form-control' placeholder='예) 입장료' id='ex"+budgetcount+"'><input type='text' class='form-control' placeholder='10000' id='money"+budgetcount+"'>"
				+"<div class='input-group-prepend'><span class='input-group-text'>원</span></div></div><button style='float: left; border: none' type='button' class='btn btn-outline-danger'><i class='far fa-times-circle'></i></button>");
	});

							/* budgetcount = 1;
							$("#moneyaddbtn").click(function() {
								budgetcount++;
							 	$("#schedule-boarder>tbody>tr>td[name='budget']").append("<div class='input-group mb-1'><input type='text' class='form-control' placeholder='예) 입장료' id='ex"+budgetcount+"'><input type='text' class='form-control' placeholder='10000' id='money"+budgetcount+"'>"
										+"<div class='input-group-prepend'><span class='input-group-text'>원</span></div></div><button style='float: left; border: none' type='button' class='btn btn-outline-danger'><i class='far fa-times-circle'></i></button>");
							});

							$("#moneyxbtn").click(function() {
								
							}); */

							$("#plan-table")
									.on(
											'click',
											"button[type='button']",
											function(event) {
												var index = $(
														event.currentTarget)
														.closest("tr").index();
												var info = $("#plan-tbody")[0];
												info.deleteRow(index,
														datecount--);

												$(
														"#plan-table tr:last td:last-child")
														.append(
																"<button type='button' class='btn btn-outline-danger btn-sm'style='float:right'><i class='fa fa-times'></i></button>");

											});

							$("#schedule-plan td:last-child").hide();
							$("#schedule-plan th:last-child").hide();

    var schedulecount = 1;
    timeArray = new Array();
    $("#success-primary").click(function() {
    	console.log("active:" + $("#schedule-plan>tbody>.active>th").html());
        con = "";
        if($("#schedule-plan>tbody>.active>th").html() != "") {
        	con = "일정을 수정하시겠습니까?";
        } else {
        	con = "일정을 추가하시겠습니까?";
        }
        
        starttime = $("#start-time").val();
        endtime = $("#end-time").val();
        place = $("#place").val();
        schedule = $("#schedule").val();
        money = $("#money").val();
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
                
            	if($("#schedule-plan>tbody>.active>th").val() == "") {	// 빈칸 = 마지막줄
            		console.log("빈칸");
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
    
    $("#schedule-plan").on('click', '.clickable-row', function(event) {
    	  $(this).addClass('active').siblings().removeClass('active');
    	  var seq = $(".active .schedule_seq").val();
    	  console.log("선택:" + seq);
    	  $("#plan-board input[name='schedule_seq']").val(seq);
    	  console.log("seq셋팅: " + $("#plan-board input[name='schedule_seq']").val());
    	  var timestr = $("#schedule-plan>tbody>.active>th").html().split("~");
    	  $("#start-time").val(timestr[0]);
          $("#end-time").val(timestr[1]);
          $("#place").val($("#schedule-plan>tbody>.active>td[name='place']").html());
          $("#schedule").val($("#schedule-plan>tbody>.active>td[name='schedule']").html());
          $("#money").val($("#schedule-plan>tbody>.active>td[name='money']").html());
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