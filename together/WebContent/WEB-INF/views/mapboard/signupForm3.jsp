<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
	<link rel="shortcut icon" href="/together/resources/assets/images/fav.jpg">
    <link rel="stylesheet" href="/together/resources/assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="/together/resources/assets/css/fontawsom-all.min.css">
    <link rel="stylesheet" type="text/css" href="/together/resources/assets/css/style.css" />
     <style>
		@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300&display=swap');
		body{
			font-family: 'Noto Sans KR', sans-serif;
		}
		h1, h2, h3, h4, h5, h6{
			font-family: 'Noto Sans KR', sans-serif;
			font-weight: bolder;
		}
	</style>
<br />
<script>

function count_ck(obj){

	var chkbox = document.getElementsByName("hobby");
	var chkCnt = 0;
	for(var i=0;i<chkbox.length; i++){
		if(chkbox[i].checked){
			chkCnt++;
		}
	}

	if(chkCnt>3){
		alert("최대 3개 선택 할 수 있습니다.");
		obj.checked = false;
		return false;
	}
}
function check(){
	var fileCheck = document.getElementById("bfile").value;
    if(!fileCheck){
        alert("파일을 첨부해 주세요");
        return false;
    }
}
</script>

<body>
<section class="blog-post-area section-margin">
	<div class="container-fluid ">
		<div class="container-fluid ">
		        <div class="container ">
		            <div class="row ">
		                
		                <div class="col-sm-10 login-box">
		                    <div class="row">
		                       <div class="col-lg-4 col-md-5 box-de">
		                           <div class="small-logo">
		                                 <img src="/together/resources/img/tgt_logo.png" width="70"> TOGETHER Login
		                            </div>
		                            <div class="ditk-inf sup-oi">
		                                <h2 class="w-100">이미 회원가입을 하셨나요? </h2>
		                                <p>로그인을 하시려면 아래 버튼을 눌러주세요.</p>
		                                <a href="index.html">
		                                    <button type="button" class="btn btn-outline-light">로그인</button>
		                                </a>
		                            </div>
		                        </div>
		                        
		                        <div class="col-lg-8 col-md-7 log-det">
		                            
		                            <h2>회원가입</h2>
		                            <h3 align="center">3 단계</h3>
		                            <p>(최대 3개까지 선택가능)</p>
		                            <br/>
		                          <form action="/together/member/signupPro.git" method="post" enctype="multipart/form-data" name="inputForm" onsubmit="return check()">
		                            <input type="hidden" name="name" value="${dto.name}">
		                            <input type="hidden" name="id" value="${dto.id}">
		                            <input type="hidden" name="pw" value="${dto.pw}">
		                            <input type="hidden" name="birth" value="${dto.birth}">
		                            <input type="hidden" name="gender" value="${dto.gender}">
		                            <input type="hidden" name="email" value="${dto.email}">
		                            <input type="hidden" name="tel" value="${dto.tel}">
		                       
		                            <div class="text-box-cont">
		                                   <div class="input-group mb-3">
		                                     <input type="button" disabled class="btn btn-success btn-round" value="관심분야 선택">
		                                    </div>
		                                    <div align="center">
		                                     <input id="sports" type="checkbox" name="hobby" onClick="count_ck(this);" value="운동">
		                                    <label for="sports">운동</label>&emsp;
		
		                                    <input type="checkbox" id="cooking" name="hobby" onClick="count_ck(this);" value="맛집">
		                                    <label for="cooking">맛집</label>&emsp;
		
		                                    <input type="checkbox" id="music" name="hobby" onClick="count_ck(this);" value="음악">
		                                    <label for="music">음악</label>&emsp;
		                                </div>
		                                    <div align="center">
		
		                                    <input type="checkbox" id="shopping" name="hobby" onClick="count_ck(this);" value="쇼핑">
		                                    <label for="shopping">쇼핑</label>&emsp;
		
		                                    <input type="checkbox" id="reading" name="hobby" onClick="count_ck(this);" value="독서">
		                                    <label for="game">독서</label>&emsp;
		
		                                    <input type="checkbox" id="etc" name="hobby" onClick="count_ck(this);" value="기타">
		                                    <label for="etc">기타</label>&emsp;
		                                </div><br/>
		                                
		                                 <div class="input-group mb-3" >
		                                     <input type="button" disabled class="btn btn-success btn-round" value="프로필 사진 첨부">
		                                </div>
		                                    <div align="center">
		                                     <input type="file" name="file" id="bfile" class="btn btn-success btn-round" style="padding: 10px; margin-left: 25px">
		                                </div><br/>
		                                
		                                <div class="input-group center sup mb-3">
		                                  <input type="submit" value="내계정만들기" class="btn btn-success btn-round">
		                                   <!-- <button class="btn btn-success btn-round">다음</button>-->
		                                </div>    
		                            </div>
		                            </form>
		
		
		                        </div>
		                       
		                    </div>
		                </div>
		            </div>
		        </div>
		        <br/><br/><br/><br/><br/>
		    </div>
	    </div>
    </section>
<!-- <div align="center"> -->
<!-- <h3>관심분야를 선택해 주세요(3개 선택)</h3> -->
<!-- <form action="/together/member/signupPro.git" method="post" enctype="multipart/form-data" name="inputForm" onsubmit="return check()"> -->
<%-- 	<input type="hidden" name="name" value="${dto.name}"> --%>
<%-- 	<input type="hidden" name="id" value="${dto.id}"> --%>
<%-- 	<input type="hidden" name="pw" value="${dto.pw}"> --%>
<%-- 	<input type="hidden" name="birth" value="${dto.birth}"> --%>
<%-- 	<input type="hidden" name="gender" value="${dto.gender}"> --%>
<%-- 	<input type="hidden" name="email" value="${dto.email}"> --%>
<%-- 	<input type="hidden" name="tel" value="${dto.tel}"> --%>
<!-- 	<table> -->
<!-- 		<tr> -->
<!-- 	        <td>관심분야</td> -->
<!-- 	        <td> -->
<!-- 	            <input id="sports" type="checkbox" name="hobby" onClick="count_ck(this);" value="운동"> -->
<!-- 	            <label for="sports">운동</label> -->
	            
<!-- 	            <input type="checkbox" id="cooking" name="hobby" onClick="count_ck(this);" value="맛집"> -->
<!-- 	            <label for="cooking">맛집</label> -->
	            
<!-- 	            <input type="checkbox" id="music" name="hobby" onClick="count_ck(this);" value="음악"> -->
<!-- 	            <label for="music">음악</label> -->
	            
<!-- 	            <input type="checkbox" id="shopping" name="hobby" onClick="count_ck(this);" value="쇼핑"> -->
<!-- 	            <label for="shopping">쇼핑</label> -->
	            
<!-- 	            <input type="checkbox" id="reading" name="hobby" onClick="count_ck(this);" value="독서"> -->
<!-- 	            <label for="game">독서</label> -->
	            
<!-- 	            <input type="checkbox" id="etc" name="hobby" onClick="count_ck(this);" value="기타"> -->
<!-- 	            <label for="etc">기타</label> -->
<!-- 	        </td> -->
<!-- 	    </tr> -->
	    
<!--         <tr> <td>프로필 사진 첨부 <input type="file" name="file" id="bfile"></td></tr> -->
<!--         <tr><td align="center"><input type="submit" value="내계정만들기"></td></tr> -->
<!-- 	</table> -->
<!-- </form> -->
<!-- </div> -->
</body>
	<script src="/together/resources/assets/js/jquery-3.2.1.min.js"></script>
	<script src="/together/resources/assets/js/popper.min.js"></script>
	<script src="/together/resources/assets/js/bootstrap.min.js"></script>
	<script src="/together/resources/assets/js/script.js"></script>
</html>