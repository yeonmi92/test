<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style>
/* 	.left-box { */
/* 	  background: white; */
/* 	  float: left; */
/* 	  width: 50%; */
/* 	} */
/* 	.right-box { */
/* 	  background: skyblue; */
/* 	  float: right; */
/* 	  width: 50%; */
/* 	} */
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
		<h1 align = "center">일정상세페이지</h1>
<section class="blog-post-area section-margin">
 	<div class="container">
		<form action ="/together/mapboard/modifyMapPro.git" method = "post">
		<input type= "hidden" name="map_num" value="${article.map_num}"/>
		<input type= "hidden" name="id" value="${article.id}"/>
		
	<table class="table table-striped">
		<tr>
			<td>주최자(id)</td>
			<td>${sessionScope.memId}</td>
		</tr>
		
		<tr>
			<td>일정명</td>
			<td colspan="2"><input type="text" class="long" name ="title" value ="${article.title}"/></td>			
		</tr>
		
		<tr>
			<td>장소</td>
			<td>
				<input type="text" name ="addr" id="addre" value ="${article.addr}"/>
				<input type="button" value = "지도검색" id="addrBtn"/>
				<input type="hidden" id="lat" name="lat" value="${article.lat}"/>
				<input type="hidden" id="lng" name="lng" value="${article.lng}"/>
			</td>
		</tr>
		<tr>
			<td colspan="2"><div id="map" style="width:100%;height:350px;"></div></td>
		</tr>
		<tr>
			<td>날짜</td>
			<td>	
				<input type = "time" name ="times" value ="${article.times}"/>
				<input type = "date" name ="start_date" value ="${article.start_date}"/>
				<input type = "date" name ="end_date" value ="${article.end_date}"/>
			</td>
			
		</tr>
		
		<tr>
			<td>인원수</td>
			<td><input type="text" name ="ppl_num" value ="${article.ppl_num}"/></td>
		</tr>
		
		<tr>
			<td>성별</td>
			<td>
				<input type ="radio" name ="gender" value ="남자" <c:if test = "${article.gender eq '남자'}">checked</c:if>/>남자
				<input type ="radio" name ="gender" value ="여자" <c:if test = "${article.gender eq '여자'}">checked</c:if>/>여자
				<input type ="radio" name ="gender" value ="무관" <c:if test = "${article.gender eq '무관'}">checked</c:if>/>무관
			</td>
			
		</tr>
		
		<tr>
			<td>나이</td>
			<td><input type ="text" name ="age" value ="${article.age}"/></td>
		</tr>
		
		<tr>
			<td>예상 비용</td>
			<td><input type ="text" name ="cost" value ="${article.cost}"/></td>
		</tr>
		
		<tr>
			<td>관심분야</td>
			<td><input type = "radio" name ="hobby" value ="운동"<c:if test = "${article.hobby eq '운동'}">checked</c:if>/>운동
				<input type = "radio" name ="hobby" value ="맛집"<c:if test = "${article.hobby eq '맛집'}">checked</c:if>/>맛집
				<input type = "radio" name ="hobby" value ="음악"<c:if test = "${article.hobby eq '음악'}">checked</c:if>/>음악
				<input type = "radio" name ="hobby" value ="독서"<c:if test = "${article.hobby eq '독서'}">checked</c:if>/>독서
				<input type = "radio" name ="hobby" value ="쇼핑"<c:if test = "${article.hobby eq '쇼핑'}">checked</c:if>/>쇼핑
				<input type = "radio" name ="hobby" value ="기타"<c:if test = "${article.hobby eq '기타'}">checked</c:if>/>기타
			</td>
		</tr>
		
		<tr>
			<td>상세내용</td>
			<td><textarea cols="80%" rows="10%" name ="detail">${article.detail}</textarea></td>
		</tr>
		
		<tr align="center">
			<td colspan="2">
			<input type="submit" class="btn btn-primary" value="수정" />
			<input type="button" class="btn btn-primary" value="취소" onclick="window.location='/together/main/main.git'"/>
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

		var coords = new kakao.maps.LatLng(${article.lat},${article.lng}); 
		// 결과값으로 받은 위치를 마커로 표시합니다
      		var marker = new kakao.maps.Marker({
          		map: map,
           	position: coords
           
       	});
		
      		// 마커가 지도 위에 표시되도록 설정합니다
  			marker.setMap(map);
      		
   		// 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
       	map.setCenter(coords);    		
   		
	$(document).ready(function(){
		$("#addrBtn").click(function(){
		
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
