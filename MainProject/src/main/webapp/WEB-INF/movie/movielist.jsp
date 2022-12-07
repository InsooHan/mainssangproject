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
	
	/* font색상 */
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
	
	/* 영화목록 */
	.mt40 {
	    margin-top: 40px;
	}
	.movie-list{letter-spacing:0}
	.movie-list p{margin:0;padding:0}
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
	    margin-right: 140px;
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
	
	/* 박스오피스 순위 */
	.movie-list0 .no-img .movie-list-info .rank {
	    background-image: none;
	}
	.movie-list0 .rank {
	    position: relative;
	    left: 0;
	    top: 0;
	    width: 230px;
	    height: 0;
	    padding: 8px 0 0 10px;
	    line-height: 1.4;
	    font-size: 2em;
	    font-style: italic;
	    font-family: Roboto,Dotum,'돋움',sans-serif;
	    font-weight: 300;
	    color: #fff;
	    text-shadow: 2px 2px 2px rgb(0 0 0 / 80%);
	    /* background: url(https://img.megabox.co.kr/static/pc/images/movie/bg-movie-list-rank.png) no-repeat 0 0; */
	}
	.ir {
	    text-indent: -9999px;
	    position: fixed;
	    top: -9999px;
	    font-size: 1px;
	    width: 1px;
	    height: 1px;
	    opacity: 0;
	}
	
	
	/* 개봉일-가나다순 style */
	.movie-list-util .movie-sorting span .btn {
	    display: block;
	    color: #666;
	    float: left;
	    padding: 5px 10px 0 0;
	}
	.movie-list-util .movie-sorting span .btn.on {
	    color: #222;
	    font-weight: 700;
	}
	
	/* 영화목록 */
	.movie-list .no-img .movie-list-info .rank, .movie-list1 .no-img, .movie-list2 .no-img{background-image:none}
	.movie-list img, .movie-list0 img, .movie-list1 img, .movie-list2 img{width:242px;height:331px}
	.movie-list .tit-area, .movie-list0 .tit-area, .movie-list1 .tit-area, .movie-list2 .tit-area{position:relative;width:100%;margin:15px 0 0 0;padding:0 0 0 30px;line-height:25px}
	
	.one {
		display: inline-block;
		width: 264px;
		margin-bottom: 80px;
		margin-right: 35px;
		padding-right: 20px;
	}
	
	.movie-list, .movie-list0, .movie-list1, .movie-list2 {
		position: relative;
	}
	
	/* 등급(나이) */
	.movie-list .tit-area .movie-grade, .movie-list0 .tit-area .movie-grade, .movie-list1 .tit-area .movie-grade, .movie-list2 .tit-area .movie-grade {
	    position: absolute;
	    left: 0;
	    top: 50%;
	    margin-top: -10px;
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
	.movie-list p, .movie-list0 p, .movie-list1 p, .movie-list2 p {
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
	/* 영화제목 */
	.movie-list .tit-area .tit, .movie-list0 .tit-area .tit, .movie-list1 .tit-area .tit, .movie-list2 .tit-area .tit {
	    overflow: hidden;
	    display: block;
	    width: 100%;
	    white-space: nowrap;
	    text-overflow: ellipsis;
	    padding: 2px 0 0 1px;
	    font-size: 1.3333em;
	    font-weight: 400;
	    color: #333;
	}
	
	.movie-list .rate-date, .movie-list0 .rate-date, .movie-list1 .rate-date, .movie-list2 .rate-date {
	    overflow: hidden;
	    padding: 10px 0 0 0;
	}
	
	/* 좋아요 */
	.movie-list .btn-movie .btn-like, .movie-list0 .btn-movie .btn-like, .movie-list1 .btn-movie .btn-like, .movie-list2 .btn-movie .btn-like {
	    float: left;
	    width: 72px;
	    margin: 10px 0 0 0;
	    padding: 0 5px;
	    font-size: .6000em;
	    border-color: #ebebeb;
	}
	.button>i:first-child {
	    margin-left: 0;
	    margin-right: 4px;
	}
	.button>i {
	    margin-top: -2px;
	    margin-left: 4px;
	}
	/* 예매버튼 */
	.button {
	    display: inline-block;
	    height: 36px;
	    margin: 0;
	    padding: 0 15px;
	    text-align: center;
	    line-height: 34px;
	    color: #503396;
	    font-weight: 400;
	    border-radius: 4px;
	    font-family: NanumBarunGothic,Dotum,'돋움',sans-serif;
	    text-decoration: none;
	    border: 1px solid #503396;
	    vertical-align: middle;
	    background-color: #fff;
	    cursor: pointer;
	}
	.movie-list .button, .movie-list0 .button, .movie-list1 .button, .movie-list2 .button {
	    display: block;
	    float: left;
	    width: 160px;
	    margin: 0;
	    padding: 0;
	}
	.button.purple {
	    color: #fff;
	    line-height: 36px;
	    border: 0;
	    background: #503396;
	    margin-left: 10px;
	    margin-top: 10px;
	}
	a.button {
	    text-decoration: none;
	}
	a:link {
	    color: #444;
	    text-decoration: none;
	}
</style>
<script type="text/javascript">
$(function(){
	
	//날짜		
	var today = new Date();
	var sel_day = -1;
	today.setDate(today.getDate() + sel_day );
	console.log(today);
	year = today.getFullYear();
	month = ('0' + (today.getMonth() + 1)).slice(-2);
	day = ('0' + today.getDate()).slice(-2);
	var dateString = year+month+day;
	console.log(dateString);
	
	//박스오피스 순위 조회
	$.ajax({
		method:"get",
		type:"json",
		url:"http://kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/searchDailyBoxOfficeList.json?key=f5eef3421c602c6cb7ea224104795888&targetDt="+dateString,
		success:function(res){
			console.log(res);
			
			var result = "";
					
			//1위부터 10위까지
			for(var i=0; i<10; i++){

				var m = res.boxOfficeResult.dailyBoxOfficeList[i];
				
				result += "<div class='one' style='margin-right: 45px'>";
				result += "<a href='detail?'><p class='rank' style='z-index: 2;'>"+m.rank+"<span class='ir'>위</span></span></p><img src='${root }/save/' style='z-index: 1;'></a>"
				result += "<div class='tit-area'>"
				if(m.movieNm=='올빼미') {
					result += "<p class='movie-grade age-15'>,</p>"
				}
				if(m.movieNm=='압꾸정') {
					result += "<p class='movie-grade age-12'>,</p>"
				}
				if(m.movieNm=='극장판 뽀로로와 친구들: 바이러스를 없애줘!') {
					result += "<p class='movie-grade age-all'>,</p>"
				}
				if(m.movieNm=='원피스 필름 레드') {
					result += "<p class='movie-grade age-12'>,</p>"
				}
				if(m.movieNm=='탄생') {
					result += "<p class='movie-grade age-12'>,</p>"
				}
				if(m.movieNm=='블랙 팬서: 와칸다 포에버') {
					result += "<p class='movie-grade age-12'>,</p>"
				}
				if(m.movieNm=='오늘 밤, 세계에서 이 사랑이 사라진다 해도') {
					result += "<p class='movie-grade age-12'>,</p>"
				}
				if(m.movieNm=='데시벨') {
					result += "<p class='movie-grade age-12'>,</p>"
				}
				if(m.movieNm=='엔시티 드림 더 무비 : 인 어 드림') {
					result += "<p class='movie-grade age-all'>,</p>"
				}
				if(m.movieNm=='본즈 앤 올') {
					result += "<p class='movie-grade age-19'>,</p>"
				}
				if(m.movieNm=='동감') {
					result += "<p class='movie-grade age-12'>,</p>"
				}
				result += "<b><p class='tit' style='padding-right: 25px; overflow: hidden;display: block;width: 100%;white-space: nowrap;text-overflow: ellipsis;padding: 2px 0 0 1px;font-size: 1.3333em;font-weight: 400;color: #333;'>"+m.movieNm+"</p></b>"		
				result += "</div>"		
				result += "<div class='rate-date' style='font-size: 11pt'><span class='rate'>예매율 "+m.salesShare+"% | </span><span class='date'>개봉일 "+m.openDt+"</span>"
				result += "</div>"  
				result += "<div class='btn-movie'>"		   
				result += "<button type='button' class='button btn-like' data-no='22085900'>"			
				result += "<i class='fa-regular fa-heart' style='font-size: 15px; padding-top: 12px;'></i>"
				result += "<span style='font-size: 12pt;'></span>"
				result += "</button>"		   
				result += "<div class='case movieStat4'><a href='' class='button purple bokdBtn' title='영화 예매하기'>예매</a>"
				result += "</div></div></div>"		  							
				}
			
			//div에 출력
			$(".movie-list0").html(result);
			
		}
	});
	
});
</script>
</head>
<c:set var="root" value="<%=request.getContextPath() %>"/>
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
	
				<ul class="nav nav-tabs" id="myTab" role="tablist" style="width: 1156px;">
					<li class="nav-item" role="presentation">
						<button class="nav-link active" id="home-tab" data-bs-toggle="tab" data-bs-target="#boxoffice" type="button" 
							role="tab" aria-controls="boxoffice" aria-selected="true" style="width: 385px;"><b>박스오피스</b></button>
					</li>
					<li class="nav-item" role="presentation">
						<button class="nav-link" id="profile-tab" data-bs-toggle="tab" data-bs-target="#new" type="button" 
							role="tab" aria-controls="new" aria-selected="false" style="width: 385px;"><b>최신영화</b></button>
					</li>
					<li class="nav-item" role="presentation">
						<button class="nav-link" id="contact-tab" data-bs-toggle="tab" data-bs-target="#comming" type="button" 
							role="tab" aria-controls="comming" aria-selected="false" style="width: 385px;"><b>상영예정작</b></button>
					</li>
				</ul>
			</div>				
			
			<div class="tab-content" id="myTabContent">
				<div class="tab-pane fade show active" id="boxoffice" role="tabpanel" aria-labelledby="home-tab">
					<!-- movie-list-util -->
					<div class="movie-list-util mt40">
						<!-- 박스오피스 -->
						<div class="topSort" style="display: block;">
							<div class="movie-sorting sortTab">
<!-- 						<span><button type="button" class="btn on" sort-type="ticketing">예매율순</button></span> -->
<!-- 						<span><button type="button" class="btn" sort-type="accmAdnc">누적관객순</button></span> -->
<!-- 						<span><button type="button" class="btn" sort-type="megaScore">메가스코어순</button></span> -->
							</div>
						<!-- 검색결과 없을 때 -->
						<p class="no-result-count"><strong id="totCnt">10</strong> 위 까지의 영화순위입니다.</p>
						<!--// 검색결과 없을 때 -->
			
<!-- 						<div class="movie-search">
							<form action="list" class="form-inline">
								<input type="text" title="영화명을 입력하세요" id="ibxMovieNmSearch" name="ibxMovieNmSearch" placeholder="영화명 검색" class="input-text">
								<button type="submit" class="btn-search-input" id="btnSearch">검색</button>
							</form>
						</div> 
-->
		
						</div>
						<!--// 박스오피스 -->
					</div>
					
					<div class="movie-list0"></div>
					<!--// movie-list-util -->			
				</div>
				
				<div class="tab-pane fade" id="new" role="tabpanel" aria-labelledby="profile-tab">
					<!-- movie-list-util -->
					<div class="movie-list-util mt40">
						<!-- 최신영화 -->
<!-- 						<div class="topSort">
							<div class="movie-sorting sortTab">
								<span><button type="button" class="btn on" sort-type="ticketing">예매율순</button></span>
								<span><button type="button" class="btn" sort-type="accmAdnc">누적관객순</button></span>
							</div>
						</div> -->
						<!-- 검색결과 없을 때 -->
						<p class="no-result-count"><strong id="totCnt">${newtotalCount }</strong>개의 영화가 검색되었습니다.</p>
						<!--// 검색결과 없을 때 -->
			
<!--  						<div class="movie-search">
							<form action="list" class="form-inline">
								<input type="text" title="영화명을 입력하세요" id="ibxMovieNmSearch" name="ibxMovieNmSearch" placeholder="영화명 검색" class="input-text">
								<button type="submit" class="btn-search-input" id="btnSearch">검색</button>
							</form>
						</div> -->
						
						<!--// 최신영화 -->
					</div>
					
					<!-- 최신영화 리스트 -->
					<div class="movie-list">
						<c:forEach var="dto" items="${list }">
					     <c:if test="${dto.sang=='0' }">
						  <div class="one">
							<a href="detail?num=${dto.num }">
								<img src="${root }/save/${dto.poster}">
							</a>
							<div class="tit-area">    
								<c:if test="${dto.age=='전체관람가' }">
									<p class="movie-grade.age-all">,</p>    								
								</c:if>
								<c:if test="${dto.age=='12' }">
									<p class="movie-grade age-12">,</p>    								
								</c:if>
								<c:if test="${dto.age=='15' }">
									<p class="movie-grade age-15">,</p>    								
								</c:if>
								<c:if test="${dto.age>='18' }">
									<p class="movie-grade age-19">,</p>    								
								</c:if>
								<b><p class="tit" style="padding-right: 25px;">${dto.name }</p></b>
							</div>
							<div class="rate-date">    
								<span class="rate">예매율 **.*% | </span>    
								<span class="date">개봉일 <fmt:formatDate value="${dto.opendate }" pattern="yyyy.MM.dd"/></span>
							</div>
							<div class="btn-movie">    
								<button type="button" class="button btn-like" data-no="22085900" num="${dto.num }">
									<i class="fa-regular fa-heart" style="font-size: 15px; padding-top: 12px;"></i>
									<span style="font-size: 12pt;" id="intrstCnt" class="like">${dto.likes }</span>
								</button>    
								<div class="case movieStat4">
									<a href="" class="button purple bokdBtn" title="영화 예매하기">예매</a>    
								</div>
							</div>
						  </div>
					     </c:if>
						</c:forEach>
					</div>
				</div>
				
				<div class="tab-pane fade" id="comming" role="tabpanel" aria-labelledby="contact-tab">
					<!-- movie-list-util -->
					<div class="movie-list-util mt40">
						<!-- 상영예정작 -->
						<div class="topSort">
							<div class="movie-sorting sortTab">
								<span><button type="button" class="btn on" sort-type="rfilmDe" id="open">개봉일순</button></span>
								<span><button type="button" class="btn" sort-type="title" id="asc">가나다순</button></span>
							</div>
						</div>
						<!-- 검색결과 없을 때 -->
						<p class="no-result-count"><strong id="totCnt">${commingtotalCount }</strong>개의 영화가 검색되었습니다.</p>
						<!--// 검색결과 없을 때 -->
			
<!-- 						<div class="movie-search">
							<input type="text" title="영화명을 입력하세요" id="ibxMovieNmSearch" name="ibxMovieNmSearch" placeholder="영화명 검색" class="input-text">
							<button type="button" class="btn-search-input" id="btnSearch">검색</button>
						</div> -->
						<!--// 상영예정작 -->
					</div>
					
					<!-- 상영예정작 리스트 -->
					<div class="movie-list1">
						<c:forEach var="dto" items="${list }">
					     <c:if test="${dto.sang=='1' }">
						  <div class="one">
							<a href="detail?num=${dto.num }">
								<img src="${root }/save/${dto.poster}">
							</a>
							<div class="tit-area">    
								<c:if test="${dto.age=='전체관람가' }">
									<p class="movie-grade.age-all">,</p>    								
								</c:if>
								<c:if test="${dto.age=='12' }">
									<p class="movie-grade age-12">,</p>    								
								</c:if>
								<c:if test="${dto.age=='15' }">
									<p class="movie-grade age-15">,</p>    								
								</c:if>
								<c:if test="${dto.age>='18' }">
									<p class="movie-grade age-19">,</p>    								
								</c:if>
								<b><p class="tit" style="padding-right: 25px;">${dto.name }</p></b>
							</div>
							<div class="rate-date">    
								<span class="rate">예매율 **.*% | </span>    
								<span class="date">개봉일 <fmt:formatDate value="${dto.opendate }" pattern="yyyy.MM.dd"/></span>
							</div>
							<div class="btn-movie">    
								<button type="button" class="button btn-like" data-no="22085900" num=${dto.num }>
									<i class="fa-regular fa-heart" style="font-size: 15px; padding-top: 12px;"></i>
									<span style="font-size: 12pt;" id="intrstCnt" class="like">${dto.likes }</span>
								</button>    
								<div class="case movieStat4">
									<a href="" class="button purple bokdBtn" title="영화 예매하기">예매</a>    
								</div>
							</div>
						  </div>
					     </c:if>
						</c:forEach>
					</div>
					
					<!-- 상영예정작 리스트(가나다순) -->
					<div class="movie-list2">
						<c:forEach var="cdto" items="${clist }">
					     <c:if test="${cdto.sang=='1' }">
						  <div class="one">
							<a href="detail?num=${dto.num }">
								<img src="${root }/save/${cdto.poster}">
							</a>
							<div class="tit-area">    
								<c:if test="${cdto.age=='전체관람가' }">
									<p class="movie-grade.age-all">,</p>    								
								</c:if>
								<c:if test="${cdto.age=='12' }">
									<p class="movie-grade age-12">,</p>    								
								</c:if>
								<c:if test="${cdto.age=='15' }">
									<p class="movie-grade age-15">,</p>    								
								</c:if>
								<c:if test="${cdto.age>='18' }">
									<p class="movie-grade age-19">,</p>    								
								</c:if>
								<b><p class="tit" style="padding-right: 25px;">${cdto.name }</p></b>
							</div>
							<div class="rate-date">    
								<span class="rate">예매율 **.*% | </span>    
								<span class="date">개봉일 <fmt:formatDate value="${cdto.opendate }" pattern="yyyy.MM.dd"/></span>
							</div>
							<div class="btn-movie">    
								<button type="button" class="button btn-like" data-no="22085900" num=${cdto.num }>
									<i class="fa-regular fa-heart" style="font-size: 15px; padding-top: 12px;"></i>
									<span style="font-size: 12pt;" id="intrstCnt" class="like">${dto.likes }</span>
								</button>    
								<div class="case movieStat4">
									<a href="" class="button purple bokdBtn" title="영화 예매하기">예매</a>    
								</div>
							</div>
						  </div>
					     </c:if>
						</c:forEach>
					</div>
					
				</div>
			</div>
		</div>
	</div>
	
<script type="text/javascript">
	/* 가나다순 */
	$("div.movie-list2").hide();
	
	$(".movie-sorting span").click(function() {
 		$(this).children().addClass("on");
 		$(this).siblings().children().removeClass("on");
	});

	$("#asc").click(function() {
		$("div.movie-list2").show();
		$("div.movie-list1").hide();
	});
	$("#open").click(function() {
		$("div.movie-list1").show();
		$("div.movie-list2").hide();
	});
	
	$("button.btn-like").click(function() {
		var heart = $(this).find("i").attr("class");
		var n = $(this).attr("num");
		
		//로그인 상태가 아닐 때
		if(${sessionScope.loginok==null}) {
			alert("로그인을 먼저 해주세요.")
		}
		//로그인 상태일 때
		if(${sessionScope.loginok!=null}) {
			if(heart=='fa-regular fa-heart') {
				$(this).find("i").attr("class","fa-solid fa-heart").css("color","#503396");
				
		 		$.ajax({
					type:"get",
					url:"likes",
					dataType:"json",
					data:{"num":n},
					success:function(res) {
						$("div.btn-movie").children().children("span.like").text(res.likes);
					}
				});	
			}
	 		else {
				$(this).find("i").attr("class","fa-regular fa-heart").css("color","#222");
			}			
		}
	});

</script>
</body>
</html>