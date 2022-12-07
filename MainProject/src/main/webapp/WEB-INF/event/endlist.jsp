<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
<script src="https://kit.fontawesome.com/a47cf79e39.js" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.6.0/font/bootstrap-icons.css" />

<title>Insert title here</title>
</head>
<body>

<div class="container" >

<br><br>
<p style="font-size: 2.5em; color: #252451; font-weight: 700;">종료된 이벤트


		      <div class="tab-content">
		     <div id="alllist" class="container tab-pane active"><br>
		     	<form action="endlist" class="form-inline" >
		<div style=" display: flex;" >
		<h5>총 ${totalCount }개의 글이있습니다</h5>
			<select  class="form-select" style="display: none " name="searchcolumn">
				<option value="subject"></option>
			</select>
			<input type="text" name="searchword" class="form-control" style="margin-left: 800px;" placeholder="검색어를 입력하세요">
			<button type="submit" style="background-color: white;border:0 ;outline: 0;" class=""><i class="bi bi-search"></i></button> 
		</div>
	</form>	
			  <hr>
			  <div class="event eventalllist"  style="/* display: flex; */cursor:pointer;">
	     		  <table class="table table-border" style="text-align: center;">
		      		
		
		    			<c:forEach var="dto" items="${list}" varStatus="i">
		    			
		    			<tr onclick="location.href='detail?num=${dto.num }'">
		    			<td width="200px"  rowspan="4" align="left"  >
		    				<img style="width:120px; height:120px; border-radius: 10%; "  alt="" src="../save/${dto.photo }">
		    			</td>
		    			</tr>
		    			
		    			<tr onclick="location.href='detail?num=${dto.num }'">
		    			<td align="left" style="font-size: 15px;color: #01738b; border-bottom : none;">
		    			<b>${dto.category }</b>
		    			</td>
		    			</tr>
		    			
		    			<tr onclick="location.href='detail?num=${dto.num }'">
		    			<td align="left" style="font-size: 18px;border : none;">
		    			<b>${dto.subject }</b>
		    			</td>
		    			</tr>
		    			
		    			<tr onclick="location.href='detail?num=${dto.num }'">
		    			<td align="left" style="font-size: 15px; color: #01738b;border-top : none;">
		    			<b>${dto.startday }~${dto.endday }</b>
		    			</td>
		    			</tr>
		    			
		    			<br>
	
		    	</c:forEach> 
		    	
		      </table>
		      <c:if test="${totalCount>0 }">
		<div style="width: 800px; text-align:center;"  class="container d-flex justify-content-center">
			<ul class="pagination">
			
			<!-- 이전 -->
			<c:if test="${startPage>1  }">
			<li>
				<a style="text-align: center;" class="container p-1 my-5 border" 
				href="endlist?currentPage=${startPage-1 }">이전</a>
			</li>
			</c:if>
			<c:forEach var="pp" begin="${startPage }" end="${endPage }"> 
				<c:if test="${currentPage==pp }">
					<li class="active">
						<a class="container p-1 my-5 border" 
						href="endlist?currentPage=${pp }">${pp }</a>
					</li>
				</c:if>
				
				<c:if test="${currentPage!=pp }">
					<li>
						<a class="container p-1 my-5 border" 
						href="endlist?currentPage=${pp }">${pp }</a>
					</li>
				</c:if>
				
			</c:forEach>
				
			<!-- 다음 -->
			<c:if test="${endPage<totalPage }">
			<li>
				<a class="container p-1 my-5 border" 
				href="endlist?currentPage=${endPage+1 }">다음</a>
			</li>
			</c:if>
					
			</ul>
		</div>
		
	</c:if>
	      	  </div>
	      	
	      	 </div>
	      </div>


</div>
</body>
</html>