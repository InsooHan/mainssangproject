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
<script type="text/javascript">
  $(function(){
	  
	  $(".btnnewphoto").click(function(){
		  
		  $("#newphoto").trigger("click");
	  });
	  
	  $("#newphoto").change(function(){
		  
		  var num=$(this).attr("num");
		  console.log(num);
		  //alert(num);
		  
		  var form=new FormData();
		  form.append("photo",$("#newphoto")[0].files[0]); //선택한 1개만 추가
		  form.append("num",num);
		  
		  console.dir(form);
		  
		  $.ajax({
			  type:"post",
			  dataType:"text",
			  url:"updatephoto",
			  data:form,
			  processData:false,
			  contentType:false,
			  success:function(){
				  
				  location.reload();
			  }
		  });
	  });
	  
	  
	  //탈퇴
	  $(".btndelete").click(function(){
			
			var num=$(this).attr("num");
			alert(num);
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

	  
  });


</script>
</head>
<body>
<div style="margin: 50px;">
<table class="table table-bordered" style="width: 800px;">
  <c:forEach  var="dto" items="${list }">
    <c:if test="${sessionScope.loginok!=null and sessionScope.myid==dto.id }">
    <tr>
      <td style="width: 250px;" align="center" rowspan="5">
         <img alt="" src="../photo/${dto.photo }" width="230" height="230" border="1">
         <br><br>
         <input type="file" id="newphoto" style="display: none;" num=${dto.num }>  <!--사진수정시호출  -->
         <button type="button" class="btn btn-info btnnewphoto">사진수정</button>
      </td>
      <td style="width: 300px;">회원명: ${dto.name } </td>
      <td rowspan="5" align="center"  style="width: 200px; vertical-align: middle;">
      <button type="button" class="btn btn-default"
      onclick="location.href='updateform?num=${dto.num}'">수정</button>
      <button type="button" class="btn btn-default btndelete" num=${dto.num }>탈퇴</button>
      </td>
    </tr>
    <tr>
       <td>아이디: ${dto.id }</td>
    </tr>
    <tr>
       <td>이메일: ${dto.email }</td>
    </tr>
    <tr>
       <td>핸드폰: ${dto.hp }</td>
    </tr>
    <tr>
       <td>주소: ${dto.addr }</td>
    </tr>
   </c:if> 
  </c:forEach>
</table>
</div>

</body>
</html>