<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
<div class="card border-primary mb-3" style="max-width: 100rem;">
	<div class="card-header">신고접수</div>
		<div class="card-body">
		<h4 class="card-title" align="center"><b>완료</b></h4>
		<table>
			<tr>
				<td>신고가 접수 되었습니다.<br />
				<input type="button" value="닫기" onclick="popupClose()" /> </td>
			</tr>
		</table>
	</div>
</div>
</body>
</html>