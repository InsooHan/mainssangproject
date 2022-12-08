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
<title>Insert title here</title>
<script type="text/javascript">
	$(function(){
		
		//날짜 받아오기		
		var today = new Date();
		var sel_day = -1; //일자를 조절하시면 됩니다. -1이면 하루전/ +1이면 내일
		today.setDate(today.getDate() + sel_day );
		console.log(today);
		year = today.getFullYear();
		month = ('0' + (today.getMonth() + 1)).slice(-2);
			//당일 박스오피스 데이터는 안나와서 하루 전 날짜 받아오기
			day = ('0' + today.getDate()).slice(-2);
		var dateString = year+month+day;
		console.log(dateString);
		
		//박스오피스 순위 조회
		$.ajax({
			method:"get",
			type:"json",
			url:"https://kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/searchDailyBoxOfficeList.json?key=7c712641a1205c3d6608343c0c561641&targetDt="+dateString,
			success:function(res){
				console.log(res);
				
				var result = "";
					result +="<div>";
					result +="<table class='table table-dark table-hover' style='border:1px solid black; box-shadow:inset 0 0 8px #deb13a; width:400px; color: white; text-align:center;'>";
						result +="<caption class='s1' style='caption-side: top; color: white; font-size:1.8em; font-weight: 500; text-align:center;'>박스오피스 순위<span style='font-size:0.5em;'>("+year+"."+month+"."+day+")</span></caption>";
						result +="<tr>";
							result +="<th style='background-color:#339EB2; width:100px;'>순위</th>";
							result +="<th style='background-color:#339EB2; width:300px;'>영화</th>";
						result +="</tr>";

						
					//1위부터 10위까지 순위와 제목 출력
					for(var i=0; i<10; i++){
						
					var s = res.boxOfficeResult.dailyBoxOfficeList[i];
					
					//순위 증감
					if(s.rankInten==0){
						rankIn = "(<span>-";
					}else if(s.rankInten>0){
						rankIn = "(<span style='color:red;'>▲</span>"+s.rankInten;
					}else{
						rankIn = "(<span style='color:blue;'>▼</span>"+s.rankInten;
					}

						result +="<tr>";
							result +="<td>"+s.rank+"위"+rankIn+")</td>";
							result +="<td>"+s.movieNm+"</td>";
						result +="</tr>";
					}
					result +="</table>";
					result +="</div>";
				
				//div에 출력
				$(".boxoffice").html(result);
				
			}
		});
		
	});
						
	//test
	function test(){
		alert("test");
	}
						
						
</script>
<style type="text/css">
body {
	font-family: Noto Sans KR;
}

.main {
	background-color: #555555;
	font-family: Noto Sans KR;
	margin-top: 0px;
}

.s1 {
	text-shadow: 2px 2px 2px gray;
}

.s2 {
	text-shadow: 2px 4px 2px gray;
}

.s3 {
	text-shadow: 2px 6px 2px gray;
}

.img-fluid {
   position: relative;
}

.card .cardbtn{
   position: absolute;
   top: 150px;
   left: 40px;   
   opacity: 0;
}

.hovertest:hover .cardbtn{
	opacity: 1;
}

.hovertest:hover .img-fluid{
	filter: brightness(70%);
}

.container_event{
	display:grid;
	width: 45%;
	height: 430px;
	margin-left: 100px;
	padding-bottom: 10px;
	padding-top: 10px;
	grid-template-columns: 1fr 1fr 1fr 1fr;
	grid-template-rows: 1fr 1fr;
	gap: 10px;
	place-items: center center;
	
}

.container_boxoffice{
	display: flex;
}

.boxoffice{
	flex-shrink: 0;
}



</style>
</head>
<body>
<div>
	<!-- 메인 상단 광고 슬라이드 -->
	<div id="demo" class="carousel slide carousel-fade" data-bs-ride="carousel">
	
	  <!-- Indicators/dots -->
	  <div class="carousel-indicators">
	    <button type="button" data-bs-target="#demo" data-bs-slide-to="0" class="active"></button>
	    <button type="button" data-bs-target="#demo" data-bs-slide-to="1"></button>
	    <button type="button" data-bs-target="#demo" data-bs-slide-to="2"></button>
	  </div>
	  
	  <!-- The slideshow/carousel -->
	  <div class="carousel-inner">
	    <div class="carousel-item active" data-bs-interval="3000">
	      <img src="https://caching2.lottecinema.co.kr/lotte_image/2022/AA/AA_1920774.jpg" alt="#" style="width:100%">
	    </div>
	    <div class="carousel-item" data-bs-interval="3000"> 
	      <img src="https://caching2.lottecinema.co.kr/lotte_image/2022/CC/CC_1920774.jpg" alt="#" style="width:100%">
	    </div>
	    <div class="carousel-item" data-bs-interval="3000">
	      <img src="https://caching2.lottecinema.co.kr/lotte_image/2022/ST/1121/ST_1920774.jpg" alt="#" style="width:100%">
	    </div>
	  </div>
	  
	  <!-- Left and right controls/icons -->
	  <button class="carousel-control-prev" type="button" data-bs-target="#demo" data-bs-slide="prev">
	    <span class="carousel-control-prev-icon"></span>
	  </button>
	  <button class="carousel-control-next" type="button" data-bs-target="#demo" data-bs-slide="next">
	    <span class="carousel-control-next-icon"></span>
	  </button>
	</div>
	<!-- 광고 슬라이드 end -->
	
<div style="height: 650px; background-color:#212529; background-color:rgba(0,0,0,0.6); padding-top: 10px; padding-left: 100px; padding-right: 100px; padding-bottom: 100px;">

	<!-- 영화 리스트 캐러셀-->
	<div class="container" style="float: right; width: 75%; margin-top: 30px;">
		<div class="row">
			<div class="col-6">
				<p class="mb-3 s1" style="color: white; font-family: Noto Sans KR; font-weight: 500; font-size: 1.8em;">최신 개봉작</p>
			</div>
			<div class="col-6 text-right">
				<a class="btn btn-primary mb-3 mr-1"
					href="#carouselExampleIndicators_movie" role="button" data-slide="prev">
					<i class="fa fa-arrow-left"></i>
				</a> <a class="btn btn-primary mb-3 "
					href="#carouselExampleIndicators_movie" role="button" data-slide="next">
					<i class="fa fa-arrow-right"></i>
				</a>
			</div>
			<div class="col-12">
				<div id="carouselExampleIndicators_movie"
					class="carousel slide carousel-fade" data-ride="carousel">

					<div class="carousel-inner">
						<div class="carousel-item active">
							<div class="row">

								<!-- 4개 반복문 -->
								<c:forEach var="movie" items="${mlist }" begin="0" end="3">
									<div class="col-md-3 mb-3">
										<div class="card" style="width: 250px; border: 0px solid black;" >
											<div class="hovertest">
											<img class="img-fluid" alt="100%x280" src="../save/${movie.poster}" style="width: 280px;">
												<div class="cardbtn" style="text-align: center;">
												<button class="btn btn-m detailbtn" type="button" style="background-color: #339EB2; color: white;" onclick="location.href='${root}/movie/detail?num=${movie.num }'">상세보기</button>	
												&nbsp;&nbsp;
												<button class="btn btn-m bookbtn" type="button" style="background-color: #503396; color: white;" onclick="location.href='${root}/book/list'">예매하기</button>	
												</div>
											</div>
											<div class="card-body">
												<h5 class="card-title" style="font-family: Noto Sans KR; text-align: center;">${movie.name }</h5>
												<div style="text-align: center;">개봉일: <fmt:formatDate value="${movie.opendate }" pattern="yyyy.MM.dd"/></div>
											</div>
	
										</div>
									</div>
								
								</c:forEach>
							</div>
						</div>
						<!-- 첫 캐러셀 3개 end -->
						
						<!-- 다음 페이지 캐러셀 3개 start -->
						<div class="carousel-item">
							<div class="row">

								<!-- 4개 반복문 -->
								<c:forEach var="movie" items="${mlist }" begin="4" end="7">
									<div class="col-md-3 mb-3">
										<div class="card" style="width: 250px; border: 0px solid black;">
											<div class="hovertest">
											<img class="img-fluid" alt="100%x280" src="../save/${movie.poster}" style="width: 280px;">
												<div class="cardbtn" style="text-align: center;">
												<button class="btn btn-m detailbtn" type="button" style="background-color: #339EB2; color: white;" onclick="test()">상세보기</button>	
												&nbsp;&nbsp;
												<button class="btn btn-m bookbtn" type="button" style="background-color: #503396; color: white;" onclick="#">예매하기</button>	
												</div>
											</div>
											<div class="card-body">
												<h5 class="card-title" style="font-family: Noto Sans KR; text-align: center;">${movie.name }</h5>
												<div style="text-align: center;">개봉일: <fmt:formatDate value="${movie.opendate }" pattern="yyyy.MM.dd"/></div>
											</div>
	
										</div>
									</div>
								
								</c:forEach>

							</div>
						</div>
						<!-- 두번째 캐러셀 end -->
						<!-- 세번째 캐러셀 start-->
						<div class="carousel-item">
							<div class="row">

								<!-- 4개 반복문 -->
								<c:forEach var="movie" items="${mlist }" begin="8" end="10">
									<div class="col-md-3 mb-3">
										<div class="card" style="width: 250px; border: 0px solid black;">
											<div class="hovertest">
											<img class="img-fluid" alt="100%x280" src="../save/${movie.poster}" style="width: 280px;">
												<div class="cardbtn" style="text-align: center;">
												<button class="btn btn-m detailbtn" type="button" style="background-color: #339EB2; color: white;" onclick="test()">상세보기</button>	
												&nbsp;&nbsp;
												<button class="btn btn-m bookbtn" type="button" style="background-color: #503396; color: white;" onclick="#">예매하기</button>	
												</div>
											</div>
											<div class="card-body">
												<h5 class="card-title" style="font-family: Noto Sans KR; text-align: center;">${movie.name }</h5>
												<div style="text-align: center;">개봉일: <fmt:formatDate value="${movie.opendate }" pattern="yyyy.MM.dd"/></div>
											</div>
	
										</div>
									</div>
								
								</c:forEach>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- 박스 오피스 api-->
	<div class="container_boxoffice">
	<div class="boxoffice" style="margin-top: 20px; margin-bottom: 100px;"></div>
	</div>
</div>

<div style="height: 550px; background-color: white;">
<!-- 스토어 캐러셀 -->
<section class="pt-5 pb-5">
    <div style="margin-left: 100px; margin-right: 100px;">
        <div class="row">
            <div class="col-6">
                <h3 class="mb-3" style="font-family: Noto Sans KR; font-weight: 500;">메가박스 스토어</h3>
            </div>
            <div class="col-6 text-right">
                <a class="btn btn-primary mb-3 mr-1" href="#carouselExampleIndicators_store" role="button" data-slide="prev">
                    <i class="fa fa-arrow-left"></i>
                </a>
                <a class="btn btn-primary mb-3 " href="#carouselExampleIndicators_store" role="button" data-slide="next">
                    <i class="fa fa-arrow-right"></i>
                </a>
            </div>
            <div class="col-12">
                <div id="carouselExampleIndicators_store" class="carousel slide carousel-fade" data-ride="carousel">

                    <div class="carousel-inner">
                        <div class="carousel-item active">
                            <div class="row">
                                <c:forEach var="store" items="${slist }" begin="0" end="3">
                                	<div class="col-md-3 mb-3">
	                                    <div class="card" style="text-align: center;">
	                                    	<a href="/store/detail?store_num=${store.store_num }">
	                                        <img class="img-fluid" alt="100%x280" src="../save/${store.store_photo }" >
	                                        </a>
	                                        <div class="card-body" style="text-align: center;">
	                                            <h4 class="card-title" style="font-family: Noto Sans KR;">${store.store_product }</h4>
	                                            <p class="card-text">${store.store_content }</p>
	                                        </div>
	                                    </div>
	                                </div>
                                </c:forEach>
                                
                            </div>
                        </div>
                        <div class="carousel-item">
                            <div class="row">

                                 <c:forEach var="store" items="${slist }" begin="4" end="7">
                                	<div class="col-md-3 mb-3">
	                                    <div class="card" style="text-align: center;">
	                                        <a href="/store/detail?store_num=${store.store_num }">
	                                        <img class="img-fluid" alt="100%x280" src="../save/${store.store_photo }" >
	                                        </a>
	                                        <div class="card-body" style="text-align: center;">
	                                            <h4 class="card-title" style="font-family: Noto Sans KR;">${store.store_product }</h4>
	                                            <p class="card-text">${store.store_content }</p>
	                                        </div>
	                                    </div>
	                                </div>
                                </c:forEach>

                            </div>
                        </div>
                        <div class="carousel-item">
                            <div class="row">

                                <c:forEach var="store" items="${slist }" begin="8" end="11">
                                	<div class="col-md-3 mb-3">
	                                    <div class="card" style="text-align: center;">
	                                        <a href="/store/detail?store_num=${store.store_num }">
	                                        <img class="img-fluid" alt="100%x280" src="../save/${store.store_photo }" >
	                                        </a>
	                                        <div class="card-body" style="text-align: center;">
	                                            <h4 class="card-title" style="font-family: Noto Sans KR;">${store.store_product }</h4>
	                                            <p class="card-text">${store.store_content }</p>
	                                        </div>
	                                    </div>
	                                </div>
                                </c:forEach>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

</div>
<div style="height: 580px; background-color: #503396;">
	<!-- 커뮤니티 -->
	<div class="main_community" style="border: 1px solid black; border-radius:15px; background-color:white; width: 40%; height: 500px; float: right; margin-right: 130px; margin-top: 30px;">
		<div style="background-color: #339EB2; border-radius:15px 15px 0px 0px; padding: 13px 20px 10px;"><h4 style="font-family: Noto Sans KR; font-weight: 500; color: white;">커뮤니티</h4></div>
		<table class="table table-hover" style="width:700px; color: black; margin:0px 10px 10px 25px;">
			<c:forEach var="community" items="${clist }" begin="0" end="9">
				<tr>
					<td style="width: 60%;"><a href="/community/detail?num=${community.num }&currentPage=1" style="color: black;">${community.subject }</a></td>
					<td style="width: 25%; text-align: center;">${community.name }</td>
					<td style="width: 15%; text-align: center;"><fmt:formatDate value="${community.writeday }" pattern="yyyy-MM-dd"/> </td>
				</tr>
			</c:forEach>
		</table>
	</div>
	<!-- 이벤트 -->
	<h4 style="font-family: Noto Sans KR; font-weight: 500; color: white; padding-top: 40px; margin-left: 100px;">이벤트</h4><br>
	<div class="container_event" style="border:0px solid white; background-color: white; border-radius: 15px;">
		<c:forEach var="event" items="${elist }" begin="0" end="7">
			<div class="item">
			<a href="/event/detail?num=${event.num }"><img alt="#" src="../save/${event.photo}" style="width: 200px;"></a>
			</div>
		</c:forEach>
	</div>
</div>
</div>
</body>
</html>