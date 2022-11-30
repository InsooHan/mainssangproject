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
div.ddddd div.detailtable
{
display:inline-block;
border:1px solid gray;
border-radius:10px;
text-align:center;
width:100px;
height:50px;
cursor: pointer;
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
		q+="<p style='display:none;'>"+realtoday+"</p>";
		q+=today+"</span>\n"+getDayOfWeek(to.getDay())+"</div>&nbsp;&nbsp;";

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
		
		$(this).css("background-color","#FF5050");
	});
	
	$(document).on("click",".four",function(){
		moviename=$(this).find('b').text();
		$(".four").css("background-color","#dcdcdc");
		$(this).css("background-color","#FF5050");
	});
	
	$(document).on("click","#msche",function(){
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
				
				$.each(res,function(idx,item){
					
				if(mtime==realtoday(item.movietime)){
					
					s+="&nbsp;<div class='detailtable'>"; // data-bs-toggle='modal' data-bs-target='#bookModal'>"
					s+="<span>"+item.capacity+"</span>";
					s+="<span class='mmmtime'><br>";
					s+=formatDate(item.movietime);
					s+="</span><b style='display:none;'>"+item.sang_num+"</b>";
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
		
		var sangnum=$(this).find('b').text();
		//alert(sangnum);
		location.href="listtwo?moviename="+moviename+"&theater="+theater+"&sangnum="+sangnum;
		
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

<!-- The Modal -->
<div class="modal" id="bookModal">
  <div class="modal-dialog">
    <div class="modal-content">

      <!-- Modal Header -->
      <div class="modal-header">
        <h4 class="modal-title">Modal Heading</h4>
        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
      </div>

      <!-- Modal body -->
      <div class="modal-body">
        Modal body..
      </div>

      <!-- Modal footer -->
      <div class="modal-footer">
        <button type="button" class="btn btn-danger" data-bs-dismiss="modal">Close</button>
      </div>

    </div>
  </div>
</div>



<!-- The Modal -->
<div class="modal" id="bookModal">
  <div class="modal-dialog">
    <div class="modal-content">

      <!-- Modal Header -->
      <div class="modal-header">
        <h4 class="modal-title">Modal Heading</h4>
        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
      </div>

      <!-- Modal body -->
      <div class="modal-body" id="modalbody">
	  	
      </div>

      <!-- Modal footer -->
      <div class="modal-footer">
        <button type="button" class="btn btn-danger" data-bs-dismiss="modal">Close</button>
      </div>

    </div>
  </div>
</div>
</body>
</html>




















