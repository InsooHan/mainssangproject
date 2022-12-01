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
						result +="<caption style='caption-side: top; color: white; font-size:1.8em; font-weight: 700; text-align:center;'>박스오피스 순위<span style='font-size:0.5em;'>("+year+"."+month+"."+day+")</span></caption>";
						result +="<tr>";
							result +="<th style='width:100px;'>순위</th>";
							result +="<th style='width:300px;'>영화</th>";
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
	.main{
	background-color: #555555;
	font-family: Noto Sans KR;
	margin-top: 0px;
	}
	
</style>
</head>
<body>
	<!-- 메인 상단 광고 슬라이드 -->
	<div id="demo" class="carousel slide" data-bs-ride="carousel">
	
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
	
	
<div style="height: 650px; background-color:#212529; padding-top: 10px; padding-left: 100px; padding-right: 100px; padding-bottom: 100px;">
	
	<!-- 박스 오피스 api-->
	<div class="boxoffice" style="margin-top:20px; margin-bottom: 100px;"></div>
</div>
<div style="height: 500px; background-color: white;">

</div>

</body>
</html>