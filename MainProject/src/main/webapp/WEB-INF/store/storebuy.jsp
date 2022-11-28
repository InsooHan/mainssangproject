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
		
		//신용/체크카드 선택시 카드 목록 show
		$("input:radio[name=payinput]").click(function(){
			var paysel = $("input[name=payinput]:checked").val();
			console.log(paysel);			
			
			if(paysel=="pay_card"){
				$("#pay_cardlist").show();
			}else{
				$("#pay_cardlist").hide();
			}
		})
		
	});
	
	var IMP = window.IMP;   // 생략 가능
	IMP.init("imp62053265"); // 예: imp00000000 

    function requestPay() {
        IMP.request_pay({
            pg : 'html5_inicis',
            pay_method : 'card',
            merchant_uid: "merchant_" + new Date().getTime(), 
            name : '당근 10kg',
            amount : 100,
            buyer_email : 'Iamport@chai.finance',
            buyer_name : '아임포트 기술지원팀',
            buyer_tel : '010-1234-5678',
            buyer_addr : '서울특별시 강남구 삼성동',
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
					<td style="vertical-align: middle;">${cdto.cart_cnt }</td>
					<td style="vertical-align: middle;">
					<fmt:formatNumber value="${cdto.cart_cnt * sdto.store_price }" type="currency" />
					</td>
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
							<fmt:formatNumber value="${cdto.cart_cnt * sdto.store_price }" type="currency" />
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
					 		<fmt:formatNumber value="${cdto.cart_cnt * sdto.store_price }" type="currency" />
					 	</p>
					 </div>
				</div>
				<br><br>
				<hr style="width: 80%; color: white; margin: 0px auto;">
				<br>
				<div class="pay">
					<p style="color: white;">결제수단 선택</p>
					<input type="radio" name="payinput" id="pay_card" value="pay_card">
					<span style="color: white;">신용/체크카드</span>
						<span id="pay_cardlist" style="display: none;">
							<select name="cardlist" id="cardlist">
								<option value="">카드선택</option>
								<option value="shinhan">신한카드</option>
								<option value="woori">우리카드</option>
								<option value="lotte">롯데카드</option>
								<option value="hana">하나카드</option>
								<option value="samsung">삼성카드</option>
								<option value="hyundai">현대카드</option>
							</select>						
						</span>
					<br>
					<input type="radio" name="payinput" id="pay_bank" value="pay_bank">
					<span style="color: white;">무통장 입금</span>
					<br><br>
					<button type="button" class="btn btn-megabox" onclick="requestPay()">결제하기</button>
				</div>
				<br>
				
			</div>
		</div>
		
	</div>
</div>

	
</body>
</html>