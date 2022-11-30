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
		var year = today.getFullYear();
		var month = ('0' + (today.getMonth() + 1)).slice(-2);
			//당일 박스오피스 데이터는 안나와서 하루 전 날짜 받아오기
			var day = ('0' + today.getDate()).slice(-2);
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
				
					result +="<table class='table table-dark table-hover' style='border:5	px inset #339EB2; width:350px; color: white; text-align:center;'>";
						result +="<tr>";
							result +="<th>순위</th>";
							result +="<th>영화</th>";
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
	}
</style>
</head>
<body>
<div class="main">
<div class="container-fluid">

	<!-- 박스 오피스 -->
	<div class="boxoffice" style="margin-left: 1400px;"></div>
</div>
</div>
</body>
</html>