<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <link rel="stylesheet" href="/together/resources/css/bootstrap.css" media="screen">
    <link rel="stylesheet" href="/together/resources/css/bootstrap.min.css">
</head>
<script>
	function setId(){
		//opener는 현재 내 창을 open해준 창을 말함.
		opener.document.inputForm.id.value="${trialId}";
		self.close(); //창닫기
	}

     var _gaq = _gaq || [];
      _gaq.push(['_setAccount', 'UA-23019901-1']);
      _gaq.push(['_setDomainName', "bootswatch.com"]);
        _gaq.push(['_setAllowLinker', true]);
      _gaq.push(['_trackPageview']);

     (function() {
       var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
       ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
       var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
     })();
</script>

<body>
	<div class="card border-primary mb-3" style="max-width: 20rem;">
		<div class="card-header" align="center"><b>중복확인</b></div>
	  	<div class="card-body">
	    	<h4 class="card-title" align="center">ID중복확인</h4>
	    		<p class="card-text" align="center">
	        		<c:if test="${check eq 'true'}">			
						${trialId}은 이미 사용중인 아이디입니다.
						<form action="/together/member/confirmId.git" method="post">				
						 다른 아이디를 입력하세요.
						 <div class="form-group">
						 	<input type="text" name="id" class="form-control" />
						 </div>
							<input type="submit" class="btn btn-primary my-2 my-sm-0" value="중복확인" />						
						</form>
					</c:if>
					<c:if test="${check eq 'false'}">				
						입력하신 ${trialId }는 사용하실 수 있는 아이디 입니다.<br>
						<input type="button" value="닫기" class="btn btn-primary btn-sm" onclick="setId()"/>						
					</c:if>
				</p>
		</div>
	</div>	     
</body>
</html>