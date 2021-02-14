<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내 신고내역</title>
</head>
<body>
<section class="blog-post-area section-margin">
	<div class="container">
	<table class="table table-hover">
		<tr>
			<td>No.</td>
			<td>신고대상아이디</td>
			<td>신고분류</td>
			<td>신고사유</td>
			<td>신고날짜</td>
			<td>처리상태</td>
		</tr>
		<c:forEach var="myReport" items="${myReportList}">
			<tr>
				<td>${number}
					<c:set var="number" value="${number-1 }"/></td>
				<td>${myReport.ID}</td>
				<td>${myReport.SEL} </td>
				<td>${myReport.DETAIL}</td>
				<td>${myReport.REG}</td>
				<td>${myReport.STATUS}</td>
			</tr>
		</c:forEach>
	
	</table>
</div>
</section>
<div align="center">
	<c:if test="${count > 0}">
		<fmt:parseNumber var="res" value="${count/pageSize }" integerOnly="true"/>
		<c:set var="pageCount" value="${res + (count % pageSize == 0? 0:1)}"/>
		<c:set var="pageBlock" value="10"/>
		<fmt:parseNumber var="result" value="${((currPage-1)/pageBlock)}" integerOnly="true"/>
		<fmt:parseNumber var="startPage" value="${result * pageBlock + 1 }"/>
		<fmt:parseNumber var="endPage" value="${startPage + pageBlock -1}"/>
		<c:if test="${endPage > pageCount }">
			<c:set var="endPage" value="${pageCount}"/>
		</c:if>
		
		<c:if test="${startPage > pageBlock}">
			<a href="/together/member/choiceList.git?pageNum=${startPage-pageBlock}"> &lt; </a>
		</c:if>
		 
		<c:forEach var="i" begin="${startPage}" end="${endPage}" step="1">
			<a href="/together/member/choiceList.git?pageNum=${i}" class="pageNums"> &nbsp; ${i} </a>
		</c:forEach>

		<c:if test="${endPage < pageCount}">
			<a href="/together/member/choiceList.git?pageNum=${startPage+pageBlock}"> &gt; </a>
		</c:if>
	</c:if>
	</div>
</body>
</html>