$(document).ready(function() {
	

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