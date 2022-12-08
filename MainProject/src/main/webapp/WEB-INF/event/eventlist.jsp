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
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.6.0/font/bootstrap-icons.css" />


<title>Insert title here</title>
<style type="text/css">
div.look {
		border-radius: 30%;
		width: 233px;
		float: left;
		margin-right: 10px;
	}
	
.event1 {
	display: grid;
	grid-template-columns: repeat(auto-fill, minmax(25%, auto));
	
}
	
div.carousel-item {

}

</style>
<script>
$(window).scroll(function(){
	if ($(this).scrollTop() > 300){
		$('.btn_gotop').show();
	} else{
		$('.btn_gotop').hide();
	}
});
$('.btn_gotop').click(function(){
	$('html, body').animate({scrollTop:0},400);
	return false;
});
</script>
</head>
<body>

<div style="position: fixed;bottom: 100px;right: 100px; ">
<a class="btn_gotop" style="" href ="#header"><img style="width: 50px;height: 50px;" alt="" src="../save/m_top.png"> </a>
</div>

<div class="container mt-3" id="header">
<br><br>
<p style="font-size: 2.5em; color: #252451; font-weight: 700;">진행중인 이벤트

	<!-- admin만 글 작성가능 -->
	<c:if test="${sessionScope.loginok!=null && sessionScope.myid=='admin'}">
		<button type="button" class="btn btn-primary" style="float: right;" onclick="location.href='form'">이벤트 추가</button>
	</c:if>
	
	<!-- 카테고리 네비바 -->
	<div class="container mt-3">
	  <ul class="nav nav-tabs" role="tablist" style="text-align: center;">
	    <li class="nav-item" style="width: 16%">
	      <button style="width: 100%"  class="nav-link active" data-bs-toggle="tab" onclick="location.href='list'">전체</button>
	    </li>
	    <li class="nav-item" style="width: 16%">
	      <button style="width: 100%" class="nav-link " data-bs-toggle="tab" onclick="location.href='megapick'">메가pick</button>
	    </li>
	    <li class="nav-item" style="width: 16%">
	      <button style="width: 100%" class="nav-link " data-bs-toggle="tab" onclick="location.href='movie'">영화</button>
	    </li>
	    <li class="nav-item" style="width: 16%">
	      <button style="width: 100%" class="nav-link" data-bs-toggle="tab" onclick="location.href='theater'">극장</button>
	    </li>
	    <li class="nav-item" style="width: 16%">
	      <button style="width: 100%" class="nav-link " data-bs-toggle="tab" onclick="location.href='discount'">제휴/할인</button>
	    </li>
	     <li class="nav-item" style="width: 16%">
	      <button style="width: 100%" class="nav-link " data-bs-toggle="tab" onclick="location.href='preview'">시사회/무대인사</button>
	    </li>
	  </ul>
	 </div>
	 
	 <br>
	 
	 <!-- 캐러셀 시작 -->
	<div style="background-color: #f8f8fa" id="Dark" class="carousel carousel-dark slide carousel-fade" data-bs-ride="carousel">
	  <div class="carousel-indicators">
	    <button type="button" data-bs-target="#Dark" data-bs-slide-to="0" class="active"></button>
	    <button type="button" data-bs-target="#Dark" data-bs-slide-to="1"></button>
	    <button type="button" data-bs-target="#Dark" data-bs-slide-to="2"></button>
	  </div>
	  <div class="carousel-inner ">
	  	<br><br>
	  		<!-- 1 -->
	     <div class="carousel-item active" data-bs-interval="2000"> 
    	<div style="display: flex;">
     	<a style="width: 50%; height: 50%; "  href="detail?num=12">
					<img  src="../save/1.png" class="d-block w-100"  alt="대체문자열"/>
		</a>  	
     	<a style="width: 50%; height: 50%; " href="detail?num=11" >
				<img  src="../save/2.jpg" class="d-block w-100"  alt="대체문자열"/>
		</a>	
      </div>
      <div style="display: flex;">
      	<div style="width: 50%; display: flex;">
      		<p style="font-size: 19px;color: #222222;">수능 끝! 새로운 시작 응원해📣 </p>
      		<p style=" font-size: 14px;margin-left: 240px;">2022-11-17~2022-12-13 </p>
      	</div>
      	<div style="width: 50%; display: flex;" >
      		<p style="font-size: 19px;color: #222222">[에버랜드X메가박스] 제휴 할인 프로모션!</p>
      		<p style="font-size: 14px; margin-left: 150px;">2022-06-01~2022-12-31 </p>
      	</div>
      </div>
    </div>
	    
    <!-- 2 -->
	      <div class="carousel-item " data-bs-interval="2000">
    
    	<div style="display: flex;">
     	<a style="width: 50%; height: 50%; "  href="detail?num=11">
					<img  src="../save/2.jpg" class="d-block w-100"  alt="대체문자열"/>
		</a>
		
     	
     	
     	<a style="width: 50%; height: 50%; " href="detail?num=14" >
				<img  src="../save/3.jpg" class="d-block w-100"  alt="대체문자열"/>
		</a>
		
      </div>
      <div style="display: flex;">
      	<div style="width: 50%; display: flex;">
      		<p style="font-size: 19px;color: #222222">[에버랜드X메가박스] 제휴 할인 프로모션!</p>
      		<p style="font-size: 14px; margin-left: 150px;">2022-06-01~2022-12-31 </p>
      	</div>
      	<div style="width: 50%; display: flex;" >
      		<p style="font-size: 19px;color: #222222">[메가박스X더쎈카드] 더쎈카드 연말정산 이벤트!</p>
      		<p style="font-size: 14px; margin-left: 90px;">2022-10-24~2023-01-01 </p>
      	</div>
      </div>
    </div>
	    
	    
	    <!-- 3 -->
      <div class="carousel-item" data-bs-interval="2000">
    
    	<div style="display: flex;">
     	<a style="width: 50%; height: 50%; "  href="detail?num=14">
					<img  src="../save/3.jpg" class="d-block w-100"  alt="대체문자열"/>
		</a>
		
     	
     	
     	<a style="width: 50%; height: 50%; " href="detail?num=12" >
				<img  src="../save/1.png" class="d-block w-100"  alt="대체문자열"/>
		</a>
		
      </div>
       <div style="display: flex;">
      	<div style="width: 50%; display: flex;">
      		<p style="font-size: 19px;color: #222222">[메가박스X더쎈카드] 더쎈카드 연말정산 이벤트!</p>
      		<p style="font-size: 14px; margin-left: 90px;">2022-10-24~2023-01-01 </p>
      	</div>
      	<div style="width: 50%; display: flex;" >
      		<p style="font-size: 19px;color: #222222;">수능 끝! 새로운 시작 응원해📣 </p>
      		<p style=" font-size: 14px;margin-left: 240px;">2022-11-17~2022-12-13 </p>
      	</div>
      </div>
    </div>
    
	  </div>
	  
	<br><br>
	  <button class="carousel-control-prev" type="button" data-bs-target="#Dark" data-bs-slide="prev">
	    <span class="carousel-control-prev-icon"></span>
	  </button>
	  <button class="carousel-control-next" type="button" data-bs-target="#Dark" data-bs-slide="next">
	    <span class="carousel-control-next-icon"></span>
	  </button>
	</div>



		      <br><br>
		      <div class="tab-content">
		      <div style="display: flex;">
	     		 <h2 style="color: #503396;">메가Pick</h2>
	     		 <a style="margin-left: 1100px; color: #444444; color: #444444 " href='megapick'>더보기 ></a>
	     		 </div>
	     		  <table class="table table-border" style="text-align: center;">
		      		<tr class="event1" >
		    			<c:forEach var="dto" items="${megapick}" varStatus="i" begin="0" end="3">
		    			<td >
		    			<a  href="detail?num=${dto.num }">
		    				<div class="look" style="height: 352px;">
		    				<img style="width:233px; height: 233px; border-radius: 10%; "  alt="" src="../save/${dto.photo }">
		    					<b style="color: black;">${dto.subject }</b>
		    					<br>
		    					<b style="font-size: 14px;color: gray"> ${dto.startday }~${dto.endday }</b>
		    				</div>
		    			</a>
		    		</td> 
		    	</c:forEach> 
		    	</tr>
		      </table>
	      	  </div>
	      	  <!--  -->
		      <div class="tab-content">
		      <div style="display: flex;">
	     		 <h2 style="color: #503396;">메가영화</h2>
	     		<a style="margin-left: 1100px; color: #444444"  href='movie'>더보기 ></a>
	     		 </div>
	     		 
	     		  <table class="table table-border" style="text-align: center;">
		      		<tr class="event1" >
		    			<c:forEach var="dto" items="${movie}" varStatus="i" begin="0" end="3">
		    			<td >
		    			<a href="detail?num=${dto.num }">
		    				<div class="look" style="height: 352px;">
		    				<img style="width:233px; height: 233px; border-radius: 10%; "  alt="" src="../save/${dto.photo }">
		    					<b style="color: black;">${dto.subject }</b>
		    					<br>
		    					<b style="font-size: 14px;color: gray"> ${dto.startday }~${dto.endday }</b>
		    				</div>
		    			</a>
		    		</td> 
		    	</c:forEach> 
		    	</tr>
		      </table>
	      	  </div>
	      	  <!--  -->
		      <div class="tab-content">
	     		 <div style="display: flex;">
	     		 <h2 style="color: #503396;">극장</h2>
	     		 <a style="margin-left: 1160px;  color: #444444"  href='theater'>더보기 ></a>
	     		 </div>
	     		  <table class="table table-border" style="text-align: center;">
		      		<tr class="event1" >
		    			<c:forEach var="dto" items="${theater}" varStatus="i" begin="0" end="3">
		    			<td >
		    			<a href="detail?num=${dto.num }">
		    				<div class="look" style="height: 352px;">
		    				<img style="width:233px; height: 233px; border-radius: 10%; "  alt="" src="../save/${dto.photo }">
		    					<b style="color: black;" >${dto.subject }</b>
		    					<br>
		    					<b style="font-size: 14px;color: gray"> ${dto.startday }~${dto.endday }</b>
		    				</div>
		    			</a>
		    		</td> 
		    	</c:forEach> 
		    	</tr>
		      </table>
	      	  </div>
	      	  <!--  -->
		      <div class="tab-content">
	     		 <div style="display: flex;">
	     		 <h2 style="color: #503396;">제휴/할인</h2>
	     		<a style="margin-left: 1080px;  color: #444444"  href='discount'>더보기 ></a>
	     		 </div>
	     		  <table class="table table-border" style="text-align: center;">
		      		<tr class="event1" >
		    			<c:forEach var="dto" items="${discount}" varStatus="i" begin="0" end="3">
		    			<td >
		    			<a href="detail?num=${dto.num }">
		    				<div class="look" style="height: 352px;">
		    				<img style="width:233px; height: 233px; border-radius: 10%; "  alt="" src="../save/${dto.photo }">
		    					<b style="color: black;">${dto.subject }</b>
		    					<br>
		    					<b style="font-size: 14px;color: gray"> ${dto.startday }~${dto.endday }</b>
		    				</div>
		    			</a>
		    		</td> 
		    	</c:forEach> 
		    	</tr>
		      </table>
	      	  </div>
	      	  <!--  -->
		      <div class="tab-content" >
	     		  <div style="display: flex;">
	     		 <h2 style="color: #503396;">시사회/무대인사</h2>
	     		 <a style="margin-left: 980px;  color: #444444" href='preview'">더보기 ></a>
	     		 </div>
	     		  <table class="table table-border" style="text-align: center;">
		      		<tr class="event1" >
		    			<c:forEach var="dto" items="${preview}" varStatus="i" begin="0" end="3">
		    			<td >
		    			<a href="detail?num=${dto.num }">
		    				<div class="look" style="height: 352px;">
		    				<img style="width:233px; height: 233px; border-radius: 10%; "  alt="" src="../save/${dto.photo }">
		    					<b style="color: black;">${dto.subject }</b>
		    					<br>
		    					<b style="font-size: 14px;color: gray"> ${dto.startday }~${dto.endday }</b>
		    				</div>
		    			</a>
		    		</td> 
		    	</c:forEach> 
		    	</tr>
		      </table>
	      	  </div>
	      </div>
	      
</body>
</html>