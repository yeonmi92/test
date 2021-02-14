<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>참여이력목록</title>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.6.2/jquery.min.js"></script>
<style type="text/css">  

 table {width:50%; border:1px solid #fff; text-align:center}  

 .hide {display:none;}  

 .show {display:table-row;}  

 .item td {cursor:pointer; background:#fff}  

</style>  

<script type="text/javascript">

$(document).ready(function(){
	$("#goodReviewBtn").click(function(){
		val = '1';
		reviewId = $("#reviewId").val();
		review = $("#review").val();
		console.log(val);
		console.log(reviewId);
		console.log(review);
		$.ajax({
			type : "post",
			url : "/together/member/review.git",
			data : {"reviewId" : reviewId, "review" : review, "val" : val},
			success : function(result){
				alert("작성되었습니다");
				$("#review").val("");
			}
		});
		
	});
	$("#badReviewBtn").click(function(){
		val = '0';
		reviewId = $("#reviewId").val();
		review = $("#review").val();
		console.log(val);
		console.log(reviewId);
		console.log(review);
		$.ajax({
			type : "post",
			url : "/together/member/review.git",
			data : {"reviewId" : reviewId, "review" : review, "val" : val},
			success : function(result) { // 결과 성공 콜백함수
		    	alert("작성되었습니다.");
				$("#review").val("");
		    }
		});
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
</style>
</head>
<body>
<section class="blog-post-area section-margin">
	<div class="container">
	<h1 align="center">참여이력</h1><br/>
	<c:if test="${count == 0 }">
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
		<c:forEach var="history" items="${historyList}" varStatus="status">
          <tr class="item">  
              <td><a onclick="infoView('${history.ID}')" href="#">${history.ID}</a></td>  
              <td>${history.TITLE}</td>  
              <td>${history.ADDR}</td>  
              <td><fmt:formatDate pattern="yyyy-MM-dd" value="${history.START_DATE}"/> ~
					<fmt:formatDate pattern="yyyy-MM-dd" value="${history.END_DATE}"/> </td>  
              <td>${history.TIMES}</td>  
          </tr>  
          <tr class="hide">  
              <td colspan="5">  
              <c:if test="${pplJoin[status.index] ne '0'}">
				<c:forEach var="ppl" items="${pplJoin[status.index]}" >
					<c:if test="${sessionScope.memId ne ppl.id }">
						<div class="img_wapper">
							<img class="img" src="/together/save/${ppl.img}" height="100" width="100" />
							<c:if test="${history.ID eq ppl.id }">
							<a href="/together/member/infoView.git?id=${ppl.id}">주최자 ${ppl.id} <input type="radio" name="commentPPL" id="reviewId" value="${ppl.id }"></a>
							</c:if>
							<c:if test="${history.ID ne ppl.id }"><br/>
							<a href="/together/member/infoView.git?id=${ppl.id}">${ppl.id}</a>
							</c:if>   
						</div>
					</c:if>
				</c:forEach>
				<input type="text" name="comments" id="review" class="form-control mr-sm-2"><br />
				<input type="button" id="goodReviewBtn" class="btn btn-primary my-2 my-sm-0" value="추천" >
				<input type="button" id="badReviewBtn" class="btn btn-primary my-2 my-sm-0" value="비추천">
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
			<a href="/together/member/historyList.git?pageNum=${startPage-pageBlock}"> &lt; </a>
		</c:if>
		<c:forEach var="i" begin="${startPage}" end="${endPage}" step="1">
			<a href="/together/member/historyList.git?pageNum=${i}" class="pageNums"> &nbsp; ${i} </a>
		</c:forEach>
		<c:if test="${endPage < pageCount}">
			<a href="/together/member/historyList.git?pageNum=${startPage+pageBlock}"> &gt; </a>
		</c:if>
	</c:if>
	</div><br />
	<%-- 검색 기능 --%>
	<form class="form-inline my-2 my-lg-0" action="/together/member/historyList.git" style="margin-left:35%;">
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
	</script>  
</body>
</html>