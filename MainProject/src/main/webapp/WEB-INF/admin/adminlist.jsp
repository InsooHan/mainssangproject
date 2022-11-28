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
</head>
<body>
<h2>공지/뉴스</h2>
<p>CGV의 주요한 이슈 및 여러가지 소식들을 확인하실 수 있습니다.</p>

<div class="searcharea" style="width:100%; ">
	<!-- 검색창 -->
	<form action="list" class="form-inline">
		<div style="width: 500px; display: flex;" >
			<select class="form-select" style="width: 100px; " name="searchcolumn">
				<option value="subject">제목</option>
				<option value="content">내용</option>
			</select>
			<input type="text" name="searchword" class="form-control" style="width:300px;" placeholder="검색어를 입력하세요">
			<button type="submit" class="">검색하기</button>
		</div>
	</form>	
	<!--  글쓰기는 로그인을 해아만 보인다-->
	<c:if test="${sessionScope.loginok!=null and sessionScope.myid=='admin' }">
		<tr>
			<td colspan="5" align="right">
				 <button type="button" class="btn btn-danger"
					style="float: right;" onclick="location.href='form'">글쓰기</button>
			</td>
		</tr>

	</c:if>
</div>

<!-- 카테고리 메뉴 -->
	  <ul class="nav nav-tabs" role="tablist" style="text-align: center;">
	    <li class="nav-item" style="width: 150px">
	      <a class="nav-link active" data-bs-toggle="tab" href="#alllist">전체</a>
	    </li>
	    <li class="nav-item" style="width: 150px">
	      <a class="nav-link" data-bs-toggle="tab" href="#system">시스템점검</a>
	    </li>
	    <li class="nav-item" style="width: 150px">
	      <a class="nav-link" data-bs-toggle="tab" href="#theater">극장</a>
	    </li>
	    <li class="nav-item" style="width: 150px">
	      <a class="nav-link" data-bs-toggle="tab" href="#other">기타</a>
	    </li>
	  </ul>
	  
<div class="tab-content">
<br>

<div id="alllist" style="margin-top:20px;" class="tab-pane  fade show active" >
	<h5>총 ${totalCount }개의 글이있습니다</h5>
	<br>
	<table class="table table-bordered" >
		<tr  align="center">
			<th width="50" >번호</th>
			<th width="100">구분</th>
			<th width="200">제목</th>
			<th width="100">작성일</th>
			<th width="50">조회</th>

		</tr>
		<c:forEach var="a" items="${list }">
		<tr  align="center">
			<td >${no} </td>
			<c:set var="no" value="${no-1 }"/>
			<td>
				${a.division}
			</td>
			<td>
				<a href="detail?num=${a.num }&currentPage=${currentPage}">${a.subject }</a>

			</td>
			
			<td>
		 			<fmt:formatDate value="${a.writeday }" pattern="yyyy-MM-dd HH:mm"/>
		 	</td>
			<td>${a.readcount }</td>
			
		</tr>
		</c:forEach>


	</table>
	<!-- 페이징처리 -->
	<c:if test="${totalCount>0 }">
		<div style="width: 800px; text-align:center;" class="container">
			<ul class="pagination">
			
			<!-- 이전 -->
			<c:if test="${startPage>1  }"></c:if>
			<li>
				<a href="list?currentPage=${startPage-1 }">이전</a>
			</li>
			
			<c:forEach var="pp" begin="${startPage }" end="${endPage }"> 
				<c:if test="${currentPage==pp }">
					<li class="active">
						<a href="list?currentPage=${pp }">${pp }</a>
					</li>
				</c:if>
				
				<c:if test="${currentPage!=pp }">
					<li>
						<a href="list?currentPage=${pp }">${pp }</a>
					</li>
				</c:if>
				
			</c:forEach>
				
			<!-- 다음 -->
			<c:if test="${endPage<totalPage }">
			<li>
				<a href="list?currentPage=${endPage+1 }">다음</a>
			</li>
			</c:if>
					
			</ul>
		</div>
		
	</c:if>
</div>

<!-- 시스템점검 -->
<div id="system"  class=" tab-pane fade">
	<h5>총 ${systemCount}개의 글이있습니다</h5>
	<br>
	<table class="table table-bordered" >
		<tr  align="center">
			<th width="50" >번호</th>
			<th width="100">구분</th>
			<th width="200">제목</th>
			<th width="100">작성일</th>
			<th width="50">조회</th>

		</tr>
		<c:forEach var="b" items="${list }" varStatus="s">
		<c:set var="division" value="${b.division }" ></c:set>
		<c:if test="${division=='시스템점검' }">
		
		<tr  align="center">
			<td >${no1} </td>
			<c:set var="no1" value="${no1-1 }"/>
			<td>
				${b.division}
			</td>
			<td>
				<a href="detail?num=${b.num }&currentPage=${currentPage}">${b.subject }</a>

			</td>
			
			<td>
		 			<fmt:formatDate value="${b.writeday }" pattern="yyyy-MM-dd HH:mm"/>
		 	</td>
			<td>${b.readcount }</td>
			
		</tr>
		</c:if>
		</c:forEach>


	</table>
	
	<!-- 페이징처리 -->
	<c:if test="${totalCount>0 }">
		<div style="width: 800px; text-align:center;" class="container">
			<ul class="pagination">
			
			<!-- 이전 -->
			<c:if test="${startPage>1  }"></c:if>
			<li>
				<a href="list?currentPage=${startPage-1 }">이전</a>
			</li>
			
			<c:forEach var="pp" begin="${startPage }" end="${endPage }"> 
				<c:if test="${currentPage==pp }">
					<li class="active">
						<a href="list?currentPage=${pp }">${pp }</a>
					</li>
				</c:if>
				
				<c:if test="${currentPage!=pp }">
					<li>
						<a href="list?currentPage=${pp }">${pp }</a>
					</li>
				</c:if>
				
			</c:forEach>
				
			<!-- 다음 -->
			<c:if test="${endPage<totalPage }">
			<li>
				<a href="list?currentPage=${endPage+1 }">다음</a>
			</li>
			</c:if>
					
			</ul>
		</div>
		
	</c:if>

</div>

<!-- 극장 -->
<div id="theater" class=" tab-pane fade">
	<h5>총 ${theaterCount}개의 글이있습니다</h5>
	<br>
	<table class="table table-bordered" >
		<tr  align="center">
			<th width="50" >번호</th>
			<th width="100">구분</th>
			<th width="200">제목</th>
			<th width="100">작성일</th>
			<th width="50">조회</th>

		</tr>
		<c:forEach var="c" items="${list }" varStatus="t">
		<c:set var="division" value="${c.division }" ></c:set>
		<c:if test="${division=='극장' }">
		
		<tr  align="center">
			<td >${no} </td>
			<c:set var="no" value="${no-1 }"/>
			<td>
				${c.division}
			</td>
			<td>
				<a href="detail?num=${c.num }&currentPage=${currentPage}">${c.subject }</a>

			</td>
			
			<td>
		 			<fmt:formatDate value="${c.writeday }" pattern="yyyy-MM-dd HH:mm"/>
		 	</td>
			<td>${c.readcount }</td>
			
		</tr>
		</c:if>
		</c:forEach>


	</table>
</div>


<!-- 기타 -->
<div id="other" style="margin-top:20px;" class=" tab-pane fade">
	<h5>총 ${otherCount}개의 글이있습니다</h5> 
	<br>
	<table class="table table-bordered" >
		<tr  align="center">
			<th width="50" >번호</th>
			<th width="100">구분</th>
			<th width="200">제목</th>
			<th width="100">작성일</th>
			<th width="50">조회</th>

		</tr>
		<c:forEach var="d" items="${list }" varStatus="o">
		<c:set var="division" value="${d.division }" ></c:set>
		<c:if test="${division=='기타' }">
		
		<tr  align="center">
			<td >${no} </td>
			<c:set var="no" value="${no-1 }"/>
			<td>
				${d.division}
			</td>
			<td>
				<a href="detail?num=${d.num }&currentPage=${currentPage}">${d.subject }</a>

			</td>
			
			<td>
		 			<fmt:formatDate value="${d.writeday }" pattern="yyyy-MM-dd HH:mm"/>
		 	</td>
			<td>${d.readcount }</td>
			
		</tr>
		</c:if>
		</c:forEach>


	</table>
</div>

</div>


<!-- 페이징처리 -->
	<c:if test="${totalCount>0 }">
		<div style="width: 800px; text-align:center;" class="container">
			<ul class="pagination">
			
			<!-- 이전 -->
			<c:if test="${startPage>1  }"></c:if>
			<li>
				<a href="list?currentPage=${startPage-1 }">이전</a>
			</li>
			
			<c:forEach var="pp" begin="${startPage }" end="${endPage }"> 
				<c:if test="${currentPage==pp }">
					<li class="active">
						<a href="list?currentPage=${pp }">${pp }</a>
					</li>
				</c:if>
				
				<c:if test="${currentPage!=pp }">
					<li>
						<a href="list?currentPage=${pp }">${pp }</a>
					</li>
				</c:if>
				
			</c:forEach>
				
			<!-- 다음 -->
			<c:if test="${endPage<totalPage }">
			<li>
				<a href="list?currentPage=${endPage+1 }">다음</a>
			</li>
			</c:if>
					
			</ul>
		</div>
		
	</c:if>


</body>
</html>