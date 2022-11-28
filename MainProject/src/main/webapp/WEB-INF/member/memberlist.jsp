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
	  
	  //전체선택하면 체크박스 선택해제
	  $("#allcheck").click(function(){
		  
		  //체크값얻기
		  var chk=$(this).is(":checked");
		  console.log(chk);
		  
		  //전체를 각 글앞의 체크에 일괄전달
		  $(".del").prop("checked",chk);
	  });
	  
	  
	  $("#btnmemberdel").click(function(){
		  
		  //체크한인원수 구하기
		  var cnt=$(".del:checked").length;
		  //alert(cnt);
		  
		  if(cnt==0){
			  alert("먼저 삭제할 회원을 선택해주세요");
			  return;
		  }
		  
		  $(".del:checked").each(function(i,elt){
			  
			  var num=$(this).attr("num");
			  console.log(num);
			  
			  
			  $.ajax({
				  type:"get",
				  url:"delete",
				  dataType:"html",
				  data:{"num":num},
				  success:function(){
					  
					  alert("삭제되었습니다");
					  //새로고침
					  location.reload();
				  }
				  
			  });
			  
			  
		  });
		  
	  });
  });

</script>
</head>
<body>
<h3 class="alert alert-info">${count }명의 회원이 가입하셨습니다</h3>
 <c:if test="${sessionScope.loginok!=null and sessionScope.myid=='admin' }">
<hr>
<table class="table table-bordered" style="width: 1000px;">
  <caption><b>전체 회원명단</b></caption>
    <tr style="background-color: #f0ffff">
       <th style="width: 50px;">번호</th>
       <th style="width: 180px;">이름</th>
       <th style="width: 100px;">아이디</th>
       <th style="width: 120px;">핸드폰</th>
       <th style="width: 160px;">주소</th>
       <th style="width: 150px;">이메일</th>
       <th style="width: 150px;">가입일</th>
       <th style="width: 80px;"><input type="checkbox" id="allcheck">삭제</th>
       
    </tr>
    
    <c:forEach var="dto"  items="${list }" varStatus="i">
      <tr>
        <td>${i.count }</td>
        <td>
          <img alt="" src="../photo/${dto.photo }" style="width: 30px; height: 30px;">&nbsp;&nbsp;
          ${dto.name }
        </td>
        <td> ${dto.id }</td>
        <td> ${dto.hp }</td>
        <td> ${dto.addr }</td>
        <td> ${dto.email }</td>
        <td> <fmt:formatDate value="${dto.gaipday }" pattern="yyyy-MM-dd HH:mm"/></td>
        <td><input type="checkbox" class="del" num=${dto.num}></td>
      </tr>
    
    </c:forEach>
</table>
<button type="button" class="btn btn-danger btn-sm" style="margin-left: 930px;" id="btnmemberdel">Delete</button>
</c:if>
</body>
</html>