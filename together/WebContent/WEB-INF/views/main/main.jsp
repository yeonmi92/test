<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=0087bac082e4992b48ce8229b57e4a1e&libraries=clusterer"></script>
	<link rel="stylesheet" href="/together/slider/owl.carousel.css">
</head>
<link rel="stylesheet" href="/together/resources/css/style.css">
<script src="jquery.min.js"></script> <script src="/together/slider/owl.carousel.min.js"></script>

<style>
.wrap {position: absolute;left: 0;bottom: 40px;width: 288px;height: 132px;margin-left: -144px;text-align: left;overflow: hidden;font-size: 12px;font-family: 'Malgun Gothic', dotum, '돋움', sans-serif;line-height: 1.5;}
.wrap * {padding: 0;margin: 0;}
.wrap .info {width: 286px;height: 120px;border-radius: 5px;border-bottom: 2px solid #ccc;border-right: 1px solid #ccc;overflow: hidden;background: #fff;}
.wrap .info:nth-child(1) {border: 0;box-shadow: 0px 1px 2px #888;}
.info .title {padding: 5px 0 0 10px;height: 30px;background: #eee;border-bottom: 1px solid #ddd;font-size: 18px;font-weight: bold;}
.info .close {position: absolute;top: 10px;right: 10px;color: #888;width: 17px;height: 17px;background: url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/overlay_close.png');}
.info .close:hover {cursor: pointer;}
.info .body {position: relative;overflow: hidden;}
.info .desc {position: relative;margin: 13px 0 0 10px;height: 75px;}
.desc .ellipsis {overflow: hidden;text-overflow: ellipsis;white-space: nowrap;}
.desc .jibun {font-size: 11px;color: #888;margin-top: -2px;}
.info .img {position: absolute;top: 6px;left: 5px;width: 73px;height: 71px;border: 1px solid #ddd;color: #888;overflow: hidden;}
.info:after {content: '';position: absolute;margin-left: -12px;left: 50%;bottom: 0;width: 22px;height: 12px;background: url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png')}
.info .link {color: #5085BB;}

.img_wapper {width:60%;height:150px; float:left; margin-right:10px;}
.img {width:100%;}
.long{
		width: 50%
	}
</style>
<body>
<section class="blog-post-area section-margin">
	<div class="container">
<!-- <div class="single-sidebar-widget post-category-widget">
	<h3 class="single-sidebar-widget__title">
		<font style="vertical-align: inherit;">참여중</font>
	</h3> 
</div> -->
<c:if test="${sessionScope.memId != null || sessionScope.memId != 'admin' } ">
	<c:if test="${myBoardList != null}">
		<section>
		    <div class="container">
		    <div class="widget-wrap">
			    <h4 class="single-sidebar-widget__title">참여중</h4>
			</div>
		        <div class="owl-carousel owl-theme blog-slider">
			        <c:forEach var="myMapBoard" items="${myBoardList}">
			          <div class="card blog__slide text-center">
			            <div class="blog__slide__content">
			              <span style='font-size:70px;' >&#128197; </span>
			              <h3><a href="/together/mapboard/detailMap.git?map_num=${myMapBoard.MAP_NUM}">${myMapBoard.TITLE}</a></h3>
			              <p><fmt:formatDate pattern="yyyy-MM-dd" value="${myMapBoard.START_DATE}"/> ~
								<fmt:formatDate pattern="yyyy-MM-dd" value="${myMapBoard.END_DATE}"/><br />
								${myMapBoard.ADDR}</p>
			            </div>
			          </div>
			        </c:forEach>
		        </div>
		 </section>
 	</c:if>
 </c:if>
 </br>
 </br>
<div align="center">
		<nav class="navbar navbar-expand-lg navbar-light bg-light" >
				<div class="form-inline my-2 my-lg-0" style="margin-left:20%;">
					<div class="form-group">
						<select id="sel" class="custom-select" name="sel" >
							<option value="id">주최자</option>
							<option value="title" selected>제목</option>
							<option value="hobby">관심분야</option>
						</select>
					</div>
				</div>
					<input type="text" class="form-control mr-sm-2 long"  id="search" name="search" />
					<input id="mapsearch" type="button" value="검색" class="btn btn-primary my-2 my-sm-0"/>
		</nav>
	</div>
</div>

</section>
<div align="center">		
	<div id="map" style="width:60%;height:450px;"></div>
	<div id="maplist" ></div>	
</div>
<!-- <div align="center"> -->


<!-- 		<select id="sel" name="sel" > -->
<!-- 			<option value="id">주최자</option> -->
<!-- 			<option value="title" selected>제목</option> -->
<!-- 			<option value="hobby">관심분야</option> -->
<!-- 		</select> -->
<!-- 			<input type="text" id="search" name="search" /> -->
<!-- 			<input id="mapsearch" type="button" value="검색" /> -->
			
			
			
<!-- 		<br/><br/><br/> -->
<!-- 	<div id="map" style="width:60%;height:450px;"></div> -->
<!-- 	<div id="maplist" ></div>	 -->
<!-- </div> -->
<section class="blog-post-area section-margin">
	<div class="container">

		<div class="widget-wrap">
		<div align="left">
	    	<h3 class="single-sidebar-widget__title">최근 게시물</h3>
	    </div>
	   </div>
	
	
	<br/>
	<table cellspacing="0" class="table table-hover recruit">  
	      <caption></caption>  
	      <colgroup>  
	          <col width="5%">  
	          <col width="10%">  
	          <col width="20%">  
	          <col width="35%">  
	          <col width="20%">  
	          <col width="10%">  
	      </colgroup>  
	      <thead>  
	          <tr class="">  
	              <th scope="col">No.</th>  
	              <th scope="col">주최자</th>  
	              <th scope="col">제목</th>  
	              <th scope="col">장소</th>  
	              <th scope="col">약속날짜</th>  
	              <th scope="col">시간</th>  
	          </tr>  
	      </thead>
      <tbody>  
      <c:forEach var="board" items="${mapBoard}" varStatus="status">
	   	<tr class="item">  
              <td>${status.index+1}</td>
              <c:if test="${sessionScope.memId == null }">
				<td>${board.ID}</td>
			  </c:if>
			  <c:if test="${sessionScope.memId != null }">
				<td><a onclick="infoView('${board.ID}')">${board.ID}</a></td>
			  </c:if>
              <td width="25%"><a href="/together/mapboard/detailMap.git?map_num=${board.MAP_NUM}">${board.TITLE}</a></td>
              <td>${board.ADDR}</td>  
              <td><fmt:formatDate pattern="yyyy-MM-dd" value="${board.START_DATE}"/> ~
					<fmt:formatDate pattern="yyyy-MM-dd" value="${board.END_DATE}"/> </td>  
              <td>${board.TIMES}</td>  
          </tr>
	   </c:forEach>
	   <c:if test="${sessionScope.memId != null }">
		   <tr><td colspan="6" align="right"><button class="btn btn-primary" onclick="window.location='/together/mapboard/insertMap.git'">일정 등록 &nbsp; <i class="ti-arrow-right"></i></button></td></tr>
	    </c:if>
      </tbody>
  </table>
  </div>
 </section>

<section class="blog-post-area section-margin">
	<div class="container">
	<div class="widget-wrap">
	    <h3 class="single-sidebar-widget__title">후기</h3>
	</div>
	<table cellspacing="0" class="table table-hover recruit">  
	      <caption></caption>  
	      <colgroup>  
	          <col width="5%">  
	          <col width="40%">  
	          <col width="20%">  
	          <col width="25%">  
	          <col width="10%">  
	      </colgroup>  
	      <thead>  
	          <tr class="">  
	              <th scope="col">No.</th>  
	              <th scope="col">제목</th>  
	              <th scope="col">작성자</th>  
	              <th scope="col">날짜</th>  
	              <th scope="col">조회수</th>  
	          </tr>  
	      </thead>  
      <tbody>  
      <c:forEach var="board" items="${boardList}" varStatus="status">
	   	<tr class="item">  
              <td>${status.index+1}</td>
               <td><a href="/together/board/content.git?board_num=${board.BOARD_NUM}">${board.TITLE}</a></td>  
               <c:if test="${sessionScope.memId == null }">
				<td>${board.ID}</td>
			  </c:if>
			  <c:if test="${sessionScope.memId != null }">
				<td><a onclick="infoView('${board.ID}')">${board.ID}</a></td>
			  </c:if>
              <td><fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${board.REG}"/></td>  
              <td>${board.READCOUNT}</td>  
          </tr>
	   </c:forEach>
	   	<tr>
	   		<td colspan="5" align="right">
	   			<a href="/together/board/indexBoard.git"><button class="btn btn-primary">더보기&nbsp;<i class="ti-arrow-right"></i></button></a>
	   		</td>
	   	</tr>
      </tbody>
  </table>
  </div>  
 </section>
	<div class="container">
		<div class="widget-wrap">
		    <h4 class="single-sidebar-widget__title">이용방법</h4>
		</div>
		<a href="/together/csboard/use.git">
		<img alt="" src="/together/resources/img/banner.png">
		</a>
	</div>
	<br />

</body>
<script>
	

	var map = new kakao.maps.Map(document.getElementById('map'), { // 지도를 표시할 div
	    center : new kakao.maps.LatLng(37.4809136,126.949907), // 지도의 중심좌표
	    level : 5 // 지도의 확대 레벨
	});

    // 마커 클러스터러를 생성합니다
    // 마커 클러스터러를 생성할 때 disableClickZoom 값을 true로 지정하지 않은 경우
    // 클러스터 마커를 클릭했을 때 클러스터 객체가 포함하는 마커들이 모두 잘 보이도록 지도의 레벨과 영역을 변경합니다
    // 이 예제에서는 disableClickZoom 값을 true로 설정하여 기본 클릭 동작을 막고
    // 클러스터 마커를 클릭했을 때 클릭된 클러스터 마커의 위치를 기준으로 지도를 1레벨씩 확대합니다
/*     var clusterer = new kakao.maps.MarkerClusterer({
        map: map, // 마커들을 클러스터로 관리하고 표시할 지도 객체
        averageCenter: true, // 클러스터에 포함된 마커들의 평균 위치를 클러스터 마커 위치로 설정
        minLevel: 10, // 클러스터 할 최소 지도 레벨
        disableClickZoom: true // 클러스터 마커를 클릭했을 때 지도가 확대되지 않도록 설정한다
    }); */
    
    if (navigator.geolocation) {
        
        // GeoLocation을 이용해서 접속 위치를 얻어옵니다
        navigator.geolocation.getCurrentPosition(function(position) {
            
            var lat = position.coords.latitude, // 위도
                lon = position.coords.longitude; // 경도
            
            var locPosition = new kakao.maps.LatLng(lat, lon), // 마커가 표시될 위치를 geolocation으로 얻어온 좌표로 생성합니다
                message = '<div style="padding:5px;">나의 위치</div>'; // 인포윈도우에 표시될 내용입니다
            
            // 마커와 인포윈도우를 표시합니다
            displayMarker(locPosition, message);
                
          });
        
    } else { // HTML5의 GeoLocation을 사용할 수 없을때 마커 표시 위치와 인포윈도우 내용을 설정합니다
        
        var locPosition = new kakao.maps.LatLng(33.450701, 126.570667),    
            message = 'geolocation을 사용할수 없어요..'
            
        displayMarker(locPosition, message);
    }
    
    function displayMarker(locPosition, message) {

        // 마커를 생성합니다
        var marker = new kakao.maps.Marker({  
            map: map, 
            position: locPosition
        }); 
        
        var iwContent = message, // 인포윈도우에 표시할 내용
            iwRemoveable = true;

        // 인포윈도우를 생성합니다
        var infowindow = new kakao.maps.InfoWindow({
            content : iwContent,
            removable : iwRemoveable
        });
        
        // 인포윈도우를 마커위에 표시합니다 
        infowindow.open(map, marker);
        
        // 지도 중심좌표를 접속위치로 변경합니다
        map.setCenter(locPosition);      
    }    
	
	var arrMarker = [];
    
    // 데이터를 가져오기 위해 jQuery를 사용합니다
    // 데이터를 가져와 마커를 생성하고 클러스터러 객체에 넘겨줍니다
    // * 기존 카카오지도의 코드 다시 살리고, 파일명 대신 요청 경로로 처리  
    // * @RestController 는 객체를 JSON 방식으로 전달하기 때문에 jQuery를 이용해서 호출하는 .get() 다시 살려서 이용
    $.get("/together/map/getPositions.git", function(data) {
    	
/*     	 var clusterer = new kakao.maps.MarkerClusterer({
    	        map: map, // 마커들을 클러스터로 관리하고 표시할 지도 객체
    	        averageCenter: true, // 클러스터에 포함된 마커들의 평균 위치를 클러스터 마커 위치로 설정
    	        minLevel: 10, // 클러스터 할 최소 지도 레벨
    	        disableClickZoom: true // 클러스터 마커를 클릭했을 때 지도가 확대되지 않도록 설정한다
    	 });
    	 */
    	
    	$.each(data.positions, function(i, position) {
	    	var marker = new kakao.maps.Marker({
	    	    map: map, 
	    	    position: new kakao.maps.LatLng(position.lat, position.lng)
	    	});
	    	
		    var info1 = document.createElement('div');
		    info1.className="info";
		    var title1 = document.createElement('div');
		    title1.className="title";
		   	title1.appendChild(document.createTextNode(this.title));
		    
  		 	var closeBtn1 = document.createElement('div');
  		  	closeBtn1.className='close';
  		  	closeBtn1.title='닫기';
  		  	closeBtn1.onclick = function() { overlay.setMap(null); };
  		  	
		    var body1 = document.createElement('div');
		    body1.className="body";
		    var desc1 = document.createElement('div');
		    desc1.className="desc";
		    var ellipsis1 = document.createElement('div');
		    ellipsis1.appendChild(document.createTextNode("주최자 : " + this.id));
		    
		    var jibune1 = document.createElement('div');
		    jibune1.className="jibune";
		    jibune1.className="ellipsis";
		    jibune1.appendChild(document.createTextNode("만나는 장소 : " + this.addr));
		    
		    var dd1 = document.createElement('div');
		    var aa1 = document.createElement('a');
		    aa1.className = "link";
		    aa1.href = '/together/mapboard/detailMap.git?map_num='+this.map_num;
		    aa1.appendChild(document.createTextNode(this.detail));
		    
		    var content1 = document.createElement('div');
			content1.className="wrap";
			
			title1.appendChild(closeBtn1);
			info1.appendChild(title1);
			desc1.appendChild(ellipsis1);
			desc1.appendChild(jibune1);
			dd1.appendChild(aa1);
			desc1.appendChild(dd1);
			body1.appendChild(desc1);
			info1.appendChild(body1);
			content1.appendChild(info1);	
			
	    	// 마커 위에 커스텀오버레이를 표시합니다
	    	// 마커를 중심으로 커스텀 오버레이를 표시하기위해 CSS를 이용해 위치를 설정했습니다
	    	var overlay = new kakao.maps.CustomOverlay({
	    	    content: content1,
	    	    map: map,
	    	    position: marker.getPosition()       
	    	});
	    	
	    	//clusterer.addMarker(marker);
	    	
	    	overlay.setVisible(false);
	    	// 마커를 클릭했을 때 커스텀 오버레이를 표시합니다
	    	kakao.maps.event.addListener(marker, 'click', function() {
	    		console.log("marker click");
	    		overlay.setVisible(true);
	    	    overlay.setMap(map);
	    	});
	    	
	    	arrMarker.push(marker);
    	});
	    console.log(arrMarker);
	});
    
	
    function closeOverlay(orverlay) {
        overlay.setMap(null);     
    }

    // 마커 클러스터러에 클릭이벤트를 등록합니다
    // 마커 클러스터러를 생성할 때 disableClickZoom을 true로 설정하지 않은 경우
    // 이벤트 헨들러로 cluster 객체가 넘어오지 않을 수도 있습니다
/*     kakao.maps.event.addListener(clusterer, 'clusterclick', function(cluster) {

        // 현재 지도 레벨에서 1레벨 확대한 레벨
        var level = map.getLevel()-1;

        // 지도를 클릭된 클러스터의 마커의 위치를 기준으로 확대합니다
        map.setLevel(level, {anchor: cluster.getCenter()});
    }); */
    
    // 검색하면
    $('#mapsearch').click(function(){
    	
    	var sel = $("#sel").val();
    	var search = $("#search").val();
    	if(sel != null && search != null){

    		// 기존의 만들어진 마커클러스터 지우기
	    	//clusterer.clear();
    		
    		for(var i=0; i < arrMarker.length; i++){
    			arrMarker[i].setMap(null);
    			
    		}
    		arrMarker = [];
	    	
	    	// 검색 결과로 새롭게 마커 생성하기
	    	$.get("/together/map/getSearchPositions.git", {sel: sel, search: search },function(data) {
		        	
	    		$.each(data.positions, function(i, position) {
	    	    	var marker = new kakao.maps.Marker({
	    	    	    map: map, 
	    	    	    position: new kakao.maps.LatLng(position.lat, position.lng)
	    	    	});
	    	    	
	    		    var info1 = document.createElement('div');
	    		    info1.className="info";
	    		    var title1 = document.createElement('div');
	    		    title1.className="title";
	    		   	title1.appendChild(document.createTextNode(this.title));
	    		    
	      		 	var closeBtn1 = document.createElement('div');
	      		  	closeBtn1.className='close';
	      		  	closeBtn1.title='닫기';
	      		  	closeBtn1.onclick = function() { overlay.setMap(null); };
	      		  	
	    		    var body1 = document.createElement('div');
	    		    body1.className="body";
	    		    var desc1 = document.createElement('div');
	    		    desc1.className="desc";
	    		    var ellipsis1 = document.createElement('div');
	    		    ellipsis1.appendChild(document.createTextNode("주최자 : " + this.id));
	    		    
	    		    var jibune1 = document.createElement('div');
	    		    jibune1.className="jibune";
	    		    jibune1.className="ellipsis";
	    		    jibune1.appendChild(document.createTextNode("만나는 장소 : " + this.addr));
	    		    
	    		    var dd1 = document.createElement('div');
	    		    var aa1 = document.createElement('a');
	    		    aa1.className = "link";
	    		    aa1.href = '/together/mapboard/detailMap.git?map_num='+this.map_num;
	    		    aa1.appendChild(document.createTextNode(this.detail));
	    		    
	    		    var content1 = document.createElement('div');
	    			content1.className="wrap";
	    			
	    			title1.appendChild(closeBtn1);
	    			info1.appendChild(title1);
	    			desc1.appendChild(ellipsis1);
	    			desc1.appendChild(jibune1);
	    			dd1.appendChild(aa1);
	    			desc1.appendChild(dd1);
	    			body1.appendChild(desc1);
	    			info1.appendChild(body1);
	    			content1.appendChild(info1);	
	    			
	    	    	// 마커 위에 커스텀오버레이를 표시합니다
	    	    	// 마커를 중심으로 커스텀 오버레이를 표시하기위해 CSS를 이용해 위치를 설정했습니다
	    	    	var overlay = new kakao.maps.CustomOverlay({
	    	    	    content: content1,
	    	    	    map: map,
	    	    	    position: marker.getPosition()       
	    	    	});
	    	    	
	    	    	overlay.setVisible(false);
	    	    	// 마커를 클릭했을 때 커스텀 오버레이를 표시합니다
	    	    	kakao.maps.event.addListener(marker, 'click', function() {
	    	    		console.log("marker click");
	    	    		overlay.setVisible(true);
	    	    	    overlay.setMap(map);
	    	    	});
	    	    	
	    	    	arrMarker.push(marker);
	    	    	
	        	});
		    	    
	    	    var tagList = "<section class='blog-post-area section-margin'> <div class='container'> <div align='center' style='width:1140px; height:200px; overflow:auto'>"
	    	     + "<table cellspacing='0'class='table'> <caption></caption>"  
	    	     + "<colgroup> <col width='10%'> <col width='20%'> <col width='40%'> <col width='20%'> <col width='10%'> </colgroup>"  
	    	     + "<thead> <tr> <th scope='col'>주최자</th> <th scope='col'>제목</th> <th scope='col'>장소</th> <th scope='col'>날짜</th> <th scope='col'>시간</th> </tr> </thead>"  
	        	 + "<tbody> <tr class='item'>";
	    	    
	        	 if(data.positions != ""){
	        		 
	        		 $.each(data.positions, function() { // for문 같이 each로 jsonData.info를 객체로,
	        			 
	        			 var currentTime = new Date(this.start_date)
		        		 var month = currentTime.getMonth() + 1
		        		 var day = currentTime.getDate()
		        		 var year = currentTime.getFullYear()
		        		 var startdate = year + "-" + month + "-" + day
		        		 currentTime = new Date(this.end_date)
		        		 month = currentTime.getMonth() + 1
		        		 day = currentTime.getDate()
		        		 year = currentTime.getFullYear()
		        		 var enddate = year + "-" + month + "-" + day
		        		 
	        			 
	     				tagList += "<td>" + this.id + "</td>"; // this.name은 jsonData.info의 name
	     				tagList += "<td><a href='/together/mapboard/detailMap.git?map_num="+this.map_num+"'>" + this.title + "</a></td>"; // this.name은 jsonData.info의 name
	     				tagList += "<td>" + this.addr + "</td>"; // this.name은 jsonData.info의 name
	     				tagList += "<td>" + startdate + " ~ " + enddate + "</td>"; // this.name은 jsonData.info의 name
	     				tagList += "<td>" + this.times + "</td> </tr>"; // this.name은 jsonData.info의 name
	     				  
	     			});
	        	 }else{
	        		 tagList += "<td colspan='4'>검색한 결과가 없습니다.</td>"; 
	        	 }
	        	 
	    	    tagList += "</tbody></table></div></div></section>";
	
	    	    $("#maplist").html(tagList);
	    	    
	    	    //$("#maplist").html(t);
	    	    //$("#maplist").show();
	    	    //$("#maplist").css("display", "");
	    	    //data.list[0]. -> dto 
		    	    
		      });
    	}	
    });	
    
    function infoView(id){
		url = "/together/member/infoView.git?id=" + id;
		window.open(url, '회원 정보 보기', 'width=600px,height=600px, scrollbars=no, resizable=no, toolbar=no, status=no, location=no');
      
      }
</script>

</html>