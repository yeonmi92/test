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
	//유효성 검사 (javascript영역)
	function check(){
		var inputs = document.inputForm;
		if(!inputs.tel.value){	// false일때 값이 없을때
			alert("전화번호를 입력하세요");
			return false;
		}
		if(!inputs.pw.value){	// false일때 값이 없을때
			alert("비밀번호를 입력하세요");
			return false;
		}
		if(!inputs.pwCh.value){	// false일때 값이 없을때
			alert("비밀번호 확인란을 입력하세요");
			return false;
		}
		if(inputs.pw.value != inputs.pwCh.value){
			alert("비밀번호를 동일하게 작성하세요");
			return false;
		}
	}
	function count_ck(obj){
	
		var chkbox = document.getElementsByName("hobby");
		var chkCnt = 0;
		for(var i=0;i<chkbox.length; i++){
			if(chkbox[i].checked){
				chkCnt++;
			}
		}
	
		if(chkCnt>3){
			alert("최대 3개 선택 할 수 있습니다.");
			obj.checked = false;
			return false;
		}
	}
</script>

<body>
<section class="blog-post-area section-margin">
	<div align="center" >
		<form action="/together/member/modifyPro.git" method="post" enctype="multipart/form-data" name="inputForm" onsubmit="return check()">
		<table border="0">
			<tr>
				<td rowspan="11"><img src="/together/save/${dto.img}" height="230" width="230"><br/><br/><input type="file" name="file" id="bfile" class="btn btn-warning btn-sm" style="margin-right:30px;"></td>
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
				<td><input type="password" name="pw" class="form-control" value="${dto.pw}" /></td>
			</tr>
			<tr>
				<td><b>비밀번호 확인</b></td>
				<td><input type="password" name="pwCh" class="form-control" value="${dto.pw}" /></td>
			</tr>
			<tr>
				<td><b>전화번호</b></td>
				<td><input type="text" name="tel" class="form-control" value="${dto.tel}" /></td>
			</tr>
			<tr>
				<td><b>성별</b></td>
				<td>
					<c:choose>
						<c:when test="${dto.gender eq 'female'}">성별 : 여성</c:when>
						<c:when test="${dto.gender eq 'male'}">성별 : 남성</c:when>
					</c:choose>
				</td>
			</tr>
			<tr>
				<td><b>나이</b></td>
				<td>${dto.birth}</td>
			</tr>
			<tr>
		        <td><b>관심분야</b></td>
		        <td>
		            <input id="sports" type="checkbox" name="hobby" onClick="count_ck(this);" value="운동" <c:if test="${dto.hobby1 eq '운동' or dto.hobby2 eq '운동' or dto.hobby3 eq '운동'  }">checked</c:if> >          
		            <label for="sports">운동</label>
		            
		            <input type="checkbox" id="cooking" name="hobby" onClick="count_ck(this);" value="맛집"<c:if test="${dto.hobby1 eq '맛집' or dto.hobby2 eq '맛집' or dto.hobby3 eq '맛집'  }">checked</c:if>>
		            <label for="cooking">맛집</label>
		            
		            <input type="checkbox" id="music" name="hobby" onClick="count_ck(this);" value="음악" <c:if test="${dto.hobby1 eq '음악' or dto.hobby2 eq '음악' or dto.hobby3 eq '음악'  }">checked</c:if>>
		            <label for="music">음악</label>
		            
		            <input type="checkbox" id="shopping" name="hobby" onClick="count_ck(this);" value="쇼핑" <c:if test="${dto.hobby1 eq '쇼핑' or dto.hobby2 eq '쇼핑' or dto.hobby3 eq '쇼핑'  }">checked</c:if>>
		            <label for="shopping">쇼핑</label>
		            
		            <input type="checkbox" id="reading" name="hobby" onClick="count_ck(this);" value="독서" <c:if test="${dto.hobby1 eq '독서' or dto.hobby2 eq '독서' or dto.hobby3 eq '독서'  }">checked</c:if>>
		            <label for="game">독서</label>
		            
		            <input type="checkbox" id="etc" name="hobby" onClick="count_ck(this);" value="기타" <c:if test="${dto.hobby1 eq '기타' or dto.hobby2 eq '기타' or dto.hobby3 eq '기타'  }">checked</c:if>>
		            <label for="etc">기타</label>
		        </td>
						            
		    </tr>
		    <tr>
		    	<td colspan="2" align="right">
					<input type="submit" class="btn btn-primary my-2 my-sm-0" value="수정">
					<input type="button" class="btn btn-primary my-2 my-sm-0" onclick="window.location='/together/member/myInfoView.git'" value="취소">
				</td>
			</tr>
		</table>
		</form>
	</div>
	<br/><br/><br/>
</section>
</body>
</html>