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
p{
color: black !important;
}

</style>
</head>
<body>



<table class="table table" style=" width: 1000px; margin: 40px;">
	
	<tr>
		<td>
			<span style="color: #339EB2; font-size: 17px; padding: 5px;">${dto.category} ></span>
			&nbsp;&nbsp;<h3 style="padding-top: 10px; padding-bottom: 5px;"><span>${dto.subject }</span></h3>
			&nbsp;<b>${dto.name }</b><br>
			&nbsp;<span style="color: gray;"><fmt:formatDate value="${dto.writeday }" pattern="yyyy-MM-dd"/> 
			&nbsp;조회 ${dto.readcount }
			</span>
		</td>
	</tr>
	
	<tr>
			<td height="300px;" >
			
			<p>${dto.content }</p>
			<br><br><br><br><br><br><br><br><br>
			
		   <div style="cursor: pointer;" id="likes" num=${dto.num }>
		   <button type="button" class="btn btn-outline-danger">
		   <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-heart" viewBox="0 0 16 16">
  				<path d="m8 2.748-.717-.737C5.6.281 2.514.878 1.4 3.053c-.523 1.023-.641 2.5.314 4.385.92 1.815 2.834 3.989 6.286 6.357 3.452-2.368 5.365-4.542 6.286-6.357.955-1.886.838-3.362.314-4.385C13.486.878 10.4.28 8.717 2.01L8 2.748zM8 15C-7.333 4.868 3.279-3.04 7.824 1.143c.06.055.119.112.176.171a3.12 3.12 0 0 1 .176-.17C12.72-3.042 23.333 4.867 8 15z"/>
			</svg> 좋아요 ${dto.likes }</button>
		  
			</div>
			</td>
		
		</tr>
		
		
		<tr>
			<td>
			<br>
			<!-- 댓글리스트 -->
			<h5><b>댓글</b></h5>
				<div id="answer">
					
				</div>
				
			<!-- 댓글입력폼 -->
				<div>
					<form action="" class="form-inline" name="aform" id="aform">
					<input type="hidden" name="idx" value="${idx }">
					<input type="hidden" name="num" value="${num }">
					<input type="hidden" name="currentPage" value="${currentPage }">
					<input type="hidden" name="ans_regroup" value="${ans_regroup }">
					<input type="hidden" name="ans_restep" value="${ans_restep }">
					<input type="hidden" name="ans_relevel" value="${ans_relevel}">
					<textarea style="width: 850px; height: 100px;" class="form-control" name="content" required="required">
					</textarea>
					<button type="submit" class="btn btn-info ainsert" style="width: 100px; height: 100px; margin-left: 10px;" content=${bdto.conetnt }>등록</button>
					</form>
					<br>
				</div>
			
			</td>
		</tr>
		
		<tr>
			<td align="center">
				<button class="btn btn btn-light" onclick="location.href='writeform'">
				<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-pencil" viewBox="0 0 16 16">
 					 <path d="M12.146.146a.5.5 0 0 1 .708 0l3 3a.5.5 0 0 1 0 .708l-10 10a.5.5 0 0 1-.168.11l-5 2a.5.5 0 0 1-.65-.65l2-5a.5.5 0 0 1 .11-.168l10-10zM11.207 2.5 13.5 4.793 14.793 3.5 12.5 1.207 11.207 2.5zm1.586 3L10.5 3.207 4 9.707V10h.5a.5.5 0 0 1 .5.5v.5h.5a.5.5 0 0 1 .5.5v.5h.293l6.5-6.5zm-9.761 5.175-.106.106-1.528 3.821 3.821-1.528.106-.106A.5.5 0 0 1 5 12.5V12h-.5a.5.5 0 0 1-.5-.5V11h-.5a.5.5 0 0 1-.468-.325z"/>
				</svg>
				글쓰기</button>
				<button class="btn btn btn-light" onclick="location.href='writeform?num=${dto.num}&regroup=${dto.regroup }&restep=${dto.restep }&relevel=${dto.relevel }&currentPage=${currentPage}'">
				<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-arrow-return-right" viewBox="0 0 16 16">
  					<path fill-rule="evenodd" d="M1.5 1.5A.5.5 0 0 0 1 2v4.8a2.5 2.5 0 0 0 2.5 2.5h9.793l-3.347 3.346a.5.5 0 0 0 .708.708l4.2-4.2a.5.5 0 0 0 0-.708l-4-4a.5.5 0 0 0-.708.708L13.293 8.3H3.5A1.5 1.5 0 0 1 2 6.8V2a.5.5 0 0 0-.5-.5z"/>
				</svg>
				답글</button>
				<button class="btn btn btn-light" onclick="location.href='list?currentPage=${currentPage}'">
				<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-justify" viewBox="0 0 16 16">
  					<path fill-rule="evenodd" d="M2 12.5a.5.5 0 0 1 .5-.5h11a.5.5 0 0 1 0 1h-11a.5.5 0 0 1-.5-.5zm0-3a.5.5 0 0 1 .5-.5h11a.5.5 0 0 1 0 1h-11a.5.5 0 0 1-.5-.5zm0-3a.5.5 0 0 1 .5-.5h11a.5.5 0 0 1 0 1h-11a.5.5 0 0 1-.5-.5zm0-3a.5.5 0 0 1 .5-.5h11a.5.5 0 0 1 0 1h-11a.5.5 0 0 1-.5-.5z"/>
				</svg>
				목록</button>
				
				<c:if test="${sessionScope.loginok!=null && sessionScope.myid==dto.id }">
				<button class="btn btn btn-light" onclick="location.href='uform?num=${dto.num}&currentPage=${currentPage }'">
				<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-pencil-square" viewBox="0 0 16 16">
 					 <path d="M15.502 1.94a.5.5 0 0 1 0 .706L14.459 3.69l-2-2L13.502.646a.5.5 0 0 1 .707 0l1.293 1.293zm-1.75 2.456-2-2L4.939 9.21a.5.5 0 0 0-.121.196l-.805 2.414a.25.25 0 0 0 .316.316l2.414-.805a.5.5 0 0 0 .196-.12l6.813-6.814z"/>
 					 <path fill-rule="evenodd" d="M1 13.5A1.5 1.5 0 0 0 2.5 15h11a1.5 1.5 0 0 0 1.5-1.5v-6a.5.5 0 0 0-1 0v6a.5.5 0 0 1-.5.5h-11a.5.5 0 0 1-.5-.5v-11a.5.5 0 0 1 .5-.5H9a.5.5 0 0 0 0-1H2.5A1.5 1.5 0 0 0 1 2.5v11z"/>
				</svg>
				수정</button>
				<button class="btn btn btn-light" id="delete" num=${dto.num }>
				<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" style="color: red;" fill="currentColor" class="bi bi-trash3" viewBox="0 0 16 16">
  				<path d="M6.5 1h3a.5.5 0 0 1 .5.5v1H6v-1a.5.5 0 0 1 .5-.5ZM11 2.5v-1A1.5 1.5 0 0 0 9.5 0h-3A1.5 1.5 0 0 0 5 1.5v1H2.506a.58.58 0 0 0-.01 0H1.5a.5.5 0 0 0 0 1h.538l.853 10.66A2 2 0 0 0 4.885 16h6.23a2 2 0 0 0 1.994-1.84l.853-10.66h.538a.5.5 0 0 0 0-1h-.995a.59.59 0 0 0-.01 0H11Zm1.958 1-.846 10.58a1 1 0 0 1-.997.92h-6.23a1 1 0 0 1-.997-.92L3.042 3.5h9.916Zm-7.487 1a.5.5 0 0 1 .528.47l.5 8.5a.5.5 0 0 1-.998.06L5 5.03a.5.5 0 0 1 .47-.53Zm5.058 0a.5.5 0 0 1 .47.53l-.5 8.5a.5.5 0 1 1-.998-.06l.5-8.5a.5.5 0 0 1 .528-.47ZM8 4.5a.5.5 0 0 1 .5.5v8.5a.5.5 0 0 1-1 0V5a.5.5 0 0 1 .5-.5Z"/>
				</svg>
				<span style="color: red;">삭제</span></button>
				</c:if>
				
			</td>
		</tr>
</table>
</body>
<script type="text/javascript">
//좋아요
$("#likes").click(function(){
	var num=$(this).attr("num");
	
	<c:if test="${sessionScope.loginok==null }">
		alert("로그인이 필요합니다");
		history.back();
	</c:if>
	
	$.ajax({
		data:{"num":num},
		dataType:"html",
		url:"likes",
		success:function(){
			location.reload();
		}
	})
})

//게시글 삭제
$("#delete").click(function(){
	var num=$(this).attr("num");
	confirm("삭제하시겠습니까?");
	
	if(confirm){
	$.ajax({
		data:{"num":num},
		dataType:"html",
		url:"delete",
		success:function(){
			location.href = document.referrer;
		}
	})
}
})


$("button.ainsert").click(function(){
	var formdata=$("#aform").serialize();
	alert(formdata);
	
	$.ajax({
		type:"post",
		dataType:"html",
		url:"ainsert",
		data:formdata,
		success:function(data){
			alert("인서트성공");
		}
	})
})

	
			
</script>
</html>