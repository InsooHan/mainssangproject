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
<form action="update" method="post" enctype="multipart/form-data" >
  <input type="hidden" name="num" value="${dto.num }">
  <table class="table table-bordered" style="width: 600px;">
    <caption><h4 class="alert alert-danger"><b>회원수정</b></h4></caption>
      
      <tr>
         <th style="background-color: #ffe4e1; width: 150px;" >회원명</th>
        <td>
          <input type="text" name="name" class="form-control" style="width: 150px;"
           value="${dto.name }">
        </td>
      </tr>
      <tr>
        <th style="background-color: #ffe4e1">이메일</th>
        <td>
          <input type="email" name="email" class="form-control" style="width: 200px;"
          placeholder="이메일을 입력하세요" required="required" value="${dto.email }">
        </td>
      </tr>
      <tr>
        <th style="background-color: #ffe4e1">연락처</th>
        <td>
          <input type="tel" name="hp" class="form-control" style="width: 250px;"
          placeholder="연락처를 입력하세요" required="required" value="${dto.hp }">
        </td>
      </tr>
      <tr>
       <th style="background-color: #ffe4e1">주소</th>
        <td>
          <input type="text" name="addr" class="form-control" style="width: 250px;"
          placeholder="주소 입력하세요" required="required" value="${dto.addr }">
        </td>
      </tr>
      
      
      <tr>
        <td colspan="2" align="center">
          <button type="submit" class="btn btn-info" style="width: 200px;">정보수정</button>
        </td>
      </tr>
  </table>

</form>
</body>
</html>