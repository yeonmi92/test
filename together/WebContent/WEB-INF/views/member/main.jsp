<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<div id="map" style="width:100%;height:350px;"></div>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=0087bac082e4992b48ce8229b57e4a1e&libraries=clusterer"></script>
<script>
	var map = new kakao.maps.Map(document.getElementById('map'), { // 지도를 표시할 div
	    center : new kakao.maps.LatLng(36.2683, 127.6358), // 지도의 중심좌표
	    level : 14 // 지도의 확대 레벨
	});
	
    

    // 마커 클러스터러를 생성합니다
    // 마커 클러스터러를 생성할 때 disableClickZoom 값을 true로 지정하지 않은 경우
    // 클러스터 마커를 클릭했을 때 클러스터 객체가 포함하는 마커들이 모두 잘 보이도록 지도의 레벨과 영역을 변경합니다
    // 이 예제에서는 disableClickZoom 값을 true로 설정하여 기본 클릭 동작을 막고
    // 클러스터 마커를 클릭했을 때 클릭된 클러스터 마커의 위치를 기준으로 지도를 1레벨씩 확대합니다
    var clusterer = new kakao.maps.MarkerClusterer({
        map: map, // 마커들을 클러스터로 관리하고 표시할 지도 객체
        averageCenter: true, // 클러스터에 포함된 마커들의 평균 위치를 클러스터 마커 위치로 설정
        minLevel: 10, // 클러스터 할 최소 지도 레벨
        disableClickZoom: true // 클러스터 마커를 클릭했을 때 지도가 확대되지 않도록 설정한다
    });

    
    
  
    
    
    var datas = {
   		"positions" : [
   			{
   		      "lat": 37.27943075229118,
   		      "lng": 127.01763998406159
   		    },
   		    {
   		      "lat": 37.55915668706214,
   		      "lng": 126.92536526611102
   		    },
   		    {
   		      "lat": 35.13854258261161,
   		      "lng": 129.1014781294671
   		    },
   		    {
   		      "lat": 37.55518388656961,
   		      "lng": 126.92926237742505
   		    },
   		    {
   		      "lat": 35.20618517638034,
   		      "lng": 129.07944301057026
   		    }
   		]
   	};
    // 객체{ "positions" = 배열[ 객체{ "lat": 37.27, "lng":127.0 }, 객체{}, ...   ]     }
    
    // 데이터를 가져오기 위해 jQuery를 사용합니다
    // 데이터를 가져와 마커를 생성하고 클러스터러 객체에 넘겨줍니다
    //$.get(positions, function(data) {
        // 데이터에서 좌표 값을 가지고 마커를 표시합니다
        // 마커 클러스터러로 관리할 마커 객체는 생성할 때 지도 객체를 설정하지 않습니다
        var markers = $(datas.positions).map(function(i, position) {
            return new kakao.maps.Marker({
                position : new kakao.maps.LatLng(position.lat, position.lng)
            });
        });

        // 클러스터러에 마커들을 추가합니다
        clusterer.addMarkers(markers);
  //  });

    // 마커 클러스터러에 클릭이벤트를 등록합니다
    // 마커 클러스터러를 생성할 때 disableClickZoom을 true로 설정하지 않은 경우
    // 이벤트 헨들러로 cluster 객체가 넘어오지 않을 수도 있습니다
    kakao.maps.event.addListener(clusterer, 'clusterclick', function(cluster) {

        // 현재 지도 레벨에서 1레벨 확대한 레벨
        var level = map.getLevel()-1;

        // 지도를 클릭된 클러스터의 마커의 위치를 기준으로 확대합니다
        map.setLevel(level, {anchor: cluster.getCenter()});
    });
</script>
</body>
</html>