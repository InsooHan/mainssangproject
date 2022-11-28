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
.container{}
.one
{

}
</style>
</head>
<body>
<table class="table table-bordered" style="width: 1500px; height:800px; margin-left: 200px; margin-top: 20px;">
	<tr>
		<td class="container one" style="width: 95px;">

			<div class="item" style="background-color: red; color: white; width: 95px;"><b>상영시간</b></div>
			<div class="item" style="background-color: lightgray;"><b>인원/좌석</b></div>
			<div class="item" style="background-color: lightgray;"><b>결제</b></div>
			<div class="item" style="background-color: lightgray;"><b>결제완료</b></div>

		</td>

		<td>
			<div class="list-group">
			  <a href="#" class="list-group-item list-group-item-action">지역</a>
			  <a href="#" class="list-group-item list-group-item-action">MY영화관</a>
			  <a href="#" class="list-group-item list-group-item-action">서울</a>
			  <a href="#" class="list-group-item list-group-item-action">경기/인천</a>
			  <a href="#" class="list-group-item list-group-item-action">충청/대전</a>
			  <a href="#" class="list-group-item list-group-item-action">전라/광주</a>
			  <a href="#" class="list-group-item list-group-item-action">경북/대구</a>
			  <a href="#" class="list-group-item list-group-item-action">경남/부산/울산</a>
			  <a href="#" class="list-group-item list-group-item-action">강원</a>
			  <a href="#" class="list-group-item list-group-item-action">제주</a>
			</div>
			
			<ul>
				<li>지역</li>
				<li>MY영화관</li>
				<li>서울</li>
				<li>경기/인천</li>
				<li>충청/대전</li>
				<li>전라/광주</li>
				<li>경북/대구</li>
				<li>경남/부산/울산</li>
				<li>강원</li>
				<li>제주</li>
			</ul>
		</td>
		
		<td>
			<ul>
				<li>극장</li>
			</ul>
		</td>
		
		<td>
			<ul>
				<li>영화선택</li>
			</ul>
		</td>
		
		<td>
			<ul>
				<li>날짜</li>
			</ul>
		</td>
	</tr>
</table>
</body>
</html>