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
	function readURL(input) {
	    if (input.files && input.files[0]) {
	        var reader = new FileReader();
	        reader.onload = function (e) {
	            $('#uploadimg').attr('src', e.target.result);
	        }
	        reader.readAsDataURL(input.files[0]);
	    }
	}
</script>
</head>
<body>
<form action="insert" method="post" enctype="multipart/form-data">
<table class="table table-bordered" margin: 50px 50px;">
	<caption><h3>상품 등록</h3></caption>
		<tr bgcolor="pink">
			<th style="width: 150px;">상품명</th>
			<th>카테고리</th>
			<th style="width: 100px;">가격</th>
			<th>상품 설명</th>
			<th style="width: 250px;">이미지</th>
			<th style="width: 350px;">미리보기</th>
		</tr>
		<tr>
			<td>
				<input type="text" class="form-control" name="store_product" required="required">
			</td>
			<td>
				<select name="store_category" class="form-control" required="required">
					<option value="giftcard">기프트카드</option>
					<option value="ticket">메가티켓</option>
					<option value="food">팝콘/음료/굿즈</option>
				</select>
			</td>
			<td>
				<input type="text" class="form-control" name="store_price" required="required">
			</td>
			<td>
				<input type="text" class="form-control" name="store_content" required="required">
			</td>
			<td>
				<input type="file" class="form-control" name="upload" onchange="readURL(this);" required="required">
			</td>
			<td>
				<div style="margin: 20px 20px;">
				    <img id="uploadimg" src="" alt="상품 이미지를 등록해주세요"  style="width: 150px; height: 150px;" />
				</div>
			</td>
		</tr>
		<tr>
			<td colspan="5" align="center">
				<button type="submit" class="btn btn-primary">등록하기</button>
				<button type="button" class="btn btn-seconday" onclick="location.href='list'">목록으로</button>
			</td>
		</tr>
		


</table>
</form>


</body>
</html>