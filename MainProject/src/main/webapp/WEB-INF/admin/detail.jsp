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
<table class="table table-bordered" style="width: 700px;">
	<tr>
		<td>
			<h2>[${dto.division }]<b>${dto.subject }</b></h2>
			
				
			<span style="color:gray;font-size: 13px; color: gray; float: right;" >
				등록일:<fmt:formatDate value="${dto.writeday }" pattern="yyyy-MM-dd HH:mm"/>
				&nbsp;&nbsp;
				조회&nbsp;${dto.readcount }회
			</span>
		</td>
	</tr>
	<tr height="300" valign="top">
		<td>
			<pre style="background-color: #fff; border: 0px;" >${dto.content }</pre>
			<br><br>
			<c:if test="${dto.photo!='no' }">
				<c:forTokens var="photo" items="${dto.photo }" delims=",">
					<img alt="" src="../save/${photo }" width="100" class="img-tumbnail">
				</c:forTokens>
			
			</c:if>
			<br><br>
			
		</td>
	</tr>
<tr>
	<td>
		<button type="button" class="btn btn-outline-info"
		onclick="location.href='list?currentPage=${currentPage}'">목록</button>
		<!-- 로그인 중이면서 세션의 아이디와 글의 아이디가 같을 경우에만 수정 삭제 나오게 -->
		<c:if test="${sessionScope.loginok!=null and sessionScope.myid=='admin' }">
		<button type="button" class="btn btn-outline-info"
		onclick="location.href='updateform?num=${dto.num}&currentPage=${currentapge }'">수정</button>
		<button type="button" class="btn btn-outline-info"
		onclick="location.href='delete?num=${dto.num}'">삭제</button>
		</c:if>
	</td>
</tr>


</table>
</body>
</html>