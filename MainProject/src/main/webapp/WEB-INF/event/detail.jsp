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

<div class="container" style="width: 1200px;" >
<table class="table table-bordered">
<tr>
	<td>
		<!-- 로그인 중이면서 세션의 아이디와 글의 아이디가 같을 경우에만 수정 삭제 나오게 -->
		<c:if test="${sessionScope.loginok!=null and sessionScope.myid=='admin' }">
		<button type="button" class="btn btn-outline-info"
		onclick="location.href='updateform?num=${dto.num}'">수정</button>
		<button type="button" class="btn btn-outline-info"
		onclick="location.href='delete?num=${dto.num}'">삭제</button>
		</c:if>
	</td>
</tr>
<tr style="width: 100px;">
<br><br><br>

<p style="font-size: 2.5em; color: #252451; font-weight: 700;">${dto.subject}
<h5  style="color: gray;">기간: ${dto.startday }~${dto.endday }</h5>

<br>
<hr>
<br><br>

<div  > ${dto.content } </div>
</tr>

</table>
</div>
</body>
</html>