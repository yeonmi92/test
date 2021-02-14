<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix ="c" uri ="http://java.sun.com/jsp/jstl/core" %>

<body>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=c79c1c15f53e9ba60cc4a63e6aebdd70&libraries=services"></script>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>


<p style="margin-top:-12px">
    <em class="link">
        <a href="javascript:void(0);" onclick="window.open('http://fiy.daum.net/fiy/map/CsGeneral.daum', '_blank', 'width=981, height=650')">

        </a>
    </em>
</p>
<!-- 지도를 표시할 div 입니다 -->



	<h1 align = "center">모임등록 페이지 </h1>
	<form action ="/together/mapboard/insertMapPro.git" method ="post">
		
	<div id="aside"></div>	
	<table>
		<tr>
			<td>모임장(id):</td>
			<td><input type="text" name ="id"/></td>
		</tr>
		
		<tr>
			<td>모임 명: </td>
			<td><input type="text" name ="title"/></td>			
		</tr>
		
		<tr>
			<td>모임 장소: </td>
			<td><input type ="text" name = "addr" id="addre"/></td>
			<td><input type ="button" value = "지도검색" id="addrBtn"/></td>
			<td><input type="hidden" id="lat" name="lat" value="" /></td>
			<td><input type="hidden" id="lng" name="lng" value="" /></td>
			

		</tr>
		<tr>
			<td></td>
			<td><div id="map" style="width:100%;height:350px;"></div></td>
		</tr>

		<tr>
			<td>모임 날짜:</td>
			<td><input type = "date" name ="start_date" value ="시작날짜"/>
				<input type = "date" name ="end_date" value ="종료날짜"/>
				<input type = "time" name ="times" value ="시간"/>
			</td>
		</tr>
		
		<tr>
			<td>같이 놀 친구 인원 수 :</td>
			<td><input type="text" name ="ppl_num"/></td>
		</tr>
		
		<tr>
			<td>같이 놀 친구 성별 : </td>
			<td>
				<input type ="radio" name ="gender" value ="남자"/>남자
				<input type ="radio" name ="gender" value ="여자"/>여자
				<input type ="radio" name ="gender" value ="무관"/>무관
				
			</td>
		</tr>
		
		<tr>
			<td>같이 놀 친구 나이:</td>
			<td><input type ="text" name ="age"/></td>
		</tr>
		
		<tr>
			<td>모임 비용:</td>
			<td><input type ="text" name ="cost"/></td>
		</tr>
		
		<tr>
			<td>관심분야 : </td>
			<td><input type = "radio" name ="hobby" value ="sport"/>운동
				<input type = "radio" name ="hobby" value ="music"/>음악
				<input type = "radio" name ="hobby" value ="read"/>독서
				<input type = "radio" name ="hobby" value ="shoping"/>쇼핑
				<input type = "radio" name ="hobby" value ="rest"/>기타
			</td>
		</tr>
		
		<tr>
			<td>모임 내용</td>
			<td><textarea rows="20" cols="50" name ="detail"></textarea>
		</tr>
		
		<tr>
			<td colspan ="2">
			<input type ="submit" value ="등록" onclick ="window.location='/together/mapboard/indexMap.git'"/>
			<input type = "button" value ="취소" onclick ="window.location='/together/mapboard/indexMap.git'"/>
			</td>
		
		</tr>

	</table>
	</form>
	
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
	
	        	
	        	//var lat = $("#lat").val();
        		//console.log(result[0].y, result[0].x);

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
		
		$(document).ready(function(){
			$("#addrBtn").click(function(){
				
				//var addre = document.getElementById("addre").val();
				var addre = $("#addre").val();
				console.log(addre);
				// 주소창에 기입한 주소글 가져와서 
				
					geocoder.addressSearch(addre, function(result, status) {
						console.log(result)
						
			    		// 정상적으로 검색이 완료됐으면 
			     		if (status === kakao.maps.services.Status.OK) {
			
			        		var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
			        		
			        		//var lat = $("#lat").val();
			        		//var lng = $("#lng").val();
			        		console.log(result[0].y, result[0].x);
			        		
			        		// 결과값으로 받은 위치를 마커로 표시합니다
			        		var marker = new kakao.maps.Marker({
				           		map: map,
				            	position: coords
				            
				        	});

			     		// 마커가 지도 위에 표시되도록 설정합니다
			   			marker.setMap(map);
			   		
	
			    		// 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
			        	map.setposition(coords);  
			    		
			    
			    	} 

				});
				
			});
			
		});
		
		
	</script>
	
</body>