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
            money = $("#money").val();
            reference = $("#reference").val();
            
            check = true;
            for(i = 1; i <= budgetcount;i++) {
            	if($("#ex" + i).val() == "") {
            		alert("예산 내용을 입력해주세요");
            		check = false;
            		break;
            	} else if($("#money" + i).val() == ""){
            		alert("예산 내용을 입력해주세요");
            		check = false;
            		break;
            	}
            }
            
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