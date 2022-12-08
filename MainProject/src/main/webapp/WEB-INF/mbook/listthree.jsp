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
#ckcard,#kakao
{
display: inline-block;
text-align: center;
width: 45%;
height: 80%;
cursor: pointer;
border-radius: 30px;
line-height: 35px;
}
</style>
<script type="text/javascript">
$(function() {
	realprice=${realprice};
	
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
	
	//클릭하면 클래스명 추가
	$("#ckcard").click(function(){
		$("#kakao").css("border","");
		$("#kakao").removeClass("select");
		$(this).addClass("select");
		$(this).css("border","3px solid orange");
		$(".fa-sack-dollar").css("color","#CD3861");
	});
	$("#kakao").click(function(){
		$("#ckcard").css("border","");
		$("#ckcard").removeClass("select");
		$(this).addClass("select");
		$(this).css("border","3px solid orange");
		$(".fa-sack-dollar").css("color","#FFDC3C");
	});
	
	$("#pay").click(function(){
		var test=$("div.item").find(".select").attr("var");
		
		
		
		if(test=="card"){
			requestPay1();
		}else if (test=="kakao") {
			requestPay2();
		}
		
	});
	
	//포인트 적용
	$("#mpointbtn").click(function() {
		mpoint=$("#mpoint").val();
		membernum=${memberdto.num};
		
		if(mpoint>${memberdto.mpoint}){
			alert("보유 포인트를 초과했습니다.");
		}else if (mpoint<0) {
			alert("마이너스를 입력했습니다.");
		}else if (mpoint>${realprice}){
			alert("가격을 초과했습니다.")
		}else{
			var totalprice=String(${realprice}-mpoint);
			realprice=${realprice}-mpoint;
			
			$("#discount").text("-"+addComma(mpoint)+" 원");
			$("#finalpay").text(addComma(totalprice)+" 원");
			//$("#finalpay").text("ㅎㅎㅎ원");
		}
	});
	
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
		<div style="height: 45%; background-color: rgb(232,232,232);">
			<br>
			<span style="margin: 5px 5px; font-weight: bold;"> Mpoint 보유현황 :&nbsp;${memberdto.mpoint} point </span><br><br>&nbsp;
			<input id="mpoint" type="number" class="form-control" style="width: 200px; display: inline-block;">&nbsp;&nbsp;&nbsp;<button type="button" class="btn btn-success" id="mpointbtn">포인트 적용</button>
		</div>
		<div style="height: 35%; background-color: rgb(232,232,232); text-align: center;">
			<i class="fa-solid fa-sack-dollar fa-5x"></i>
		</div>
		<div style="height: 10%; background-color: rgb(232,232,232);">
			<span id="ckcard" var="card" style="background-color: #CD3861; margin-left: 18px;">
				<b style="color: white;">신용/체크카드</b>
			</span>
			<span id="kakao" var="kakao" style="background-color: #FFDC3C;">
				<b style="color: white;">카카오페이</b>
			</span>
		</div>
	</div>
	<div class="item" style="background-color: white;">
		<div class="subname">
			<b style="color: white; font-size: 15px;">결제하기</b>
		</div>
		<div style="height: 45%; background-color: white; text-align: center; line-height: 270px;">
			<i class="fa-regular fa-credit-card fa-7x"></i>
		</div>
		<div style="height: 10%; background-color: rgb(65,65,65); border: 0.7px solid rgb(103,103,103);">
			<span style="color: white; font-weight: bold; line-height: 45px;">&nbsp;&nbsp;상품금액&nbsp;&nbsp;</span>
			<span style="color: white; font-weight: bold; line-height: 45px;"><fmt:formatNumber type="number" maxFractionDigits="3" value="${realprice}"/>&nbsp;원</span>
		</div>
		<div style="height: 10%; background-color: rgb(65,65,65); border: 0.7px solid rgb(103,103,103);">
			<span style="color: white; font-weight: bold; line-height: 45px;">&nbsp;&nbsp;할인금액&nbsp;&nbsp;</span>
			<span id="discount" style="color: white; font-weight: bold; line-height: 45px;">-0&nbsp;원</span>
		</div>
		<div style="height: 10%; background-color: rgb(65,65,65); border: 0.7px solid rgb(103,103,103);">
			<span style="color: white; font-weight: bold; line-height: 45px;">&nbsp;&nbsp;결제금액&nbsp;&nbsp;</span>
			<span id="finalpay" style="color: white; font-weight: bold; line-height: 45px;"><fmt:formatNumber type="number" maxFractionDigits="3" value="${realprice}"/>&nbsp;원</span>
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
        name : "${realseat}",
        amount : realprice,
        buyer_email : '${memberdto.email}',
        buyer_name : '${memberdto.name}',
        buyer_tel : '${memberdto.hp}',
        buyer_addr : '${memberdto.addr}',
        buyer_postcode : '123-456'
    }, function (rsp) { // callback
        if (rsp.success) {
            console.log(rsp);
            
            $.ajax({
    			type:"get",
    			url:"buy",
    			dataType:"html",
    			data:{"realprice":realprice,"mpoint":mpoint,"membernum":membernum},
    			success:function(res){
    				
    				location.href="/book/listfinal";
    			}
    		});
            
            
        } else {
            console.log(rsp);
        }
    });
}

//카카오페이
function requestPay2() {
    IMP.request_pay({
        pg : 'kakaopay',
        pay_method : 'card',
        merchant_uid: "merchant_" + new Date().getTime(), 
        name : "${realseat}",
        amount : realprice,
        buyer_email : '${memberdto.email}',
        buyer_name : '${memberdto.name}',
        buyer_tel : '${memberdto.hp}',
        buyer_addr : '${memberdto.addr}',
        buyer_postcode : '123-456'
    }, function (rsp) { // callback
        if (rsp.success) {
            console.log(rsp);
            
            $.ajax({
    			type:"get",
    			url:"buy",
    			dataType:"html",
    			data:{"realprice":realprice,"mpoint":mpoint,"membernum":membernum},
    			success:function(res){
    				
    				location.href="/book/listfinal";
    			}
    		});
            
          
        } else {
            console.log(rsp);
        }
    });
}

//3자리 콤마
function addComma(value){
    value = value.replace(/\B(?=(\d{3})+(?!\d))/g, ",");
    return value; 
}
</script>
</body>
</html>