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
<style type="text/css">
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

table{
    margin-left:auto; 
    margin-right:auto;
}

.nav li{
display: inline-block;
font-size: 1.3em;
}

.pagination{
 justify-content : center; 
}

tr {
  line-height: 1.7rem;
}
</style>

</head>
<body>
<!-- 카테고리 선택 -->
<ul class="nav nav-pills mb-3 justify-content-start" id="pills-tab" role="tablist" style="margin-top: 40px; margin-left: 140px;">
  <li class="nav-item" role="presentation">
    <button class="nav-link" id="pills-home-tab" data-bs-toggle="pill" data-bs-target="#pills-home" type="button" role="tab" aria-controls="pills-home" aria-selected="true" onclick="location.href='list'">전체</button>
  </li>
  <li class="nav-item" role="presentation">
    <button class="nav-link active" data-bs-toggle="pill"  type="button" role="tab" aria-controls="pills-profile" aria-selected="false" onclick="location.href='best'">인기글</button>
  </li>
  <li class="nav-item" role="presentation">
    <button class="nav-link" data-bs-toggle="pill"  type="button" role="tab" aria-controls="pills-profile" aria-selected="false" onclick="location.href='movietalk'">영화수다</button>
  </li>
  <li class="nav-item" role="presentation">
    <button class="nav-link" id="pills-contact-tab" data-bs-toggle="pill" data-bs-target="#pills-contact" type="button" role="tab" aria-controls="pills-contact" aria-selected="false" onclick="location.href='moviereport'">영화정보</button>
  </li>
</ul>

<!-- 인기글 리스트 출력(공지사항 포함x) -->
  	<div class="boardlist">
	<table class="table table-hover" style="width: 1200px;">
	<thead>
		<tr>
			<th width="120"></th>
			<th style="text-align: center;">제목</th>
			<th width="200">작성자</th>
			<th width="180">작성일</th>
			<th width="70" style="text-align: center;">조회</th>
			<th width="60" style="text-align: center;">추천</th>
		</tr>
		</thead>
		
		<tbody>

			<c:forEach var="dto" items="${list }" varStatus="i">
				
				<tr>
					<td align="center">${i.count }</td>				

					<td>	
							<a href="detail?num=${dto.num }&currentPage=${currentPage}" style="color: black;">
							${dto.subject }</a>
							
							
							<!-- 사진 있을경우 사진아이콘 -->
							<c:if test="${dto.content.contains('img') }">
								<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-image" viewBox="0 0 16 16" style="color: gray;">
								  <path d="M6.002 5.5a1.5 1.5 0 1 1-3 0 1.5 1.5 0 0 1 3 0z"/>
								  <path d="M2.002 1a2 2 0 0 0-2 2v10a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V3a2 2 0 0 0-2-2h-12zm12 1a1 1 0 0 1 1 1v6.5l-3.777-1.947a.5.5 0 0 0-.577.093l-3.71 3.71-2.66-1.772a.5.5 0 0 0-.63.062L1.002 12V3a1 1 0 0 1 1-1h12z"/>
								</svg>
							</c:if>		
							
							<!-- 댓글개수 -->
							<c:if test="${dto.anscount>0 }">
							<a style="color: red;" href="detail?num=${dto.num }#answer"><b>[${dto.anscount }]</b></a>
							</c:if>
							
							<!-- 오늘 날짜일경우 제목 옆에 new -->
							<c:set var="today" value="<%=new java.util.Date()%>" />
							<c:set var="date"><fmt:formatDate value="${today}" pattern="yyyy-MM-dd" /></c:set> 
							<c:set var="dtodate"><fmt:formatDate value="${dto.writeday }" pattern="yyyy-MM-dd"/></c:set>
							<c:if test="${date==dtodate }">
							<span class="badge rounded-pill text-bg-danger" style="font-size: 5px;">N</span>
							</c:if>
					</td>

					<td>
							${dto.name }
					
					</td>
					<td> <fmt:formatDate value="${dto.writeday }" pattern="yyyy-MM-dd"/></td>
					<td style="text-align: center;">${dto.readcount }</td>
					<td style="text-align: center;">${dto.likes }</td>
					</tr>
			</c:forEach>
		</tbody>
	
	<thead>
	<tr>
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