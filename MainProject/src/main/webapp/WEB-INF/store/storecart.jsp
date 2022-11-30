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
	   
      //수량에 따라 가격 변경(foreach문이라서 tr을 찾고 그에 맞는 td값들이 바뀌도록 해줘야 함)
      $("input.cnt").change(function(){
    	  
    	  var $t = $(this).parents('tr');
    	  var val = $t.find("input.cnt").val() * $t.find('input.storeprice').val();
    	  console.log(val);
    	  
    	  result = val.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');

    	  $t.find("#totalprice").text(result+" 원");
         
      });
      
      //변경 버튼 누르면 storecart db 수정
      $(".cartupdate").click(function(){
    	  
    	  var cart_idx = $(this).attr("cart_idx");
    	  console.log(cart_idx);
    	  
    	  var $t = $(this).parents('tr');
    	  var cart_cnt = $t.find("input.cnt").val()
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
      
      //삭제 버튼 누르면 삭제
      $(".cartdel").click(function(){
    	  
    	  var cart_idx = $(this).attr("cart_idx");
    	  console.log(cart_idx);
    	  
    	  var a = confirm("장바구니에서 삭제하시겠습니까?");
    	  
 			if(a){
 				
 				$.ajax({
		    		  
				      type:"get",
				      dataType:"html",
				      url:"cartdelete",
				      data:{"cart_idx":cart_idx},
					  success: function(res){
					
					  location.reload();
					  }
 				
				     }); 
	    	  
    		}
    	 
		
      });
      
      
   });
   
   //사용자 함수
   $(document).ready(function(){
	   
	   totalcartprice = 0;
	   
	   $(".cart_info_hidden").each(function(idx, ele){
		   
		   //각 품목의 총 가격 더하기
		   totalcartprice += parseInt($(ele).find(".individual_totalprice").val());
		   
	   });
	   
	   var result = totalcartprice.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ','); 
	   
	   //내역에 보이기
	   $(".totalcartprice").text(result+"원");
	   
	   
   });
   

</script>
</head>
<body>
<div class="container" style="margin-top: 50px; font-family: Noto Sans KR;">
	<!-- 타이틀 -->
   <div class="buypage_title">
      <p style="font-size: 2.5em; font-weight: 700; color: #2E2E2E;">장바구니</p>
      <p style="font-size: 1.8em; font-weight: 400; color: #503396;">장바구니 목록</p>
   </div>
   
   <!-- 장바구니 내용 -->
   <div class="buypage_content" style="margin-top: 20px;">
      <table class="table" style="text-align: center; vertical-align: middle;">
         <thead style="background-color: #E6E6E6;">
            <tr>
               <th style="width: 10;">주문 번호</th>
               <th style="width: 40%;">주문 상품</th>
               <th style="width: 15%;">사용 가능처</th>
               <th style="width: 10%;">구매 수량</th>
               <th style="width: 15%;">총 상품 금액</th>
               <th style="width: 10%;">삭제</th>
            </tr>
         </thead>
         <!-- 장바구니 목록 출력 -->
         <c:if test="${cartlistcount==0 }">
         	<tr>
         		<td colspan="6">	
         			장바구니에 담은 상품이 없습니다.
         		</td>
         	</tr>
         </c:if>
         <c:if test="${cartlistcount>0}">
         	<c:forEach var="cdto" items="${cartlist }" varStatus="i">
            <tr class="cartlist">
               <td style="text-align: center; vertical-align: middle;">${i.count}</td>
               <td style="text-align: center; vertical-align: middle;">
                  <img alt="" src="../save/${cdto.store_photo }" style="width: 200px;"> ${cdto.store_product}
                  <!-- 결제창에 상품명, 가격 띄우기 -->
					<c:if test="${cartlistcount==1}">
						<input type="hidden" class="payapiproduct" value="${cdto.store_product}">
					</c:if>
					<c:if test="${cartlistcount>1}">
						<input type="hidden" class="payapiproduct" value="${cdto.store_product} 외 다수">
					</c:if>
				
               </td>
               <td style="text-align: center; vertical-align: middle;">사용가능처</td>
               <td style="text-align: center; vertical-align: middle;">
                  <input type="number" min="1" max="8" step="1" name="cart_cnt" class="cnt" id="cnt" value="${cdto.cart_cnt }" style="width: 50px;">
                  <button type="button" class="btn btn-primary btn-sm cartupdate" cart_idx="${cdto.cart_idx}">변경</button>
               </td>
               <td style="text-align: center; vertical-align: middle;">
                  <input type="hidden" class="storeprice" id="storeprice" value="${cdto.store_price }">
                  <p style="font-size: 1.2em; color: black;" id="totalprice">
                     <fmt:formatNumber value="${cdto.store_price * cdto.cart_cnt}" pattern="#,###" /> 원
                  </p>
               </td>
               <td style="text-align: center; vertical-align: middle;">
                   <button type="button" class="btn btn-danger cartdel" cart_idx="${cdto.cart_idx}">삭제</button>
               </td>
               <td class="cart_info_hidden">
               		<input type="hidden" class="individual_totalprice" value="${cdto.store_price * cdto.cart_cnt}">
               </td>
            </tr>
         </c:forEach>
         </c:if>
         
      </table>
   </div>
   <!-- 장바구니 내용 end -->
   <br>
   <!-- 결제 내역 start -->
   <div class="buypage_pay">
			<div class="buypage_title">
				<p style="font-size: 1.8em; font-weight: 400; color: #503396;">최종 결제</p>
			</div>
			<div style="text-align:center; border: 1px #555555 solid; border-radius:10px; background-color: #555555; width: 100%; height: 350px;">
				<div class="calc" style="margin-top: 30px; display: flex; justify-content:center; align-items:center;">
					 <div class="price" style="width: 200px; height: 80px; display: inline-block;">
					 	<p style="color: white;">총 상품 금액</p>
					 	<p style="font-size: 2em; color: white; font-weight: 500">
							<span class="totalcartprice"></span>
						</p>
					 </div>
					 <i class="fa-solid fa-minus" style="display: inline-block; color: white;"></i>
					 <div class="discount" style="width: 180px; height: 80px; display: inline-block;">
					 	<p style="color: white;">총 할인 금액</p>
					 	<p style="font-size: 2em; color: white; font-weight: 500">
					 		<span class="discount">0원</span>
					 	</p>
					 </div>
					 <i class="fa-solid fa-equals" style="display: inline-block; color: white;"></i>
					 <div class="finalprice" style="width: 200px; height: 80px; display: inline-block;">
					 	<p style="color: white;">최종 결제 금액</p>
					 	<p style="font-size: 2em; color: #339EB2; font-weight: 500">
					 		<span class="totalcartprice"></span>
					 		<%-- <fmt:formatNumber value="${cdto.cart_cnt * sdto.store_price }" type="currency" /> --%>
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
					<br>
					<input type="radio" name="payinput" id="pay_bank" value="pay_bank">
					<span style="color: white;">카카오페이</span>
				</div>
				<br>
					<button type="button" id="pay_cardbtn" class="btn btn-megabox" style="display: none;" onclick="requestPay1()"> 신용/체크카드 결제</button>						
					<button type="button" id="pay_kakaobtn" class="btn btn-megabox" style="display: none;" onclick="requestPay2()"> 카카오페이 결제</button>	
				
				
			</div>
   
	</div>
	<!-- 결제 내역 end -->
	
	<!-- 결제 api -->
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
        amount : totalcartprice,
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
        amount : totalcartprice,
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