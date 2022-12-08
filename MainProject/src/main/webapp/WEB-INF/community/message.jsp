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
.balloon_03 {
 position:relative;
 margin: 50px;
 width:450px;
 height:150px;
  background:#c8f0f4;
  border-radius: 10px;
}
.balloon_03:after {
 border-top:15px solid #c8f0f4;
 border-left: 15px solid transparent;
 border-right: 0px solid transparent;
 border-bottom: 0px solid transparent;
 content:"";
 position:absolute;
 top:10px;
 left:-15px;
}

.balloon_02 {
 position:relative;
 margin: 50px;
 width:450px;
 height:150px;
  background:#fdfaa5;
  border-radius: 10px;
}

.balloon_02:after {
 content: '';
	position: absolute;
	right: 0;
	top: 50%;
	width: 0;
	height: 0;
	border: 40px solid transparent;
	border-left-color: #fdfaa5;
	border-right: 0;
	border-bottom: 0;
	margin-top: -20px;
	margin-right: -40px;
}


</style>
</head>
<body>




<!-- 쪽지보내기 버튼 -->
<button type="button" class="mbtn btn btn-info" data-bs-toggle="modal" data-bs-target="#msgModal" style="margin-left: 300px; margin-top: 20px;">
 	<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-send" viewBox="0 0 16 16" data-bs-toggle="modal" data-bs-target="#msgModal" style="color: white;">
  <path d="M15.854.146a.5.5 0 0 1 .11.54l-5.819 14.547a.75.75 0 0 1-1.329.124l-3.178-4.995L.643 7.184a.75.75 0 0 1 .124-1.33L15.314.037a.5.5 0 0 1 .54.11ZM6.636 10.07l2.761 4.338L14.13 2.576 6.636 10.07Zm6.787-8.201L1.591 6.602l4.339 2.76 7.494-7.493Z"/>
</svg>
<span style="color: white;">쪽지쓰기</span>
</button>   



<ul class="nav nav-tabs justify-content-center" id="myTab" role="tablist" style="width: 800px; margin-left: 200px; margin-top: 30px;">
  <li class="nav-item" role="presentation">
    <button class="nav-link active" id="home-tab" data-bs-toggle="tab" data-bs-target="#home-tab-pane" type="button" role="tab" aria-controls="home-tab-pane" aria-selected="true" style="width: 300px;">받은 쪽지함&nbsp;[${count }]</button>
  </li>
  <li class="nav-item" role="presentation">
    <button class="nav-link" id="profile-tab" data-bs-toggle="tab" data-bs-target="#profile-tab-pane" type="button" role="tab" aria-controls="profile-tab-pane" aria-selected="false" style="width: 300px;">보낸 쪽지함&nbsp;[${scount }]</button>
  </li>
</ul>



<!-- 받은쪽지함 출력 -->
<div class="tab-content" id="myTabContent">
  <div class="tab-pane fade show active" id="home-tab-pane" role="tabpanel" aria-labelledby="home-tab" tabindex="0">
  	<c:forEach var="dto" items="${mlist }">
  	<c:if test="${dto.receiver_name==sessionScope.myid }">
  	<div class="balloon_03" style="margin-left: 350px; margin-right: auto;">
  	<br>
  	<span style="margin: 20px;"><b>From. ${dto.sender_name }</b></span><span style="float:right; margin-right: 10px;"> <fmt:formatDate value="${dto.send_date }" pattern="yy-MM-dd [HH:mm]"/></span>
  	<br><br>
  	<span style="margin: 20px;">${dto.ms_content }</span><br>
  	<span><button class="mbtn btn btn-light rep" id="rep" value="${dto.ms_num }" style="float: right; margin: 10px; margin-right: 20px;">답장</button></span>
  	</div> 
  	</c:if>
  	</c:forEach>
  	<c:if test="${count==0 }">
		<br><br>
		<h3 style="margin-left: 450px;">받은 쪽지가 없습니다</h3>
		</c:if>
  </div>
  
 <!-- 보낸쪽지함 출력 --> 
  <div class="tab-pane fade" id="profile-tab-pane" role="tabpanel" aria-labelledby="profile-tab" tabindex="0">
  	<c:forEach var="dto" items="${mlist }">
  	<c:if test="${dto.sender_name==sessionScope.myid }">
  	<div class="balloon_02" style="margin-left: 350px; margin-right: auto;">
  	<br>
  	<span style="margin: 20px;"><b>To. ${dto.receiver_name }</b></span><span style="float: right; margin-right: 20px;"> <fmt:formatDate value="${dto.send_date }" pattern="yy-MM-dd [HH:mm]"/></span>
  	<br><br>
  	<span style="margin: 20px;">${dto.ms_content }</span>
  	
  	</div> 
  	</c:if>
  	</c:forEach>
  	<c:if test="${scount==0 }">
		<br><br>
		<h3 style="margin-left: 450px;">보낸 쪽지가 없습니다</h3>
		</c:if>
  </div>
</div>
    

<br>

<!-- 쪽지 Modal -->
<div class="modal" tabindex="-1" id="msgModal">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">
              <input type="hidden" id="sender_name" name="sender_name" class="form-control" value="${sessionScope.myid }"/>				
 				
 					<c:forEach var="row" items="${userlist}" varStatus="status">
                  		<input value="${row.id }" id="userlist" name="userlist" type="hidden"> 
                    </c:forEach> 
             
                받는사람 : 
                   <input name="receiver_name" id="receiver_name" type="text">
        </h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
      
        <textarea style="width: 450px; height: 300px;" name="ms_content" id="ms_content"></textarea>
      </div>
      <div class="modal-footer">
      <button type="button" class="btn btn-info" id="msg_submit" style="color: white;">보내기</button>
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
        
      </div>
    </div>
  </div>
</div>

<!-- 쪽지 답장 Modal -->
<div class="modal" tabindex="-1" id="ReplyModal">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">
              <input type="hidden" id="resender_name" name="resender_name" class="form-control" value="${sessionScope.myid }"/>				
 			
             
                받는사람 : 
                 
                   <span name="re_receiver_name" id="re_receiver_name"></span>

        </h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
      
        <textarea style="width: 450px; height: 300px;" name="ms_recontent" id="ms_recontent"></textarea>
      </div>
      <div class="modal-footer">
      <button type="button" class="btn btn-info" id="msg_resubmit" style="color: white;">보내기</button>
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
        
      </div>
    </div>
  </div>
</div>

    <script>

//쪽지 인서트 
    $("#msg_submit").click(function(){
    	var sender_name=$("#sender_name").val();
    	var ms_content=$("#ms_content").val();
    	var receiver_name=$("#receiver_name").val();
 		var userlist = $("[name=userlist]").map(function(){return this.value}).get();
 		if(userlist.includes(receiver_name)==false){
 			 alert("해당 아이디가 없습니다");
  	 }

		else{
		 	$.ajax({
		    		 type:"post",
		    	     dataType:"html",
		    	     url:"insertmessage",
		    	     data :{"sender_name":sender_name,
		    	    	 "ms_content":ms_content,"receiver_name":receiver_name
		    	        },
		    	     success:function(){
		    	  	 	location.reload();
		    	     }
		    	});
			}
   })  
 
   
//답장 폼    
   $("button.rep").click(function(){
			var ms_num=$(this).val();
		//	alert(ms_num);
			$.ajax({
				type:"get",
				dataType:"json",
				url:"replyid",
				data:{"ms_num":ms_num},
				success:function(data){
					$("#re_receiver_name").html(data.sender_name);
				}
			})
			 $("#ReplyModal").modal('show');
   })
   
   
//답장 쪽지 인서트 
    $("#msg_resubmit").click(function(){
    	var sender_name=$("#resender_name").val();
    	var ms_content=$("#ms_recontent").val();
    	var receiver_name=$("#re_receiver_name").text();
 		
		 	$.ajax({
		    		 type:"post",
		    	     dataType:"html",
		    	     url:"insertmessage",
		    	     data :{"sender_name":sender_name,
		    	    	 "ms_content":ms_content,"receiver_name":receiver_name
		    	        },
		    	     success:function(){
		    	  	 	location.reload();
		    	     }
		    	});
		
   })     
</script>
</body>
</html>