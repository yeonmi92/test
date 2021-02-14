<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri ="http://java.sun.com/jsp/jstl/core" %>

<style>
.left-box {
  background: white;
  float: left;
  width: 50%;
  height: 900px;
}
.right-box {
  background: white;
  float: right;
  width: 50%;
  height: 900px;
}
.bolder{
	font-weight: bolder;	
}
/* #map{ */
/* 	width:100%; */
/* 	height:350px; */
/* 	margin-top: 5%; */
/* 	margin-left: 5%; */
/* } */
</style>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=0087bac082e4992b48ce8229b57e4a1e&libraries=services"></script>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<body>
<section class="blog-post-area section-margin">
 	<div class="container">
 	<h1 align="center">${article.title}</h1>
 	<br>
	<div class="row">
<p style="margin-top:-12px">
    <em class="link">
        <a href="javascript:void(0);" onclick="window.open('http://fiy.daum.net/fiy/map/CsGeneral.daum', '_blank', 'width=981, height=650')">

        </a>
    </em>
</p>
	
	<div class='left-box'>
		<input type= "hidden" name="map_num" value="${article.map_num}"/>
			<div class="container">
			<table class="table">
				<tr>
					<td class="bolder">ID &nbsp;</td>
					<td>${article.id}</td>
				</tr>
				<tr>
					<td class="bolder">장소 &nbsp;</td>
					<td>
						${article.addr}
						<input type="hidden" id="lat" name="lat" value="${article.lat}"/>
						<input type="hidden" id="lng" name="lng" value="${article.lng}"/>
					</td>
				</tr>
				<tr>
					<td class="bolder">날짜 &nbsp;</td>
					<td>${article.times} / ${article.start_date} ~ ${article.end_date}</td>
				</tr>
				<tr>
					<td class="bolder">인원 &nbsp;</td>
					<td>${article.ppl_num}</td>
				</tr>
				<tr>
					<td class="bolder">성별 &nbsp;</td>
					<td>${article.gender}</td>
				</tr>
				<tr>
					<td class="bolder">나이 &nbsp;</td>
					<td>${article.age}</td>
				</tr>
				<tr>
					<td class="bolder">예상 비용 &nbsp;</td>
					<td>${article.cost} 원</td>
				</tr>
				<tr>
					<td class="bolder">관심분야 &nbsp;</td>
					<td>${article.hobby }</td>
				</tr>
				<tr>
					<td class="bolder" align="center" colspan="2"><h2>상세 설명 &nbsp;</h2></td>
				</tr>
				<tr>
					<td height="100" align="center" colspan="2">${article.detail}</td>
				</tr>
				<tr>
					<td class="bolder" align="center" colspan="2">
						<h2>참여인원 &nbsp;</h2>
					</td>
				</tr>
				<tr>
					<td align="center" colspan="2">
					<c:forEach var ="ppl_avail2" items ="${ppl_avail2}">
						<c:if test ="${ppl_avail2.JOIN_STATUS== 1}">
							<img src="/together/save/${ppl_avail2.IMG}" width="50" height="50"> ${ppl_avail2.ID}
						</c:if>
					</c:forEach>
					</td>
				</tr>
			</table>
		</div>	
			
				
			<%--모임 멤버 확인 버튼 --%>
	<br />
	<br />
	<br />
	</div>	


<div class='right-box'>
	<div id="map" style="width:100%;height:80%;"></div>
		<div>
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
		

			</script>
			<br>
			<c:if test="${sessionScope.memId != article.id }">
			<div align="right">
				<c:if test ="${ppl_avail == 0}">
					<button class="hereOn btn btn-primary">저요</button>
					<button class="hereOff btn btn-primary" style="display:none" >저요 해지</button>
				</c:if>
				<c:if test ="${ppl_avail == 1}">
					<button class="hereOn btn btn-primary" style="display:none">저요 </button>
					<button class="hereOff btn btn-primary">저요 해지</button>
				</c:if>
				<c:if test ="${check == 0}">
					<button class="zzimOn btn btn-primary">찜</button>
					<button class="zzimOff btn btn-primary" style="display:none">찜해지</button>
				</c:if>
				<c:if test ="${check == 1}">
					<button class="zzimOn btn btn-primary" style="display:none">찜</button>
					<button class="zzimOff btn btn-primary">찜해지</button>
				</c:if>
<%-- 				<a href ="mailto:'${ppl_avail2.EMAIL}'">${article.id}</a> --%>
		</div>
		</c:if>
		<%--찜 ajax --%>
			<script>
				$(document).ready(function(){
					
					$(".zzimOn").click(function(){
						var btnOn = $(this);
						var btnOff = $(this).next();
						var map_num = ${article.map_num};
						$.ajax({
							type: "post",
							url: "/together/mapboard/choiceList.git",
							data: {"map_num":map_num},
							success: function(data){
								btnOn.css("display", "none");
								btnOff.css("display","");
								//btnOn.css("display")
								console.log(data);
								
							}
						});
						
					});
					
					$(".zzimOff").click(function(){
						var btnOff = $(this);
						var btnOn = $(this).prev();
						var map_num = ${article.map_num};
						$.ajax({
							type: "post",
							url: "/together/mapboard/choiceDelete.git",
							data: {"map_num":map_num},
							success: function(data){
								btnOff.css("display", "none");
								btnOn.css("display","");
								//btnOn.css("display")
								console.log(data);
								
							}
						});
						
					});
					
			<%--저요  ajax --%>
					$(".hereOn").click(function(){
						var btnOn = $(this);
						console.log(btnOn);
						var btnOff =$(this).next();
						console.log(btnOff);
						var map_num =${article.map_num};
						$.ajax({
							type :"post",
							url  :"/together/mapboard/ppl_avail.git",
							data :{"map_num":map_num},
							success:function(data){
								btnOn.css("display","none");
								btnOff.css("display","");
								console.log(data);
							}
						});
					});
					
					$(".hereOff").click(function(){
						var btnOff = $(this);
						console.log(btnOff);
						var btnOn =$(this).prev();
						console.log(btnOn);
						var map_num =${article.map_num};
						$.ajax({
							type :"post",
							url  :"/together/mapboard/ppl_availDelete.git",
							data :{"map_num":map_num},
							success:function(data){
								btnOff.css("display","none");
								btnOn.css("display","");
								console.log(data);
							}
						});
					});	
				});

				function joinMember(){
					var map_num = ${article.map_num};
					var id = $(joinId).val();
					console.log(map_num);
					console.log(id);
					$.ajax({
						type :"post",
						url  :"/together/mapboard/joinMember.git",
						data :{"map_num":map_num,"id":id},
						success:function(data){
							
						}
					});	
				}
			</script>
	</div>
</div>
<c:if test ="${sessionScope.memId == article.id}">
	<table class="table">
		<tr>
			<td colspan="2" class="bolder" align="center">참여가능인원 <button onclick ="joinMember()" class="btn btn-primary btn-sm">모임멤버추가</button></td>
		</tr>
		<tr>
			<td colspan="2">
				<c:forEach var ="ppl_avail2" items ="${ppl_avail2}">
			 		<c:if test ="${ppl_avail2.JOIN_STATUS == 0}">
						<img src="/together/save/${ppl_avail2.IMG}" width="50" height="50"><input type= "radio" id = "joinId" value ="${ppl_avail2.ID}"/>${ppl_avail2.ID}
					</c:if>
				</c:forEach>
			</td>
		</tr>
		<tr>
			<td colspan ="2" align="right">
				<input type ="submit" class="btn btn-primary" value ="메인페이지" onclick ="window.location='/together/main/main.git'"/>
				<input type ="submit" class="btn btn-primary" value ="수정" onclick ="window.location='/together/mapboard/modifyMap.git?map_num=${article.map_num}'"/>
				<input type = "button" class="btn btn-primary" value ="삭제" onclick ="window.location='/together/mapboard/main.git?map_num=${article.map_num}'"/>
			</td>
	</table>
</c:if> 
<br><br><br><br>
</div>
</div>
</div>
</section>
</body>