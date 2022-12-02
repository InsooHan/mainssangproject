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
				
					result +="<table class='table table-dark table-hover' style='border:1px solid black; border-radius: 16px; box-shadow:inset 0 0 8px #deb13a; width:400px; color: white; text-align:center;'>";
						result +="<caption style='caption-side: top; color: white; font-size:1.8em; font-weight: 500; text-align:center;'>박스오피스 순위<span style='font-size:0.5em;'>("+year+"."+month+"."+day+")</span></caption>";
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
				
				//div에 출력
				$(".boxoffice").html(result);
				
			}
		});
		
	});
						
						
</script>
<style type="text/css">
	body{
	font-family: Noto Sans KR;
	}
	
	.main{
	background-color: #555555;
	font-family: Noto Sans KR;
	margin-top: 0px;
	}
	
	
</style>
</head>
<body>
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
	
<div style="height: 650px; background-color:#212529; padding-top: 10px; padding-left: 100px; padding-right: 100px; padding-bottom: 100px;">
	
	<!-- 박스 오피스 api-->
	<div class="boxoffice" style="margin-top:20px; margin-bottom: 100px;"></div>
	<!-- 영화 리스트 캐러셀-->
	<section class="pt-5 pb-5" style="width: 60%;" >
	    <div class="container" style="float: right;">
	        <div class="row">
	            <div class="col-6">
	                <h3 class="mb-3" style="color: #339EB2; font-family: Noto Sans KR;">영화 리스트</h3>
	            </div>
	            <div class="col-6 text-right">
	                <a class="btn btn-primary mb-3 mr-1" href="#carouselExampleIndicators2" role="button" data-slide="prev">
	                    <i class="fa fa-arrow-left"></i>
	                </a>
	                <a class="btn btn-primary mb-3 " href="#carouselExampleIndicators2" role="button" data-slide="next">
	                    <i class="fa fa-arrow-right"></i>
	                </a>
	            </div>
	            <div class="col-12">
	                <div id="carouselExampleIndicators2" class="carousel slide carousel-fade" data-ride="carousel">
	
	                    <div class="carousel-inner">
	                        <div class="carousel-item active">
	                            <div class="row">
	
	                                <div class="col-md-4 mb-3">
	                                    <div class="card">
	                                        <img class="img-fluid" alt="100%x280" src="https://images.unsplash.com/photo-1532781914607-2031eca2f00d?ixlib=rb-0.3.5&amp;q=80&amp;fm=jpg&amp;crop=entropy&amp;cs=tinysrgb&amp;w=1080&amp;fit=max&amp;ixid=eyJhcHBfaWQiOjMyMDc0fQ&amp;s=7c625ea379640da3ef2e24f20df7ce8d">
	                                        <div class="card-body">
	                                            <h4 class="card-title">Special title treatment</h4>
	                                            <p class="card-text">With supporting text below as a natural lead-in to additional content.</p>
	
	                                        </div>
	
	                                    </div>
	                                </div>
	                                <div class="col-md-4 mb-3">
	                                    <div class="card">
	                                        <img class="img-fluid" alt="100%x280" src="https://images.unsplash.com/photo-1517760444937-f6397edcbbcd?ixlib=rb-0.3.5&amp;q=80&amp;fm=jpg&amp;crop=entropy&amp;cs=tinysrgb&amp;w=1080&amp;fit=max&amp;ixid=eyJhcHBfaWQiOjMyMDc0fQ&amp;s=42b2d9ae6feb9c4ff98b9133addfb698">
	                                        <div class="card-body">
	                                            <h4 class="card-title">Special title treatment</h4>
	                                            <p class="card-text">With supporting text below as a natural lead-in to additional content.</p>
	
	                                        </div>
	                                    </div>
	                                </div>
	                                <div class="col-md-4 mb-3">
	                                    <div class="card">
	                                        <img class="img-fluid" alt="100%x280" src="https://images.unsplash.com/photo-1532712938310-34cb3982ef74?ixlib=rb-0.3.5&amp;q=80&amp;fm=jpg&amp;crop=entropy&amp;cs=tinysrgb&amp;w=1080&amp;fit=max&amp;ixid=eyJhcHBfaWQiOjMyMDc0fQ&amp;s=3d2e8a2039c06dd26db977fe6ac6186a">
	                                        <div class="card-body">
	                                            <h4 class="card-title">Special title treatment</h4>
	                                            <p class="card-text">With supporting text below as a natural lead-in to additional content.</p>
	
	                                        </div>
	                                    </div>
	                                </div>
	
	                            </div>
	                        </div>
	                        <div class="carousel-item">
	                            <div class="row">
	
	                                <div class="col-md-4 mb-3">
	                                    <div class="card">
	                                        <img class="img-fluid" alt="100%x280" src="https://images.unsplash.com/photo-1532771098148-525cefe10c23?ixlib=rb-0.3.5&amp;q=80&amp;fm=jpg&amp;crop=entropy&amp;cs=tinysrgb&amp;w=1080&amp;fit=max&amp;ixid=eyJhcHBfaWQiOjMyMDc0fQ&amp;s=3f317c1f7a16116dec454fbc267dd8e4">
	                                        <div class="card-body">
	                                            <h4 class="card-title">Special title treatment</h4>
	                                            <p class="card-text">With supporting text below as a natural lead-in to additional content.</p>
	
	                                        </div>
	
	                                    </div>
	                                </div>
	                                <div class="col-md-4 mb-3">
	                                    <div class="card">
	                                        <img class="img-fluid" alt="100%x280" src="https://images.unsplash.com/photo-1532715088550-62f09305f765?ixlib=rb-0.3.5&amp;q=80&amp;fm=jpg&amp;crop=entropy&amp;cs=tinysrgb&amp;w=1080&amp;fit=max&amp;ixid=eyJhcHBfaWQiOjMyMDc0fQ&amp;s=ebadb044b374504ef8e81bdec4d0e840">
	                                        <div class="card-body">
	                                            <h4 class="card-title">Special title treatment</h4>
	                                            <p class="card-text">With supporting text below as a natural lead-in to additional content.</p>
	
	                                        </div>
	                                    </div>
	                                </div>
	                                <div class="col-md-4 mb-3">
	                                    <div class="card">
	                                        <img class="img-fluid" alt="100%x280" src="https://images.unsplash.com/photo-1506197603052-3cc9c3a201bd?ixlib=rb-0.3.5&amp;q=80&amp;fm=jpg&amp;crop=entropy&amp;cs=tinysrgb&amp;w=1080&amp;fit=max&amp;ixid=eyJhcHBfaWQiOjMyMDc0fQ&amp;s=0754ab085804ae8a3b562548e6b4aa2e">
	                                        <div class="card-body">
	                                            <h4 class="card-title">Special title treatment</h4>
	                                            <p class="card-text">With supporting text below as a natural lead-in to additional content.</p>
	
	                                        </div>
	                                    </div>
	                                </div>
	
	                            </div>
	                        </div>
	                        <div class="carousel-item">
	                            <div class="row">
	
	                                <div class="col-md-4 mb-3">
	                                    <div class="card">
	                                        <img class="img-fluid" alt="100%x280" src="https://images.unsplash.com/photo-1507525428034-b723cf961d3e?ixlib=rb-0.3.5&amp;q=80&amp;fm=jpg&amp;crop=entropy&amp;cs=tinysrgb&amp;w=1080&amp;fit=max&amp;ixid=eyJhcHBfaWQiOjMyMDc0fQ&amp;s=ee8417f0ea2a50d53a12665820b54e23">
	                                        <div class="card-body">
	                                            <h4 class="card-title">Special title treatment</h4>
	                                            <p class="card-text">With supporting text below as a natural lead-in to additional content.</p>
	
	                                        </div>
	
	                                    </div>
	                                </div>
	                                <div class="col-md-4 mb-3">
	                                    <div class="card">
	                                        <img class="img-fluid" alt="100%x280" src="https://images.unsplash.com/photo-1532777946373-b6783242f211?ixlib=rb-0.3.5&amp;q=80&amp;fm=jpg&amp;crop=entropy&amp;cs=tinysrgb&amp;w=1080&amp;fit=max&amp;ixid=eyJhcHBfaWQiOjMyMDc0fQ&amp;s=8ac55cf3a68785643998730839663129">
	                                        <div class="card-body">
	                                            <h4 class="card-title">Special title treatment</h4>
	                                            <p class="card-text">With supporting text below as a natural lead-in to additional content.</p>
	
	                                        </div>
	                                    </div>
	                                </div>
	                                <div class="col-md-4 mb-3">
	                                    <div class="card">
	                                        <img class="img-fluid" alt="100%x280" src="https://images.unsplash.com/photo-1532763303805-529d595877c5?ixlib=rb-0.3.5&amp;q=80&amp;fm=jpg&amp;crop=entropy&amp;cs=tinysrgb&amp;w=1080&amp;fit=max&amp;ixid=eyJhcHBfaWQiOjMyMDc0fQ&amp;s=5ee4fd5d19b40f93eadb21871757eda6">
	                                        <div class="card-body">
	                                            <h4 class="card-title">Special title treatment</h4>
	                                            <p class="card-text">With supporting text below as a natural lead-in to additional content.</p>
	                                        </div>
	                                    </div>
	                                </div>
	                            </div>
	                        </div>
	                    </div>
	                </div>
	            </div>
	        </div>
	    </div>
	</section>
	</div>
	
	
	
</div>
<div style="height: 500px; background-color: white;">

</div>
<div style="height: 500px; background-color: #503396;">

</div>
</body>
</html>