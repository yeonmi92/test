<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">

<head>
	<link rel="shortcut icon" href="/together/resources/assets/images/fav.jpg">
    <link rel="stylesheet" href="/together/resources/assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="/together/resources/assets/css/fontawsom-all.min.css">
    <link rel="stylesheet" type="text/css" href="/together/resources/assets/css/style.css" />
</head>
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

<body>
<section class="blog-post-area section-margin">
			  <div class="container-fluid ">
			        <div class="container ">
			            <div class="row ">
			                <div class="col-sm-10 login-box">
			                    <div class="row">
			                        <div class="col-lg-8 col-md-7 log-det">
			                            <div class="small-logo">
			                                <img src="/together/resources/img/tgt_logo.png" width="70"> TOGETHER Login
			                            </div>
			                            <h2>TOGETHER에 로그인하기</h2><br/>
			                        
									<form action="/together/member/loginPro.git" method="post">
			
			                            <div class="text-box-cont">
			                                <div class="input-group mb-3">
			                                    <div class="input-group-prepend">
			                                        <span class="input-group-text" id="basic-addon1"><i class="fas fa-user"></i></span>
			                                    </div>
			                                    <input type="text" class="form-control" placeholder="Username" name="id" aria-label="Username" aria-describedby="basic-addon1">
			                                </div>
			                                 <div class="input-group mb-3">
			                                    <div class="input-group-prepend">
			                                        <span class="input-group-text" id="basic-addon1"><i class="fas fa-lock"></i></span>
			                                    </div>
			                                    <input type="password" name="pw" class="form-control" placeholder="Password" aria-label="Username" aria-describedby="basic-addon1">
			                                </div>
			                                <br/>
			                                <div class="input-group center mb-3">
			                                    <input type="submit" value="로그인" class="btn btn-success btn-round"/>
			                                </div>    
			                            </div>
			                            
								</form>
			
			                        </div>
			                        <div class="col-lg-4 col-md-5 box-de">
			                            <div class="ditk-inf">
			                                <h2 class="w-100">회원가입을 해야 <br> 사이트 이용이 가능합니다.</h2>
			                                <p></p>
			                                <a onclick="window.location='/together/member/signupForm.git'">
			                                <button type="button" class="btn btn-outline-light">회원가입</button>
			                                </a>
			                            </div>
			                        </div>
			                    </div>
			                </div>
			            </div>
			        </div>
			    </div>
    </section>
</body>
<script src="/together/resources/assets/js/jquery-3.2.1.min.js"></script>
<script src="/together/resources/assets/js/popper.min.js"></script>
<script src="/together/resources/assets/js/bootstrap.min.js"></script>
<script src="/together/resources/assets/js/script.js"></script>
</html>