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

}
.item
{
flex-shrink: 0;
}
div.item div.one
{
height: 25%;
text-align: center;
line-height: 120px;
font-size: 9pt;
border: 1px solid gray;
}
a.st
{
width: 150px;
height: 35px;
text-align: center;
line-height:35px;
cursor: pointer;
font-weight: bold;
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
div.ddddd div.detailtable
{
display:inline-block;
border:1px solid #bebebe;
border-radius:10px;
text-align:center;
width:100px;
height:50px;
cursor: pointer;
background-color: #f8f8ff;
}
#movie
{
overflow: auto;
}
</style>
<script type="text/javascript">
$(function() {
	var to=new Date();
	var q="";
	var today="";
	var realtoday="";
	function getDayOfWeek(a){

	    const week = ['일', '월', '화', '수', '목', '금', '토'];

	    const dayOfWeek = week[a];

	    return dayOfWeek;

	}
	
	for(var i=0;i<7;i++){
		
		today=to.getDate();
		realtoday=to.getFullYear()+":"+(to.getMonth()+1)+":"+today;
		var q="&nbsp;<div style='display:inline-block; font-size: 1.1em; color:white; background-color:gray; width:30px; height:30px; line-height:30px; text-align:center; border-radius:100px; position:relative;'>";
		
		q+="<span class='five' id='msche' style='cursor:pointer;'>";
		q+="<p style='display:none;'>"+realtoday+"</p><b>";
		q+=today+"</b></span>\n<b style='color:black;'>"+getDayOfWeek(to.getDay())+"</b></div>&nbsp;&nbsp;&nbsp;";

		to.setDate(to.getDate()+1);

		$(".date").append(q);
	}
	
	//마우스 호버 이벤트
	$(".two").hover(function(){
		$(this).css("border","1px groove orange");
	},function(){
		$(".two").css("border","");
	});
	
	$(document).on("mouseover",".three",function(){
		$(this).css("border","1px groove orange");
	});
	$(document).on("mouseleave",".three",function(){
		$(this).css("border","");
	});
	
	$(".four").hover(function(){
		$(this).css("border","1px groove orange");
	},function(){
		$(".four").css("border","");
	});
	
	
	
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
		
		$(this).css("background-color","#FF5050");
	});
	
	$(document).on("click",".four",function(){
		moviename=$(this).find('b').text();
		$(".four").css("background-color","#dcdcdc");
		$(this).css("background-color","#FF5050");
	});
	
	$(document).on("click","#msche",function(){
		$(".five").parent().css("background-color","gray");
		$(this).parent().css("background-color","black");
		var mtime=$(this).find('p').text();
		$(".movietime").text("");
		//alert(mtime);
		//location.href="movielist";
		
 		 $.ajax({
			type:"get",
			url:"movielist",
			data:{"moviename":moviename,"theater":theater},
			dataType:"json",
			success:function(res){
				//alert(res); //object Object가 들어와야하지만 여기는 null이 출력됨
				//alert(Object.keys(res[0]).includes('movietime'));
				function formatDate(date) {
					var d = new Date(date),
				    
				    time=d.getHours();
				    min=d.getMinutes();
				    
				    return time+":"+min;
			    }

				function realtoday(date){
					var to = new Date(date)
					
					return to.getFullYear()+":"+(to.getMonth()+1)+":"+to.getDate();
				}

				var i=1; 
  				var s="<div class='ddddd'>";
					s+="<div style='display: block; height: 10px;'></div>";
				$.each(res,function(idx,item){
					
				if(mtime==realtoday(item.movietime)){
					
					var seatnum=item.seat.length;
					var seatarr="";
					if(seatnum!=1){
						var seata=item.seat.substring(2,(seatnum-1));
						seatarr = seata.split("ll");
					
					}

					
					s+="&nbsp;<div class='detailtable' cartnum='"+item.cart_num+"'>"; // data-bs-toggle='modal' data-bs-target='#bookModal'>"
					s+="<span><b>";
					s+=seatarr.length;	
					s+="/"+item.capacity+"</b></span>";
					s+="<span class='mmmtime'><br><b>";
					s+=formatDate(item.movietime);
					s+="</b></span><p style='display:none;'>"+item.sang_num+"</p>";
					s+="</div>&nbsp;&nbsp;";
					if((i+4)%4==0)
						s+="</div><div>"; i++;
						
						
						//The Modal
					/* s+=	"<div class='modal' id='bookModal'>";
					s+=	  "<div class='modal-dialog'>";
					s+=	    "<div class='modal-content'>";

						      //Modal Header
					s+=	      "<div class='modal-header'>";
					s+=	        "<h4 class='modal-title'>"+res[]+"~</h4>";
					s+=	        "<button type='button' class='btn-close' data-bs-dismiss='modal'></button>";
					s+=	      "</div>";

						      //Modal body
					s+=	      "<div class='modal-body' style='text-align:center;'>";
					s+=	        "<span style='font-size: 9pt;'>본 영화는 <b style='color: orange; font-size: 11pt;'>만 "+item.age+"세 이상 관람가</b> 영화입니다.<br>";
					s+=         "만 15세 미만 고객님(영,유아 포함)은 반드시 부모님 또는 성인 보호자의 동반하에 관람이 가능합니다. 연령 확인 불가 시 입장이 제한될 수 있습니다.</span>";
					s+=	      "</div>";

						      //Modal footer
					s+=	      "<div class='modal-footer'>";
					s+=	        "<button type='button' class='btn btn-danger' data-bs-dismiss='modal'>취소</button>";
					s+=	        "<button type='button' class='btn btn-dark' data-bs-dismiss='modal'>인원/좌석 선택</button>";
					s+=	      "</div>";

					s+=	    "</div>";
					s+=	  "</div>";
					s+=	"</div>"; */
				}
				});
				/* $.each(res[0], function(key, value){
				    s+=key 
				    s+=value;
				}); */
				$(".movietime").html(s); 
			}
		});  
	});
	
	$(document).on("click",".detailtable",function(){
		
		var sangnum=$(this).find('p').text();
		var cartnum=$(this).attr("cartnum");
		//alert(cartnum);
		location.href="listtwo?moviename="+moviename+"&theater="+theater+"&sangnum="+sangnum+"&cartnum="+cartnum;
		
	});
	
	
	$(".fon").trigger("click");

});
</script>
</head>
<body>
<div style="height: 800px; padding-top: 30px; background-color: #505050;">
<div class="container">
	<div class="item" style="flex-basis: 70px;">
		<div class="one" style="background-color: #FF5050;"><b>상영시간</b></div>
		<div class="one" style="background-color: white;"><b>인원/좌석</b></div>
		<div class="one" style="background-color: white;"><b>결제</b></div>
		<div class="one" style="background-color: white;"><b>결제완료</b></div>
	</div>
	
	<div class="item" style="border: 1px #d2d2d2 solid;">	
		<div class="" style="height:100%; background-color:#dcdcdc;">
			<!-- <a href="#" class="list-group-item list-group-item-action st">MY영화관</a> -->
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
	
	<div class="item" id="theater" style="background-color: white; border: 1px solid #d2d2d2;">
	
	</div>
	
	<div class="item" id="movie" style="background-color: #dcdcdc; border: 1px solid #d2d2d2;">
 		<c:forEach var="dto" items="${list}" varStatus="i">
			<a class='list-group-item list-group-item-action st four'>&nbsp;
			<%-- <span style='border-radius: 100px; font-size:7pt; color:white; background-color: 
			${dto.age==12?'#46AAFF':dto.age==15?'orange':dto.age=="청소년관람불가"?'#FF5675':dto.age=="전체관람가"?'green':''};'>
			&nbsp;${dto.age}&nbsp;</span> --%>
			<span style='border-radius: 100px; font-size:7pt; color:white; background-color: 
			${dto.age=="청소년관람불가"?'#FF5675':dto.age=="전체관람가"?'green':dto.age==12?'#46AAFF':dto.age==15?'orange':''};'>
			&nbsp;${dto.age=="청소년관람불가"?"청불":dto.age=="전체관람가"?'전체':dto.age}&nbsp;</span>
			<span style="font-weight: bold;">${dto.name}</span><b style="display: none;">${dto.num}</b></a>
		</c:forEach>
	</div>
	
	<div class="item" style="flex-grow: 1; background-color: white; border: 1px solid #d2d2d2;">
		<div style="background-color: #f9f8f6; border: 1px solid #d2d2d2;">
		<div class="date" style="text-align: center;">
			<div style="display: block; height: 10px;"></div>
			
		</div>
		</div>
		<div class="movietime">
			<div style="display: block; height: 10px;"></div>
			조회가능한 시간이 없습니다. 조건을 변경해주세요!
		</div>
	</div>

</div>
</div>
</body>
</html>




















