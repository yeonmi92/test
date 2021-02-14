<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입페이지</title>
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
		
		/* step css */
	</style>
<script >
//유효성 검사 (javascript영역)
function check(){
	var inputs = document.inputForm;
	if(!inputs.name.value){	// false일때 값이 없을때
		alert("이름을 입력하세요");
		return false;
	}
	if(!inputs.id.value){	// false일때 값이 없을때
		alert("아이디를 입력하세요");
		return false;
	}
	if(!inputs.pw.value){	// false일때 값이 없을때
		alert("비밀번호를 입력하세요");
		return false;
	}
	if(!inputs.pwCh.value){	// false일때 값이 없을때
		alert("비밀번호 확인란을 입력하세요");
		return false;
	}
	if(inputs.pw.value != inputs.pwCh.value){
		alert("비밀번호를 동일하게 작성하세요");
		return false;
	}
}
function confirmId(inputForm){
	// 아이디 중복 확인 버튼 눌렀을때 실행되는 함수
	// 아이디 input태그에 입력이 되어 있어야 정상 처리
	if(inputForm.id.value == ""){
		alert("아이디를 입력하세요.");
		return; //함수 강제 종료 밑에 코드 실행 안됨.
	}
	var url = "confirmId.git?id=" + inputForm.id.value;
	console.log(url);
	open(url, "confirmId", "toolbar=no, location=no, status=no, menubar=no, scrollbar=no, resizable=no, width=300, height=200");
}
</script>
</head>
<body>
<section class="blog-post-area section-margin">
  <div class="container-fluid ">
        <div class="container ">
        
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
			                                <a href="/together/member/login.git">
			                                    <button type="button" class="btn btn-outline-light">로그인</button>
			                                </a>
			                            </div>
			                        </div>
			                        <div class="col-lg-8 col-md-7 log-det">
			                            
			                            <h2>회원가입</h2>
			                            <h3 align="center">1 단계</h3>
			                            <br/>
			                           <form action="/together/member/signupForm2.git" method="post" name="inputForm" onsubmit="return check()">
			                            <div class="text-box-cont">
			                            
			                                <div class="input-group mb-3">
			                                    <div class="input-group-prepend">
			                                        <span class="input-group-text" id="basic-addon1">
			                                        <i class="far fa-user"></i></span>
			                                    </div>
			                                    <input type="text" class="form-control" placeholder="이름" aria-label="Username" aria-describedby="basic-addon1" name="name">
			                                </div>
			                                
			                                   <div class="input-group mb-3">
			                                    <div class="input-group-prepend">
			                                        <span class="input-group-text" id="basic-addon1">
			                                            <i class="far fa-envelope"></i>
			                                        </span>
			                                    </div>
			                                    <input type="text" class="form-control" placeholder="아이디" aria-label="Username" aria-describedby="basic-addon1" name="id">
			                                </div>
			                                 <div class="input-group mb-3" align="right">
					                                <input type="button" value=" 아이디 중복 확인 " onclick="confirmId(this.form)" class="btn btn-success btn-round"/>
			                                 </div>
							                                
			                                 <div class="input-group mb-3">
			                                    <div class="input-group-prepend">
			                                        <span class="input-group-text" id="basic-addon1"><i class="fas fa-lock"></i></span>
			                                    </div>
			                                    <input type="password" name="pw" class="form-control" placeholder="비밀번호" aria-label="Username" aria-describedby="basic-addon1">
			                                </div>
			                               <div class="input-group mb-3">
			                                    <div class="input-group-prepend">
			                                        <span class="input-group-text" id="basic-addon1"><i class="fas fa-shield-alt"></i></span>
			                                    </div>
			                                    <input type="password" class="form-control" placeholder="비밀번호 확인" aria-label="Username" aria-describedby="basic-addon1">
			                                </div>
			                               
			                                <div class="input-group center sup mb-3">
			                                    <button class="btn btn-success btn-round">다음</button>
			                                </div>    
			                            </div>
			                            </form>
			
			
			                        </div>
			                       
			                    </div>
			                </div>
			            </div>
			        </div>
			    </div>
		    </div>
	    <br/> <br/> <br/> <br/> <br/> <br/>
	    </div>
   </section>

</body>
<script src="/together/resources/assets/js/jquery-3.2.1.min.js"></script>
<script src="/together/resources/assets/js/popper.min.js"></script>
<script src="/together/resources/assets/js/bootstrap.min.js"></script>
<script src="/together/resources/assets/js/script.js"></script>
</html>