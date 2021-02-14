<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Together</title>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script>
	function check(){
		var inputs = document.searchForm;
		if(!inputs.keyword.value){
			alert("검색어를 입력해주세요.");
			return false;
		}
	}
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
            <c:if test="${count==0}">
            	<table class="table table-striped">
            		<tr align="center">
            			<td>회원이 없습니다.</td>
            		</tr>
            	</table>
            </c:if>
            
            <c:if test="${count>0}">
             
      		<table class="table table-striped">
      			<tr>
      				<td>No</td>
      				<td>아이디</td>
      				<td>이름</td>
      				<td>성별</td>
      				<td>나이</td>
      				<td>이메일</td>
      				<td>전화번호</td>
      				<td>누적 경고수</td>
      				<td>가입 날짜</td>
      				<td>상태</td>
      			</tr>
      			<c:forEach var="member" items="${memberList}">
	      			<tr>
	      			<!-- 반복문 돌리기 -->
	      				<td>${number}
	      					<c:set var="number" value="${number-1}"/>
	      				</td>
	      				<td><a onclick="infoView('${member.id}')">${member.id}</a></td>
	      				<td>${member.name}</td>
	      				<td>${member.gender}</td>
	      				<td>${member.birth}</td>
	      				<td>${member.email}</td>
	      				<td>${member.tel}</td>
	      				<td>${member.warning}</td>
	      				<td><fmt:formatDate pattern="yyyy-MM-dd" value="${member.reg}"/></td>
	      				<td>
	      					<c:if test="${member.status==0}">추방</c:if>
	      					<c:if test="${member.status==1}">활동</c:if>
	      					<c:if test="${member.status==2}">탈퇴</c:if>
	      				</td>
	      			</tr>
      			</c:forEach>
      			
      		</table>
      		
      		<hr/>
      		
      		<br/>
      		<div style="margin-left:50%">
	      		<c:if test="${count>0 }">
					<fmt:parseNumber var="res" value="${count / pageSize}" integerOnly="true"/>
					<c:set var="pageCount" value="${res + (count % pageSize == 0 ? 0 : 1)}"/>
					<c:set var="pageBlock" value="10"/>
					<fmt:parseNumber var="result" value="${(currPage-1)/pageBlock}" integerOnly="true"/>
					<fmt:parseNumber var="startPage" value="${result*pageBlock + 1}"/>
					<fmt:parseNumber var="endPage" value="${startPage+pageBlock-1}"/>
					<c:if test="${endPage>pageCount}">
						<c:set var="endPage" value="${pageCount}"/>
					</c:if>
	                <ul class="pagination">
						<c:if test="${startPage>pageBlock}">
		                  <li class="page-item disabled">
		                    <a class="page-link" href="/together/admin/memberList.git?pageNum=${startPage + pageBlock}">&laquo;</a>
		                  </li>
		                </c:if>
		                
		            	<c:forEach var="i" begin="${startPage}" end="${endPage}" step="1">
		                  	<li class="page-item active">
		                    	<a class="page-link pageNums" href="/together/admin/memberList.git?pageNum=${pageNum}&search=${search}&keyword=${keyword}">${i}</a>
		                  	</li>
						</c:forEach>
	                  <c:if test="${endPage<pageCount}">
		            	<li class="page-item">
		             		<a class="page-link" href="/together/admin/memberList.git?pageNum=${startPage + pageBlock}">&raquo;</a>
		             	</li>
	                  </c:if>
	                </ul>
                </c:if>
              </div>
             </c:if>
             
             <br/><br/><br/>
      			<form class="form-inline my-2 my-lg-0" action="/together/admin/memberList.git" method="post" style="margin-left: 35%" name="searchForm" onsubmit="return check()">
      					<div class="form-group">
	      		    	<select name="search" id="search" class="custom-select">
	      		    		<option value="all" <c:if test="${search eq 'all'}">selected</c:if>>전체</option>
	      		    		<option value="name" <c:if test="${search eq 'name'}">selected</c:if>>이름</option>
	      		    		<option value="id" <c:if test="${search eq 'id'}">selected</c:if>>아이디</option>
	      		    		<option value="email" <c:if test="${search eq 'email'}">selected</c:if>>이메일</option>
	      		    		<option value="tel" <c:if test="${search eq 'tel'}">selected</c:if>>전화번호</option>
	      		    	</select>
	      		    	</div>
      		     	<input type="text" name="keyword" id="keyword" class="form-control mr-sm-2" />
      		     	<input type="submit" value="검색" id="searchBtn" class="btn btn-primary my-2 my-sm-0" />
      			</form>
		</div>
   	</div>
	</section>
</body>
</html>