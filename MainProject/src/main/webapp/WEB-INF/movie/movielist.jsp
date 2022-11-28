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
<title>MovieList</title>
<style type="text/css">
	* {
	    box-sizing: border-box;
	}
	
	button.nav-link {
		color: #333;
	}
	#home-tab.active,#profile-tab.active,#contact-tab.active {
		color: #503396;
	}
	#home-tab:hover,#profile-tab:hover,#contact-tab:hover {
		color: #503396;
	}

	a:visited {
	    color: #666;
	    text-decoration: none;
	    outline: 1px dotted #000;
	}
	
	.mt40 {
	    margin-top: 40px;
	}
	.movie-list-util {
	    overflow: hidden;
	    margin-bottom: 15px;
	}

	.movie-list-util .movie-search .input-text {
	    display: block;
	    width: 100%;
	    height: 34px;
	    border: 0;
	}
	.movie-list-util .movie-search {
	    position: relative;
	    float: right;
	    width: 230px;
	    height: 36px;
	    margin: 0;
	    padding: 0 31px 0 0;
	    border: 1px solid #d8d9db;
	    border-radius: 3px;
	}
	.movie-list-util button {
	    margin: 0;
	    padding: 0;
	    border: 0;
	    background-color: transparent;
	}
	.movie-list-util .movie-search .btn-search-input {
	    position: absolute;
	    right: 1px;
	    top: 1px;
	}
	.btn-search-input {
	    overflow: hidden;
	    width: 30px;
	    height: 32px;
	    margin: 0;
	    padding: 0;
	    font-size: 0;
	    line-height: 0;
	    border: 0;
	    text-indent: -9999px;
	    background: #fff url(https://img.megabox.co.kr/static/pc/images/common/btn/btn-search-input.png) no-repeat center;
	}

	.page-util {
	    display: block;
	    position: static;
	    width: 100%;
	    height: 42px;
	    background-color: #f8f8fa;
	}
	.page-util.fixed {
		right:18px;
		width:auto
	}
	.page-util .location {
	    float: left;
	    height: 42px;
	}
	.page-util .location a {
	    display: block;
	    position: relative;
	    float: left;
	    height: 42px;
	    margin: 0 0 0 25px;
	    padding: 0;
	    line-height: 46px;
	    color: #666;
	}
	.page-util .location span {
	    overflow: hidden;
	    display: block;
	    float: left;
	    width: 13px;
	    height: 100%;
	    margin: 0;
	    padding: 0;
	    text-indent: -9999px;
	    background: url(https://img.megabox.co.kr/static/pc/images/common/bg/bg-location-home.png) no-repeat center;
	}
	.page-util .location a:before, .page-util .location span.no-link:before {
	    content: '';
	    display: block;
	    position: absolute;
	    left: -14px;
	    top: 0;
	    width: 5px;
	    height: 42px;
	    background: url(https://img.megabox.co.kr/static/pc/images/common/bg/bg-location-arr.png) no-repeat left center;
	}
	
	h2.tit {
	    padding: 0 0 26px 0;
	    font-size: 1.8666em;
	    font-weight: 400;
	    letter-spacing: -1px;
	    line-height: 1.1;
	    color: #222;
	}
	.movie-list-util .no-result-count {
	    float: left;
	    margin: 0 0 0 20px;
	    padding: 1px 0 0 0;
	    color: #222;
	    line-height: 34px;
	}
/* 	ol, ul {
	    list-style-type: none;
	    margin: 0;
	    padding: 0;
	}
	
	.tab-list {
		position:static;
		width:100%;
		background-color:rgba(255,255,255)
	}
	.tab-list:after,.tab-list:before {
		content:'';
		display:table
	}
	.tab-list:after {clear:both}
	.tab-list>ul {
		position:relative;
		width:100%;height:42px;
		padding: 0;	
	}
	.tab-list>ul:after {
		content:'';
		display:block;
		position:absolute;
		left:0;bottom:0;z-index:2;width:900px;height:1px;
		background-color:#503396
	}
	.tab-list>ul>li {
	    float: left;
	    height: 42px;
	    margin: 0;
	    padding: 0;
	    border: 1px solid #ebebeb;
	    border-width: 1px 0 1px 1px;
	}
	.tab-list>ul>li.on>a:active, .tab-list>ul>li.on>a:focus, .tab-list>ul>li.on>a:hover, .tab-list>ul>li.on>a:visited {
	    color: #503396;
	    text-decoration: none;
	}
	.tab-list>ul>li.on>a {
	    z-index: 3;
	    color: #503396;
	    background-color: #fff;
	}
	.tab-list>ul>li>a {
	    position: relative;
	    display: block;
	    width: 300px;
	    height: 41px;
	    line-height: 40px;
	    padding: 0;
	    text-align: center;
	    color: #222;
	    font-size: 1.0667em;
	    text-decoration: none;
	}
	.tab-list>ul>li {
		float:left;height:42px;margin:0;
		border:1px solid #ebebeb;
		border-width:1px 0 1px 1px;
	}
	.tab-list>ul>li:last-child{border-right:1px solid #ebebeb}
	.tab-list>ul>li.on{border:1px solid #503396;border-bottom:0}
	.tab-list>ul>li>a.disabled{color:#787878;background-color:#f3f4f5}
	.tab-list>ul>li.on>a{z-index:3;color:#503396;background-color:#fff}
	.tab-list>ul>li.on>a:active,.tab-list>ul>li.on>a:focus,.tab-list>ul>li.on>a:hover,.tab-list>ul>li.on>a:visited {
		color:#503396;text-decoration:none
	}
	.tab-list.fixed.theater>ul>li.on a{background-color:transparent;border-color:#503396} */
</style>
</head>
<body>
	<!-- container -->
	<div class="container">
		<div class="page-util">
			<div class="inner-wrap">
				<div class="location">
					<span>Home</span>
	                <a href="list">영화</a>
	                <a href="list">전체영화</a>
				</div>
			</div>
		</div>
		<br><br>
		<!-- contents -->
		<div id="contents">
			<!-- inner-wrap -->
			<div class="inner-wrap">
				<h2 class="tit">전체영화</h2>
				
<!--   				<div class="tab-list fixed">
					<ul id="topMenu">
						<li><a class="box" href="">박스오피스</a></li>
						<li><a class="new" href="">최신영화</a></li>
						<li><a class="comming" href="">상영예정작</a></li>
					</ul>
				</div> -->
				
				<ul class="nav nav-tabs" id="myTab" role="tablist">
					<li class="nav-item" role="presentation">
						<button class="nav-link active" id="home-tab" data-bs-toggle="tab" data-bs-target="#boxoffice" type="button" 
							role="tab" aria-controls="boxoffice" aria-selected="true">박스오피스</button>
					</li>
					<li class="nav-item" role="presentation">
						<button class="nav-link" id="profile-tab" data-bs-toggle="tab" data-bs-target="#new" type="button" 
							role="tab" aria-controls="new" aria-selected="false">최신영화</button>
					</li>
					<li class="nav-item" role="presentation">
						<button class="nav-link" id="contact-tab" data-bs-toggle="tab" data-bs-target="#comming" type="button" 
							role="tab" aria-controls="comming" aria-selected="false">상영예정작</button>
					</li>
				</ul>	
			</div>				
		<!-- movie-list-util -->
			<div class="movie-list-util mt40">
				<!-- 검색결과 없을 때 -->
				<p class="no-result-count"><strong id="totCnt"></strong>개의 영화가 검색되었습니다.</p>
				<!--// 검색결과 없을 때 -->

				<div class="movie-search">
					<input type="text" title="영화명을 입력하세요" id="ibxMovieNmSearch" name="ibxMovieNmSearch" placeholder="영화명 검색" class="input-text">
					<button type="button" class="btn-search-input" id="btnSearch">검색</button>
				</div>
			</div>
			
			<div class="tab-content" id="myTabContent">
				<div class="tab-pane fade show active" id="boxoffice" role="tabpanel" aria-labelledby="home-tab">
					<!-- 박스오피스 -->
					<div class="topSort" style="display: block;">
						<div class="movie-sorting sortTab">
<!-- 						<span><button type="button" class="btn on" sort-type="ticketing">예매율순</button></span> -->
<!-- 						<span><button type="button" class="btn" sort-type="accmAdnc">누적관객순</button></span> -->
<!-- 						<span><button type="button" class="btn" sort-type="megaScore">메가스코어순</button></span> -->
						</div>
	
					</div>
					<!--// 박스오피스 -->
				</div>
				<div class="tab-pane fade" id="new" role="tabpanel" aria-labelledby="profile-tab">
					<!-- 최신영화 -->
					<div class="topSort">
						<div class="movie-sorting sortTab">
							<span><button type="button" class="btn on" sort-type="ticketing">예매율순</button></span>
							<span><button type="button" class="btn" sort-type="accmAdnc">누적관객순</button></span>
						</div>
					</div>
					<!--// 최신영화 -->
				</div>
				<div class="tab-pane fade" id="comming" role="tabpanel" aria-labelledby="contact-tab">
					<!-- 상영예정작 -->
					<div class="topSort">
						<div class="movie-sorting sortTab">
							<span><button type="button" class="btn on" sort-type="rfilmDe">개봉일순</button></span>
							<span><button type="button" class="btn" sort-type="title">가나다순</button></span>
						</div>
					</div>
					<!--// 상영예정작 -->
				</div>
			</div>
		</div>
	</div>
	
<script type="text/javascript">
/* 	$('#topMenu li a.new').click(function() {
	    $(this).parent("#topMenu li").addClass("on");
	    var a = $(this).parent("#topMenu li");
	    $(a).siblings("#topMenu li").removeClass("on");
	}) */
</script>
</body>
</html>