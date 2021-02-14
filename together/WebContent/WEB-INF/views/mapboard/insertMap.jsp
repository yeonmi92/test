<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix ="c" uri ="http://java.sun.com/jsp/jstl/core" %>
<style>
	table{
		width: 100%;
	}
	.long{
		width: 40%
	}
	.short{
		width: 10%
	}
</style>
<body>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=0087bac082e4992b48ce8229b57e4a1e&libraries=services"></script>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>


<p style="margin-top:-12px">
    <em class="link">
        <a href="javascript:void(0);" onclick="window.open('http://fiy.daum.net/fiy/map/CsGeneral.daum', '_blank', 'width=981, height=650')">

        </a>
    </em>
</p>
	<h1 align = "center">일정등록</h1>
<!-- 지도를 표시할 div 입니다 -->
<section class="blog-post-area section-margin">
 	<div class="container">


	<form action ="/together/mapboard/insertMapPro.git" method = "post">

	<div id="aside"></div>	
		<table class="table table-striped">
			<tr>
				<td>주최자(id)</td>
				<td>${sessionScope.memId}</td>
			</tr>
			
			<tr>
				<td>일정명</td>
				<td colspan="2"><input type="text" class="long" name ="title"/></td>			
			</tr>
			
			<tr>
				<td>장소</td>
				<td>
					<input type ="text" class="long" name = "addr" id="addre"/>
					<input type ="button" class="btn btn-primary" value = "지도검색" id="addrBtn"/>
					<input type="hidden" id="lat" name="lat" value="" />
					<input type="hidden" id="lng" name="lng" value="" />
				</td>
			</tr>
			<tr>
				<td colspan="2"><div id="map" style="width:100%;height:350px;"></div></td>
			</tr>
	
			<tr>
				<td>날짜</td>
				<td><input type = "date" name ="start_date" value ="시작날짜"/>
					<input type = "date" name ="end_date" value ="종료날짜"/>
					<input type = "time" name ="times" value ="시간"/>
				</td>
			</tr>
			
			<tr>
				<td>인원수</td>
				<td><input type="text" class="short" name ="ppl_num"/> 명</td>
			</tr>
			
			<tr>
				<td>성별</td>
				<td>
					<input type ="radio" name ="gender" value ="남자"/> 남자
					<input type ="radio" name ="gender" value ="여자"/> 여자
					<input type ="radio" name ="gender" value ="무관"/> 무관
					
				</td>
			</tr>
			
			<tr>
				<td>나이</td>
				<td><input type ="text" class="short" name ="age"/> 세</td>
			</tr>
			
			<tr>
				<td>예상 비용</td>
				<td><input type ="text" class="short" name ="cost"/> 원</td>
			</tr>
			
			<tr>
				<td>관심분야</td>
				<td>
					<input type = "radio" name ="hobby" value ="운동"/> 운동
					<input type = "radio" name ="hobby" value ="맛집"/> 맛집
					<input type = "radio" name ="hobby" value ="음악"/> 음악
					<input type = "radio" name ="hobby" value ="독서"/> 독서
					<input type = "radio" name ="hobby" value ="쇼핑"/> 쇼핑
					<input type = "radio" name ="hobby" value ="기타"/> 기타
				</td>
			</tr>
			
			<tr>
				<td>내용</td>
				<td><textarea cols="80%" rows="10%" name ="detail"></textarea>
			</tr>
			
			<tr align="center">
				<td colspan="2">
				<input type ="submit" class="btn btn-primary" value ="등록"/>
				<input type = "button" class="btn btn-primary" value ="취소" onclick ="window.location='/together/main/main.git'"/>
				</td>
			
			</tr>
	
		</table>
	</form>
	
		</div>
</section>
</body>
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
		//33.389331, 126.801264  구글
		// 33.3892750006954:126.801181519578
		//37.5047267237807:126.953833907628
		
		// 주소로 좌표를 검색합니다
		geocoder.addressSearch(address, function(result, status) {

	    	// 정상적으로 검색이 완료됐으면 
	     	if (status === kakao.maps.services.Status.OK) {
	
	        	var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
					console.log(result[0].y + ":" + result[0].x);
	        	
		        	$("#lat").val(result[0].y);
		        	$("#lng").val(result[0].x);
		        	
	        	// 결과값으로 받은 위치를 마커로 표시합니다
	        	var marker = new kakao.maps.Marker({
	           		map: map,
	            	position: coords
	            
	        	});
	
	        	// 인포윈도우로 장소에 대한 설명을 표시합니다
	       	 	var infowindow = new kakao.maps.InfoWindow({
	          		content:'<div style="width:150px;text-align:center;padding:6px 0;">글로벌IT</div>'		
	        	});
	     		
	    
	      		// 마커가 표시될 위치입니다 
	       		//var markerPosition  = new kakao.maps.LatLng(33.450701, 126.570667); 
	     		// 마커를 생성합니다
	       		//var marker = new kakao.maps.Marker({
	    	 
	         		//position: markerPosition 
	         
				//});  
	    
	     		// 마커가 지도 위에 표시되도록 설정합니다
	   			//marker.setMap(map);
	     
	    
		 		// 인포윈도우를 생성합니다
	        	infowindow.open(map, marker);
	    		// 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
	        	//map.setCenter(coords);  
	    
	    	} 

		});    
		
		$(document).ready(function(){
			$("#addrBtn").click(function(){
				
				//var addre = document.getElementById("addre").val();
				var addre = $("#addre").val();
				console.log(addre);
				// 주소창에 기입한 주소글 가져와서 
				
					geocoder.addressSearch(addre, function(result, status) {

			    		// 정상적으로 검색이 완료됐으면 
			     		if (status === kakao.maps.services.Status.OK) {
			
			        		var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
			        		
			        		var lat = $("#lat").val(result[0].y);
			        		var lng = $("#lng").val(result[0].x);
			      
			        		console.log(coords);
			
			        		// 결과값으로 받은 위치를 마커로 표시합니다
			        		var marker = new kakao.maps.Marker({
				           		map: map,
				            	position: coords
				            
				        	});
		
			    
			     		// 마커가 지도 위에 표시되도록 설정합니다
			   			marker.setMap(map);

			    		// 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
			        	map.setCenter(coords);  
			   			//map.setPosition(coords);
			    	} 

				});
				
			});
			
		});
		
		
	</script>
	
