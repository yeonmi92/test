<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- SmartEditor2 라이브러리 -->
<script type="text/javascript" src="/together/resources/se2/js/service/HuskyEZCreator.js" charset="urf-8"></script>
<script type="text/javascript" src="//cdnjs.cloudflare.com/ajax/libs/jquery/1.9.0/jquery.js"></script>

<script type="text/javascript">

	function check(){
		var inputs = document.insertForm;
		if(!inputs.title.value){
			alert("제목을 입력해주세요.");
			return false;
		}
		if(!inputs.detail.value){
			alert("내용을 입력해주세요.")
			return false;
		}
		if(!inputs.sel.value){
			alert("분류를 선택하세요.")
			return false;
		}
	}


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
<body>
	<section class="blog-post-area section-margin">
	 	<div class="container">
			<div class="row">
				<form action="/together/board/insertPro.git" id="frm" method="post" name="insertForm" onsubmit="return check()">
					<input type="hidden" name="id" value="${id}"/>
					<table align="center" class="table table-striped">
						<tr>
							<td>제목</td>
							<td><input type="text" name="title"/></td>
						</tr> 
						<tr>
							<td>작성자</td>
							<td>${id}</td>
						</tr>
						<tr>
							<td>분류</td>
							<td>
								<label for="0">일반</label><input type="radio" name="sel" value="0">
								<label for="1">후기</label><input type="radio" name="sel" value="1">
								<c:if test="${id=='admin'}">
									<label for="2">공지사항</label><input type="radio" name="sel" value="2">
								</c:if>
							</td>
						</tr>
						<tr>
							<td>내용</td>
							<td width="1000">
								<textarea name="detail" id="detail" rows="40" cols="40" required=""></textarea>
							</td>
						</tr>
						<tr  align="center">
							<td colspan="2">
								<input type="submit" value="등록" id="save"  class="btn btn-primary" />
								<!-- pageNum, sel 가지고 와서 돌아가야 원래 보던 페이지로 돌아감. -->
								<input type="button" class="btn btn-primary" value="취소" onclick="window.location='/together/board/indexBoard.git'"/>
							</td>
						</tr>
					</table>
				</form>
			</div>
		</div>
	</section>
</body>
</html>


