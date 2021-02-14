<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<body>
	<div class="card border-primary mb-3" style="max-width: 20rem;">
		<div class="card-header">비밀번호 확인</div>
		<div class="card-body">
			<h4 class="card-title">비밀번호 확인</h4>
			<p class="card-text">
				<form action="pwConfirmPro.git" method="post">
				<input type="hidden" name="btn" value="${btn}">
					<table>
						<tr>
							<td>비밀번호를 입력해주세요.</td>
						</tr>
						<tr>
							<td><input type="password" name="pw" class="form-control"></td>
						</tr>
						<tr>
							<td align="center"><input type="submit" class="btn btn-primary my-2 my-sm-0" value="확인"></td>
						</tr>
					</table>
				</form>
			</p>
		</div>
	</div>
</body>
</html>