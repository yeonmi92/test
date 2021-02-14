<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>

	<style type="text/css">
    	table {width:500px;}
    	.hide {display:none;}
    	.show {display:table-row;}
    	.item td {cursor:pointer;}
   </style>
   
	<!-- <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.6.2/jquery.min.js"></script> -->
	<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
	<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.4/jquery.min.js"></script>
	<link rel="stylesheet" href="/together/resources/css/bootstrap.css" media="screen">
    <link rel="stylesheet" href="/together/resources/css/bootstrap.min.css">
	
	<script type="text/javascript">
        $(function(){
            var article = (".recruit .show");
            $(".recruit .item td").click(function() {
            	var cs_num = $(this).parent(".item").attr('id');
            	
                var myArticle = $(this).parents().next("tr");                
                if($(myArticle).hasClass('hide')) {
                    $(article).removeClass('show').addClass('hide');
                    $(myArticle).removeClass('hide').addClass('show');
                }
                else {
                	$(myArticle).addClass('hide').removeClass('show');
                }
                
                $.ajax({
    				type : "post",
    				url : "/together/csboard/readcount.git",
    				data : {"cs_num" : cs_num},
    				success : function(data){
    					console.log(data);
    					//$(".cs_num").text("${csboardDTO.readcount}");
    				}
    			});
            });
           
        });
        
        $(document).ready(function(){
        	$(".replyBtn").click(function(){
        		btnIndx = $(this).data("index");
    			cs_num = $(this).prev().attr('id');
    			replyText = $(this).prev().val();
    			$.ajax({
    				type : "post",
    				url : "/together/csboard/reply.git",
    				data : {"replyText" : replyText, "cs_num" : cs_num},
    				success : function(data){
    					console.log(data);
    					var n = ".reply" + btnIndx;
    					$(n).append($("<p>"+replyText+"</p>"));
    					$(this).prev().val("");
    				}
    			});
    		});
        });
        
   	 function infoView(id){
		url = "/together/member/infoView.git?id=" + id;
		window.open(url, '회원 정보 보기', 'width=600px,height=600px, scrollbars=no, resizable=no, toolbar=no, status=no, location=no');
      
      }
	</script>
</head>
<body>
<input type="hidden" value="${sel}" name="sel"/>
<!--================ Start Blog Post Area =================-->
 <section class="blog-post-area section-margin">
 	<div class="container">
		<!-- Q&A/F&Q -->
		<ul class="nav nav-tabs">
			<li class="nav-item">
		    	<a class="nav-link active" href="/together/csboard/cslist.git?sel=0">Q&A</a>
		  	</li>
		  	<li class="nav-item">
		    	<a class="nav-link active" href="/together/csboard/cslist.git?sel=1">F&Q</a>
		  	</li>
  		</ul>
  		<!-- csboard 목록 -->
		<table class="table table-hover recruit" cellspacing="0">
		<thead>
			<tr class="">
     			<th scope="col">No</th>
     			<th scope="col">분류</th>
     			<th scope="col">제목</th>
     			<th scope="col">작성자</th>
     			<th scope="col">작성날짜</th>
     			<th scope="col">조회수</th>
     			<!-- <th scope="col">처리상태</th> -->
     		</tr>
		</thead>
		
		<c:choose>
			<c:when test="${pag.count == null}">
				<button type="button" class="btn btn-primary btn-sm" onclick="window.location='/together/csboard/insertcs.git'" style="float:right;">글쓰기</button>				
			</c:when>
			<c:otherwise>
				<tbody>
					<c:set var="number" value="${pag.number}" />
					<c:forEach var="csboardDTO" items="${pag.csboardList}" varStatus ="status" >
						<tr class="item" id="${csboardDTO.cs_num}">
							<td>${number}
								<c:set var="number" value="${number-1}" />
							</td>					
							<td>
								<c:if test="${csboardDTO.sel==0}">Q&A</c:if>
								<c:if test="${csboardDTO.sel==1}">F&A</c:if>
							</td>
							<td>${csboardDTO.subject}</td>
							<td><a onclick="infoView('${review.WRITER}')" href="#">${csboardDTO.id} </a></td>				
							<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${csboardDTO.reg}"/></td>
							<td class="cs_num">${csboardDTO.readcount}</td>
						</tr>	
						
						<tr class="hide">
							<td colspan="6">
								<c:if test="${csboardDTO.sel==0}">
			   						${csboardDTO.content}
			   						<c:if test="${memId == csboardDTO.id}">
			   							<input type="button" value="수정" class="btn btn-primary btn-sm" style="float:right;" onclick="window.location='/together/csboard/modifycs.git?pageNum=${pageNum}&cs_num=${csboardDTO.cs_num}'" />
			   						</c:if>
			   						<div class="reply${status.index}" >	      							
			   						</div>
			   						<c:if test="${csboardDTO.reply ne '0'}">
				   						<div id="replyRe">
				   							관리자 : ${csboardDTO.reply}
				   						</div>
			   						</c:if>
			   						<c:if test="${memId eq 'admin' && csboardDTO.reply eq '0'}">
				   						<div class="replyPosition">
				    						<input type="text" name="replyTxt" class="form-control mr-sm-2" id="${csboardDTO.cs_num}" />
				    						<input type="button" value="저장" class="replyBtn btn btn-primary btn-sm" data-index="${status.index}"/>				      						
				   						</div>
			   						</c:if>
			   					</c:if>      					
			   					<c:if test="${csboardDTO.sel==1}">
			   						<c:if test="${pag.count == 0}">
			   							게시글이 없습니다.
			   						</c:if>
			   						${csboardDTO.content}
			   						<c:if test="${memId eq 'admin'}">
			   							<input type="button" value="수정" class="btn btn-primary btn-sm" style="float:right;" onclick="window.location='/together/csboard/modifycs.git?pageNum=${pageNum}&cs_num=${csboardDTO.cs_num}'" />
			   						</c:if>
			   					</c:if>
							</td>
						</tr>									
					</c:forEach>
				</tbody>
			</c:otherwise>
		</c:choose>			
		</table>

		<!-- 페이지네이션 -->
        <div align="center">
			<c:if test="${pag.count > 0}">
				<fmt:parseNumber var="res" value="${pag.count / pag.pageSize}" integerOnly="true"/>
			<c:set var="pageCount" value="${res + (pag.count % pag.pageSize == 0 ? 0 : 1)}"/>
			<c:set var="pageBlock" value="10" />
			<fmt:parseNumber var="result" value="${(pag.currPage-1)/pageBlock}" integerOnly="true"/>
			<fmt:parseNumber var="startPage" value="${result * pageBlock + 1}" />
			<fmt:parseNumber var="endPage" value="${startPage + pageBlock - 1}" />
			
			<c:if test="${endPage > pageCount}">
				<c:set var="endPage" value="${pageCount}"/>
			</c:if>
			
			<c:if test="${startPage > pageBlock}">
				<a href="/together/csboard/cslist.git?pageNum=${startPage-pageBlock}" class="page-link"> &lt; </a>		
			</c:if>				

			<c:forEach var="i" begin="${startPage}" end="${endPage}" step="1">
				<a href="/together/csboard/cslist.git?pageNum=${i}" class="pageNum" class="page-link"> &nbsp; ${i} &nbsp; </a>
			</c:forEach>
					
			<c:if test="${endPage < pageCount}">
				<a href="/together/csboard/cslist.git?pageNum=${startPage+pageBlock}" class="page-link"> &gt; </a>
			</c:if>
			
			</c:if>
		</div>	

		<!-- 검색 -->
		<nav class="navbar navbar-expand-lg navbar-light bg-light" style="margin-top:3%;">
			<div class="collapse navbar-collapse" id="navbarColor03" style="margin-left:30%;">
			
	    		<form class="form-inline my-2 my-lg-0" id="searchForm" action="cslist.git">
	    			<div class="form-group">
						<select class="custom-select" name="type">
					      	<option value="subject">제목</option>
					    	<option value="content">내용</option>
					      	<option value="id">작성자</option>
					 	</select>
					</div>
	      			<input name="search" class="form-control mr-sm-2" type="text" placeholder="search" />	      			
	      			<button class="btn btn-primary my-2 my-sm-0" type="submit">검색</button>
	      			<button type="button" class="btn btn-primary" onclick="window.location='/together/csboard/insertcs.git'" style="margin-left:10px;">글쓰기</button>
	   			</form>
			</div>
		</nav>
	   			<br/><br/><br/><br/>
		</div>
   	</section>	
</body>
</html>