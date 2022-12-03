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
div.item div.one
{
height: 25%;
text-align: center;
line-height: 120px;
font-size: 9pt;
border: 1px groove gray;
width: 70px;
}
div.item:nth-child(2)
{
flex-grow: 1;
background-color: teal;
}
div.item div.two
{
background-color: black;
height: 5%;
text-align: center;
line-height: 25px;
color: white;
font-weight: bold;
}
div.item div.three
{
background-color: white;
height: 9%;
text-align: center;
}
.num
{
width: 30px;
text-align: center;
}
input[type="number"]::-webkit-outer-spin-button,
input[type="number"]::-webkit-inner-spin-button {
-webkit-appearance: none;
-moz-appearance: none;
appearance: none;
}
div.item div.four
{
background-color: black;
height: 70%;
line-height: 33px;
text-align:  center;
padding-top: 10px;
color: white;
}

</style>
<script type="text/javascript">
$(function() {
	//+-구현
	var seatnumber=${sdto.capacity-bookednum};
	
	$(".fa-plus").click(function(){
		var a=$(this).parent().find("input").val();
		a++;
		var totalseatnum=parseInt($("#adult").val())+parseInt($("#youth").val());
		
		if(totalseatnum!=seatnumber){
			$(this).parent().find("input").val(a);
		}
		if(totalseatnum==seatnumber){
			alert(seatnumber+"이상의 좌석을 예매할 수 없습니다.");
		}
	});
	$(".fa-minus").click(function(){
		var a=$(this).parent().find("input").val();
		a--;
		if(a!=-1){
			$(this).parent().find("input").val(a);
		}
		if(a==-1){
			alert("0보다 큰 수를 입력해주세요!");
		}
	});
	
	//이미 예약된 좌석 번호 추출
	var bookedseat=[];
	var seatnum=${seatnum};
	
	$.each(${booklist},function(idx,item){
		bookedseat[idx]=item;
		//console.log(bookedseat[idx]);
	});
	
	
	//32석 좌석 구현
	capa=${sdto.capacity};
	var seat="<i class='fa-regular fa-square fa-2xl seat' style='color:white;'></i>&nbsp;";
	var a=1;
	var j=0;
	var abc = ['A','B','C','D'];
	if(capa==32){
	for(var i=0;i<capa;i++){
		//좌석 옆 ABC 띄우기
		if(i==0 || (a+7)%8==0){
			$(".four").append("<b>"+abc[j]+"</b>&nbsp;&nbsp;&nbsp;");
			j++;
		}
		
		$(".four").append("<span id='seat"+i+"' seatnum="+(i+1)+">"+seat+"</span>");	
		
		//이미 예약된 좌석 표시
		for(var k=0;k<bookedseat.length;k++){

			if(bookedseat[k]==(i+1)){
				
				$("#seat"+i).find("i").removeClass("fa-regular fa-square fa-2xl seat");
				$("#seat"+i).find("i").addClass("fa-solid fa-square fa-2xl");
				$("#seat"+i).find("i").css("color","gray");
			}
		}
		
		//좌석 사이 간격 등
		if((a+2)%2==0)
			$(".four").append("&nbsp;&nbsp;&nbsp;");
		if((a+8)%8==0)
			$(".four").append("<br>");a++;
		if(i==31){
			var seatnum=[1,2,3,4,5,6,7,8]
			$(".four").append("&nbsp;");
			for(var k=0;k<seatnum.length;k++){
				$(".four").append("<span style='display: inline-block; font-size:15pt; width: 29px; margin-left:2px;'><b>"+seatnum[k]+"</b></span>");
				if((k+3)%2==0 && k!=7){
					$(".four").append("&nbsp;&nbsp;&nbsp;&nbsp;");
				}
			}
		}
		
			
	}
	//음 저거 반복문 위에 두번 돌리기는 너무 비효율적인뎅...
/* 	var aaa=bookedseat.length;
	for(var i=0;i<aaa;i++){
		if($("div.four").find("span").attr("seatnum")==bookedseat[i]){
			$("div.four").find("span").removeClass("fa-regular fa-square fa-2xl seat");
			$("div.four").find("span").addClass("fa-solid fa-square fa-2xl seat booked");
		}else{
			$("div.four").find("span").removeClass("fa-solid fa-square fa-2xl seat booked");
			$("div.four").find("span").addClass("fa-regular fa-square fa-2xl seat");
		}
	} */
	}
	
	//좌석 js
	seat="";
	
	$(".seat").hover(function(){
		$(this).css("color","gray");
	},function(){
		$(this).css("color","white");
	});
	
	$(".seat").click(function(){
		//alert(parseInt($("#adult").val())+parseInt($("#youth").val()));
		
		var seatnum=$(this).parent().attr("seatnum");
		
		if($(this).attr("class")=="fa-regular fa-square fa-2xl seat"){
			$(this).removeClass("fa-regular fa-square fa-2xl seat");
			$(this).addClass("fa-solid fa-square fa-2xl seat booked");
			
			seat+="l"+seatnum+"l";
			alert(seat);
		}else{
			$(this).removeClass("fa-solid fa-square fa-2xl seat booked");
			$(this).addClass("fa-regular fa-square fa-2xl seat");
			seat=seat.replace("l"+seatnum+"l","");
			alert(seat);
		}

	});
	
	//DB에 좌석 예약 정보 전송
	$(".moviebtn").click(function(){
		var totalseatnumber=parseInt($("#adult").val())+parseInt($("#youth").val());
		var cc=0;
		for(var i=0;i<capa;i++){
			if($("#seat"+i).find("i").attr("class")=="fa-solid fa-square fa-2xl seat booked"){
				cc++;
			}	
		}
		
		if(cc>totalseatnumber){
			alert("너무 많은 좌석을 선택했습니다!");
		}if(cc<totalseatnumber){
			alert("너무 적은 좌석을 선택했습니다!");
		}if(cc==totalseatnumber){
			var cartnum=${cartnum};
			//alert("버튼 클릭!");
			location.href="updatebook?cartnum="+cartnum+"&seat="+seat+"&adult="+$("#adult").val()+"&youth="+$("#youth").val();
		}
	
	});
	
	
});
</script>
</head>
<body>
<div class="container">
	<div class="item fir" style="flex-basis: 70px;">
		<div class="one" style="background-color: lightgray;"><b>상영시간</b></div>
		<div class="one" style="background-color: #FF5050;"><b>인원/좌석</b></div>
		<div class="one" style="background-color: lightgray;"><b>결제</b></div>
		<div class="one" style="background-color: lightgray;"><b>결제완료</b></div>
	</div>
	<div class="item">
		<div class="two">
			<b>인원/좌석 선택</b>
			<span style="float: right;">
				<b>${bookednum}/${sdto.capacity}</b>
			</span>
		</div>
		<div class="three">
			<div style="height: 7px;"></div>
			<span>
				<b>성인</b>
				<i class="fa-solid fa-minus" style="cursor: pointer;"></i>
				<input class="num" id="adult" type="number" name="adult" readonly="readonly" value="0" min="0">
				<i class="fa-solid fa-plus" style="cursor: pointer;"></i>
			</span>
			&nbsp;&nbsp;&nbsp;
			<span>
				<b>청소년</b>
				<i class="fa-solid fa-minus" style="cursor: pointer;"></i>
				<input class="num" id="youth" type="number" name="youth" readonly="readonly" value="0" min="0">
				<i class="fa-solid fa-plus" style="cursor: pointer;"></i>
			</span>
		</div>
		<div style="background-color: gray; height: 4%; text-align: center; color: white;">
			특별한 순간을 위한 프리미엄 상영관입니다.
		</div>
		<div style="background-color: gray; height: 4%; text-align: center; color: white;">
			<b>S C R E E N</b>
		</div>
		<div class="four">
			
		</div>
		<div class="five" style="height: 8%; float: right;">
			<button type="button" class="btn btn-info moviebtn">DB추가</button>
			<button type="button" class="btn btn-info test">숫자체크</button>
			<c:forEach var="bseat" items="${booklist}" varStatus="i">
				<span>${bseat}</span>
			</c:forEach>
		</div>
	</div>
</div>
</body>
</html>




















