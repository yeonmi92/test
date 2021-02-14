<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Together</title>
	<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
	<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.4/jquery.min.js"></script>
	<link rel="stylesheet" href="/together/resources/css/bootstrap.css" media="screen">
    <link rel="stylesheet" href="/together/resources/css/bootstrap.min.css">
<script>
	function check(){
		var inputs = document.searchForm;
		if(!inputs.keyword.value){
			alert("검색어를 입력해주세요.");
			return false;
		}
	}

      function myFunction() {
         var position = $('#myDropdown');
         position.offset({});
         document.getElementById("myDropdown").classList.toggle("show");
      }
      $(document).ready(function(){
         window.onclick=function(e){
            if(!e.target.matches('.dropbtn')){
               var myDropdown = document.getElementById("myDropdown");               
               if(myDropdown.classList.contains('show')){
                  myDropdown.classList.remove('show');
               }
            }
         }
      });
      
      function infoView(id){
		url = "/together/member/infoView.git?id=" + id;
		window.open(url, '회원 정보 보기', 'width=600px,height=600px, scrollbars=no, resizable=no, toolbar=no, status=no, location=no');
      
      }
</script>
<style>
      .confirmPostBtn{
         width:60px;
         height:50px;
         display:block;
         position:absolute;
      }
      .dropdown{
         vertical-align:middle;         
      }
      .dropdown.dropbtn{
         width:50px;
         height:45px;
         margin:24px 0 24px 1px;
         border:2px solid transparent;
         position:relative;
         left:55px;
      }
      .dropdown-content{
         display:none;
         position:absolute;
         background-color:#f9f9f9;
         min-width:160px;
         box-shadow:0px 8px 16px 0px rgba(0,0,0,0.2);
         z-index:1;
      }
      .dropdown-content a{
         float:none;
         color:black;
         padding:12px 16px;
         text-decoration:none;
         display:block;
         text-align:left;  
      }
      .dropdown-content a:hover {
         background-color: #EED2A9;
      }
      .show{
         display:block;
      }
      .pagination a{
      	background-color: yellow;
      }
   </style>
</head>
<body>
  <section class="blog-post-area section-margin">
 	<div class="container">
		<div class="row">
		<c:if test="${sessionScope.memId!=null}">
			<a href="/together/board/insertForm.git"><button type="button" class="btn btn-primary">글쓰기</button></a>
		</c:if>
		&nbsp;
		<div class="dropdown">
         <button class="btn btn-primary btn-left dropbtn icon icon-black icon-down2" onclick="myFunction()">
         	<c:if test="${sel==0}">일반 ▼</c:if>
	      	<c:if test="${sel==1}">후기 ▼</c:if>
	      	<c:if test="${sel==2}">전체 ▼</c:if>
        </button>
            <div class="dropdown-content" id="myDropdown" >
               <a href="/together/board/indexBoard.git?sel=2">전체</a>
               <a href="/together/board/indexBoard.git?sel=0">일반</a>
               <a href="/together/board/indexBoard.git?sel=1">후기</a>
            </div>
     	</div>
     	
     	<br/><br/>
      		<table class="table table-hover">
      			<tr>
      				<td>No</td>
      				<td>분류</td>
      				<td>제목</td>
      				<td>작성자</td>
      				<td>작성날짜</td>
      				<td>조회수</td>
      			</tr>
      			<!-- 공지사항 항상 맨 위에 넣기 -->
      			<c:forEach var="notice" items="${noticeList}">
      				<tr style="background-color: rgba(230, 230, 228, 0.4);">
	      			<!-- 반복문 돌리기 -->
	      				<td><b>[중요]</b></td>
	      				<td>
	      					<c:if test="${notice.sel==4}"><b>공지사항</b></c:if>
	      				</td>
	      				<td>
	      					<c:set var="wid" value="0"/>
	      					<c:if test="${notice.re_level>0}">
	      						<img src="" width="width"/>
	      						<img src="" width="width" width="11"/>
	      					</c:if>
	      					<a href="/together/board/content.git?board_num=${notice.board_num}&pageNum=${pageNum}&search=${search}">
	      					<c:if test="${notice.sel==4}"><b>&#10071 ${notice.title}</b></c:if></a>
	      				</td>
	      				
	      				<td>
	      					<c:if test="${notice.sel==4}"><b>관리자</b></c:if>
	      				</td>
	      				<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${notice.reg}"/></td>
	      				<td>${notice.readcount}</td>
	      			</tr>
      			</c:forEach>
      			<c:if test="${count==0}">
            		<tr align="center">
            			<td colspan="6">게시글이 없습니다.</td>
            		</tr>
            	</c:if>
      			<c:if test="${count>0}">
	      			<c:forEach var="article" items="${articleList}">
		      			<tr>
		      			<!-- 반복문 돌리기 -->
		      				<td>${number}
		      					<c:set var="number" value="${number-1}"/>
		      				</td>
		      				<td>
		      					<c:if test="${article.sel==0}">일반</c:if>
		      					<c:if test="${article.sel==1}">후기</c:if>
		      					<c:if test="${article.sel==4}"><b>공지사항</b></c:if>
		      				</td>
		      				<td>
		      					<a href="/together/board/content.git?board_num=${article.board_num}&pageNum=${pageNum}&search=${search}">
		      					${article.title}</a>
		      				</td>
		      				<c:if test="${sessionScope.memId == null }">
								<td>${article.id}</td>
							</c:if>
							<c:if test="${sessionScope.memId != null }">
								<td>
			      					<a onclick="infoView('${article.id}')" href="#">${article.id}</a>
			      				</td>
							</c:if>
		      				
		      				<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${article.reg}"/></td>
		      				<td>${article.readcount}</td>
		      				
		      			</tr>
	      			</c:forEach>
      			</c:if>
      		</table>
      		
      		<hr/>
      		
      		<br/>
      		<c:if test="${count>0}">
      		<div style="margin-left:40%">
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
	                <ul class="pagination pagination-sm" style="background-color: yellow;">
						<c:if test="${startPage>pageBlock}">
		                  <li class="page-item disabled">
		                    <a class="page-link" href="/together/board/indexBoard.git?pageNum=${startPage + pageBlock}">&laquo;</a>
		                  </li>
		                </c:if>
		                
		            	<c:forEach var="i" begin="${startPage}" end="${endPage}" step="1">
		                  	<li class="page-item active">
		                    	<a class="page-link pageNums" href="/together/board/indexBoard.git?pageNum=${i}&sel=${sel}&search=${search}&keyword=${keyword}">${i}</a>
		                  	</li>
						</c:forEach>
	                  <c:if test="${endPage<pageCount}">
		            	<li class="page-item">
		             		<a class="page-link" href="/together/board/indexBoard.git?pageNum=${startPage + pageBlock}">&raquo;</a>
		             	</li>
	                  </c:if>
	                </ul>
                </c:if>
              </div>
             </c:if>
    		
		</div>
           <nav class="navbar navbar-expand-lg navbar-light bg-light" style="margin-top:3%;">
	             <div class="collapse navbar-collapse" id="navbarColor03">
	      			<form action="/together/board/indexBoard.git" method="post" style="margin-left: 35%" name="searchForm" class="form-inline my-2 my-lg-0" onsubmit="return check()">
	      		    	<div class="form-group">
		      		    	<input type="hidden" name="sel" value="${sel}"/>
		      		    	
		      		    	<select name="search" id="search" class="custom-select">
		      		    		<option value="all" <c:if test="${search eq 'all'}">selected</c:if>>전체</option>
		      		    		<option value="tide" <c:if test="${search eq 'tide'}">selected</c:if>>제목+내용</option>
		      		    		<option value="id" <c:if test="${search eq 'id'}">selected</c:if>>아이디</option>
		      		    	</select>
		      		    	<br>
	      		    	</div>
	      		     	<input type="search" name="keyword" id="keyword" class="form-control mr-sm-2"/>
	      		     	<input type="submit" value="검색" id="searchBtn" class="btn btn-primary my-2 my-sm-0"/>
	      		     	
	      			</form>
	    		</div>
    		</nav>
   	</div>
   	
	</section>
</body>
</html>