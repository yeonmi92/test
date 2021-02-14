<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<!-- SmartEditor2 라이브러리 -->
	<script type="text/javascript" src="/together/resources/se2/js/service/HuskyEZCreator.js" charset="urf-8"></script>
	<script type="text/javascript" src="//cdnjs.cloudflare.com/ajax/libs/jquery/1.9.0/jquery.js"></script>
	<link rel="stylesheet" href="/together/resources/css/bootstrap.css" media="screen">
    <link rel="stylesheet" href="/together/resources/css/bootstrap.min.css">
    
	<script type="text/javascript">	
	var oEditors = [];
	$(function(){
		nhn.husky.EZCreator.createInIFrame({
		 oAppRef: oEditors,
		 elPlaceHolder: "detail",
		 sSkinURI: "/together/resources/se2/SmartEditor2Skin.html",
		 htParams:{
			 bUseToolbar:true,
			 bUseVerticalResizer:true,
			 bUseModeChanger:true,
			 iOnBeforeUnload:function(){			 
			 }
		 },
		 fOnAppLoad:function(){
			 oEditors.getById["detail"].exec("PASTE_HTML",[""]);
		 },
		 fCreator: "createSEditor2"
		});	
		// 전송 버튼 클릭 이벤트
		$("#save").click(function(){
			// textarea id값
			oEditors.getById["detail"].exec("UPDATE_CONTENTS_FIELD",[]);		
			// form submit
			$("#frm").submit();		
		});
	});
</script>	
</head>
<body><br />
<!-- 비로그인(접근불가) -->
<c:if test="${memId == null}"> 
	<script>
		alert("로그인 후 접근가능합니다.");
		window.location="/together/member/login.git";
	</script>
</c:if>
<!-- 로그인 -->
<c:if test="${memId != null}">
	<section class="blog-post-area section-margin">
	 	<div class="container">
			<div class="row">
				<form action="/together/csboard/insertcspro.git" method="post" id="frm">
					<input type="hidden" name="cs_num" value="${csboardDTO.cs_num}" />	
					<input type="hidden" name="id" value="${sessionScope.memId}" />	
					<table align="center" class="table table-striped">
						<tr>
							<td>제목</td>
							<td>
								<input type="text" name="subject" size="67"/>
							</td>
						</tr>
						<tr>
							<td>분류</td>
							<td>
								<label for="0">Q&A</label><input type="radio" name="sel" value="0" checked="checked">
								<c:if test="${memId eq 'admin'}">
									<label for="1">F&Q</label><input type="radio" name="sel" value="1">								
								</c:if>
							</td>
						</tr>
						<tr>
							<td>작성자</td>
							<td>${memId}</td>
						</tr>
						<tr>
							<td>내용</td>
							<td width="800"><textarea rows="20" cols="70" name="content" id="detail"></textarea></td>
						</tr>
						<tr>
							<td colspan="2" align="center">
								<input type="submit" id="save" class="btn btn-primary my-2 my-sm-0" value="등록" />
								<input type="button" class="btn btn-primary my-2 my-sm-0" value="취소" onclick="window.location='/together/csboard/cslist.git'" />
							</td>
						</tr>
					</table>
				</form>
			</div>
		</div>
	</section>
</c:if>
</body>
</html>