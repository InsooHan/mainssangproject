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
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script>
	$(function(){
		if(${msg ne null}){
			alert('${msg}');
		};
		
		if($("#pwForm").submit(function(){
			if($("#pw").val() !== $("#pw2").val()){
				alert("비밀번호가 다릅니다.");
				$("#pw").val("").focus();
				$("#pw2").val("");
				return false;
			}else if ($("#pw").val().length < 8) {
				alert("비밀번호는 8자 이상으로 설정해야 합니다.");
				$("#pw").val("").focus();
				return false;
			}else if($.trim($("#pw").val()) !== $("#pw").val()){
				alert("공백은 입력이 불가능합니다.");
				return false;
			}
		}));
		
		  //탈퇴
		  $(".btndelete").click(function(){
				
				var num=$(this).attr("num");

				var ans=confirm("정말 탈퇴하시겠습니까?");
				if(ans){
					$.ajax({
						type:"get",
						dataType:"text",
						url:"deleteme",
						data:{"num":num},
						success:function(res){
							alert("탈퇴하셨습니다");
							location.reload();
						}
					});
				}
			}); 
	})
</script>
<title>마이페이지</title>
</head>
<body>
	<br><br>
	<div class="my" align="center" style="width: 800px; border: 1px solid gray; border-radius: 10px; padding: 40px; margin-left: 380px;">
		<i class="fa-solid fa-circle-user" style="font-size: 80pt;"></i><br><br>
		${dto.name }<br><br>
		<i class="fa-solid fa-mobile-screen-button"></i>&nbsp;${dto.hp }<br><br>
		<i class="fa-solid fa-envelope"></i>&nbsp;<span style="font-size: 13pt;">${dto.email }</span><br>
		<br>
		<i class="fa-solid fa-map-location-dot"></i>&nbsp;${dto.addr }<br><br>
		<br>
		<button type="button" class="btn btn-dark" onclick="location.href='updateform?num=${dto.num}'">정보수정</button>
		<button type="button" class="btn btn-dark btndelete" num=${dto.num }>회원탈퇴</button>
	</div>
</body>
</html>
</body>
</html>