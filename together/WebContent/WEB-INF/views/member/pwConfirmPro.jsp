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
	function setPw(){
		var btn = window.opener.document.getElementById("btn").value;
		if(btn == '1'){
		//opener는 현재 내 창을 open해준 창을 말함.
			opener.parent.location='/together/member/modifyForm.git'; 
		}else{
			opener.parent.location='/together/member/deleteMember.git'; 
		}
		self.close(); //창닫기
	}
</script>
<body>
	<div class="card border-primary mb-3" style="max-width: 20rem;">
		<div class="card-header">비밀번호 확인</div>
		<div class="card-body">
			<h4 class="card-title">비밀번호 확인</h4>
			<p class="card-text">
				<c:if test="${check eq 'true'}">
					<table>
						<tr>
							<td>비밀번호 확인이 완료되었습니다.<br />
							<input type="button" value="닫기" class="btn btn-primary my-2 my-sm-0" onclick="setPw()" /> </td>
						</tr>
					</table>
				</c:if>
				<c:if test="${check eq 'false'}">
				<form action="pwConfirmPro.git">
					<table>
						<tr>
							<td>비밀번호가 일치하지 않습니다. 다시 입력해 주세요. </td>
						</tr>
						<tr>
							<td><input type="password" name="pw" class="form-control" /></td>
						</tr>
						<tr>
							<td align="center"><input type="submit" class="btn btn-primary my-2 my-sm-0" value="확인"></td>
						</tr>
					</table>
				</form>
				</c:if>
			</p>
		</div>
	</div>	
</body>
</html>