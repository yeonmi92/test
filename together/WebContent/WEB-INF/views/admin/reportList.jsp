<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Together</title>
	<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.4/jquery.min.js"></script>
	<script>
		
		function check(){
			var inputs = document.searchForm;
			if(!inputs.keyword.value){
				alert("검색어를 입력해주세요.");
				return false;
			}
		}	
		// 추방 -> 해당 아이디 member status 바뀜 -> 비활성화
		$(document).ready(function(){
			$(".res0").click(function(){
				res0 = $(".res0").val();
				num = $(this).prev().val();
				$.ajax({
					type: "post",
					url: "/together/admin/res.git",
					data: {"res" : res0, "num" : num},
					success: function(){
						alert("처리 완료");
						location.reload();
					}
					})
				});
			
			$(".res1").click(function(){
				res1 = $(".res1").val();
				num = $(this).prev().prev().val();
				$.ajax({
					type: "post",
					url: "/together/admin/res.git",
					data: {"res" : res1, "num" : num},
					success: function(){
						alert("처리 완료");
						location.reload();
					}
					})
				});
			
			$(".res2").click(function(){
				num = $(this).prev().prev().prev().val();
				url="/together/admin/reject.git?num=";
				url+=num
				window.open(url, '반려 사유 작성', 'width=400px,height=400px, scrollbars=no, resizable=no, toolbar=no, status=no, location=no');
			});
			
			});
		
	</script>
	
	
	
	
	
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
	
	function myFunction() {
        var position = $('#myDropdown');
        position.offset({});
        document.getElementById("myDropdown").classList.toggle("showw");
     }
	
     $(document).ready(function(){
        window.onclick=function(e){
           if(!e.target.matches('.dropbtn')){
              var myDropdown = document.getElementById("myDropdown");               
              if(myDropdown.classList.contains('showw')){
                 myDropdown.classList.remove('showw');
              }
           }
        }
     });
     
	function myFunctionn() {
        var position = $('#myDropdownn');
        position.offset({});
        document.getElementById("myDropdownn").classList.toggle("showw");
     }
	
     $(document).ready(function(){
        window.onclick=function(e){
           if(!e.target.matches('.dropbtn')){
              var myDropdown = document.getElementById("myDropdownn");               
              if(myDropdown.classList.contains('showw')){
                 myDropdown.classList.remove('showw');
              }
           }
        }
     });
     
    </script>
	<style type="text/css">  
	
		table {width:500px;}  
		
		.hide {display:none;}  
		
		.show {display:table-row;}  
		
		.item td {cursor:pointer;} 
		
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
         background-color:#ddd;
      }
      .showw{
         display:block;
      }
      .btn{
      	margin-top: 5px;
      	margin-bottom: 5px;
      	margin-right: 5px;
      	margin-left: 5px;
      }
      .status{
		margin-left: 75%;
      }
      
		
		
		
	</style>
</head>
<body>
  <section class="blog-post-area section-margin">
 	<div class="container">
		<div class="row">
		
		<div class="dropdown" >
         <button class="btn btn-primary btn-sm btn-left dropbtn icon icon-black icon-down2" onclick="myFunction()">
         	<c:if test="${sel==6}">신고 사유 전체 ▼</c:if>
         	<c:if test="${sel==0}">욕설 ▼</c:if>
         	<c:if test="${sel==1}">음란물 ▼</c:if>
         	<c:if test="${sel==2}">노쇼 ▼</c:if>
         	<c:if test="${sel==3}">홍보 및 스팸 ▼</c:if>
         	<c:if test="${sel==4}">사생활 침해 ▼</c:if>
         	<c:if test="${sel==5}">기타 ▼</c:if>
         </button>
            <div class="dropdown-content" id="myDropdown" >
               <a href="/together/admin/reportList.git?sel=6&status=${status}">전체</a>
               <a href="/together/admin/reportList.git?sel=0&status=${status}">욕설</a>
               <a href="/together/admin/reportList.git?sel=1&status=${status}">음란물</a>
               <a href="/together/admin/reportList.git?sel=2&status=${status}">노쇼</a>
               <a href="/together/admin/reportList.git?sel=3&status=${status}">홍보 및 스팸</a>
               <a href="/together/admin/reportList.git?sel=4&status=${status}">사생활 침해</a>
               <a href="/together/admin/reportList.git?sel=5&status=${status}">기타</a>
            </div>
     	</div>
		<div class="dropdownn" >
         <button class="btn btn-primary btn-sm btn-left dropbtn icon icon-black icon-down2" onclick="myFunctionn()">
         	<c:if test="${status==2}">처리 상태 전체 ▼</c:if>
         	<c:if test="${status==0}">처리중 ▼</c:if>
         	<c:if test="${status==1}">처리 완료 ▼</c:if>
         </button>
            <div class="dropdown-content" id="myDropdownn" >
               <a href="/together/admin/reportList.git?sel=${sel}&status=2">전체</a>
               <a href="/together/admin/reportList.git?sel=${sel}&status=0">처리중</a>
               <a href="/together/admin/reportList.git?sel=${sel}&status=1">처리 완료</a>
            </div>
     	</div>
     	
		
            <c:if test="${count==0}">
            	<table class="table table-striped">
            		<tr align="center">
            			<td>신고글이 없습니다.</td>
            		</tr>
            	</table>
            </c:if>
            
            <c:if test="${count>0}">
      		<table class="table recruit" cellspacing="0">
<%-- 	      		<colgroup>   --%>
<!-- 		            <COL WIDTH="20%">   -->
<!-- 		            <COL WIDTH="20%">   -->
<!-- 		            <COL WIDTH="20%">   -->
<!-- 		            <COL WIDTH="20%">   -->
<%-- 	        	</colgroup> --%>
	        	  
	        	<thead>  
		            <tr>  
			            <td>No</td>
	      				<td>대상 아이디</td>
	      				<td>분류</td>
	      				<td>신고자</td>
	      				<td>처리 상태</td>
	      				<td>신고 날짜</td> 
		            </tr>  
		        </thead>  
		        
		        <tbody>  
	        	 <!-- 반복문 -->
      			<c:forEach var="report" items="${report}">
      			<tr class="item" <c:if test="${report.status==1}">style="background-color: rgba(83, 184, 247, 0.16);"</c:if>
	  				<c:if test="${report.status==0}">style="background-color: rgba(229, 35, 39, 0.18);"</c:if>>
					<td>${number}
						<c:set  var="number" value="${number-1}"/>
	  				</td>
	  				<td>${report.id}</td>
	  				<td>
	  					<c:if test="${report.sel==0}">욕설</c:if>
	  					<c:if test="${report.sel==1}">음란물</c:if>
	  					<c:if test="${report.sel==2}">노쇼</c:if>
	  					<c:if test="${report.sel==3}">홍보 및 스팸</c:if>
	  					<c:if test="${report.sel==4}">사생활 침해</c:if>
	  					<c:if test="${report.sel==5}">기타</c:if>
	  				</td>
	  				<td>${report.writer}</td>
	  				<td>
	  					<c:if test="${report.status==0}">처리중</c:if>
	  					<c:if test="${report.status==1}">
	  						<c:if test="${report.result==0}">추방</c:if>	
	  						<c:if test="${report.result==1}">경고</c:if>	
	  						<c:if test="${report.result==2}">반려</c:if>	
	  					</c:if>
	  				
	  				<td><fmt:formatDate pattern="yyyy-MM-dd" value="${report.reg}"/></td>
      			</tr>
      			
      			<!-- 사유 + 반려시 사유 작성란 나오기 -->
      			<tr class="hide">
      				<td align="center" colspan="6">
      					<b>신고 사유</b><br/>
      					<hr width="20%"/>
      					${report.detail}<br/>
      					<c:if test="${report.status==1}">
      						<c:if test="${report.result==2}">
      							<hr/>
      							<b>반려 사유</b><br/>
      							<hr width="20%"/>
      							${report.reason}<br/>
      						</c:if>
      					</c:if>
      					<c:if test="${report.status==0}">
	      					<br/>
	      					<div class="resBtn">
	      						<input type="hidden" class="num" value="${report.report_num}"/>
		      					<button class="btn btn-primary btn-sm res0" value="0">추방</button>
		      					<button class="btn btn-primary btn-sm res1" value="1">경고</button>
		      					<button class="btn btn-primary btn-sm res2" value="2">반려</button>
		      				</div>
      					</c:if>
      				</td>
      			</tr>
      			</c:forEach>
	      		<!-- 반복문 -->
      			
      			</tbody>
      			
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
		                    <a class="page-link" href="/together/admin/reportList.git?pageNum=${startPage + pageBlock}">&laquo;</a>
		                  </li>
		                </c:if>
		                
		            	<c:forEach var="i" begin="${startPage}" end="${endPage}" step="1">
		                  	<li class="page-item active">
		                  		<a class="page-link pageNums" href="/together/admin/reportList.git?pageNum=${i}&search=${search}&keyword=${keyword}">${i}</a>
		                  	</li>
						</c:forEach>
	                  <c:if test="${endPage<pageCount}">
		            	<li class="page-item">
		             		<a class="page-link" href="/together/admin/reportList.git?pageNum=${startPage + pageBlock}">&raquo;</a>
		             	</li>
	                  </c:if>
	                </ul>
                </c:if>
              </div>
             </c:if>
             
             <br/><br/><br/>
      			<form class="form-inline my-2 my-lg-0" action="/together/admin/reportList.git" method="post" style="margin-left: 30%" onsubmit="return check()" name="searchForm">
      				<input type="hidden" name="sel" value="${sel}"/>
      				<input type="hidden" name="status" value="${status}"/>
      					<div class="form-group">
	      		    	<select name="search" id="search" class="custom-select">
	      		    		<option value="all" <c:if test="${search eq 'all'}">selected</c:if>>전체</option>
	      		    		<option value="writer" <c:if test="${search eq 'writer'}">selected</c:if>>신고자</option>
	      		    		<option value="id" <c:if test="${search eq 'id'}">selected</c:if>>신고 대상 아이디</option>
	      		    		<option value="detail" <c:if test="${search eq 'detail'}">selected</c:if>>신고사유</option>
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