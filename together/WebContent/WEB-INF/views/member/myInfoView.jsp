<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link rel="stylesheet" href="/together/resources/css/bootstrap.css" media="screen">
    <link rel="stylesheet" href="/together/resources/css/bootstrap.min.css">
</head>
<script >
	function pwConfirm(){
		var val= $("#btn").val();
		console.log(val);
		
		var url = "pwConfirm.git?btn=" + val;
		console.log(url);
		open(url, "confirmId", "toolbar=no, location=no, status=no, menubar=no, scrollbar=no, resizable=no, width=300, height=250");
	}
</script>
<body>
<section class="blog-post-area section-margin">
	<div align="center">
		<table width="500px" border="0" cellspacing="0">
			<tr>
				<td rowspan="6"><img src="/together/save/${dto.img}" height="230" width="230"></td>
				<td><b>아이디</b></td>
				<td>
					<c:choose>
						<c:when test="${dto.grade == 1}">&#127761; ${dto.id}</c:when>
						<c:when test="${dto.grade == 2}">&#127762; ${dto.id}</c:when>
						<c:when test="${dto.grade == 3}">&#127763; ${dto.id}</c:when>
						<c:when test="${dto.grade == 4}">&#127764; ${dto.id}</c:when>
						<c:when test="${dto.grade == 5}">&#127765; ${dto.id}</c:when>
					</c:choose>
				<td>
			</tr>
			<tr>
				<td><b>이름</b></td>
				<td>${dto.name}<td>
			</tr>			
			<tr>
				<td><b>성별</b></td>
				<td>
					<c:choose>
						<c:when test="${dto.gender eq 'female'}">여성</c:when>
						<c:when test="${dto.gender eq 'male'}">남성</c:when>
					</c:choose>
				</td>
			</tr>
			<tr>
				<td><b>나이</b></td>
				<td>${dto.birth}</td>
				
			</tr>
			<tr>
				<td><b>관심분야</b></td>
				<td>${dto.hobby1}, ${dto.hobby2},${dto.hobby3}</td>
			</tr>
			<tr>
				<td colspan="2" align="right">
					<button onclick="pwConfirm()" class="btn btn-primary btn-sm" id="btn" value="1">수정</button>
					<button onclick="pwConfirm()" class="btn btn-primary btn-sm" id="btn" value="2">탈퇴</button>
				</td>
			</tr>
		</table>
		<br /><br />
		</div>
		<br/>
	<div align="center">
		<div align="center" style="width:530px; height:200px; overflow:auto">
			<table class="table table-striped" width="500px" border="0" cellspacing="0" >
				<tr align="center"><td colspan="3"><b>한줄 후기 평</b></td></tr>
				<c:if test="${count > 0}">
				<tr align="center">
					<td align="center"><b>아이디</b></td>
					<td align="center"><b>내용</b></td>
					<td align="center"><b>추천/비추천</b></td>
				</tr>
				<c:forEach var="review" items="${reviewList}">
				<tr align="center">
					<td align="center"><a href="/together/member/infoView.git?id=${review.WRITER}">${review.WRITER} </a></td>
					<td align="center">${review.COMMENTS}</td>
					<c:if test="${review.LIKES == 1}">
						<td align="center">추천&#128077;</td>
					</c:if> 
					<c:if test="${review.LIKES == 0}">
						<td align="center">비추천&#128078;</td>
					</c:if> 
				</tr>
				</c:forEach>
				</c:if>
				<c:if test="${count == 0}">
					<tr align="center"><td>리뷰가 없습니다.</td></tr>
				</c:if>
			</table>
		</div>
	</div>
	</section>
	<br /><br />
	
</body>
</html>