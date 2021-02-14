<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
	<script>
	
		$(document).ready(function(){
			$("#replyBtn").click(function(){
				replyText = $("#replyTxt").val();
				board_num = $("#board_num").val();
				if(!replyText){
					alert("댓글란을 채워주세요.");
				}else if(replyText){
					$.ajax({
						type : "post",
						url : "/together/board/reply.git",	// db에 글 추가
						data : {"replyText" : replyText, "board_num" : board_num},
						success : function(data){
							location.reload();
						}
					});
				}
			});
			
			$("#delete").click(function(){
				board_num = $(this).prev().val();
				var result = confirm("삭제하시겠습니까?");
				
				if(result){
					
				}else{
					
				}
			});
		});
		function infoView(id){
			url = "/together/member/infoView.git?id=" + id;
			window.open(url, '회원 정보 보기', 'width=600px,height=600px, scrollbars=no, resizable=no, toolbar=no, status=no, location=no');
	      
	      }
		
		
		
	</script>
</head>
<body>
	<section class="blog-post-area section-margin">
		<div class="container">
			<div class="row">
				<table class="table table-striped" align="center">
					<tr>
						<td>제목</td>
						<td colspan="3">${article.title }</td>
					</tr>
					<tr>
						<td>작성자</td>
						<td colspan="3"><a onclick="infoView('${article.id}')" href="#">${article.id}</a></td>
					</tr>
					<tr>
						<td>분류</td>
						<td>
							<c:if test="${article.sel==0}">일반</c:if>
				      		<c:if test="${article.sel==1}">후기</c:if>
				      	</td>
				      	<td>작성 날짜</td>
				      	<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${article.reg}"/></td>
					</tr>
					<tr>
						<td colspan="4">${article.detail }</td>
					</tr>
					<tr align="right">
							<td colspan="4">
								<a href="/together/board/indexBoard.git?pageNum=${pageNum}"><button type="button" class="btn btn-primary">목록으로</button></a>
								<c:if test="${id==article.id || sessionScope.memId=='admin'}">
									<a href="/together/board/modifyForm.git?board_num=${article.board_num}&pageNum=${pageNum}"><button type="button" class="btn btn-primary">수정</button></a>
									<a href="/together/board/delete.git?board_num=${article.board_num}"><button type="button" id="delete" class="btn btn-primary">삭제</button></a>
								</c:if>
							</td>
					</tr>
					<tr>
						<td>${id}</td>
						<td colspan="2">
							<textarea rows="5" cols="110" style="height: 59px; margin-left: 50px;" name="detail" id="replyTxt"></textarea>
							<input type="hidden" value="${article.board_num }" id="board_num"/>
						</td>
						<td align="right"><input type="button" value="댓글 달기" class="btn btn-primary" id="replyBtn" style="margin-botton: 100px"/></td>
					</tr>
					<c:forEach var="replies" items="${replies}">
						<tr>
							<td><a onclick="infoView('${replies.id}')" href="#">${replies.id}</a></td>
							<td colspan="2">
								${replies.detail} 
							</td>
							<td>
								<fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${replies.reg}"/><br/>
								<input type="hidden" name="num" value="${replies.board_num}"/>
								<button class="btn btn-primary btn-sm">삭제 </button> 
								<button class="btn btn-primary btn-sm"> 수정</button>
							</td>
						</tr>
					</c:forEach>
				</table>
			</div>
		</div>
	</section>
</body>
</html>