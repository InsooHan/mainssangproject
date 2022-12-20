<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=Dongle&family=Jua&family=Nanum+Pen+Script&family=Noto+Sans+KR:wght@300;400;500;700&display=swap" rel="stylesheet">
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
<style type="text/css">
	.storelist a{
	cursor: pointer;
	color: black;
	}
</style>
</head>
<body>
<div class="container" style="margin-top: 50px; font-family: Noto Sans KR;">
	
	<!-- 관리자만 보이는 상품 추가 버튼 -->
	<c:if test="${sessionScope.loginok!=null && sessionScope.myid=='admin'}">
		<button type="button" class="btn btn-primary" style="float: right;" onclick="location.href='form'">상품 추가</button>
	</c:if>
		
	<!-- 스토어 카테고리 -->
	<div class="container mt-3">
	  	<!-- 장바구니 아이콘 -->
	  	<div style="position: relative;">
	  	<a href="cart" style="font-size: 2.0em; float: right; color:#503396;">
	  	<i class="fa-solid fa-cart-shopping" style="margin-right: 100px;"></i>
	  	</a>
	  	<div style="border-radius: 100px; background-color: #339EB2; position:absolute; top: 0; right:88px; z-index:10; color: white; width: 25px; height: 25px; text-align: center; vertical-align: middle;">
	  		${cartlistcount }
	  	</div>
	  	</div>
	  	<!-- 장바구니 아이콘 end -->
	  <p style="font-size: 2.5em; color: #252451; font-weight: 700;" align="left">스토어
	  </p>
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
	
	  <!-- 탭 클릭시 카테고리별 출력 -->
	  <div class="tab-content">
	  	<!-- 전체 스토어 탭 -->
	    <div id="storelist" class="container tab-pane active"><br>
	      <p style="font-size: 1.6em; font-weight: 400; color: #252451;">전체 상품</p>
	      <p>총 ${totalCount }개의 상품이 있습니다.</p>
	      <div class="storemain">
	      	  <div class="storeevent" style="display: flex;">
		      <img alt="" src="../image/storecoupon.png" style="vertical-align: top;">
		      <div class="eventment" style="flex: 1; margin-top: 70px;">
		      <p style="font-size: 2em; font-weight: 600; color: #339EB2;">메가박스 기프트 카드 런칭!</p>
		      <p style="font-size: 2em; font-weight: 600; color: #503396;">소중한 분께 기프트 카드를 선물하세요!</p>
		      </div>
		      </div>
		      <!-- 전체 상품 리스트 start -->
			  <hr>
			  <div class="storelist storealllist">
		      <table class="table table-borderless" style="text-align: center;">
		      	<tr>
		    	<c:forEach var="dto" items="${list}" varStatus="i">
		    		<td>
		    			<a href="detail?store_num=${dto.store_num }"><div>
		    				<img alt="" src="../save/${dto.store_photo }">
		    			</div>
		    			<b style="font-size: 1.2em;"> ${dto.store_product }</b>
		    			</a>
		    			<p> ${dto.store_content }</p>
		    			<fmt:formatNumber value="${dto.store_price}" type="currency"></fmt:formatNumber>
		    		</td>
		    	<c:if test="${(i.count+4)%4==0}">
		    	</tr>
		    	<tr>
		    	</c:if>
		    	</c:forEach>
		      </table>
		      </div>
		      <!-- 전체 상품 리스트 end -->
	      </div>
	    </div>

		<!-- 기프트카드 탭 -->
	    <div id="giftcard" class="container tab-pane fade"><br>
	      <p style="font-size: 1.6em; font-weight: 400; color: #252451;">기프트카드</p>
	      <!-- 기프트카드 상품 리스트 start -->
			  <hr>
			  <div class="storelist storegiftcardlist">
		      <table class="table table-borderless" style="text-align: center;">
		      	<tr>
		    	<c:forEach var="dto" items="${list}" varStatus="g">
		    	<c:set var="category" value="${dto.store_category }"></c:set>
		    	<c:if test="${category=='giftcard'}">
		    		<td>
		    			<a href="detail?store_num=${dto.store_num }"><div>
		    				<img alt="" src="../save/${dto.store_photo }">
		    			</div>
		    			<b style="font-size: 1.2em;"> ${dto.store_product }</b>
		    			</a>
		    			<p> ${dto.store_content }</p>
		    			<fmt:formatNumber value="${dto.store_price}" type="currency"></fmt:formatNumber>
		    		</td>
			    	<c:if test="${(g.count+4)%4==0}">
			    	</tr>
			    	<tr>
			    	</c:if>
		    	</c:if>
		    	</c:forEach>
		      </table>
		      </div>
		      <!-- 기프트카드 상품 리스트 end -->
	    </div>
	    
	    <!-- 메가티켓 탭 -->
	    <div id="ticket" class="container tab-pane fade"><br>
	      <p style="font-size: 1.6em; font-weight: 400; color: #252451;">메가티켓</p>
	      <!-- 메가티켓 상품 리스트 start -->
			  <hr>
			  <div class="storelist storegiftcardlist">
		      <table class="table table-borderless" style="text-align: center;">
		      	<tr>
		    	<c:forEach var="dto" items="${mtlist}" varStatus="i">
		    		<td>
		    			<a href="detail?store_num=${dto.store_num }"><div>
		    				<img alt="" src="../save/${dto.store_photo }">
		    			</div>
		    			<b style="font-size: 1.2em;"> ${dto.store_product }</b>
		    			</a>
		    			<p> ${dto.store_content }</p>
		    			<fmt:formatNumber value="${dto.store_price}" type="currency"></fmt:formatNumber>
		    		</td>
			    	<c:if test="${(i.count+4)%4==0}">
			    	</tr>
			    	<tr>
			    	</c:if>
		    	</c:forEach>
		      </table>
		      </div>
		      <!-- 메가티켓 상품 리스트 end -->
	    </div>
	    
	    <!-- 팝콘/음료/굿즈 탭 -->
	    <div id="popcorn" class="container tab-pane fade"><br>
	      <p style="font-size: 1.6em; font-weight: 400; color: #252451;">팝콘/음료/굿즈</p>
	      <!-- 팝콘/음료/굿즈 상품 리스트 start -->
			  <hr>
			  <div class="storelist storegiftcardlist">
		      <table class="table table-borderless" style="text-align: center;">
		      	<tr>
		    	<c:forEach var="dto" items="${list}" varStatus="g">
		    	<c:set var="category" value="${dto.store_category }"></c:set>
		    	<c:if test="${category=='food'}">
		    		<td>
		    			<a href="detail?store_num=${dto.store_num }"><div>
		    				<img alt="" src="../save/${dto.store_photo }">
		    			</div>
		    			<b style="font-size: 1.2em;"> ${dto.store_product }</b>
		    			</a>
		    			<p> ${dto.store_content }</p>
		    			<fmt:formatNumber value="${dto.store_price}" type="currency"></fmt:formatNumber>
		    		</td>
			    	<c:if test="${(g.count+4)%4==0}">
			    	</tr>
			    	<tr>
			    	</c:if>
		    	</c:if>
		    	</c:forEach>
		      </table>
		      </div>
		      <!-- 팝콘/음료/굿즈 상품 리스트 end -->
	    </div>
	    
	    <!-- 포인트몰 탭 -->
	    <div id="pointmall" class="container tab-pane fade"><br>
	      <p style="font-size: 1.6em; font-weight: 400; color: #252451;">전체 상품</p>
	      <p>총 ${totalCount }개의 상품이 있습니다.</p>
	      <div class="storemain">
	      	  <div class="storeevent" style="display: flex;">
		      <img alt="" src="../image/pointmall.png" style="vertical-align: top; margin-left:20px; width: 220px; height: 220px;">
		      <div class="eventment" style="flex: 1; margin-top: 65px; margin-left: 40px;">
		      <p style="font-size: 2em; font-weight: 600; color: #339EB2;">메가박스 포인트몰 오픈!</p>
		      <p style="font-size: 2em; font-weight: 600; color: #503396;">메가박스 포인트로 상품을 구매하세요!</p>
		      </div>
		      </div>
		      <!-- 전체 상품 리스트 start -->
			  <hr>
			  <div class="storelist storealllist">
		      <table class="table table-borderless" style="text-align: center;">
		      	<tr>
		    	<c:forEach var="dto" items="${list}" varStatus="i">
		    		<td>
		    			<a href="detail?store_num=${dto.store_num }"><div>
		    				<img alt="" src="../save/${dto.store_photo }">
		    			</div>
		    			<b style="font-size: 1.2em;"> ${dto.store_product }</b>
		    			</a>
		    			<p> ${dto.store_content }</p>
		    			<fmt:formatNumber value="${dto.store_price}" type="currency"></fmt:formatNumber>
		    		</td>
		    	<c:if test="${(i.count+4)%4==0}">
		    	</tr>
		    	<tr>
		    	</c:if>
		    	</c:forEach>
		      </table>
		      </div>
		      <!-- 전체 상품 리스트 end -->
	    </div>
	  </div>
	</div>
	
	

</div>
</body>
</html>