<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>찜 목록 페이지</title>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.6.2/jquery.min.js"></script>
<script type="text/javascript">
	$(function(){  
	    var article = (".recruit .show");  
	    $(".recruit .item  td").click(function() {  
	        var myArticle =$(this).parents().next("tr");  
	        if($(myArticle).hasClass('hide')) {  
	            $(article).removeClass('show').addClass('hide');  
	            $(myArticle).removeClass('hide').addClass('show');  
	        }  
	        else {  
	            $(myArticle).addClass('hide').removeClass('show');  
	        }  
	    });  
	});  
	 function infoView(id){
			url = "/together/member/infoView.git?id=" + id;
			window.open(url, '회원 정보 보기', 'width=600px,height=600px, scrollbars=no, resizable=no, toolbar=no, status=no, location=no');
	      
	      }
</script>
<style type="text/css">
.img_wapper {width:100px;height:150px; float:left; margin-right:10px;}
.img {width:100%;}

 table {width:50%; border:1px solid #fff; text-align:center}  

 .hide {display:none;}  

 .show {display:table-row;}  

 .item td {cursor:pointer; background:#fff}  


</style>
</head>
<body>
<section class="blog-post-area section-margin">
	<div class="container">
		<h1 align="center">찜페이지</h1><br/>
		<c:if test="${count == 0}">
			<table cellspacing="0" border="1" class="table table-hover recruit">  
		      <caption></caption>  
		      <colgroup>  
		          <col width="10%">  
		          <col width="20%">  
		          <col width="30%">  
		          <col width="20%">  
		          <col width="10%">  
		      </colgroup>  
		      <thead>  
		          <tr class="">  
		              <th scope="col">주최자</th>  
		              <th scope="col">제목</th>  
		              <th scope="col">장소</th>  
		              <th scope="col">날짜</th>  
		              <th scope="col">시간</th>  
		          </tr>  
		      </thead>  
		      <tbody>  
		          <tr class="item">  
		              <td colspan="5">게시글이 없습니다.</td>  
		          </tr>  
		      </tbody>  
		  </table>
		</c:if>
		<c:if test="${count > 0 }">
			<table cellspacing="0" border="1" class="table table-hover recruit">  
			      <caption></caption>  
			      <colgroup>  
			          <col width="10%">  
			          <col width="20%">  
			          <col width="40%">  
			          <col width="20%">  
			          <col width="10%">  
			      </colgroup>  
			      <thead>  
			          <tr class="">  
			              <th scope="col">주최자</th>  
			              <th scope="col">제목</th>  
			              <th scope="col">장소</th>  
			              <th scope="col">날짜</th>  
			              <th scope="col">시간</th>  
			          </tr>  
			      </thead>  
		      <tbody>  
		   <c:forEach var="choice" items="${choiceList}" varStatus="status">
		   	<tr class="item">  
		         <td><a onclick="infoView('${choice.ID}')" href="#">${choice.ID}</a></td>  
		         <td><a href="/together/mapboard/detailMap.git?map_num=${choice.MAP_NUM}">${choice.TITLE}</a></td>  
		         <td>${choice.ADDR}</td>  
		         <td><fmt:formatDate pattern="yyyy-MM-dd" value="${choice.START_DATE}"/> ~
						<fmt:formatDate pattern="yyyy-MM-dd" value="${choice.END_DATE}"/> </td>  
		         <td>${choice.TIMES}</td>  
		     </tr>
		     <tr class="hide">  
		         <td colspan="5">  
		         	<c:if test="${pplJoin[status.index] ne '0'}">
					<c:forEach var="ppl" items="${pplJoin[status.index]}" >
					<div class="img_wapper">
						<img class="img" src="/together/save/${ppl.img}" height="100" width="100" />
						<c:if test="${choice.ID eq ppl.id }">
							<a onclick="infoView('${ppl.id}')" href="#"> 주최자 ${ppl.id} </a>
						</c:if>
						<c:if test="${choice.ID ne ppl.id }">
							<a onclick="infoView('${ppl.id}')" href="#">${ppl.id} </a>
						</c:if>
					</div>
					</c:forEach>
					</c:if>
		        </td>  
		      </tr>  
			 </c:forEach>
		    </tbody>
		  </table>		
		</c:if>
		
	<div align="center">
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
			</div><br />
			<%-- 검색 기능 --%>
			<form class="form-inline my-2 my-lg-0" action="/together/member/choiceList.git" style="margin-left:35%;">
				<div class="form-group">
				<select name="sel" class="custom-select">
					<option value="id" selected>주최자</option>
					<option value="title">제목</option>
				</select>
				</div>
				<input type="text" name="search" class="form-control mr-sm-2" />
				<input type="submit" value="검색" class="btn btn-primary my-2 my-sm-0" />
			</form>
			</div>
	</div><!-- container --> 
	</section>
</body>
</html>