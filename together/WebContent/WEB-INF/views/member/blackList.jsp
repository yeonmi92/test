<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>차단 리스트</title>
</head>
<script>
	$(document).ready(function(){
		
		$('#unblock').click(function(){
			block_id = $(this).val();
			result = confirm('차단 해제하시겠습니까?');
			if(result){
				$.ajax({
					type: 'post',
					url: '/together/member/unblock.git',
					data: {"block_id" : block_id},
					success: function(){
						alert("해제 완료");
						location.reload();
					}
				});
			}
		});
		
	});
</script>
<body>
	<section class="blog-post-area section-margin">
		<div class="container">
			<h2 align="center">블랙 리스트</h2>
			<div class="row">
				<table class="table">
					<c:if test="${count > 0 }">
						<c:forEach var="black" items="${blackList}">
							<tr>
								<td> <a onclick="infoView('${black.black_id}')" href="#">${black.black_id}</a></td>
								<td>
									<button id="unblock" value="${black.black_id}" class="btn btn-primary btn-sm">해제</button>
								</td>
							</tr>
						</c:forEach>
					</c:if>
					<c:if test="${count eq 0 }">
						<tr align="center">
							<td>차단한 사용자가 없습니다.</td>
						</tr>
					</c:if>
				</table>
				
				
			</div>
		</div>
	</section>
			<br><br><br><br><br><br><br><br><br><br><br><br>
</body>
</html>