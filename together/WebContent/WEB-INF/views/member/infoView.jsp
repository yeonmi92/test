<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<title>Insert title here</title>
<script src="//code.jquery.com/jquery-3.3.1.min.js"></script> 
<style>
	table .info{
		width: 200px;
	}	
</style>
</head>
<script >
	function reportForm(){
		var val= $("#id").val();
		var url = "/together/report/reportPopup.git?id=" + val;
		open(url, "confirmId", "toolbar=no, location=no, status=no, menubar=no, scrollbar=no, resizable=no, width=600, height=600");
	}
	function setId(){
		//opener는 현재 내 창을 open해준 창을 말함.
		opener.document.inputForm.id.value="${trialId}";
		self.close(); //창닫기
	}
	
	$(document).ready(function(){
		
		$("#black").click(function(){
			id = $(this).val();
			result = confirm(id + '님을 차단하시겠습니까?');
			if(result){
				$.ajax({
					type: "post",
					url: "/together/member/deleteMember.git",
					data: {"id": id},
					success: function(){
						alert("차단완료");
						window.close();
					}
				});
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
 	<link rel="stylesheet" href="/together/resources/css/bootstrap.css" media="screen">
    <link rel="stylesheet" href="/together/resources/css/bootstrap.min.css">
<body>
<div class="card border-primary mb-3" style="max-width: 100rem;">
<div class="card-header">정보 보기</div>
<div class="card-body">
<h4 class="card-title" align="center"><b>${dto.id}님의 정보</b></h4>
	<table class="table info">
		<tr>
			<td colspan="2" align="center"><img src="/together/save/${dto.img}" height="200" width="200"></td>
		</tr>
		<tr>
			<td><b>아이디</b></td>
			<td>
				<c:choose>
					<c:when test="${dto.grade == 1}">&#127761; ${dto.id}</c:when>
					<c:when test="${dto.grade == 2}">&#127762; ${dto.id}</c:when>
					<c:when test="${dto.grade == 3}">&#127763; ${dto.id}</c:when>
					<c:when test="${dto.grade == 4}">&#127764; ${dto.id}</c:when>
					<c:when test="${dto.grade == 5}">&#127765; ${dto.id}</c:when>
				</c:choose>
			</td>
		</tr>
		<tr>
			<td><b>이름</b></td>
			<td>${dto.name} </td>
		</tr>
		<tr>
			<td><b>성별</b></td>
			<c:if test="${dto.gender eq 'female'}">
				<td>여성 </td>
			</c:if>
			<c:if test="${dto.gender eq 'male'}">
				<td>남성  </td>
			</c:if>
		</tr>
		<tr>
			<td><b>나이</b></td>
			<td>${dto.birth }  </td>
		</tr>
		<tr>
			<td><b>관심분야</b></td>
			<td>
				<c:if test="${dto.hobby1!=null}">${dto.hobby1}</c:if>
				<c:if test="${dto.hobby2!=null}">, ${dto.hobby2}</c:if>
				<c:if test="${dto.hobby3!=null}">, ${dto.hobby3}</c:if>
			</td>
		</tr>
		<c:if test="${sessionScope.memId != 'admin'}">
		<tr>
			<td align="center" colspan="2">
				<button onclick="reportForm()" id="id" value="${dto.id }" class="btn btn-primary btn-sm">신고</button>
				<button id="black" value="${dto.id}" class="btn btn-primary btn-sm">차단</button>
			</td>
		</tr>
		</c:if>
	</table>
<br/><br />
<div align="center" style="width:530px; height:200px; overflow:auto">
	<h4 align="center"><b>한줄 후기 평</b></h4>
	<table class="table">
		<c:if test="${count > 0}">
			<tr>
				<td align="center"><b>아이디</b></td>
				<td align="center"><b>내용</b></td>
				<td align="center"><b>추천/비추천</b></td>
			</tr>
			<c:forEach var="review" items="${reviewList}">
				<tr>
					<td align="center">${review.WRITER}</td>
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
			<tr ><td align="center">리뷰가 없습니다.</td></tr>
		</c:if>
	</table>
</div>
<br />
<br />

</div>
</div>
</body>
</html>