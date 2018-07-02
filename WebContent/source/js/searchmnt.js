$(document).ready(function () {
    // 지역 정보(객체)를 저장할 배열 ({location : location, mapx : mapx, mapy : mapy})
    var storedlocation = [];
    // 타임라인 정보를 저장할 배열
    var timeline = [];

    // 찾기 버튼을 누르면 API를 이용해 정보를 얻어 옴
    $("#searchbtn").click(function () {
        $("#results").html("");
        var val = $("#searchlocation").val();
        $("#searchlocation").val("");

        $.ajax({
            url: "ajax.do",
            type: "post",
            data: { value: val },

            success: function (resp) {
                var results = $("#results")[0];

                if (resp == null || resp.length < 1) {
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
        })
    });

    $("#infosubmit").click(function () {
        if (storedlocation.length < 1) {
            console.log("아무것도 없는데 전달하려고 하지 말거라..");
            return;
        }

        maketimelineInfo(storedlocation);

        var markerInfo = JSON.stringify(storedlocation);
        var timelineInfo = JSON.stringify(timeline);

        localStorage.setItem("markerInfo", markerInfo);
        localStorage.setItem("timelineInfo", timelineInfo);
        location.href = "markerandtl.html";
    })

    // 지역 검색창이 닫힐때 내용 모두 제거
    $("#searchModal").on('hidden.bs.modal', function () {
        $("#results").html("");
    });

    // 동적 바인딩(hover) 
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

        // 객체에 저장하기 위한 배열 생성
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

        var locationobj = {
            mapx: locationinfo[0],
            mapy: locationinfo[1],
            locationname: locationinfo[2]
        }

        storedlocation.push(locationobj);
        localInfoTable(storedlocation);

        $("#searchModal").modal('toggle');
    });

    // 테이블 추가
    function localInfoTable(storedlocalArray) {
        var info_tbody = $("#info-tbody")[0];

        // 안내 문자가 존재하면 제거
        if ($("#guidance").length == 1) {
            var index = $("#guidance").closest("tr").index();
            info_tbody.deleteRow(index);
        }

        var row = info_tbody.insertRow(info_tbody.rows.length);
        var cell1 = row.insertCell(0);
        var cell2 = row.insertCell(1);
        var cell3 = row.insertCell(2);
        var cell4 = row.insertCell(3);

        cell1.innerHTML = storedlocalArray[storedlocalArray.length - 1].mapx;
        cell2.innerHTML = storedlocalArray[storedlocalArray.length - 1].mapy;
        cell3.innerHTML = storedlocalArray[storedlocalArray.length - 1].locationname;
        cell4.innerHTML = "<input type='button' class='btn btn-primary' value='행삭제'>";
    }

    function maketimelineInfo(storedlocation) {
        for (var i = 0; i < storedlocation.length; i++) {
            var today = new Date();

            var month = today.getUTCMonth() + 1; //months from 1-12
            var day = today.getUTCDate();
            var year = today.getUTCFullYear();

            today = year + "-" + month + "-" + day;

            var timelineobj = {
                date: today,
                content: storedlocation[i].locationname
            }

            timeline.push(timelineobj);
        }
    }

    // 버튼 클릭시 테이블 행 삭제
    $("#info-table").on('click', "input[type='button']", function (event) {
        var index = $(event.currentTarget).closest("tr").index();

        var info_tbody = $("#info-tbody")[0];
        info_tbody.deleteRow(index);
        storedlocation.splice(index, 1);

        // 행이 0개가 될 경우 안내 문자행 입력
        if (info_tbody.rows.length < 1) {
            var row = info_tbody.insertRow(info_tbody.rows.length);
            var cell1 = row.insertCell(0);
            cell1.id = "guidance";
            cell1.colSpan = 4;
            cell1.innerHTML = "추가한 장소가 없습니다.";
        };
    });
});