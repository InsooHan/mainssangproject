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
	
	//수량에 따라 가격 변경
	var cnt = $("#cnt").attr("value");
	console.log(cnt);
	
	$("#cnt").change(function(){
		
		var changecnt = $("#cnt").val();
		console.log(changecnt);	
		
		var price = $("#storeprice").val();
		console.log(price);
		
		var tprice = price*changecnt;
		
		var result = tprice.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
		
		$("#totalprice").text(result+" 원");
	});
	
	
	//로그인 상태면 구매페이지, 로그인 없으면 로그인 모달
	$(".buybtn").click(){
		
		if(sessionScope.loginok!=null){
			alert("로그인 상태!");
		}else{
			alert("로그인이 필요합니다.");
		}
		
		
	}
	
});



</script>
</head>
<body>
<div class="container" style="margin-top: 50px; font-family: Noto Sans KR;">
	<div class="detail_title">
		<p style="font-size: 2em; font-weight: 700; color: #2E2E2E;">${dto.store_product }</p>
		<p style="font-size: 1.2em; font-weight: 400; color: #848484;">${dto.store_content }</p>
	</div>
	<hr>
	<div class="detail_content" style="width: 100%;">
		<table class="table table-borderless">
			<tr>
				<td style="width: 40%; text-align: center;" rowspan="4">
					<div>
						<img alt="" src="../save/${dto.store_photo }" style="width: 400px; height: 400px;">
					</div>
				</td>
				<tr>
				<td style="width: 15%;">
					<div style="margin: 30px 30px;">
						<p style="font-weight:500; font-size: 1.2em; color: black;">사용 극장</p>
						<p style="font-weight:500; font-size: 1.2em; color: black;">유효 기간</p>
						<p style="font-weight:500; font-size: 1.2em; color: black;">판매 수량</p>
						<p style="font-weight:500; font-size: 1.2em; color: black;">구매 후 취소</p>
					</div>
				</td>
				<td>
					<div style="margin-top: 30px;">
						<p style="font-weight:300; font-size: 1.2em; color: black;">사용 가능 극장_모달창 만들기</p>
						<p style="font-weight:300; font-size: 1.2em; color: black;">5년</p>
						<p style="font-weight:300; font-size: 1.2em; color: black;">1회 8개 구매 가능</p>
						<p style="font-weight:300; font-size: 1.2em; color: black;">구매일로부터 10일 이내 취소 가능하며, 부분취소는 불가능합니다.</p>
					</div>
				</td>
				</tr>
				<tr>
					<td>
						<p style="margin-left:30px; font-weight:500; font-size: 1.2em; color: black;">수량</p>
					</td>
					<td>
						<input type="hidden" value="${dto.store_price }" id="storeprice">
						<input type="number" min="1" max="8" step="1" name="cnt" id="cnt" value="1">
						<div style="float:right; margin-right: 30px;">
							<p style="font-size: 2em; color: black;" id="totalprice">
							<fmt:formatNumber value="${dto.store_price }" pattern="#,###" /> 원
							</p>
						</div>
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<div style="float: right;margin-right: 30px;">
							<button class="btn btn-megabox btn-lg buybtn">
							구매하기
							</button>
						</div>
					</td>
				</tr>
			</tr>
		</table>
		<hr>
		<br><br>
		<div id="accordion">

		  <div class="card">
		    <div class="card-header">
		      <a class="btn" data-bs-toggle="collapse" href="#collapseOne">
		        구매 후 취소
		      </a>
		    </div>
		    <div id="collapseOne" class="collapse show" data-bs-parent="#accordion">
		      <div class="card-body">
		        <p>
		        ■ 연장/취소/환불 안내<br>
				본 상품은 구매일로부터 10일 이내에 취소 가능합니다.<br>
				- 유효기간은 본 상품의 유효기간 내에서 연장 신청이 가능하며, 1회 연장 시 3개월(92일) 단위로 연장됩니다.<br>
				- 구매일로부터 5년까지 유효기간 연장이 가능합니다.<br>
				- 최초 유효기간 만료 후에는 결제금액의 90%에 대해 환불 요청 가능하며, 환불 처리에 7일 이상의 시간이 소요될 수 있습니다. (접수처: 1544-0070)<br>
				- 구매 취소 및 환불 요청은 미사용 상품에 한해 가능하며, 사용한 상품에 대해서는 불가합니다.<br>
				- 본 상품은 현금으로 환불이 불가합니다.<br>
				- 환불 요청한 포인트 중 소멸 포인트가 포함되어있다면 환불 요청한 월의 말일까지 사용 가능한 포인트로 돌아갑니다.<br>
				 ※ 2020년 2월 4일 이후 구매 상품에 한하여 유효기간 연장 신청이 가능합니다.<br>
		        </p>
		      </div>
		    </div>
		  </div>
		
		  <div class="card">
		    <div class="card-header">
		      <a class="collapsed btn" data-bs-toggle="collapse" href="#collapseTwo">
		        상품 이용 안내
		      </a>
		    </div>
		    <div id="collapseTwo" class="collapse" data-bs-parent="#accordion">
		      <div class="card-body">
		      	<p>
		        ■ 사용가능 지점<br>
				구매 전 사용가능 지점을 반드시 확인해주세요!<br>
				- 서울 : 강남, 동대문, 마곡, 목동, 상봉, 상암월드컵경기장, 성수, 센트럴, 신촌, 이수, 코엑스, 홍대, 화곡<br>
				- 인천/경기 : 고양스타필드, 광명AK플라자, 광명소하, 금정AK플라자, 김포한강신도시, 남양주현대아울렛 스페이스원, 동탄, 백석, 부천스타필드시티, 부천스타필드, 분당, 송도, 안성스타필드, 영통, 용인기흥, 의정부민락, 일산벨라시타, 킨텍스, 파주출판도시, 하남스타필드<br>
				- 대전/충청 : 대전, 대전신세계 아트앤사이언스, 대전유성, 대전중앙로, 대전현대아울렛, 세종나성, 천안<br>
				- 부산/경상 : 구미강동, 남포항, 대구신세계(동대구), 대구이시아, 마산, 문경, 부산대, 사상, 양산라피에스타, 울산, 창원, 창원내서, 해운대(장산)<br>
				- 강원도 : 춘천석사<br><br>

				■ 이용 안내<br>
				본 상품의 사용 기한은 구매일로부터 92일까지입니다.<br>
				- 영화관 매점에서 스토어 쿠폰번호 제시 후 상품으로 교환하실 수 있습니다<br>
				- 본 상품은 온라인 전용 판매 상품으로 현장 구매는 불가합니다.<br>
				- 구매한 상품은 “나의 메가박스 > 스토어 구매내역”에서 확인할 수 있습니다.<br>
				- 팝콘 및 음료의 맛, 크기, 종류 변경 시 추가 금액이 발생할 수 있습니다.<br>
				- 상기 이미지는 실제 제품과 다를 수 있습니다.<br>
				- 본 상품은 포인트 사용분 외 실 결제금액에 한하여 교환권 사용시 적립 가능합니다.<br>
				<p>
		      </div>
		    </div>
		  </div>
		
		</div>
		
	</div>
	
	
	
</div>
</body>
</html>