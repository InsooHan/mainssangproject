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
<title>Insert title here</title>
<style type="text/css">
div.look {
		width: 233px;
		float: left;
		margin-right: 10px;
	}

</style>
</head>
<body>

<div class="container" >
<br><br>
<p style="font-size: 2.5em; color: #252451; font-weight: 700;">이벤트

	<!-- admin만 글 작성가능 -->
	<c:if test="${sessionScope.loginok!=null && sessionScope.myid=='admin'}">
		<button type="button" class="btn btn-primary" style="float: right;" onclick="location.href='form'">상품 추가</button>
	</c:if>
	
	<!-- 카테고리 네비바 -->
	<div class="container mt-3">
	  <ul class="nav nav-tabs" role="tablist" style="text-align: center;">
	   <li class="nav-item" style="width: 16%">
	      <button class="nav-link " data-bs-toggle="tab" onclick="location.href='list'">전체</button>
	    </li>
	    <li class="nav-item" style="width: 16%">
	      <button class="nav-link " data-bs-toggle="tab" onclick="location.href='megapick'">메가pick</button>
	    </li>
	    <li class="nav-item" style="width: 16%">
	      <button class="nav-link " data-bs-toggle="tab" onclick="location.href='movie'">영화</button>
	    </li>
	    <li class="nav-item" style="width: 16%">
	      <button class="nav-link active" data-bs-toggle="tab" onclick="location.href='theater'">극장</button>
	    </li>
	    <li class="nav-item" style="width: 16%">
	      <button class="nav-link " data-bs-toggle="tab" onclick="location.href='discount'">제휴/할인</button>
	    </li>
	     <li class="nav-item" style="width: 16%">
	      <button class="nav-link " data-bs-toggle="tab" onclick="location.href='preview'">시사회/무대인사</button>
	    </li>
	  </ul>
	 </div>
	 <div class="tab-content">
 		<div id="alllist" class="container tab-pane active"><br>
		     	<form action="theater" class="form-inline">
		<div style="width: 500px; display: flex;" >
		<h5>총 ${totalCount }개의 글이있습니다</h5>
			<select class="form-select" style="width: 100px; " name="searchcolumn">
				<option value="subject">제목</option>
				<option value="content">내용</option>
			</select>
			<input type="text" name="searchword" class="form-control" style="width:300px;" placeholder="검색어를 입력하세요">
			<button type="submit" class="">검색하기</button>
		</div>
	</form>	
			  <hr>
			  <div class="event eventalllist"  style="display: flex;">
		      <table class="table table-border" style="text-align: center;">
		      	<tr >
		    	<c:forEach var="dto" items="${list}" varStatus="i">
		    		<td >
		    			<a href="detail?num=${dto.num }">
		    			<div class="look" style="height: 352px;">
		    				<img style="width:233px; height: 233px; "  alt="" src="../save/${dto.photo }">
		    			
		    			<b>${dto.subject }</b>
		    			<br>
		    			<b> ${dto.startday }~${dto.endday }</b>
		    			</div>
		    			</a>
		    			
		    		</td>
		    	<c:if test="${(i.count+4)%4==0}">
		    	</tr>
		    	<tr>
		    	</c:if>
		    	</c:forEach>
		    	
		      </table>
		      </div>
		      
	      </div>
	    </div>

	

</div>
</body>
</html>