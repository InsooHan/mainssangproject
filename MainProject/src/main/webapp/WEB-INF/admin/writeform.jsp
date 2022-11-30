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
<div class="container">
<form action="insert" method="post" enctype="multipart/form-data">
	<table class="table table-bordered" style="width: 500px;">
		<caption><b>공지</b></caption>
		<tr>
			<th width="120" bgcolor="pink">제목</th>
				<td>
					<input type="text" name="subject" class="form-control"
					required="required">
				</td>
		</tr>
		<tr>
			<th width="120" bgcolor="pink">구분</th>
				<td>
					<input type="radio" name="division" 
					value='시스템점검'>시스템점검
					<input type="radio" name="division" 
					value='극장'>극장
					<input type="radio" name="division"
					value='기타' checked="checked">기타
				</td>
		</tr>
		<tr>
			<th width="120" bgcolor="pink">사진</th>
				<td>
					<input type="file" name="upload" class="form-control">
				</td>
		</tr>
		<tr>
			<td colspan="2" align="center">
			<!-- <input type="text" style="width: 490px; height: 150px;" class="form-control"
			name="content" required="required"> -->
			<textarea style="width: 490px;height: 150px;" name="content" class="form-control"></textarea>
			</td>
		</tr>
		<tr>
			<td colspan="2" align="center">
				<button type="submit" class="btn btn-default" style="width: 100px;">등록</button>
				<button type="button" class="btn btn-default" style="width: 100px;"
				onclick="location.href='list'">목록</button>
			</td>
			
		</tr>
	</table>
</form>
</div>
</body>
</html>