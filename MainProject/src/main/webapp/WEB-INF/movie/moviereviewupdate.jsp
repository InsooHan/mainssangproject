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
<title>MovieDetail</title>
<style type="text/css">
	* {
	    box-sizing: border-box;
	}
	.movie-detail-page {
	    position: relative;
	    z-index: 1;
	    height: 520px;
	    margin: 0 0 40px 0;
	    color: #ccc;
	    background-color: #151515;
	}
	.movie-detail-page .movie-detail-cont {
	    position: relative;
	    z-index: 4;
	    width: 1100px;
	    height: 100%;
	    margin: 0 auto;
	    padding: 55px 0 0 0;
	}
	/* 백그라운드 */
	.movie-detail-page .bg-mask {
	    position: absolute;
	    left: 0;
	    top: 0;
	    z-index: 4;
	    width: 100%;
	    height: 100%;
	    background: -moz-linear-gradient(left,#0f0f0f 20%,rgba(15,15,15,0) 50%,#0f0f0f 80%);
	    background: -webkit-linear-gradient(left,#0f0f0f 20%,rgba(15,15,15,0) 50%,#0f0f0f 80%);
	    background: -o-linear-gradient(left,#0f0f0f 20%,rgba(15,15,15,0) 50%,#0f0f0f 80%);
	    background: -ms-linear-gradient(left,#0f0f0f 20%,rgba(15,15,15,0) 50%,#0f0f0f 80%);
	    background: linear-gradient(to right,#0f0f0f 20%,rgba(15,15,15,0) 50%,#0f0f0f 80%);
	}
	
	/* 영화정보 */
	.movie-detail-page p {
	    margin: 0;
	    padding: 0;
	}
	p {
	    display: block;
	    margin-block-start: 1em;
	    margin-block-end: 1em;
	    margin-inline-start: 0px;
	    margin-inline-end: 0px;
	}
	.movie-detail-page .movie-detail-cont .title {
	    position: static;
	    left: inherit;
	    top: inherit;
	    width: 800px;
	    padding: 15px 0 0 0;
	    color: #fff;
	    font-size: 3.0666em;
	    font-weight: 400;
	    line-height: 1.2;
	    text-shadow: 2px 2px 10px rgb(0 0 0 / 70%);
	}
	/* 좋아요-공유하기 버튼 */
	.movie-detail-page .movie-detail-cont .btn-util {
	    padding: 15px 0 0 0;
	}
	.movie-detail-page .movie-detail-cont .btn-util .btn {
	    display: inline-block;
	    min-width: 100px;
	    height: 36px;
	    line-height: 34px;
	    margin: 0 6px 0 0;
	    padding: 0 10px;
	    font-size: .9333em;
	    color: #fff;
	    text-decoration: none;
	    text-align: center;
	    border: 1px solid #706f72;
	    border-radius: 4px;
	    background-color: transparent;
	}
	.movie-detail-page .movie-detail-cont .btn-util .btn:hover {
	    /* color: #222; */
	    background-color: #037B94;
	}
	[type=button], [type=reset], [type=submit], button {
	    -webkit-appearance: button;
	}
	button {
	    cursor: pointer;
	    letter-spacing: -.5px;
	    font-weight: 400;
	    font-family: NanumBarunGothic,Dotum,'돋움',sans-serif;
	}
	button, select {
	    text-transform: none;
	}
	button, input {
	    overflow: visible;
	}
	.btn-sns-share-group {
	    margin: 0;
	    padding: 0;
	    text-align: center;
	}
	.movie-detail-page .movie-detail-cont .btn-util .sns-share {
	    position: relative;
	    display: inline-block;
	}
	.movie-detail-page .movie-detail-cont .btn-util .sns-share .btn-sns-share-wrap:before {
	    content: '';
	    position: absolute;
	    left: 169px;
	    top: -12px;
	    display: block;
	    width: 22px;
	    height: 12px;
	    background: url(https://img.megabox.co.kr/static/pc/images/common/bg/bg-tooltip-arr-top-script.png) no-repeat 0 0;
	}
	.movie-detail-page .movie-detail-cont .btn-util .sns-share .btn-sns-share-wrap.on {
	    display: block;
	}
	.movie-detail-page .movie-detail-cont .btn-util .sns-share .btn-sns-share-wrap {
	    display: none;
	    position: absolute;
	    left: 50%;
	    top: 54px;
	    z-index: 55;
	    width: 360px;
	    height: 110px;
	    margin: 0 0 0 -180px;
	    padding: 20px 0 0 0;
	    border: 1px solid #d8d9db;
	    border-radius: 5px;
	    background-color: #fff;
	}
	.movie-detail-page .movie-detail-cont .btn-util .sns-share .btn-sns-share-wrap .btn {
	    display: inline-block;
	    min-width: 50px;
	    margin: 0 4px;
	    padding: 48px 0 0 0;
	    border: 0;
	    font-size: .9333em;
	    color: #444;
	    line-height: 1.1;
	    background-color: transparent;
	    background-position: center top;
	    background-repeat: no-repeat;
	}
	.btn-sns-share-group .btn.face {
	    background-image: url(https://img.megabox.co.kr/static/pc/images/common/btn/btn-sns-share-face.png);
	}
	.btn-sns-share-group .btn.band {
	    background-image: url(https://img.megabox.co.kr/static/pc/images/common/btn/btn-sns-share-band.png);
	}
	.btn-sns-share-group .btn.twitter {
	    background-image: url(https://img.megabox.co.kr/static/pc/images/common/btn/btn-sns-share-twitter.png);
	}
	.btn-sns-share-group .btn.link {
	    background-image: url(https://img.megabox.co.kr/static/pc/images/common/btn/btn-sns-share-link.png);
	}
	/* 평점-예매율-누적관객수 */
	.movie-detail-page .movie-detail-cont .info {
	    position: absolute;
	    left: 0;
	    bottom: 45px;
	    padding: 0;
	}
	.movie-detail-page .movie-detail-cont .info .score {
	    float: left;
	    padding: 0;
	}
	.movie-detail-page .movie-detail-cont .info .tit {
	    display: block;
	    padding: 0 0 15px 0;
	    line-height: 1.1;
	    font-size: .9333em;
	}
	.movie-detail-page .movie-detail-cont .info .score .number {
	    padding: 0 0 0 30px;
	    background: url(https://img.megabox.co.kr/static/pc/images/common/ico/ico-megabox.png) no-repeat 0 center;
	    /* font-family: Roboto,Dotum,'돋움',sans-serif; */
	    font-weight: 400;
	}	
	.movie-detail-page .movie-detail-cont .info .score .number.gt .before {
	    font-size: 2.1333em;
	    /* font-family: Roboto,Dotum,'돋움',sans-serif; */
	    font-weight: 400;
	}
	.movie-detail-page .movie-detail-cont .info .score .number .before {
	    color: #59bec9;
	}
	.movie-detail-page .movie-detail-cont .info .score .number>p {
	    display: inline-block;
	    vertical-align: middle;
	    line-height: 1.1;
	}
	
	.movie-detail-page .movie-detail-cont .info .rate {
	    float: left;
	    padding: 0 0 0 35px;
	}
	.movie-detail-page .movie-detail-cont .info .rate .cont {
	    display: inline-block;
	    min-height: 35px;
	    padding: 0 0 0 30px;
	    vertical-align: middle;
	    line-height: 1.1;
	    background: url(https://img.megabox.co.kr/static/pc/images/common/ico/ico-ticket-gray.png) no-repeat 0 center;
	}
	.movie-detail-page .movie-detail-cont .info .rate .cont em {
	    margin: 0 4px 0 0;
	    color: #fff;
	    font-size: 2.1333em;
	    /* font-family: Roboto,Dotum,'돋움',sans-serif; */
	    font-weight: 400;
	}
	/* 누적관객수 */
	.movie-detail-page .movie-detail-cont .info .audience {
	    float: left;
	    padding: 0 0 0 35px;
	}
	.ico-tooltip-gray {
	    overflow: hidden;
	    width: 16px;
	    height: 16px;
	    background-image: url(https://img.megabox.co.kr/static/pc/images/common/ico/ico-tooltip-gray.png);
	}
	.iconset {
	    overflow: hidden;
	    display: inline-block;
	    margin: -1px 0 0 0;
	    padding: 0;
	    font-size: 0;
	    line-height: 0;
	    vertical-align: middle;
	    background-position: 0 0;
	    background-repeat: no-repeat;
	}
	.movie-detail-page .movie-detail-cont .info .audience .cont {
	    display: inline-block;
	    padding: 0 0 0 30px;
	    vertical-align: middle;
	    line-height: 1.1;
	    background: url(https://img.megabox.co.kr/static/pc/images/common/ico/ico-person.png) no-repeat 0 center;
	}
	.movie-detail-page .movie-detail-cont .info .audience .cont em {
	    margin: 0 4px 0 0;
	    color: #fff;
	    font-size: 2.1333em;
/* 	    font-family: Roboto,Dotum,'돋움',sans-serif; */
	    font-weight: 400;
	}

	/* 영화포스터 */
	.poster .wrap img {
	    border: 0;

	}
	.movie-detail-page .movie-detail-cont .poster {
	    overflow: hidden;
	    display: block;
	    position: absolute;
	    right: 0;
	    top: 45px;
	    z-index: 2;
	    width: 260px;
	    height: 374px;
	}
	.movie-detail-page .movie-detail-cont .poster .wrap {
	    position: relative;
	    width: 100%;
	    height: 100%;
	    font-size: 0;
	    line-height: 0;
	}
	.movie-detail-page .movie-detail-cont .poster .wrap img {
	    display: block;
 	    width: 100%;
	    height: 100%;
	    border-radius: 10px;
	    float: right;
	}
	
	/* 관람등급 */
	.movie-detail-page .movie-detail-cont .poster .wrap .movie-grade {
	    overflow: hidden;
	    position: absolute;
	    left: 10px;
	    top: 10px;
	    z-index: 4;
	}
	.movie-grade.age-all {
	    background-image: url(https://img.megabox.co.kr/static/pc/images/common/txt/ALL_46x46.png);
	    background-size: 23px 23px;
	}
	.movie-grade.age-12 {
	    background-image: url(https://img.megabox.co.kr/static/pc/images/common/txt/12_46x46.png);
	    background-size: 23px 23px;
	}
	.movie-grade.age-15 {
	    background-image: url(https://img.megabox.co.kr/static/pc/images/common/txt/15_46x46.png);
	    background-size: 23px 23px;
	}
	.movie-grade.age-19 {
	    background-image: url(https://img.megabox.co.kr/static/pc/images/common/txt/18_46x46.png);
	    background-size: 23px 23px;
	}
	.movie-detail-page p {
	    margin: 0;
	    padding: 0;
	}
	.movie-grade {
	    overflow: hidden;
	    display: inline-block;
	    width: 23px;
	    height: 23px;
	    margin: 0;
	    padding: 0;
	    text-indent: -9999px;
	    background-position: center;
	    background-repeat: no-repeat;
	}
	
	/* 예매버튼 */
	.movie-detail-page .movie-detail-cont .screen-type {
	    overflow: hidden;
	    display: block;
	    position: absolute;
	    right: 0;
	    bottom: 45px;
	    width: 260px;
	}
 	.movie-detail-page .movie-detail-cont .screen-type .btn {
	    border-radius: 5px 5px 5px 5px;
	}
	.movie-detail-page .movie-detail-cont .screen-type .btn.reserve {
		width: 260px;
	    background-color: #329eb1;
	}
	.movie-detail-page .movie-detail-cont .screen-type .btn {
	    height: 46px;
	    line-height: 44px;
	    font-size: 1.2em;
	    margin: 0;
	    padding: 0;
	    color: #fff;
	    text-align: center;
	    border: 0;
	    border-radius: 5px;
	    background-color: transparent;
	    text-decoration: none;
	    font-weight: 700;
	}
	
	/* font색상 */
	button.nav-link {
		color: #333;
	}
	#data-tab.active,#review-tab.active,#trailer-tab.active {
		color: #503396;
	}
	#data-tab:hover,#review-tab:hover,#trailer-tab:hover {
		color: #503396;
	}

	a:visited {
	    color: #666;
	    text-decoration: none;
	    outline: 1px dotted #000;
	}
	
	/* 주요정보 */
	#nav-data .movie-summary {
	    margin: 20px 0 0 0;
	}
	#nav-data .movie-summary.on .txt {
	    height: auto;
	}
	#nav-data .movie-summary .txt {
	    overflow: hidden;
	    height: 140px;
	}
	
	.movie-info {
	    padding: 10px 0 0 80px;
	}
	.movie-info p {
	    margin: 0;
	    padding: 0;
	    color: #222;
	    font-weight: 500;
	}
	.movie-info .line p {
	    display: inline-block;
	    position: relative;
	    margin: 0;
	    padding: 0 0 0 20px;
	    color: #222;
	    font-weight: 500;
	}
	.movie-info .line p:first-child {
	    padding: 0;
	}
	.movie-info .line p:before {
	    content: '';
	    display: block;
	    position: absolute;
	    left: 9px;
	    top: 50%;
	    width: 1px;
	    height: 13px;
	    margin: -6px 0 0 0;
	    background-color: #d8d9db;
	}

	/* 평점 등.. */
	.movie-graph {
	    display: table;
	    width: 92%;
	    table-layout: fixed;
	    border-collapse: collapse;
	}
	.movie-graph .col {
	    display: table-cell;
	    width: 45%;
	    border: 1px solid #eaeaea;
	    padding: 30px 0;
	}
	.movie-graph .col dl dt {
	    font-size: 1.0667em;
	    color: #555;
	}
	dd, dl, dt {
	    margin: 0;
	    padding: 0;
	}
	.movie-graph .col dl {
	    text-align: center;
	    font-weight: 400;
	}
	.movie-graph .col dl dd {
	    padding: 0 0 30px 0;
	    line-height: 50px;
	    font-size: 2em;
	    color: #503396;
	}
	.movie-graph .col .score {
	    position: relative;
	    height: 162px;
	    margin: 30px 0 0 0;
	    text-align: center;
	}
	.movie-graph .col .score.equal .middle .circle {
	    left: 222px;
	    top: 12px;
	    z-index: 12;
	    width: 120px;
	    height: 120px;
	    line-height: 120px;
	    border-radius: 120px;
	}
	.movie-graph .col .score .middle .circle {
	    background-color: #6543b1;
	}
	.movie-graph .col .score .circle {
	    overflow: hidden;
	    display: block;
	    position: absolute;
	    color: #fff;
	    font-size: 2em;
	    font-weight: 400;
	}
	
	/* 관람평 */
	.mt40 {
	    margin-top: 40px;
	}
	.movie-list-util {
	    overflow: hidden;
	    margin-bottom: 15px;
	}
	h2.tit.small {
	    padding: 0 0 16px 0;
	    font-size: 1.4666em;
	    color: #503396;
	}
	.tit-util .tit {
	    float: left;
	    padding: 0!important;
	    line-height: 1.1;
	}
	h2.tit {
	    padding: 0 0 26px 0;
	    font-size: 1.8666em;
	    font-weight: 400;
	    letter-spacing: -1px;
	    line-height: 1.1;
	    color: #222;
	}
	.font-gblue {
	    color: #01738b!important;
	}
	
	/* 정렬 */
	.movie-sorting {
	    float: left;
	    padding: 10px 0 0 0;
	}
	.movie-sorting-right {
	    float: right;
	    padding: 10px 0 0 0;
	}
	.movie-sorting-right span .btn.on {
	    color: #222;
	    font-weight: 700;
	}
	.movie-sorting-right span .btn {
	    display: inline-block;
	    color: #666;
	}
	
	/* 관람평작성 */
	.user-prof {
	    position: relative;
	    float: left;
	    width: 105px;
	    text-align: center;
	}
	.story-box .story-wrap .story-cont {
	    display: table-cell;
	    float: none;
	    width: 910px;
	    height: 84px;
	    vertical-align: middle;
	    padding-left: 30px;
	    text-align: left;
	    color: #666;
	}
	.user-prof .user-id {
	    margin: 0;
	    width: 71px;
	    overflow: hidden;
	    text-overflow: ellipsis;
	    font-size: .9333em;
	    line-height: 1.1;
	    color: #222;
	    font-weight: 500;
	}
	
	/* 관람평 목록 */
	.story-area,.story-area,.story-area2,.story-area3 {
	    display: block;
	    width: 100%;
	}
	.user-prof {
	    position: relative;
	    float: left;
	    width: 81px;
	    text-align: center;
	}
	.user-prof .prof-img img {
	    width: 50px;
	}
	.user-prof .user-id {
	    margin: 0;
	    width: 80px;
	    overflow: hidden;
	    text-overflow: ellipsis;
	    font-size: .9333em;
	    line-height: 1.1;
	}
	.story-box {
	    float: right;
	    position: relative;
	    width: calc(100% - 105px);
	    height: 84px;
	    padding: 0;
	}
	.story-box .story-wrap {
	    display: block;
	    width: 100%;
	    height: 84px;
	}
	.story-box .story-wrap .tit {
	    float: left;
	    height: 84px;
	    width: 105px;
	    line-height: 82px;
	    text-align: center;
	    vertical-align: middle;
	    border-radius: 0 0 0 10px;
	}
	.story-box .tit {
	    font-weight: 400;
	    background-color: #f8f8fa;
	    border: 1px solid #f2f4f5;
	    border-width: 1px 0 1px 1px;
	}
	 .story-box .review .tit {
	    color: #503396;
	}
	 .story-box .story-cont .story-point {
	    display: table-cell;
	    width: 90px;
	    height: 50px;
	    padding: 0;
	    text-align: center;
	    vertical-align: middle;
	}
	.story-box .story-cont .story-point span {
	    display: inline-block;
	    vertical-align: top;
	    font-size: 2.4em;
	    font-family: Roboto;
	    font-weight: 300;
	}
	.story-box .story-cont .story-txt {
	    display: table-cell;
	    position: relative;
	    padding: 0 20px 0 30px;
	    text-align: left;
	    color: #666;
	    vertical-align: middle;
	    font-size: .9333em;
	    line-height: 1.4;
	    width: 720px;
	}
	.story-box .story-cont .story-like {
	    display: table-cell;
	    width: 40px;
	    text-align: center;
	    vertical-align: middle;
	}
	.story-box .review .story-cont {
	    background-color: #f8f8fa;
	    color: #503396;
	    border-radius: 0 10px 10px 0;
	}
	.story-my {
	    display: block;
	    padding: 90px 190px 0 0;
	    text-align: right;
	    font-size: .9333em;
	    line-height: 1.1;
	    color: #037B94;
	}
</style>
<script type="text/javascript">
	$(function() {	
		//감상평 수정
/* 		$("span.rvmod").click(function() {
			var idx = $(this).attr("idx");
			//alert(a)
			
			$.ajax({
				type:"get",
				dataType:"html",
				url:"rvupdateform",
				data:{"idx":idx},
				success:function(res) {
					var result = "";
					result += "<form action='rvupdate' class='form-inline'>"
					result += "<input type='hidden' name='num' value='${dto.num }'><input type='hidden' name='name' value='${rvname }'><input type='hidden' name='myid' value='${rvmyid }'>"
					result += "<div style='width:200px; height:80px; padding: 0 0 0 80px;'>"
					result += "<div class='user-prof' style='float: left;'>"
					result += "<div class='prof-img' style='margin-left: 10px;'><img src='${root }/save/ico-mega-profile.png' alt='MEGABOX'></div>"	
	                result += "<p class='user-id' style='margin-top: 10px;' align='center'>${rvmyid }</p>"  	
	                result += "</div>&nbsp;</div>"       
					result += "<div style='border: 1px solid #d8d9db; border-radius: 10px;'>"
	                result += "&nbsp;&nbsp;&nbsp;평점&nbsp;<input type='number' name='grade' class='form-control' required='required' min='1' max='10' value='${rvgrade}'>"
	                result += "<input type='text' name='content' class='form-control' required='required' style='width: 715px; height: 90px; border: 0;' value='${a.content}'>"
					result += "<button type='submit' class='rev btn' style='height: 60px;'><i class='fa-solid fa-pen'></i> 관람평수정</button>"
					result += "</div></form>"
					
					//div에 출력
					$(".rvwrite").html(result);
				}
			});
		}); */
		
		//감상평 삭제
		$(document).on("click","span.rvdel",function() {
			
			//idx얻기
			var idx = $(this).attr("idx");
			//alert(idx);
			
			var a = confirm("관람평을 삭제하려면 [확인]을 눌러주세요.");
			
			if(a) {
				$.ajax({
					type:"get",
					url:"rvdelete",
					dataType:"html",
					data:{"idx":idx},
					success:function(res) {
						alert("삭제되었습니다.");
						//새로고침
						location.reload();
					}
				});
			}
		});

	});
</script>
</head>
<c:set var="root" value="<%=request.getContextPath() %>"/>
<body>
	<!-- movie-detail -->
	<div class="movie-detail-page fixed">
		<div class="bg-img" style="background-image:url(&#39;https://img.megabox.co.kr/SharedImg/2022/11/24/fCx7dclCaNezAP3SMKIA2a3J0VQczZbV_570.jpg&#39;);"></div>
		<div class="bg-pattern"></div>
		<div class="bg-mask"></div>
	
		<!-- movie-detail-cont -->
		<div class="movie-detail-cont">
						
			<!-- 개봉 예매가능-->
	        <p class="contents-type">#메가토크</p>
			<p class="title">${dto.name }</p>
<!-- 			<p class="title-eng"></p> -->
	
			<div class="btn-util">
				<button type="button" title="보고싶어 안함" class="btn btn-like" rpst-movie-no="22085900">
					<i class="fa-regular fa-heart"></i>
					<span title="보고싶어 한 명수" id="intrstCnt" class="like">&nbsp;${dto.likes }</span>
				</button>
				
				<div class="sns-share">
					<a class="btn btn-common-share" title="공유하기">
						<i class="fa-solid fa-share-nodes"></i> 공유하기
					</a>
				
					<div class="btn-sns-share-wrap">
						<div class="cont-area">
							<div class="btn-sns-share-group">
								<button type="button" title="페이스북 공유하기" class="btn btnSns face" id="facebook" onclick="window.open('https://www.facebook.com/login.php?skip_api_login=1&api_key=966242223397117&signed_next=1&next=https%3A%2F%2Fwww.facebook.com%2Fsharer%2Fsharer.php%3Fu%3D(${dto.name })&url=localhost9001/movie/detail?num=${dto.num})cancel_url=https%3A%2F%2Fwww.facebook.com%2Fdialog%2Fclose_window%2F%3Fapp_id%3D966242223397117%26connect%3D0%23_%3D_&display=popup&locale=ko_KR', 'news', 'width=600,height=600,scrollbar=yes')">페이스북 <!-- 페이스북 --></button>
								<button type="button" title="밴드 공유하기" class="btn btnSns band" onclick="window.open('https://auth.band.us/login_page?display=popup&next_url=https%3A%2F%2Fband.us%2Fplugin%2Fshare%3Fbody%3D(${dto.name })&url=localhost9001/movie/detail?num=${dto.num})', 'news', 'width=600,height=600,scrollbar=yes')">밴드 <!-- 밴드 --></button>
								<button type="button" title="트위터 공유하기" class="btn btnSns twitter" onclick="window.open('https://twitter.com/intent/tweet?text=(${dto.name })&url=localhost9001/movie/detail?num=${dto.num})', 'news', 'width=600,height=600,scrollbar=yes')">트위터 <!-- 트위터 --></button>
								<!-- <button type="button" title="링크 공유하기" class="btn btnSns link">링크공유 링크공유</button> -->
							</div>
						</div>
					</div>
				</div>
			</div>
	
			<!-- info -->
			<div class="info">
				<div class="score">
					<p class="tit">실관람 평점</p>
					<div class="number gt" id="mainMegaScore">
					<!--  <div class="number lt" id="mainMegaScore">
						<p title="관람 전 점수" class="before"><em>0</em><span class="ir">점</span></p>
						<p title="관람 후 점수" class="after"><em>9.2</em><span class="ir">점</span></p> -->
						<p title="실관람 평점" class="before"><em>0</em><span class="ir"></span></p>
					</div>
				</div>
	
				<div class="rate">
					<p class="tit">예매율</p>	
					<p class="cont"><em>${dto.ticket }%</em></p>
				</div>
	
	            <div class="audience ">
	                 <div class="tit ">
	                 	<span class="m-tooltip-wrap ">누적관객수</span>
	                 </div>
	                 <p class="cont">
	                 	<em>
				        	<c:if test="${dto.bookcount==0 }">0</c:if>
				            <c:if test="${dto.bookcount>0 }">
					        	<fmt:formatNumber value="${dto.bookcount }" pattern="#,#00"/>
				            </c:if>
	                 	</em> 명</p>
	            </div>
			</div>
			<!--// info -->

			<div class="poster">
				<div class="wrap">	
					<c:if test="${dto.age=='전체관람가' }">
						<p class="movie-grade age-15">${dto.age }</p> 								
					</c:if>
					<c:if test="${dto.age=='12' }">
						<p class="movie-grade age-12">${dto.age }세 이상 관람가</p>							
					</c:if>
					<c:if test="${dto.age=='15' }">
						<p class="movie-grade age-15">${dto.age }세 이상 관람가</p>    								
					</c:if>
					<c:if test="${dto.age>='18' }">
						<p class="movie-grade age-19">${dto.age }</p>							
					</c:if>					
		
				 	<img src="${root }/save/${dto.poster}" onerror="noImg(this)" alt="올빼미">
					<!-- <a href="" class="btn-poster-down" title="포스터 다운로드" data-no="1123907" data-sn="1">포스터 다운로드</a> -->
				</div>
			</div>

			<div class="reserve screen-type">
				<div class="reserve">
					<a href="" class="btn reserve" title="영화 예매하기">예매</a>
				</div>
			</div>
		</div>
		<!--// movie-detail-cont -->
	</div>
	<!--// movie-detail -->
	
	<div class="container">
		<nav align="center" style="margin-left: 80px; width: 1116px;">
		  <div class="nav nav-tabs" id="nav-tab" role="tablist">
		    <button class="nav-link" id="data-tab" data-bs-toggle="tab" data-bs-target="#nav-data" type="button" 
		    		role="tab" aria-controls="nav-data" aria-selected="false" style="width: 372px;"><b>주요정보</b></button>
		    <button class="nav-link active" id="review-tab" data-bs-toggle="tab" data-bs-target="#nav-review" type="button" 
		    		role="tab" aria-controls="nav-review" aria-selected="true" style="width: 372px;"><b>실관람평</b></button>
		    <button class="nav-link" id="trailer-tab" data-bs-toggle="tab" data-bs-target="#nav-trailer" type="button" 
		    		role="tab" aria-controls="nav-trailer" aria-selected="false" style="width: 372px;"><b>메인포스터</b></button>
		  </div>
		</nav>
		<div class="tab-content" id="nav-tabContent">
		  <div class="tab-pane fade" id="nav-data" role="tabpanel" aria-labelledby="nav-data-tab">
		  	<div class="movie-summary infoContent on" id="info">
		  		<div class="txt" style="width: 1200px; padding: 10px 0 0 80px;">
				  	${dto.content}		  		
		  			<hr>
		  		</div>
		  		<div class="movie-info infoContent">
		  			<div class="line">
		  				<p>장르&nbsp;: ${dto.genre } / ${dto.runtime }분</p> 
		  				<p>등급&nbsp;: <c:if test="${dto.age<='18' }">${dto.age }세이상관람가</c:if>
		  							  <c:if test="${dto.age>='18' }">${dto.age }</c:if>
		  				</p>
		  				<p>개봉일&nbsp;: <fmt:formatDate value="${dto.opendate }" pattern="yyyy.MM.dd"/></p>
		  			</div>
		  				<p>출연진&nbsp;: ${dto.actor }</p><br>
		  				
			  		<!-- movie-graph -->
				    <div class="movie-graph infoContent">
				        <div class="col" id="subMegaScore">
				            <dl>
				                <dt>실관람 평점</dt>
				            </dl>
	        
				            <div class="graph" style="display: none;">
				                 <img src="${root }/save/no-graph02.jpg" alt="메가스코어 결과 없음">
				            </div>
				            <div class="score equal" style="position: relative; bottom: 15px;">
				            	<div class="middle">
				                	<div class="circle"><em style="font-style: inherit;">0</em><span class="ir"></span></div>
				                </div>
				            </div>
				            <dl>
				                <dt>예매율</dt>
				                <dd class="font-roboto regular">
				                    <span id="rkTag">${dto.ticket }%</span>
				                </dd>
				            </dl>
				        </div>
				
				        <div class="col">
				            <dl>
				                <dt>누적관객수</dt>
				                <dd class="font-roboto regular" style="margin-top: 99px;">
				                	<div class="circle"><em style="font-style: inherit;">
				                		<c:if test="${dto.bookcount==0 }">0</c:if>
				                		<c:if test="${dto.bookcount>0 }">
					                		<fmt:formatNumber value="${dto.bookcount }" pattern="#,#00"/></em>
				                		</c:if>
				                	</div>
				                </dd>
				            </dl>
				        </div>
				    </div>
				    <!--// movie-graph -->
		  		</div>
		  	</div>
		  </div>
		  
		  <div class="tab-pane fade show active" id="nav-review" role="tabpanel" aria-labelledby="nav-review-tab">
		  	<c:if test="${rvcount==0 }">
			  	<!-- 한줄평 없을 때 -->
	            <div class="tit-util mt40 oneContent" style="width: 1200px;height: 50px; padding: 10px 0 0 80px;">
	                <h2 class="tit small">아직 남겨진 관람평이 없어요.</h2><br><br><br>
	            </div>
		  	</c:if>
		  	<c:if test="${rvcount>0 }">
			  	<!-- 한줄평 있을 때 -->
	            <div class="tit-util mt40 oneContent" style="width: 1200px;height: 50px; padding: 10px 0 0 80px;">
	                <h2 class="tit small">${dto.name }에 대한 <span class="font-gblue">${rvcount }</span>개의 이야기가 있어요!</h2><br><br><br>
	            </div>
		  	</c:if>
            
            <div class="tit-util mt30 oneContent" style="width: 1200px; height: 80px; padding: 10px 0 0 80px;">
            	<div class="movie-sorting">
            		<span style="color: #222; font-weight: 700;">
            			전체 <em class="font-gblue" id="cnt1">${rvcount }</em> 건
					</span>
            	</div>
<%--             	<div class="movie-sorting-right">
            		<span class="n"><button type="button" class="btn orderBtn on" id="bnewest" num=${dto.num }>최신순</button><span style="color: #d8d9db">|</span></span>
            		<span><button type="button" class="btn orderBtn" id="bchu">공감순</button><span style="color: #d8d9db">|</span></span>
            		<span><button type="button" class="btn orderBtn" id="bgra">평점순</button></span>
            	</div> --%>
            </div>
              <div class="rvwrite">
				<form action="rvupdate" method="post" class="form-inline">
					<input type="hidden" name="num" value="${dto.num }">
					<input type="hidden" name="idx" value="${rvdto.idx }">
					
					<div style="width:200px; height:80px; padding: 0 0 0 80px;">
						<div class="user-prof" style="float: left;">
	                    	<div class="prof-img" style="margin-left: 10px;"><img src="${root }/save/ico-mega-profile.png" alt="MEGABOX"></div>
	                        <p class="user-id" style="margin-top: 10px;" align="center">${rvdto.myid }</p>
	                    </div>&nbsp;
					</div>
	                <div style="border: 1px solid #d8d9db; border-radius: 10px;">
	                	&nbsp;&nbsp;&nbsp;평점&nbsp;<input type="number" name="grade" class="form-control" required="required" min="1" max="10" value="${rvdto.grade }">
						<input type="text" name="content" class="form-control" required="required" style="width: 715px; height: 90px; border: 0;" value="${rvdto.content }" autofocus="autofocus">
						<button type="submit" class="rev btn" style="height: 60px;"><i class="fa-solid fa-pen"></i><span style="color: #037B94;"><b> 관람평수정</b></span></button>
	                </div>
	          	</form>
              </div>
          	<!-- 최신순 -->
			<div class="story-area" style="margin: 77px 0 150px 76px;">
			  <div class="rlnew">
 				<c:forEach var="a" items="${rvlist }">
					<div class="user-prof">
						<div class="prof-img">
							<img src="${root }/save/bg-photo.png">
						</div>
						<p class="user-id" style="margin-top: 10px;">${a.myid }</p>
					</div>
					<div class="story-box">
						<div class="story-wrap review">
							<div class="tit">관람평</div>
							<div class="story-cont">
								<div class="story-point">
									<input type="hidden" name="rgrade" class="rgrade" value="${a.grade }">
									<span>${a.grade }</span>
								</div>
								<div class="story-txt" id="rcontent"><input type="hidden" name="rcontent" class="rcontent" value="${a.content }">${a.content }</div>
								<div class="story-like" style="cursor: pointer;">
									<i class="fa-regular fa-thumbs-up"></i><span>${a.likes }</span>
								</div>
							</div>
							</div>
						</div>
						<div class="story-my" style="margin-bottom: 30px;">
							<span class='rvmod' style="cursor: pointer; font-size: 15px;" idx=${a.idx } onclick="location.href='rvupdateform?idx=${a.idx}'"><i class="fa-regular fa-pen-to-square"></i></span>
							<span class='rvdel' style="cursor: pointer; font-size: 15px;" idx=${a.idx }><i class="fa-sharp fa-solid fa-trash"></i></span>
							<br>
						</div>
				</c:forEach>
			  </div>
			</div>
		  </div>
		  
		  <div class="tab-pane fade" id="nav-trailer" role="tabpanel" aria-labelledby="nav-trailer-tab">
		  	<div class="mainimg" style="margin-top: 40px;" align="center">
		  		<img alt="메인 포스터" src="${root }/save/${dto.poster }" style="width: 750px;">
		  	</div>
		  </div>
		</div>
	</div>
	
<script type="text/javascript">
	/* 관람평 */
	$("div.rlnew").show();
	$("div.rlchu").hide();
	$("div.rlgrade").hide();
	
	/* 관람평 정렬순 */
	$(".orderBtn").click(function() {
		var a = $(this).attr("id")
		console.log(a)
		$(this).addClass("on");
	 	$(this).parent().siblings().children().removeClass("on");

		if(a=="bchu") {
			$("div.rlnew").hide();
			$("div.rlchu").show();
			$("div.rlgrade").hide();
		}
		else if(a=="bgra") {
			$("div.rlnew").hide();
			$("div.rlchu").hide();
			$("div.rlgrade").show();			
		}
		else if(a=="bnewest"){
			$("div.rlchu").hide();
			$("div.rlgrade").hide();			
			$("div.rlnew").show();
		}
	});

	$(".fa-regular fa-heart").hover(function() {
		$(this).attr("class","fa-solid fa-heart").css("color","#339EB2")
	});
	
	/* 공유하기 */
	 $("a.btn-common-share").click(function(){
         $(".btn-sns-share-wrap").toggleClass("on");
     })
     
     /* 영화like */
	$("button.btn-like").click(function() {
		var heart = $(this).find("i").attr("class");
		
		var num = ${dto.num};
		console.log(num);
		
		//로그인 상태가 아닐 때
		if(${sessionScope.loginok==null}) {
			alert("로그인을 먼저 해주세요.")
		}
		//로그인 상태일 때
		if(${sessionScope.loginok!=null }) {
			if(heart=='fa-regular fa-heart') {
				$(this).find("i").attr("class","fa-solid fa-heart").css("color","#503396");
				
		 		$.ajax({
					type:"get",
					url:"likes",
					dataType:"json",
					data:{"num":num},
					success:function(res) {
						$("div.btn-util").children().children("span.like").text(res.likes);
					}
				});
			}
	 		else {
				$(this).find("i").attr("class","fa-regular fa-heart").css("color","#fff");
		 		$.ajax({
					type:"get",
					url:"nolikes",
					dataType:"json",
					data:{"num":num},
					success:function(res) {
						
						$("div.btn-util").children().children("span.like").text(res.likes);
					}
				});
			}			
		}
		
	});
	
	/* 감상평 정렬순 */
	$(".orderBtn").click(function() {
		$(this).addClass("on");
	 	$(this).parent().siblings().children().removeClass("on");
	});
</script>
</body>
</html>