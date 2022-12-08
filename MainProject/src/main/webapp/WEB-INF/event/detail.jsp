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
<script>
$(window).scroll(function(){
	if ($(this).scrollTop() > 300){
		$('.btn_gotop').show();
	} else{
		$('.btn_gotop').hide();
	}
});
$('.btn_gotop').click(function(){
	$('html, body').animate({scrollTop:0},400);
	return false;
});
</script>
</head>
<body>

<div style="position: fixed;bottom: 100px;right: 100px; ">
<a class="btn_gotop" style="" href ="#header"><img style="width: 50px;height: 50px;" alt="" src="../save/m_top.png"> </a>
</div>
<div style="position: fixed;bottom: 600px;right: 300px; ">
<c:if test="${sessionScope.loginok!=null and sessionScope.myid=='admin' }">
		<button type="button" class="btn btn-outline-info"
		onclick="location.href='updateform?num=${dto.num}'">수정</button>
		<button type="button" class="btn btn-outline-info"
		onclick="location.href='delete?num=${dto.num}'">삭제</button>
		</c:if>
</div>
<div class="container mt-3" id="header" style="width: 1200px;" >
<table class="table table-bordered">

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