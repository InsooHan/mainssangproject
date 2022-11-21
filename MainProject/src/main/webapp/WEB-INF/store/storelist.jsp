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

		<!-- 메뉴 템플릿 css 추가-->
 	<link href="https://fonts.googleapis.com/css?family=Quicksand:400,600,700&display=swap" rel="stylesheet"> 

    <link rel="stylesheet" href="template/fonts/icomoon/style.css">

    <link rel="stylesheet" href="template/css/owl.carousel.min.css">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="template/css/bootstrap.min.css">
    
    <!-- Style -->
    <link rel="stylesheet" href="template/css/style.css">
    <!-- 메뉴 템플릿 css end-->

<title>Insert title here</title>
</head>
<body>
<div class="container" style="margin-top: 70px;">
	
	<!-- 관리자만 보이는 상품 추가 버튼 -->
	<c:if test="${sessionScope.loginok!=null && sessionScope.myid=='admin'}">
		<button type="button" class="btn btn-primary" style="float: right;" onclick="location.href='insert'">상품 추가</button>
	</c:if>
		
	<!-- 스토어 카테고리 -->
	<div class="container mt-3">
	  <h2>스토어</h2>
	  <br>
	  <!-- 카테고리 메뉴 -->
	  <ul class="nav nav-tabs" role="tablist" style="text-align: center;">
	    <li class="nav-item" style="width: 20%;">
	      <a class="nav-link active" data-bs-toggle="tab" href="#storelist">전체 스토어</a>
	    </li>
	    <li class="nav-item" style="width: 20%;">
	      <a class="nav-link" data-bs-toggle="tab" href="#giftcard">기프트 카드</a>
	    </li>
	    <li class="nav-item" style="width: 20%;">
	      <a class="nav-link" data-bs-toggle="tab" href="#ticket">메가티켓</a>
	    </li>
	    <li class="nav-item" style="width: 20%;">
	      <a class="nav-link" data-bs-toggle="tab" href="#popcorn">팝콘/음료/굿즈</a>
	    </li>
	    <li class="nav-item" style="width: 20%;">
	      <a class="nav-link" data-bs-toggle="tab" href="#pointmall">포인트몰</a>
	    </li>
	  </ul>
	
	  <!-- 메뉴 클릭시 카테고리별 출력 -->
	  <div class="tab-content">
	    <div id="storelist" class="container tab-pane active"><br>
	      <h3>전체 상품</h3>
	      <p>총 ${totalCount }개의 상품이 있습니다.</p>
	      
	      
	    </div>
	    <div id="giftcard" class="container tab-pane fade"><br>
	      <h3>기프트 카드</h3>
	      <p>Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
	    </div>
	    <div id="ticket" class="container tab-pane fade"><br>
	      <h3>메가티켓</h3>
	      <p>Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
	    </div>
	    <div id="popcorn" class="container tab-pane fade"><br>
	      <h3>팝콘/음료/굿즈</h3>
	      <p>Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam.</p>
	    </div>
	    <div id="pointmall" class="container tab-pane fade"><br>
	      <h3>포인트몰</h3>
	      <p>Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam.</p>
	    </div>
	  </div>
	</div>
	
	


</div>
</body>
</html>