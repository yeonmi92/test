<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.4/jquery.min.js"></script>
	<link rel="stylesheet" href="/together/resources/css/bootstrap.css" media="screen">
    <link rel="stylesheet" href="/together/resources/css/bootstrap.min.css">
</head>
<script>

	$(document).ready(function(){
		
		$("#num").click(function(){
			num = $(this).val();
			res = 2;
			reason = $("#reason").val();
			if(!reason){
				alert("사유를 작성해주세요.");
			}
			if(reason){
				$.ajax({
					type: "post",
					url: "/together/admin/writeReason.git",
					data: {"num" : num, "res" : res, "reason" : reason},
					success: function(){
						alert("처리 완료");
						opener.parent.location.reload();
						window.close();
					}
				})
			}
		});
	});
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
	<div class="card border-primary mb-3" style="max-width: 100rem;">
		<div class="card-header">신고 관리</div>
			<div class="card-body" align="center">
				<h4 class="card-title" align="center"><b>반려 사유 작성</b></h4>
				<input type="hidden" name="res" value="2"/>
				<textarea name="reason" id="reason" cols="40%" rows="10%"></textarea><br>
				<button name="num" id="num" class="btn btn-primary btn-sm" value="${num}">확인</button>
				
			</div>
		</div>
</body>
</html>