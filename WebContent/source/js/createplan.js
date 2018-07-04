$(document).ready(
		function() {
			var minDate = new Date();
			var maxDate = new Date();
			var mm = minDate.getDate() - 1;
			var dd = maxDate.getDate() + 62;
			minDate.setDate(mm);
			maxDate.setDate(dd);
			$("#datepicker").datepicker({
				uiLibrary : 'bootstrap4',
				format : 'yyyy-mm-dd',
				language : "ko",
				minDate : minDate,
				maxDate : maxDate,
			});
			$("#datepicker-end").datepicker({
				uiLibrary : 'bootstrap4',
				format : 'yyyy-mm-dd',
				language : "ko",
				constrainInput : true,
				minDate : minDate,
				maxDate : maxDate,
			});
			var todate = "";
			var enddate = "";
			var formdt = null;
			var todt = null;
			var datepage = "";
			$("#datepicker").change(
					function() {
						todate = $(this).val();
						$("#datepicker-end").val("");
						if (enddate != "") {
							var arrtodate = todate.split("/");
							var arrenddate = enddate.split("/");
							formdt = new Date(arrtodate[0],
									arrtodate[1], arrtodate[2]);
							todt = new Date(arrenddate[0],
									arrenddate[1], arrenddate[2]);
							console.log((todt.getTime() - formdt
									.getTime())
									/ (24 * 60 * 60 * 1000));
							datepage = (todt.getTime() - formdt
									.getTime())
									/ (24 * 60 * 60 * 1000);
							if (datepage == 0) {
								$("#dayday").html("당일 여행");
							} else if (datepage < 0) {
								$("#dayday").html("출발일이 더늦을수없습니다");
							} else {
								$("#dayday")
								.html(datepage + 1 + "일 여행");
							}
						}
					});
			$("#datepicker-end").change(
					function() {
						if (todate != "") {
							enddate = $(this).val();
							console.log(todate + ":" + enddate);
							var arrtodate = todate.split("-");
							var arrenddate = enddate.split("-");
							formdt = new Date(arrtodate[0],
									arrtodate[1], arrtodate[2]);
							todt = new Date(arrenddate[0],
									arrenddate[1], arrenddate[2]);
							console.log((todt.getTime() - formdt
									.getTime())
									/ (24 * 60 * 60 * 1000));
							datepage = (todt.getTime() - formdt
									.getTime())
									/ (24 * 60 * 60 * 1000);
							if (datepage == 0) {
								$("#dayday").html("당일 여행");
							} else if (datepage < 0) {
								$("#dayday").html("출발일이 더늦을수없습니다");
							} else {
								$("#dayday")
								.html(datepage + 1 + "일 여행");
							}
						} else {
							alert("시작 날짜를 먼저 입력하세요.");
							$(this).val("");
						}
					});
			$("#start-btn").click(
					function() {
						if (datepage < 0) {
							alert("여행일을 제대로 설정해주세요.");
						} else if ($("#plan_title").val() == "") {
							alert("여행 제목을 지어주세요.")
						} else {
							$("#plan-form").attr("action",
							"toMyPlan.plan").submit();
						}
					});
			$('#myModal').on('shown.bs.modal', function() {
				$('#myInput').trigger('focus')
			});
		});