<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.1.0/css/all.css" integrity="sha384-lKuwvrZot6UHsBSfcMvOkWwlCMgc0TaWr+30HWe3a4ltaBwTZhyTEggF5tJv8tbt" crossorigin="anonymous">
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.22.2/moment.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/tempusdominus-bootstrap-4/5.0.0/js/tempusdominus-bootstrap-4.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/tempusdominus-bootstrap-4/5.0.0/css/tempusdominus-bootstrap-4.min.css" />
<html>

<head>

    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Insert title here</title>
    <style>
        #title-board {
            font-size: 15px;
        }

        .container {
            margin-top: 50px;
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
    </style>

</head>

<body>
    <div class="container">
        <div class="input-group input-group-lg">
            <div class="input-group-prepend">
                <span class="input-group-text" id="inputGroup-sizing-lg">제목</span>
            </div>
            <input type="text" class="form-control" aria-label="Large" aria-describedby="inputGroup-sizing-sm" id="title-board">
        </div>

        <div clss="schedule">
            <table class="table table-bordered" id="schedule-plan">
                <thead>
                    <tr>
                        <th scope="col">시간</th>
                        <th scope="col">장소</th>
                        <th scope="col">일정</th>
                        <th scope="col">예정</th>
                        <th scope="col">참조</th>
                        <th scope="col" style="width:20px;">삭제</th>
                    </tr>
                </thead>
                <tbody id="schedule-tbody" style="table-layout:fixed;word-break:break-all;">
                    <tr>
                        <th scope="row">1</th>
                        <td>Mark</td>
                        <td style="padding:0px;"><textarea class="form-control" readonly style="overflow-y:auto;background-color:white;resize:none;"></textarea></td>
                        <td style="padding:0px;"><textarea class="form-control" readonly style="overflow-y:auto;background-color:white;resize:none;"></textarea></td>
                        <td style="padding:0px;"><textarea class="form-control" readonly style="overflow-y:auto;background-color:white;resize:none;"></textarea></td>
                        <td><button style="float: left;border: none" type="button" class="btn btn-outline-danger"><i class="far fa-times-circle"></i></button></td>

                    </tr>
                    <tr>
                        <th scope="row">2</th>
                        <td>Jacob</td>
                        <td style="padding:0px;"><textarea class="form-control" readonly style="overflow-y:auto;background-color:white;resize:none;"></textarea></td>
                        <td style="padding:0px;"><textarea class="form-control" readonly style="overflow-y:auto;background-color:white;resize:none;"></textarea></td>
                        <td style="padding:0px;"><textarea class="form-control" readonly style="overflow-y:auto;background-color:white;resize:none;"></textarea></td>
                        <td><button style="float:left;border:none" type="button" class="btn btn-outline-danger"><i class="far fa-times-circle"></i></button></td>
                    </tr>
                    <tr>
                        <th scope="row">3</th>
                        <td>Larry the Bird</td>
                        <td style="padding:0px;"><textarea class="form-control" readonly style="overflow-y:auto;background-color:white;resize:none;"></textarea></td>
                        <td style="padding:0px;"><textarea class="form-control" readonly style="overflow-y:auto;background-color:white;resize:none;"></textarea></td>
                        <td style="padding:0px;"><textarea class="form-control" readonly style="overflow-y:auto;background-color:white;resize:none;"></textarea></td>
                        <td><button style="float:left;border:none" type="button" class="btn btn-outline-danger"><i class="far fa-times-circle"></i></button></td>
                    </tr>
                </tbody>
            </table>
            <div id="bt-div" style="text-align:right;">

                <button type="button" class="btn btn-outline-danger" id="delete-table">삭제</button>
            </div>
        </div>

        <div id="plan-board">
            <table class="table table-bordered" id="schedule-boarder">
                <thead>
                </thead>

                <tbody>
                    <tr>
                        <th scope="row" style="background-color:#e9e9e9;text-align:center;vertical-align:middle">시간</th>
                        <td style="width:70%;text-align:center;">

                            <div class="col-10">
                                <input class="form-control" type="time" value="13:45:00" id="start-time" />
                            </div>
                            <div class="cococo">
                                ~
                            </div>
                            <div class="col-10">
                                <input class="form-control" type="time" value="14:45:00" id="end-time" />
                            </div>
                        </td>



                    </tr>
                    <tr>
                        <th scope="row" style="background-color:#e9e9e9;text-align:center;vertical-align:middle">장소</th>
                        <td>

                            <div class="input-group">
                                <input type="text" class="form-control" placeholder="Search" readonly id="place">
                                <div class="input-btn">
                                    <button class="btn btn-default" type="button" style="height:100%; border:1px">
                                         	<i class="fa fa-search" ></i>
                                         </button>
                                </div>
                            </div>

                        </td>


                    </tr>
                    <tr>
                        <th scope="row" style="background-color:#e9e9e9 ;text-align:center;vertical-align:middle ">일정</th>
                        <td><textarea class="form-control" id="schedule"></textarea></td>

                    </tr>
                    <tr>
                        <th scope="row" style="background-color:#e9e9e9 ;text-align:center;vertical-align:middle ">예산</th>
                        <td><input type="text" class="form-control" id="money"></td>

                    </tr>
                    <tr>
                        <th scope="row" style="background-color:#e9e9e9 ;text-align:center;vertical-align:middle">참조</th>
                        <td><input type="text" class="form-control" id="reference"></td>
                    </tr>
                </tbody>
            </table>
            <div style="text-align:right">
                <button type="button" class="btn btn-outline-primary" id="success-primary">완료</button>
            </div>
        </div>
        <div style="width:40%;float:right" id="plan-div">
            <div>

                <button type="button" id="plus-plan" class="btn btn-inline">일정추가 <i class="fa fa-plus "></i></button>
            </div>
            <table class="table table-bordered" id="plan-table">
                <thead></thead>
                <tbody id="plan-tbody">


                </tbody>

            </table>
            <div style="text-align:right">
                <button class="btn btn-inline-primary btn-lg" id="end-bt">여행계획 완료</button>

            </div>


        </div>
    </div>

</body>
<script>
    $(document).ready(function() {

        var datecount = 1;
        $("#plus-plan").click(function() {

            var plustext = $("#plus-text").val();

            if (datecount <= 14) {
                $("#plan-table>tbody:last").append("<tr><th style='background-color: #e9e9e9 ;text-align: center;vertical-align: middle' >" + datecount++ + "일차</th><td style='width: 70%'>" + datecount + "</td></tr>");


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

        $("#success-primary").click(function() {
            var con = confirm("일정추가하시겠습니까?");
            var starttime = $("#start-time").val();
            var endtime = $("#end-time").val();
            var place = $("#place").val("이레빌딩");
            var schedule = $("#schedule").val();
            var money = $("#money").val();
            var reference = $("#reference").val();
            var schedulecount = 1;
            if (schedulecount <= 10) {
                if (starttime == "" || endtime == "") {
                    alert("시간을입력해주세요");
                } else if (place == "") {
                    alert("장소를정해주세요");
                } else if (schedule == "") {
                    alert("일정을적어주세요");
                } else if (con) {
                    var contents = '';
                    contents += '<tr>';
                    contents += '<th>' + starttime + "~" + endtime + '</th>';
                    contents += '<td>' + place + '</td>';
                    contents += '<td style="padding:0px;"><textarea class="form-control" readonly style="overflow-y:auto;background-color:white;resize:none;">' + schedule + '</textarea></td>';
                    contents += '<td style="padding:0px;"><textarea class="form-control" readonly style="overflow-y:auto;background-color:white;resize:none;">' + money + '</textarea></td>';
                    contents += '<td style="padding:0px;"><textarea class="form-control" readonly style="overflow-y:auto;background-color:white;resize:none;">' + reference + '</textarea></td>';
                    contents += '<td><button style="float:left;border:none"type="button"class="btn btn-outline-danger"><i class="far fa-times-circle"></i></button></td>';
                    contents += '</tr>';

                    $("#schedule-plan>tbody:last").append(contents);
                    $("#schedule-plan td:last-child").hide();

                    $("#start-time").val("");
                    $("#end-time").val("");
                    $("#place").val("");
                    $("#schedule").text("");
                    $("#money").val("");
                    $("#reference").val("");
                }
            } else {
                alert("아직지원하지않습니다");
            }
        });

    });
</script>

</html>