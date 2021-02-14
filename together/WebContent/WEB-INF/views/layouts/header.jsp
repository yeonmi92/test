<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;700&display=swap" rel="stylesheet"><style>
	body{
		font-family: 'Noto Sans KR', sans-serif;
	}
</style>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script>
	$(function(){
		var keyword = new Array;
		keyword[0] = "ff";
		keyword[1] = "indexBoard.git";
		keyword[2] = "use.git";
		keyword[3] = "cslist.git";
		keyword[4] = "myInfoView.git";
		keyword[5] = "memberList.git";
		keyword[6] = "reportList.git";
		var url = location.href;
		console.log(url);
		
		var getKey0 = url.indexOf(keyword[0]);
		var getKey1 = url.indexOf(keyword[1]);
		var getKey2 = url.indexOf(keyword[2]);
		var getKey3 = url.indexOf(keyword[3]);
		var getKey4 = url.indexOf(keyword[4]);
		var getKey5 = url.indexOf(keyword[5]);
		var getKey6 = url.indexOf(keyword[6]);
		
		console.log(getKey0);
		console.log(getKey1);
		console.log(getKey2);
		console.log(getKey3);
		console.log(getKey4);
		console.log(getKey5);
		console.log(getKey6);
		
		if(getKey0 != -1){
			$("#gather").addClass("active");
		}
		if(getKey1 != -1){
			$("#indexBoard").addClass("active");
		}
		if(getKey2 != -1){
			$("#useBoard").addClass("active");
		}
		if(getKey3 != -1){
			$("#cslist").addClass("active");
		}
		if(getKey4 != -1){
			$("#mypage").addClass("active");
		}
		if(getKey5 != -1){
			$("#adminCtr").addClass("active");
		}
		if(getKey6 != -1){
			$("#adminCtr").addClass("active");
		}
	});
</script>
<!--================Header Menu Area =================-->
  <header class="header_area">
    <div class="main_menu">
      <nav class="navbar navbar-expand-lg navbar-light">
        <div class="container box_1620">
         <!-- Brand and toggle get grouped for better mobile display -->
          <a class="navbar-brand logo_h" href="/together/main/main.git"><img src="/together/resources/img/tgt_logo.png" alt=""></a>
          <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
 
 <!-- Collect the nav links, forms, and other content for toggling -->
          <div class="collapse navbar-collapse offset" id="navbarSupportedContent">
            <ul class="nav navbar-nav menu_nav justify-content-center">
              <li id="indexBoard" class="nav-item"><a class="nav-link" href="/together/board/indexBoard.git" style="font-family: 'Noto Sans KR', sans-serif; font-size: 20px;">게시판</a></li> 
              <li id="useBoard"  class="nav-item"><a class="nav-link" href="/together/csboard/use.git" style="font-family: 'Noto Sans KR', sans-serif; font-size: 20px;">이용방법</a></li>
              <li id="cslist" class="nav-item"><a class="nav-link" href="/together/csboard/cslist.git" style="font-family: 'Noto Sans KR', sans-serif; font-size: 20px;">고객센터</a></li>
             
             <c:if test="${not empty sessionScope.memId}">
             	<c:if test="${sessionScope.memId != 'admin' }">
	              <li id="mypage" class="nav-item submenu dropdown">
	                <a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
	                  aria-expanded="false" style="font-family: 'Noto Sans KR', sans-serif; font-size: 20px;">마이페이지</a>
	                <ul class="dropdown-menu">
	                	<li class="nav-item"><a class="nav-link" href="/together/member/myInfoView.git" style="font-family: 'Noto Sans KR', sans-serif; font-size: 20px;">내정보</a></li>
	             	 	<li class="nav-item"><a class="nav-link" href="/together/member/choiceList.git" style="font-family: 'Noto Sans KR', sans-serif; font-size: 20px;">찜페이지</a></li>
	             	 	<li class="nav-item"><a class="nav-link" href="/together/member/blackList.git" style="font-family: 'Noto Sans KR', sans-serif; font-size: 20px;">블랙리스트</a></li>
	             	 	<li class="nav-item"><a class="nav-link" href="/together/member/historyList.git" style="font-family: 'Noto Sans KR', sans-serif; font-size: 20px;">참여이력</a></li>
	             	 	<li class="nav-item"><a class="nav-link" href="/together/member/myArticleList.git" style="font-family: 'Noto Sans KR', sans-serif; font-size: 20px;">내가쓴글</a></li>
	             	 	<li class="nav-item"><a class="nav-link" href="/together/report/indexMyReport.git" style="font-family: 'Noto Sans KR', sans-serif; font-size: 20px;">신고내역</a></li>
	                </ul>
	              </li>
	            </c:if>
	      	</c:if>
	              
	              <c:if test="${sessionScope.memId eq 'admin'}">
	               <li id="adminCtr" class="nav-item submenu dropdown">
	              	<a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
	                  aria-expanded="false" style="font-family: 'Noto Sans KR', sans-serif; font-size: 20px;">관리자</a>
	                <ul class="dropdown-menu">
	                	<li class="nav-item"><a class="nav-link active" href="/together/admin/memberList.git" style="font-family: 'Noto Sans KR', sans-serif; font-size: 20px;">회원목록</a></li>
	             	 	<li class="nav-item"><a class="nav-link" href="/together/admin/reportList.git" style="font-family: 'Noto Sans KR', sans-serif; font-size: 20px;">신고목록</a></li>
	                </ul>
	                </li>
	              </c:if>
	              
              
            </ul>
            
			<c:if test="${empty sessionScope.memId }">
					<a class="button" href="/together/member/login.git" style="font-family: 'Noto Sans KR', sans-serif; font-size: 15px;">login</a>
					&nbsp;
					<a class="button" href="/together/member/signupForm.git" style="font-family: 'Noto Sans KR', sans-serif; font-size: 15px;">signup</a>
			</c:if>
			
			<c:if test="${not empty sessionScope.memId }">
				<tr>
					<td><a class="button" href="/together/member/logout.git" style="font-family: 'Noto Sans KR', sans-serif; font-size: 15px;">logout</a></td>
				</tr>
			</c:if>
            
          </div> 
        </div>
      </nav>
    </div>
  </header>
