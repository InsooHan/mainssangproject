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
button.nav-link {
	color: black;
}
button.nav-link {
	background-color: white !important;
	color: black !important;
	border: 1px;
}

button.nav-link.active {
	color: #339eb2 !important;
	font-weight:bolder !important; 
	
}

button.nav-link:hover {
	color: #339eb2 !important;
}

a{
color: black;
}

.table-hover tbody tr:hover td, .table-hover tbody tr:hover th {
  background-color: #FBFCFC;
}

span.badge{
	font-size: 0.9em;
}

button.write{
 background-color: #339EB2 !important;
}

</style>

</head>
<body>
<!-- 카테고리 선택 -->
<ul class="nav nav-pills mb-3" id="pills-tab" role="tablist" style="margin-left: 20px;">
  <li class="nav-item" role="presentation">
    <button class="nav-link active" id="pills-home-tab" data-bs-toggle="pill" data-bs-target="#pills-home" type="button" role="tab" aria-controls="pills-home" aria-selected="true" style="font-size: 1.2em;">전체</button>
  </li>
  <li class="nav-item" role="presentation">
    <button class="nav-link" data-bs-toggle="pill"  type="button" role="tab" aria-controls="pills-profile" aria-selected="false" onclick="location.href='best'" style="font-size: 1.2em;">인기글</button>
  </li>
  <li class="nav-item" role="presentation">
    <button class="nav-link" data-bs-toggle="pill"  type="button" role="tab" aria-controls="pills-profile" aria-selected="false" onclick="location.href='movietalk'" style="font-size: 1.2em;">영화수다</button>
  </li>
  <li class="nav-item" role="presentation">
    <button class="nav-link" id="pills-contact-tab" data-bs-toggle="pill" data-bs-target="#pills-contact" type="button" role="tab" aria-controls="pills-contact" aria-selected="false" onclick="location.href='moviereport'" style="font-size: 1.2em;">영화정보</button>
  </li>
</ul>


<!-- 전체리스트 출력 -->
  	<div class="boardlist" style="margin-left: 40px; margin-top: 20px;">
	<table class="table table-hover" style="width: 1200px;">
	<thead>
		<tr>
			<th width="120"></th>
			<th>제목</th>
			<th width="200">작성자</th>
			<th width="180">작성일</th>
			<th width="70">조회</th>
			<th width="60">추천</th>
		</tr>
		</thead>
		
		<tbody>
		<c:if test="${totalCount==0 }">
			<tr>
				<td colspan="6" align="center">
					<h4>등록된 글이 없습니다</h4>
				</td>
			</tr>
		</c:if>
		
		<c:if test="${totalCount>0 }">
			<c:forEach var="dto" items="${list }">
				
				<!-- 카테고리가 공지사항이면 공지 badge가 뜨게 -->
				<tr>
					<td align="center">
					<c:if test="${dto.category!='공지사항' }">
						${dto.category }
					</c:if>
					
					<c:if test="${dto.category=='공지사항' }">
						<span class="badge text-bg-secondary">공지</span>
					</c:if>
						
					</td>
					
					<td>				
						<!-- 답글일 경우 level당 2칸 띄우기 -->	
						<c:forEach begin="1" end="${dto.relevel }">&nbsp;&nbsp;</c:forEach>
						<!-- 답글일 경우 답글이미지 -->
						<c:if test="${dto.relevel>0 }">
							<img alt="" src="../save/re.png">	
							</c:if>
							
							
							<c:if test="${dto.category!='공지사항' }">
							<a href="detail?num=${dto.num }&currentPage=${currentPage}" style="color: black;">
							${dto.subject }</a>
							</c:if>
							
							<!-- 공지사항이면 제목 굵게표시 -->
							<c:if test="${dto.category=='공지사항' }">
								<a href="detail?num=${dto.num }&currentPage=${currentPage}" style="color: black;">
							<b>${dto.subject }</b></a>
							</c:if>
							
							
							<!-- 사진 있을경우 사진아이콘 -->
							<c:if test="${dto.content.contains('img') }">
								<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-image" viewBox="0 0 16 16" style="color: gray;">
								  <path d="M6.002 5.5a1.5 1.5 0 1 1-3 0 1.5 1.5 0 0 1 3 0z"/>
								  <path d="M2.002 1a2 2 0 0 0-2 2v10a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V3a2 2 0 0 0-2-2h-12zm12 1a1 1 0 0 1 1 1v6.5l-3.777-1.947a.5.5 0 0 0-.577.093l-3.71 3.71-2.66-1.772a.5.5 0 0 0-.63.062L1.002 12V3a1 1 0 0 1 1-1h12z"/>
								</svg>
							</c:if>		
							
							<!-- 댓글개수 -->
							<c:if test="${dto.anscount>0 }">
							<a style="color: red;" href="detail?num=${dto.num }&currentPage=${currentPage}#answer"><b>[${dto.anscount }]</b></a>
							</c:if>
							
							<!-- 오늘날짜일 경우 제목 옆에 new -->
							<c:set var="today" value="<%=new java.util.Date()%>" />
							<c:set var="date"><fmt:formatDate value="${today}" pattern="yyyy-MM-dd" /></c:set> 
							<c:set var="dtodate"><fmt:formatDate value="${dto.writeday }" pattern="yyyy-MM-dd"/></c:set>
							<c:if test="${date==dtodate }">
							<span class="badge rounded-pill text-bg-danger" style="font-size: 5px;">N</span>
							</c:if>
							<!-- 날짜끝  -->
						
					</td>

						<!-- 공지사항이면 작성자 굵게표시 -->
					<td>
							<c:if test="${dto.category!='공지사항' }">
								${dto.name }
							</c:if>
							
							<c:if test="${dto.category=='공지사항' }">
								<b>${dto.name }</b>
							</c:if>
					
					</td>
					<td>${dtodate }</td>
					<td style="padding-left: 20px;">${dto.readcount }</td>
					<td style="padding-left: 20px;">${dto.likes }</td>
					</tr>
			</c:forEach>
		</c:if>
		</tbody>

	<thead>
	<tr>
		<!-- 글쓰기버튼 -->
		<td colspan="6" align="right">
			<button type="button" class="btn btn-outline-secondary" id="write">
			<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-pencil" viewBox="0 0 16 16">
 				 <path d="M12.146.146a.5.5 0 0 1 .708 0l3 3a.5.5 0 0 1 0 .708l-10 10a.5.5 0 0 1-.168.11l-5 2a.5.5 0 0 1-.65-.65l2-5a.5.5 0 0 1 .11-.168l10-10zM11.207 2.5 13.5 4.793 14.793 3.5 12.5 1.207 11.207 2.5zm1.586 3L10.5 3.207 4 9.707V10h.5a.5.5 0 0 1 .5.5v.5h.5a.5.5 0 0 1 .5.5v.5h.293l6.5-6.5zm-9.761 5.175-.106.106-1.528 3.821 3.821-1.528.106-.106A.5.5 0 0 1 5 12.5V12h-.5a.5.5 0 0 1-.5-.5V11h-.5a.5.5 0 0 1-.468-.325z"/>
			</svg>
			글쓰기</button>  
		</td>
	</tr>
	</thead>

	</table>
	
	
<!-- 페이징처리 -->
<c:if test="${totalCount>0 }">
	<div style="width: 800px; align-content: center; margin-left: 550px;" class="container">
		<ul class="pagination">
			<!-- 이전 -->
			<c:if test="${startPage>1 }">
				<li>
			<a href="list?currentPage=${startPage-1 }">이전</a>
				</li>&nbsp;
			</c:if>
			
			<c:forEach var="pp" begin="${startPage }" end="${endPage }">
				<c:if test="${currentPage==pp }">
					<li class="active">
				<a href="list?currentPage=${pp }">${pp }</a>
					</li>&nbsp;
				
				</c:if>
				
				<c:if test="${currentPage!=pp }">
					<li>
				<a href="list?currentPage=${pp }">${pp }</a>
					</li>&nbsp;
				
				</c:if>
			
			</c:forEach>
			
			<!-- 다음 -->
			<c:if test="${endPage<totalPage }">
			<li>
				<a href="list?currentPage=${endPage+1 }>">다음</a>
			</li>
			</c:if>
		</ul>
	</div>
	
	</c:if>

</div>
  	



<div class="searcharea" style="align-content: center; margin-left: 500px;">
	<!-- 검색창 -->
	<form action="list">
		<div>
			<select name="searchcolumn" style="width: 100px;">
				<option value="subject">제목</option>
				<option value="id">아이디</option>
				<option value="name">작성자</option>
				<option value="content">내용</option>
			</select>
			<input type="text" name="searchword" style="width: 160px; height: 24px;">
			<input type="submit" value="검색" class="btn btn-secondary btn-sm">
		</div>
	</form>

</div>

<script type="text/javascript">
$("#write").click(function(){
	<c:if test="${sessionScope.loginok==null }">
	alert("로그인이 필요합니다");
	location.reload();
	</c:if>
	
	<c:if test="${sessionScope.loginok!=null }">
	location.href="writeform";
		</c:if>
})
</script>				

</body>
</html>