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
.container
{
display: flex;
flex-direction: row;
align-items: stretch;
width: 1500px;
height: 500px;
}
.item
{
flex-grow: 1;
}
div.item div.one
{
height: 25%;
text-align: center;
line-height: 120px;
font-size: 9pt;
border: 1px groove gray;
width: 70px;
}
</style>
</head>
<body>
<div style="height: 800px; padding-top: 30px; background-color:#505050;">
<div class="container">
	<div class="item" style="flex-basis: 70px;">
		<div class="one" style="background-color: rgb(51,51,51); color: white;"><b>상영시간</b></div>
		<div class="one" style="background-color: rgb(51,51,51); color: white;"><b>인원/좌석</b></div>
		<div class="one" style="background-color: rgb(51,51,51); color: white;"><b>결제</b></div>
		<div class="one" style="background-color: #FF5050;"><b>결제완료</b></div>
	</div>
	<div class="item" style="background-color: #D7AC87; width: 1430px; text-align: center;">
		<i class="fa-solid fa-circle-check fa-7x" style="margin-top: 140px; color: #A8F552;"></i><br><br>
		<h3>결제에 성공하였습니다!</h3>
	</div>
</div>
</div>
</body>
</html>