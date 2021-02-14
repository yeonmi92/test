<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>신고팝업창</title>
</head>
<script >
	function popupClose(){
		self.close();
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
	<link rel="stylesheet" href="/together/resources/css/bootstrap.css" media="screen">
    <link rel="stylesheet" href="/together/resources/css/bootstrap.min.css">
<body>
<div class="card border-primary mb-3">
	<div class="card-header">신고하기</div>
	<div class="card-body">
	<h4 class="card-title" align="center"><b>${id} 신고</b></h4>
		<form action="reportPopupPro.git" method="post">
		<input type="hidden" name="writer" value="${sessionScope.memId }">
		<input type="hidden" name="id" value="${id}">
			<table class="table">
				<tr>
					<td>신고자</td>
					<td>${sessionScope.memId}</td>
				</tr>
				<tr>
					<td>신고할 아이디</td>
					<td>${id}</td>
				</tr>
				<tr align="center">
					<td colspan="2">
						<input type="radio" name="sel" value="0"> 욕설 &nbsp;
						<input type="radio" name="sel" value="1"> 음란물 &nbsp;
						<input type="radio" name="sel" value="2"> 노쇼 &nbsp;<br>
						<input type="radio" name="sel" value="3"> 홍보 및 스팸 &nbsp; 
						<input type="radio" name="sel" value="4"> 사생활침해 &nbsp;
						<input type="radio" name="sel" value="5"> 기타 &nbsp;
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<textarea name="detail" rows="10%" cols="55%"></textarea>
					</td>
				</tr>
				<tr align="center">
					<td colspan="2">
						<input type="submit" value="제출" class="btn btn-sm btn-primary">
						<input type="button" class="btn btn-primary btn-sm" onclick="popupClose()" value="취소">
					</td>
				</tr>
			</table>
		</form>
	</div>
</div>
</body>
</html>