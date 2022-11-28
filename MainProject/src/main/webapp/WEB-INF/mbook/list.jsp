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
<title>Insert title here</title>
<style type="text/css">
.container
{
display: flex;
flex-direction: row;
align-items: stretch;
width: 1500px;
height: 500px;
background-color: lightblue;
}
.item
{

}
div.item div.one
{
height: 25%;
text-align: center;
line-height: 120px;
font-size: 9pt;
border: 1px groove gray;
}
a.st
{
width: 150px;
height: 35px;
text-align: center;
line-height:35px;
border: 1px solid gray;
}
a.three
{
background: white;
}
a.four
{
overflow: hidden;
text-overflow: ellipsis;
white-space: nowrap;
width: 230px;
background-color: #dcdcdc;
}


</style>
<script type="text/javascript">
$(function() {
	var to=new Date();
	var q="";
	var today="";
	
	function getDayOfWeek(a){

	    const week = ['일', '월', '화', '수', '목', '금', '토'];

	    const dayOfWeek = week[a];

	    return dayOfWeek;

	}
	
	for(var i=0;i<7;i++){
		
		today=to.getDate();
		
		var q="&nbsp;<div style='display:inline-block; font-size: 1.1em; color:white; background-color:gray; width:30px; height:30px; line-height:30px; text-align:center; border-radius:100px; position:relative;'>";
		
		q+="<span id='msche' style='cursor:pointer;'>"+today+"</span>\n"+getDayOfWeek(to.getDay())+"</div>&nbsp;&nbsp;";

		to.setDate(to.getDate()+1);

		$(".date").append(q);
	}
	
	
	$(".two").click(function() {
		city=$(this).text();
		$(".two").css("background-color","#dcdcdc");
			
		$.ajax({
			type:"get",
			url:"listcity",
			dataType:"json",
			data:{"city":city},
			success:function(res){
				//alert(res);
				//alert(Object.keys(res[0]).includes('name'));  //true
				var s="";
				
				$.each(res,function(idx,item){
					s+="<a class='list-group-item list-group-item-action st three'><b style='display:none;'>";
					s+=item.num+"</b>";
					s+=item.name+"</a>";
				});  
				
				/* $.each(res[0], function(key, value){
				    s+=key;
				    s+=value;
				}); */ 
				
				$("#theater").html(s);
				
			}
		});
		
		$(this).css("background-color","#FF5050");
	});
	
	$(document).on("click",".three",function(){
		theater=$(this).find('b').text();
		$(".three").css("background-color","white");
		
		$.ajax({
			type:"get",
			url:"listmovie",
			dataType:"json",
			success:function(res){
				
				var t="";
				
/* 				$.each(res,function(idx,item){
					t+="<a class='list-group-item list-group-item-action st four'>&nbsp;";
					t+="<span style='border-radius: 100px; font-size:7pt; color:white;";
					
						if(item.age==12){
							t+=" background-color:#46AAFF;";
						}if(item.age==15){
							t+=" background-color:orange;";
						}if(item.age==19){
							t+=" background-color:#FF5675;";
						}
						
					t+="'>&nbsp;";
					t+=item.age+"&nbsp;</span>";
					t+=item.name+"</a>";
					
				});
				
				$("#movie").html(t); */
				
			}
		});
		$(this).css("background-color","#FF5050");
	});
	
	$(document).on("click",".four",function(){
		moviename=$(this).find('b').text();
		$(".four").css("background-color","#dcdcdc");
		$(this).css("background-color","#FF5050");
	});
	
	$(document).on("click","#msche",function(){
		
		$(".movietime").text("");
		//alert(moviename);
		//location.href="movielist";
		
 		 $.ajax({
			type:"get",
			url:"movielist",
			data:{"moviename":moviename,"theater":theater},
			dataType:"json",
			success:function(res){
				//alert(res); //object Object가 들어와야하지만 여기는 null이 출력됨
				//alert(Object.keys(res[0]).includes('movietime'));
				
  				var v="";
				
				$.each(res,function(idx,item){
					v+="<a class='list-group-item list-group-item-action st three'><b>";
					v+=item.movietime+"</b>";
					v+="</a>";
				});
				
				/* $.each(res[0], function(key, value){
				    v+=key; 
				    v+=value;
				});  */
				
				$(".movietime").html(v); 
			}
			
			
		});  
		
		
	});
	
	
	$(".fon").trigger("click");

});
</script>
</head>
<body>
<div class="container">
	<div class="item" style="flex-basis: 70px;">
		<div class="one" style="background-color: #FF5050;"><b>상영시간</b></div>
		<div class="one" style="background-color: lightgray;"><b>인원/좌석</b></div>
		<div class="one" style="background-color: lightgray;"><b>결제</b></div>
		<div class="one" style="background-color: lightgray;"><b>결제완료</b></div>
	</div>
	
	<div class="item">	
		<div class="" style="height:100%; background-color:#dcdcdc;">
			<a href="#" class="list-group-item list-group-item-action st">MY영화관</a>
			<a href="#" class="list-group-item list-group-item-action st two fon">서울</a>
			<a href="#" class="list-group-item list-group-item-action st two">경기/인천</a>
			<a href="#" class="list-group-item list-group-item-action st two">충청/대전</a>
			<a href="#" class="list-group-item list-group-item-action st two">전라/광주</a>
			<a href="#" class="list-group-item list-group-item-action st two">경북/대구</a>
			<a href="#" class="list-group-item list-group-item-action st two">경남/부산/울산</a>
			<a href="#" class="list-group-item list-group-item-action st two">강원</a>
			<a href="#" class="list-group-item list-group-item-action st two">제주</a>
		</div>
	</div>
	
	<div class="item" id="theater" style="background-color: white;">
	
	</div>
	
	<div class="item" id="movie" style="background-color: #dcdcdc;">
 		<c:forEach var="dto" items="${list}" varStatus="i">
			<a class='list-group-item list-group-item-action st four'>&nbsp;
			<span style='border-radius: 100px; font-size:7pt; color:white; background-color: 
			${dto.age==12?'#46AAFF':dto.age==15?'orange':dto.age==19?'#FF5675':''};'>
			&nbsp;${dto.age}&nbsp;</span>
			<span style="font-weight: bold;">${dto.name}</span><b style="display: none;">${dto.num}</b></a>
		</c:forEach>
	</div>
	
	<div class="item">
		<div class="date">
			
		</div>
		
		<div class="movietime">
			조회가능한 시간이 없습니다. 조건을 변경해주세요!
		</div>
	</div>

</div>
</body>
</html>




















