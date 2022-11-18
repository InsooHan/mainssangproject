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

    <link rel="stylesheet" href="fonts/icomoon/style.css">

    <link rel="stylesheet" href="css/owl.carousel.min.css">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="css/bootstrap.min.css">
    
    <!-- Style -->
    <link rel="stylesheet" href="css/style.css">
    <!-- 메뉴 템플릿 css end-->


<title>Insert title here</title>

</head>
<body>
<!-- NAVBAR -->
    <header class="site-navbar mt-3">
      <div class="container-fluid">
        <div class="row align-items-center">
        <!-- 좌측 상단 로고 -->
          <div class="site-logo col-6"><a href="#"><img alt="" src="../save/megabox_logo.png" style="width: 150px;"> </a></div>

		  <!-- 메뉴 탭 start -->
          <nav class="mx-auto site-navigation" style="text-align: center; ">
            <ul class="site-menu js-clone-nav d-none d-xl-block ml-0 pl-0">
              <li class="has-children">
                <a href="job-listings.html">영화</a>
                <ul class="dropdown">
                  <li><a href="job-single.html">최신 영화</a></li>
                  <li><a href="post-job.html">박스오피스</a></li>
                </ul>
              </li>
              <li><a href="blog.html">예매</a></li>
              <li><a href="blog.html">스토어</a></li>
              <li><a href="contact.html">커뮤니티</a></li>
              <li class="has-children">
              <a href="contact.html">이벤트/공지사항</a>
              <ul class="dropdown">
                  <li><a a href="${root }/admin/list">이벤트</a></li>
                  <li><a href="post-job.html">공지사항</a></li>
                </ul>
                </li>
            </ul>
          </nav>
          <!-- 메뉴 탭 end -->
          
          <div class="right-cta-menu text-right d-flex aligin-items-center col-6">
            <div class="ml-auto">
            	<!-- 검색 버튼 만들기~!~!~!~!~!~!~!~!~!~!~!~!~!~!~  -->
            	
            	
            	<!-- 로그인 유무에 따른 로그인/로그아웃 -->
            	<div class="login">
					<c:if test="${sessionScope.loginok==null}">
						<button type="button" class="btn btn-outline-white border-width-2 d-none d-lg-inline-block" onclick="location.href='${root}/login/main'" style="position:relative; z-index:999; background-color: #339EB2; border: 0px; color: white;">로그인</button>
					</c:if>
					<c:if test="${sessionScope.loginok!=null}">
						<b>${sessionScope.myid }님이 로그인 중입니다.</b>
						<button type="button" class="btn btn-info btn-m" onclick="location.href='${root}/login/main'" style="background-color: #339EB2; border: 0px; color: white;">로그아웃</button>
					</c:if>
					
				</div>
            	
            </div>
          </div>

        </div>
      </div>
    </header>
    
    <!-- 템플릿 스크립트 -->
    <script src="js/jquery-3.3.1.min.js"></script>
    <script src="js/popper.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/jquery.sticky.js"></script>
    <script src="js/main.js"></script>
    

</body>
</html>