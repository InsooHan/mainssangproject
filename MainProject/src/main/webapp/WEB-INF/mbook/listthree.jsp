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
<!-- iamport.payment.js -->
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.8.js"></script>
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
flex: 1 0 0;
}
.item:nth-child(1){flex: 0.17 0 0;}
.item:nth-child(2){flex: 0.6 0 0;}
.item:nth-child(3){flex: 1.2 0 0;}
.item:nth-child(4){flex: 1.2 0 0;}
div.item div.one
{
height: 25%;
text-align: center;
line-height: 120px;
font-size: 9pt;
border: 1px groove gray;
}
div.item div.subname
{
background-color: black;
text-align: center;
height: 10%;
line-height: 40px;
border: 1px solid #808080;
}
div.item span.moviedetail
{
font-weight: bold;
}
</style>
<script type="text/javascript">
$(function() {
	
	//연령 등급 색 넣기
	var age="${age}";
	if(age==12){
		$("#movieage").css("background-color","orange");
	}else if(age==15) {
		$("#movieage").css("background-color","lightblue");
	}else{
		$("#movieage").css("background-color","red");
	}
	
	//인원수 넣기
	var adult=${adult};
	var youth=${youth};
	
	if(adult!=null){
		$("#inwon").append("&nbsp;성인&nbsp;"+adult+"&nbsp;");
	}if(youth!=null){
		$("#inwon").append("&nbsp;청소년&nbsp;"+youth+"&nbsp;");
	}
	
	
	
});
</script>
</head>
<body>
<div style="height: 800px; padding-top: 30px; background-color:#505050;">
<div class="container">
	<div class="item">
		<div class="one" style="background-color: rgb(51,51,51); color: white;"><b>상영시간</b></div>
		<div class="one" style="background-color: rgb(51,51,51); color: white;"><b>인원/좌석</b></div>
		<div class="one" style="background-color: #FF5050;;"><b>결제</b></div>
		<div class="one" style="background-color: white;"><b>결제완료</b></div>
	</div>
	<div class="item" style="background-color: white;">
		<div class="subname">
			<b style="color: white; font-size: 15px;">예매정보</b>
		</div>
		<img src="../save/${poster}" style="width: 150px; height: 200px;margin: 15px 50px;">
		<div style="margin: 5px 5px;">
			<span id="movieage" style="display:inline-block; font-weight: bold; border-radius: 7px; width: 25px; text-align: center; color: white;">${age}</span>&nbsp;
			<span class="moviedetail" style="font-size: 14pt;">${mname}</span>
			<br><br>
			<span class="moviedetail">일시&nbsp;&nbsp;&nbsp;<fmt:formatDate value="${time}" pattern="yyyy-MM-dd HH:mm"/> </span><br>
			<span class="moviedetail">상영시간&nbsp;&nbsp;&nbsp;${runtime}&nbsp;분</span><br>
			<span class="moviedetail" id="inwon">인원&nbsp;&nbsp;</span><br>
			<hr>
			<span class="moviedetail">좌석&nbsp;&nbsp;&nbsp;${realseat}</span>
		</div>
		
		
	</div>
	<div class="item" style="background-color: rgb(232,232,232);">
		<div class="subname">
			<b style="color: white; font-size: 15px;">결제수단</b>
		</div>
	</div>
	<div class="item" style="background-color: white;">
		<div class="subname">
			<b style="color: white; font-size: 15px;">결제하기</b>
		</div>
		<div style="height: 45%; background-color: white; text-align: center;">
			<i class="fa-regular fa-credit-card"></i>
		</div>
		<div style="height: 10%; background-color: rgb(65,65,65); border: 0.7px solid rgb(103,103,103);">
			<span style="color: white; font-weight: bold; line-height: 45px;">&nbsp;&nbsp;상품금액&nbsp;&nbsp;</span>
			<span style="color: white; font-weight: bold; line-height: 45px;"><fmt:formatNumber type="number" maxFractionDigits="3" value="${realprice}"/>&nbsp;원</span>
		</div>
		<div style="height: 10%; background-color: rgb(65,65,65); border: 0.7px solid rgb(103,103,103);">
			<span style="color: white; font-weight: bold; line-height: 45px;">&nbsp;&nbsp;할인금액&nbsp;&nbsp;</span>
			<span style="color: white; font-weight: bold; line-height: 45px;">-0&nbsp;원</span>
		</div>
		<div style="height: 10%; background-color: rgb(65,65,65); border: 0.7px solid rgb(103,103,103);">
			<span style="color: white; font-weight: bold; line-height: 45px;">&nbsp;&nbsp;결제금액&nbsp;&nbsp;</span>
			<span style="color: white; font-weight: bold; line-height: 45px;">&nbsp;원</span>
		</div>
		<div id="pay" style="height: 15%; background-color: red; text-align: center; color: white; line-height: 70px; cursor: pointer;">
			<b>결제하기</b>
		</div>
	</div>
</div>
</div>
<script type="text/javascript">
var IMP = window.IMP;   // 생략 가능
IMP.init("imp62053265"); // 예: imp00000000 

//신용/체크카드
function requestPay1() {
    IMP.request_pay({
        pg : 'html5_inicis',
        pay_method : 'card',
        merchant_uid: "merchant_" + new Date().getTime(), 
        name : "nametest",
        amount : 100,
        buyer_email : 'Iamport@chai.finance',
        buyer_name : '쌍용교육센터 파이널 프로젝트',
        buyer_tel : '010-1234-5678',
        buyer_addr : '서울특별시 강남구 역삼동',
        buyer_postcode : '123-456'
    }, function (rsp) { // callback
        if (rsp.success) {
            console.log(rsp);
            
        } else {
            console.log(rsp);
        }
    });
}
</script>
</body>
</html>