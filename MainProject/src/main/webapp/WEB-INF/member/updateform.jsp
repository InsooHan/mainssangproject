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
#showimg{
	border: 1px solid gray;
	width: 130px;
	height: 160px;
}

</style>

</head>
<body>
	<div class="w3-content w3-container w3-margin-top">
		<div class="w3-container w3-card-4">
			<div class="w3-center w3-large w3-margin-top" align="center">
				<br><h3>회원정보 수정</h3>
				<br>
			</div>
			<div align="center">
				<form id="myForm" action="../member/update_mypage.do" method="post">
					<p>
						<label>Name</label> 
						<input class="w3-input" type="text" id="name" name="name" value="${ dto.name }" required> 
					</p>
					<p>
						<label>Hp</label> 
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input class="w3-input" type="text" id="hp" name="hp" value="${ dto.hp }" required> 
					</p>
					<p>
						<label>Email</label> 
						<input class="w3-input" type="text" id="email" name="email" value="${ dto.email }" required> 
					</p>
					<p>
						<label>Address</label> 
						<input class="w3-input" type="text" id="addr" name="addr" value="${ dto.addr }" required> 
					</p>
					<p class="w3-center">
						<button type="submit" class="w3-button w3-block w3-black w3-ripple w3-margin-top w3-round">회원정보 변경</button>
					</p>
				</form>
				<br />
				<form id="pwForm" action="../member/update_pw.do" method="post">	
					<input type="hidden" name="id" value="${ member.id }">
					<p>
						<label>Password</label>
						<input class="w3-input" id="old_pw" name="old_pw" type="password" required>
					</p>
					<p>
						<label>New Password</label> 
						<input class="w3-input" id="pw" name="pw" type="password" required>
					</p>
					<p>
						<label>Confirm</label>
						<input class="w3-input" type="password" id="pw2" type="password" required>
					</p>
					<p class="w3-center">
						<button type="submit" id="joinBtn" class="w3-button w3-block w3-black w3-ripple w3-margin-top w3-round">비밀번호 변경</button>
					<br>
					<br>
					</p>
				</form>
			</div>
		</div>
	</div>
</body>
</html>