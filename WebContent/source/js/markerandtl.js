// 마커에 입력할 배열과 타임라인 정보를 입력할 배열
var markerlocation = [],
    timeline = [];

// 다중 마커에 정보창 띄우기
var markers = [],
    infoWindows = [];


// 받아온 jsonArry 정보를 이용해 배열에 넣음 
var makeMarkerArray = function () {
    if (localStorage.getItem('markerInfo') == null && localStorage.getItem("timelineInfo") == null) {
        markerlocation.push({ location: "서울시청", mapx: 309852, mapy: 552189 });
        timeline.push({date : '0000-00-00', content : "서울시청"});
        return;
    }

    var jsonArray = JSON.parse(localStorage.getItem('markerInfo'));
    timeline = JSON.parse(localStorage.getItem("timelineInfo"));

    for (var i = 0; i < jsonArray.length; i++) {
        let markerObj = {
            location: jsonArray[i].locationname,
            mapx: jsonArray[i].mapx,
            mapy: jsonArray[i].mapy
        }

        markerlocation.push(markerObj);
    }

    // 로컬 저장소 clear
    localStorage.clear();
};
makeMarkerArray();

// 네이버 지도 생성
var map = new naver.maps.Map('map', {
    center: new naver.maps.Point(markerlocation[0].mapx, markerlocation[0].mapy),
    zoom: 5,
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
            position: new naver.maps.Point(markerArray[i].mapx, markerArray[i].mapy),
            zIndex: 100
        });

        var infoWindow = new naver.maps.InfoWindow({
            content: '<div style="width:150px;text-align:center;padding:10px;">' + markerArray[i].location + '</div>'
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