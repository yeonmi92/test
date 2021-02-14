<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
<script >
//유효성 검사 (javascript영역)
function check(){
	var inputs = document.inputForm;
	if(!inputs.birth.value){	// false일때 값이 없을때
		alert("나이를 입력하세요");
		return false;
	}
	if(!inputs.gender.value){	// false일때 값이 없을때
		alert("성별을 선택해 주세요");
		return false;
	}
	if(!inputs.email.value){	// false일때 값이 없을때
		alert("이메일을 입력하세요");
		return false;
	}
	if(!inputs.tel.value){	// false일때 값이 없을때
		alert("전화번호를 입력하세요");
		return false;
	}

}
</script>
</head>
<body>
	<section class="blog-post-area section-margin">
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
			                            <h3 align="center">2 단계</h3>
			                            <br/>
			                           <form action="/together/member/signupForm3.git" method="post" name="inputForm" onsubmit="return check()">
			                           <input type="hidden" name="name" value="${dto.name}">
			                            <input type="hidden" name="id" value="${dto.id}">
			                            <input type="hidden" name="pw" value="${dto.pw}">
			                            <div class="text-box-cont">
			                                   <div class="input-group mb-3">
			                                    <div class="input-group-prepend">
			                                        <span class="input-group-text" id="basic-addon1"><i class="fas fa-calendar-check"></i></span>
			                                    </div>
			                                    <input type="text" class="form-control" placeholder="나이" aria-label="Username" aria-describedby="basic-addon1" name="birth">
			                                </div>
			                                
			                                    <div align="center">
			                                        <input type="button" disabled class="btn btn-success" value="성별"><br/>
			                                     	<input type="radio" name="gender" value="female" checked="checked"> &nbsp; 여 &nbsp;
						                         	<input type="radio" name="gender" value="male" > &nbsp; 남 <br/>
			                                    </div>
			                                    <br/>
			                                    
			                                
			                                
			                               <div class="input-group mb-3">
			                                    <div class="input-group-prepend">
			                                        <span class="input-group-text" id="basic-addon1"><i class="fas fa-envelope"></i></span>
			                                    </div>
			                                    <input type="text" class="form-control" placeholder="이메일" name="email" aria-label="Username" aria-describedby="basic-addon1">
			                                </div>
			                                
			                                <div class="input-group mb-3">
			                                    <div class="input-group-prepend">
			                                       <span class="input-group-text" id="basic-addon1"><i class="fas fa-check"></i></span>
			                                    </div>
			                                    <input type="text" class="form-control" placeholder="전화번호" aria-label="Username" aria-describedby="basic-addon1" name="tel">
			                                    &nbsp;
			                                    <input type="button" value="인증확인" onclick="confirmId(this.form)" class="btn btn-info btn-round" style="padding:2px; margin-top: 1px"/>
			                                </div>
			                               
			                                <div class="input-group center sup mb-3">
			                                   <input type="submit" value="다음" class="btn btn-success btn-round">
			                                   <!-- <button class="btn btn-success btn-round">다음</button>-->
			                                </div>    
			                            </div>
			                            </form>
			
			
			                        </div>
			                       
			                    </div>
			                </div>
			            </div>
			        </div>
			    </div>
	 </section>
<!-- <div align="center"> -->
<!-- <form action="/together/member/signupForm3.git" method="post" name="inputForm" onsubmit="return check()"> -->
<%-- 	<input type="hidden" name="name" value="${dto.name}"> --%>
<%-- 	<input type="hidden" name="id" value="${dto.id}"> --%>
<%-- 	<input type="hidden" name="pw" value="${dto.pw}"> --%>
<!-- 	<table> -->
<!-- 		<tr><td>*나이</td></tr> -->
<!-- 		<tr><td><input type="text" name="birth"></td></tr> -->
<!-- 		<tr><td>*성별 </td></tr> -->
<!-- 		<tr><td> -->
<!-- 			<input type="radio" name="gender" value="female" checked="checked"> 여 &nbsp;&nbsp; -->
<!-- 			<input type="radio" name="gender" value="male" > 남 -->
<!-- 		</td></tr> -->
<!-- 		<tr><td>*이메일 </td></tr> -->
<!-- 		<tr><td><input type="text" name="email"></td></tr> -->
<!-- 		<tr><td>*전화번호</td></tr> -->
<!-- 		<tr><td><input type="text" name="tel"></td> -->
<!-- 		<td colspan="2"><input type="button" value="인증확인" onclick="confirmId(this.form)"/></td></tr> -->
<!-- 		<tr><td align="center"><input type="submit" value="다음"></td></tr> -->
<!-- 	</table> -->
<!-- </form> -->
<!-- </div> -->
</body>
	<script src="/together/resources/assets/js/jquery-3.2.1.min.js"></script>
	<script src="/together/resources/assets/js/popper.min.js"></script>
	<script src="/together/resources/assets/js/bootstrap.min.js"></script>
	<script src="/together/resources/assets/js/script.js"></script>
</html>