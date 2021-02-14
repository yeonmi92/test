<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@taglib prefix = "c" uri ="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix = "fmt" uri ="http://java.sun.com/jsp/jstl/fmt" %>
<style>
.left-box {
  background: white;
  float: left;
  width: 50%;
}
.right-box {
  background: skyblue;
  float: right;
  width: 50%;
}
</style>


<body>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=c79c1c15f53e9ba60cc4a63e6aebdd70&libraries=services"></script>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>


<p style="margin-top:-12px">
    <em class="link">
        <a href="javascript:void(0);" onclick="window.open('http://fiy.daum.net/fiy/map/CsGeneral.daum', '_blank', 'width=981, height=650')">

        </a>
    </em>
</p>

	<br/>
		<div class='left-box'>
		
			<br/>
	<h1 align = "center">모임 상세페이지</h1>
	<input type= "hidden" name = "map_num" value = "${article.map_num}"/>
	
		<table>
			<tr>
				<td>모임장(id) :</td>
				<td colspan = "2">${article.id}</td>
			</tr>
			
			<tr>
				<td>제목 :</td>
				<td colspan ="2">${article.title}</td>
			</tr>
			
			<tr>
				<td>장소 :</td>
				<td colspan = "2">${article.addr}</td>
				<td><input type="hidden" id="lat" name="lat" value="${article.lat}" /></td>
				<td><input type="hidden" id="lng" name="lng" value="${article.lng}" /></td>
			</tr>
			
			<tr>
				<td>날짜</td>
				<td colspan = "3">${article.times},${article.start_date},${article.end_date}</td>
			</tr>
			
			<tr>
				<td>인원 :</td>
				<td colspan ="2" > ${article.ppl_num}</td>
			</tr>
			
			<tr>
				<td>성별</td>
				<td colspan ="2" > ${article.gender}</td>
			</tr>
			
			<tr>
				<td>나이</td>
				<td colspan ="2" > ${article.age}</td>
			</tr>
			
			<tr>
				<td>비용</td>
				<td colspan ="2" > ${article.cost}</td>
			</tr>
			
			<tr>
				<td>관심분야</td>
				<td colspan ="2" > ${article.hobby}</td>
			</tr>
			
			<tr>
				<td>상세 설명</td>
				<td colspan = "2">${article.detail}</td>
			</tr>
			
			<tr>
				<td colspan ="2">
				<input type ="submit" value ="수정" onclick ="window.location='/together/mapboard/modifyMap.git'"/>
				<input type = "button" value ="취소" onclick ="window.location='/together/mapboard/indexMap.git'"/>
				</td>
			
			</tr>
		
		</table>
	</div>	
	<div class='right-box'>
	<div id="map" style="width:100%;height:350px;"></div>
	<script>
	
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
   		mapOption = {
       		center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
        	level: 3 // 지도의 확대 레벨
    	};  

		// 지도를 생성합니다    
		var map = new kakao.maps.Map(mapContainer, mapOption); 

		// 주소-좌표 변환 객체를 생성합니다
		var geocoder = new kakao.maps.services.Geocoder();


		//var address = prompt("주소를 입력하세요",""); // 주소창에 주소를 작성 후 확인버튼 누르면 지도 생성 

		var address = "서울특별시 관악구 남부순환로 1820";
		
		
		// 주소로 좌표를 검색합니다
		geocoder.addressSearch(address, function(result, status) {

	    	// 정상적으로 검색이 완료됐으면 
	     	if (status === kakao.maps.services.Status.OK) {
	
	        	var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
	
	        	// 결과값으로 받은 위치를 마커로 표시합니다
	        	var marker = new kakao.maps.Marker({
	           		map: map,
	            	position: coords
	            
	        	});
	
	        	// 인포윈도우로 장소에 대한 설명을 표시합니다
	       	 	var infowindow = new kakao.maps.InfoWindow({
	          		content:'<div style="width:150px;text-align:center;padding:6px 0;">글로벌IT</div>'		
	        	});

	    
	     		// 마커가 지도 위에 표시되도록 설정합니다
	   			marker.setMap(map);
	     
	    
		 		// 인포윈도우를 생성합니다
	        	infowindow.open(map, marker);
	    		// 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
	        	map.setCenter(coords);  
	    
	    	} 

		});    	
		
		
	</script>
	</div>
</body>
