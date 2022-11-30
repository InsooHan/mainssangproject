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
<!-- iamport.payment.js -->
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.8.js"></script>
<script src="https://kit.fontawesome.com/a47cf79e39.js" crossorigin="anonymous"></script>
<title>Insert title here</title>
<script type="text/javascript">
	$(function(){
		
		//신용/체크카드 선택시 kg이니시스, 카카오페이 선택시 카카오페이
		$("input:radio[name=payinput]").click(function(){
			var paysel = $("input[name=payinput]:checked").val();
			console.log(paysel);			
			
			if(paysel=="pay_card"){
				$("#pay_kakaobtn").hide();
				$("#pay_cardbtn").show();
			}else{
				$("#pay_cardbtn").hide();
				$("#pay_kakaobtn").show();
			}
		});
		
		//수량에 따라 가격 변경
	      $("input.cnt").change(function(){
	    	  
	    	  totalprice = 0;
	    	  
	    	  var cnt = $("input.cnt").val();
	    	  var price= $('input.storeprice').val();
	    	  console.log(cnt+","+price);
	    	  var val = $("input.cnt").val() * $('input.storeprice').val();
	    	  console.log(val);
	    	  console.log(totalprice);
	    	  
	    	  totalprice = val;
	    	  
	    	  result = val.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');

	    	  $(".totalprice").text(result+" 원");
	         
	      });
	      
	      //변경 버튼 누르면 storecart db 수정
	      $(".cartupdate").click(function(){
	    	  
	    	  var cart_idx = $(this).attr("cart_idx");
	    	  console.log(cart_idx);
	    	  
	    	  var cart_cnt = $("input.cnt").val()
	    	  console.log(cart_cnt);
	    	  
	    	  var a = confirm("장바구니에서 수량을 변경하시겠습니까?");
	    	  
	 			if(a){
	 				
	 				$.ajax({
			    		  
					      type:"post",
					      dataType:"html",
					      url:"cartcntupdate",
					      data:{"cart_idx":cart_idx,"cart_cnt":cart_cnt},
						  success: function(res){
							  
							  alert("수량을 변경했습니다.");
							  location.reload();

						  }
	 				
					     }); 
		    	  
	    		}
	    	 
			
	      });
		
	});
	
	
</script>
<style type="text/css">

</style>
</head>
<body>
<div class="container" style="margin-top: 50px; font-family: Noto Sans KR;">
	<div class="buypage_title">
		<p style="font-size: 2.5em; font-weight: 700; color: #2E2E2E;">결제</p>
		<p style="font-size: 1.8em; font-weight: 400; color: #503396;">주문 상품 정보</p>
	</div>
	<div class="buypage_content" style="margin-top: 20px;">
		<table class="table" style="text-align: center; vertical-align: middle;">
			<thead style="background-color: #E6E6E6;">
				<tr>
					<th style="width: 50%;">주문 상품</th>
					<th style="width: 20%;">사용 가능처</th>
					<th style="width: 10%;">구매 수량</th>
					<th style="width: 20%;">총 상품 금액</th>
				</tr>
			</thead>
			<tbody style="font-size: 1.2em; font-weight: 300;">
				<tr>
					<td style="vertical-align: middle;">
						<img alt="" src="/save/${sdto.store_photo}" style="width: 200px;">			
						${sdto.store_product }
					</td>
					<td style="vertical-align: middle;">사용 가능 극장</td>
					<%-- <td style="vertical-align: middle;">${cdto.cart_cnt }</td> --%>
					<td style="text-align: center; vertical-align: middle;">
                  <input type="number" min="1" max="8" step="1" name="cart_cnt" class="cnt" id="cnt" value="${cdto.cart_cnt }" style="width: 50px;">
                  <button type="button" class="btn btn-primary btn-sm cartupdate" cart_idx="${cdto.cart_idx}">변경</button>
               </td>
               <td style="text-align: center; vertical-align: middle;">
                  <input type="hidden" class="storeprice" id="storeprice" value="${sdto.store_price }">
                  <p style="font-size: 1.2em; color: black;" class="totalprice">
                     <fmt:formatNumber value="${cdto.cart_cnt * sdto.store_price }" pattern="#,###" /> 원
                  </p>
				</tr>
			</tbody>
		</table>
		<br>
		<div class="buypage_pay">
			<div class="buypage_title">
				<p style="font-size: 1.8em; font-weight: 400; color: #503396;">최종 결제</p>
			</div>
			<div style="text-align:center; border: 1px #555555 solid; border-radius:10px; background-color: #555555; width: 100%; height: 350px;">
				<div class="calc" style="margin-top: 30px; display: flex; justify-content:center; align-items:center;">
					 <div class="price" style="width: 180px; height: 80px; display: inline-block;">
					 	<p style="color: white;">총 상품 금액</p>
					 	<p style="font-size: 2em; color: white; font-weight: 500">
							<span class="totalprice">
					 		<fmt:formatNumber value="${cdto.cart_cnt * sdto.store_price }"/> 원
					 		</span>
						</p>
					 </div>
					 <i class="fa-solid fa-minus" style="display: inline-block; color: white;"></i>
					 <div class="discount" style="width: 180px; height: 80px; display: inline-block;">
					 	<p style="color: white;">총 할인 금액</p>
					 	<p style="font-size: 2em; color: white; font-weight: 500">
					 		<fmt:formatNumber value="0" type="currency" />
					 	</p>
					 </div>
					 <i class="fa-solid fa-equals" style="display: inline-block; color: white;"></i>
					 <div class="finalprice" style="width: 180px; height: 80px; display: inline-block;">
					 	<p style="color: white;">최종 결제 금액</p>
					 	<p style="font-size: 2em; color: #339EB2; font-weight: 500">
					 		<span class="totalprice">
					 		<fmt:formatNumber value="${cdto.cart_cnt * sdto.store_price }"/> 원
					 		</span>
					 	</p>
					 </div>
				</div>
				<br><br>
				<hr style="width: 80%; color: white; margin: 0px auto;">
				<br>
				<div class="pay">
					<div class="pay">
					<p style="color: white;">결제수단 선택</p>
					<input type="radio" name="payinput" id="pay_card" value="pay_card">
					<span style="color: white;">신용/체크카드</span>
					<br>
					<input type="radio" name="payinput" id="pay_bank" value="pay_bank">
					<span style="color: white;">카카오페이</span>
				</div>
				<br>
					<button type="button" id="pay_cardbtn" class="btn btn-megabox" style="display: none;" onclick="requestPay1()"> 신용/체크카드 결제</button>						
					<button type="button" id="pay_kakaobtn" class="btn btn-megabox" style="display: none;" onclick="requestPay2()"> 카카오페이 결제</button>	
				
			</div>
				<!-- 결제창에 상품명, 가격 띄우기 -->
				<input type="hidden" class="payapiproduct" value="${sdto.store_product }">
				<input type="hidden" class="payapiprice" value="${sdto.store_price * cdto.cart_cnt}">
				<input type="hidden" class="payapiname" value="${sdto.store_product }">
				
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
        name : $(".payapiproduct").val(),
        amount : totalprice,
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

//카카오페이
function requestPay2() {
    IMP.request_pay({
        pg : 'kakaopay',
        pay_method : 'card',
        merchant_uid: "merchant_" + new Date().getTime(), 
        name : $(".payapiproduct").val(),
        amount : totalprice,
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