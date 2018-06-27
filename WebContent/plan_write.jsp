<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

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
	href="https://use.fontawesome.com/releases/v5.1.0/css/all.css"
	integrity="sha384-lKuwvrZot6UHsBSfcMvOkWwlCMgc0TaWr+30HWe3a4ltaBwTZhyTEggF5tJv8tbt"
	crossorigin="anonymous">
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.22.2/moment.min.js"></script>
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/tempusdominus-bootstrap-4/5.0.0/js/tempusdominus-bootstrap-4.min.js"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/tempusdominus-bootstrap-4/5.0.0/css/tempusdominus-bootstrap-4.min.css" />
<script type="text/javascript" src="source/js/plan_write.js"></script>
<style>
#title-board {
	font-size: 15px;
}

.container {
	margin-top: 100px;
}

.input-group {
	margin-bottom: 10px;
}

#plan-board {
	margin-top: 20px;
	width: 55%;
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
}

.active {
	background-color: #eee;
}

#schedule-plan div {
	display: inline;
}
</style>

</head>

<body>
	<c:choose>
		<c:when test="${sessionScope.loginId !=null}">
			<%@include file="include/mainNavi_login.jsp"%>
		</c:when>
		<c:otherwise>
			<%@include file="include/mainNavi.jsp"%>
		</c:otherwise>
	</c:choose>
	<div class="container">
		<div class="input-group input-group-lg">
			<div class="input-group-prepend">
				<span class="input-group-text" id="inputGroup-sizing-lg">제목</span>
			</div>
			<input type="text" class="form-control" aria-label="Large"
				aria-describedby="inputGroup-sizing-sm" id="title-board"
				name="plantitle">
		</div>

		<div class="schedule">

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
					<tr class="clickable-row active new">
						<th scope="row" style="height: 50px;"></th>
						<td name="place"></td>
						<td name="schedule"></td>
						<td name="money"></td>
						<td name="reference"></td>
						<td><button style="float: left; border: none" type="button"
								class="btn btn-outline-danger">
								<i class="far fa-times-circle"></i>
							</button></td>

					</tr>
				</tbody>
			</table>
			<div id="bt-div" style="text-align: right;">

				<button type="button" class="btn btn-outline-danger"
					id="delete-table">삭제</button>
			</div>
		</div>

		<div id="plan-board">
			<table class="table table-bordered" id="schedule-boarder">
				<thead>
				</thead>

				<tbody>
					<tr>
						<th scope="row"
							style="background-color: #e9e9e9; text-align: center; vertical-align: middle">시간</th>
						<td style="width: 70%; text-align: center;">

							<div class="col-10">
								<input class="form-control" type="time" value="13:45:00"
									id="start-time" />
							</div>
							<div class="cococo">~</div>
							<div class="col-10">
								<input class="form-control" type="time" value="14:45:00"
									id="end-time" />
							</div>
						</td>



					</tr>
					<tr>
						<th scope="row"
							style="background-color: #e9e9e9; text-align: center; vertical-align: middle">장소</th>
						<td>
							<div class="input-group">
								<input type="text" class="form-control" placeholder="Search"
									readonly id="place">
								<div class="input-btn">
									<button class="btn btn-default" type="button"
										style="height: 100%; border: 1px">
										<i class="fa fa-search"></i>
									</button>
								</div>
							</div>
						</td>


					</tr>
					<tr>
						<th scope="row"
							style="background-color: #e9e9e9; text-align: center; vertical-align: middle">일정</th>
						<td><textarea class="form-control" id="schedule"></textarea></td>

					</tr>
					<tr>
						<th scope="row"
							style="background-color: #e9e9e9; text-align: center; vertical-align: middle">예산
							<button type='button' class='btn btn-outline-primary btn-sm'
								style='float: right' id="moneyaddbtn">
								<i class='fa fa-plus'></i>
							</button>
						</th>
						<td name="budget">
							<div class="input-group mb-1">
								<input type="text" class="form-control" id="ex1"
									placeholder="예) 입장료"> <input type="text"
									class="form-control" id="money1" placeholder="10000">
								<div class="input-group-prepend">
									<span class="input-group-text">원</span>
								</div>
							</div>
						</td>
					</tr>
					<tr>
						<th scope="row"
							style="background-color: #e9e9e9; text-align: center; vertical-align: middle">참조</th>
						<td><input type="text" class="form-control" id="reference"></td>
					</tr>
				</tbody>
			</table>
			<div style="text-align: right">
				<button type="button" class="btn btn-outline-primary"
					id="success-primary">완료</button>
			</div>
		</div>
		<div style="width: 40%; float: right" id="plan-div">
			<div style="text-align: right">
				<button class="btn btn-inline-primary btn-lg" id="end-bt">여행계획
					완료</button>

			</div>


		</div>
	</div>
<script>
$(document).ready(function() {
	budgetcount = 1;
	$("#moneyaddbtn").click(function() {
		budgetcount++;
	 	$("#schedule-boarder>tbody>tr>td[name='budget']").append("<div class='input-group mb-1'><input type='text' class='form-control' placeholder='예) 입장료' id='ex"+budgetcount+"'><input type='text' class='form-control' placeholder='10000' id='money"+budgetcount+"'>"
				+"<div class='input-group-prepend'><span class='input-group-text'>원</span></div></div><button style='float: left; border: none' type='button' class='btn btn-outline-danger'><i class='far fa-times-circle'></i></button>");
	});

	$("#moneyxbtn").click(function() {
		
	});
	
    var datecount = 2;
    $("#plus-plan").click(function() {

        var plustext = $("#plus-text").val();
        $("#plan-table>tbody>tr").removeClass('active');

        if (datecount <= 14) {
            $("#plan-table>tbody:last").append("<tr class='clickable-row active'><th style='background-color: #e9e9e9 ;text-align: center;vertical-align: middle' >" + datecount++ + "일차</th><td style='width: 70%'>" + datecount + "</td></tr>");


            if ($("#plan-table tr:last")) {

                $("#plan-table button[type='button']").hide();
            }
            $("#plan-table tr:last td:last-child").append("<button type='button' class='btn btn-outline-danger btn-sm'style='float: right'><i class='fa fa-times'></i></button>");


        } else {
            alert("최대 14일까지 제공하고있습니다");
        }
    });
    $("#plan-table").on('click', "button[type='button']", function(event) {
        var index = $(event.currentTarget).closest("tr").index();
        var info = $("#plan-tbody")[0];
        info.deleteRow(index, datecount--);

        $("#plan-table tr:last td:last-child").append("<button type='button' class='btn btn-outline-danger btn-sm'style='float:right'><i class='fa fa-times'></i></button>");

    });

    $("#schedule-plan td:last-child").hide();
    $("#schedule-plan th:last-child").hide();

    $("#delete-table").click(function() {
        if ($("#delete-table").text() == "삭제") {
            $("#delete-table").text("완료");
            $("#delete-table").attr("class", "btn btn-outline-primary");
            $("#schedule-plan td:last-child").show();
            $("#schedule-plan th:last-child").show();
        } else {
            $("#delete-table").text("삭제");
            $("#delete-table").attr("class", "btn btn-outline-danger");
            $("#schedule-plan td:last-child").hide();
            $("#schedule-plan th:last-child").hide();
        }
    });

    $("#schedule-plan").on('click', "button[type='button']", function(event) {
        var index = $(event.currentTarget).closest("tr").index();
        var info = $("#schedule-tbody")[0];
        info.deleteRow(index);
    });

    var schedulecount = 1;
    $("#success-primary").click(function() {
        var con = confirm("일정추가하시겠습니까?");
        starttime = $("#start-time").val();
        endtime = $("#end-time").val();
        place = "이레빌딩"; /*  $("#place").val("이레빌딩");*/
        schedule = $("#schedule").val();
        /* money = $("#money").val(); */
        reference = $("#reference").val();
        
        check = true;
        /* for(i = 1; i <= budgetcount;i++) {
        	if($("#ex" + i).val() == "") {
        		alert("예산 내용을 입력해주세요");
        		check = false;
        		break;
        	} else if($("#money" + i).val() == ""){
        		alert("예산 내용을 입력해주세요");
        		check = false;
        		break;
        	}
        	console.log(check);
        } */
        
        if (check) {
            if (starttime == "" || endtime == "") {
            	alert("시간을정해주세요");
            } else if (place == "") {
                alert("장소를정해주세요");
            } else if (schedule == "") {
                alert("일정을적어주세요");
            } else if (con) {
            	
            	var contents = '';
                contents += '<tr class="clickable-row new active"><th style="height:50px;"></th><td name="place"></td><td name="schedule"></td>';
                contents += '<td name="money"></td>';
                contents += '<td name="reference"></td>';
                contents += '<td><button style="float:left;border:none"type="button"class="btn btn-outline-danger"><i class="far fa-times-circle"></i></button></td>';
                contents += '</tr>';
                
            	if($("#schedule-plan>tbody>.active>th>div").length == 0 ) {	// 빈칸 = 마지막줄
            		$("#schedule-plan>tbody>tr").removeClass('new');
                	var cursor = "#schedule-plan>tbody>.active";
                	$(cursor + ">th").html("<div name='start'>"+starttime+"</div>~<div name='end'>"+endtime+"</div>");
                	$(cursor + ">td[name='place']").html(place);
                	$(cursor + ">td[name='schedule']").html(schedule);
                	for(i = 1; i <= budgetcount;i++) {
                		$(cursor + ">td[name='money']").html("<div id='ex"+i+"'>"+$("#ex" + i).val()+"</div>(<div id='money"+i+"'>"+$("#money" + i).val()+"</div>)");
                    }
                	$(cursor + ">td[name='money']").html(money);
                	$(cursor + ">td[name='reference']").html(reference);
                	$("#schedule-plan>tbody>tr").removeClass('active');
                	$("#schedule-plan>tbody:last").append(contents);
                    $("#schedule-plan td:last-child").hide();
                   
                } else { // 빈칸x = 마지막줄x
                	console.log("다름" + $("#schedule-plan>tbody>.active>th>div").length);
                	var cursor = "#schedule-plan>tbody>.active";
                	$(cursor + ">th").html("<div name='start'>"+starttime+"</div>~<div name='end'>"+endtime+"</div>");
                	$(cursor + ">td[name='place']").html(place);
                	$(cursor + ">td[name='schedule']").html(schedule);
                	$(cursor + ">td[name='money']").html(money);
                	$(cursor + ">td[name='reference']").html(reference);
                	$("#schedule-plan>tbody>tr").removeClass('active');
                	$("div .show>#schedule-plan>tbody>.new").addClass('active');
                }

                $("#start-time").val("");
                $("#end-time").val("");
                $("#place").val("");
                $("#schedule").val("");
                $("td[name='budget'] input").val("");
                $("#reference").val("");
            }
        }
    });
    
    $("#schedule-plan").on('click', '.clickable-row', function(event) {
    	  $(this).addClass('active').siblings().removeClass('active');
    	  $("#start-time").val($("#schedule-plan>tbody>.active>th>div[name='start']").html());
          $("#end-time").val($("#schedule-plan>tbody>.active>th>div[name='end']").html());
          $("#place").val($("#schedule-plan>tbody>.active>td[name='place']").html());
          $("#schedule").val($("#schedule-plan>tbody>.active>td[name='schedule']").html());
          
          $("#reference").val($("#schedule-plan>tbody>.active>td[name='reference']").html());
    });
    
    $("#plan-table").on('click', '.clickable-row', function(event) {
  		$(this).addClass('active').siblings().removeClass('active');
	});

});
</script>
</body>
</html>