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
<script type="text/javascript">
$(function(){
	
	$("#bookmenu").click(function(){
		
		if(${sessionScope.loginok!=null}){
			location.href="${root}/book/list";
		}else{
			
			alert("로그인이 필요합니다.");
			
			$("#loginbtn").trigger("click");
		}
		
	})
		
		
	
	
})
</script>
<style type="text/css">
.modal-content {
  width: 80%;
  margin: 0 auto;
}
.modal-body {
  padding: 0;
}
.btn-close {
  position: absolute;
  right: 15px;
  padding: 1em;
}
h1 {
  font-size: 2.3em;
  font-weight: bold;
  font-family: Noto Sans KR;
}
.myform {
  padding: 2em;
  max-width: 100%;
  color: #fff;
  box-shadow: 0 4px 6px 0 rgba(22, 22, 26, 0.18);
}
@media (max-width: 576px) {
  .myform {
    max-width: 90%;
    margin: 0 auto;
  }
}
.form-control:focus {
  box-shadow: inset 0 -1px 0 #7e7e7e;
}
.form-control {
  background-color: inherit;
  color: #fff;
  padding-left: 0;
  border: 0;
  border-radius: 0;
  border-bottom: 1px solid #fff;
}
.myform .btn {
  width: 100%;
  font-weight: 800;
  background-color: #fff;
  border-radius: 0;
  padding: 0.5em 0;
}
.myform .btn:hover {
  background-color: inherit;
  color: #fff;
  border-color: #fff;
}
p a {
  color: #e1e1e1;
  text-decoration: none;
}
p a:hover {
  color: #fff;
}
</style>
</head>
<c:set var="root" value="<%=request.getContextPath() %>"></c:set>
<body>
<!-- NAVBAR -->
	<div class="title" style="z-index: 50;">
    <header class="site-navbar mt-3">
      <div class="container-fluid">
        <div class="row align-items-center">
        <!-- 좌측 상단 로고 -->
          <div class="site-logo col-6">
          <a href="${root }/" style="position: relative; z-index: 50;"><img alt="" src="../image/megabox_logo.png" style="width: 150px;"></a>
          </div>

		  <!-- 메뉴 탭 start -->
          <nav class="mx-auto site-navigation" style="text-align: center; ">
            <ul class="site-menu js-clone-nav d-none d-xl-block ml-0 pl-0">
           	  <li><a href="${root }/movie/list">영화</a></li>
              <li><a href="#" id="bookmenu">예매</a></li>
              <li><a href="${root }/store/list">스토어</a></li>
              <li><a href="${root }/community/list">커뮤니티</a></li>
              <li class="has-children">
            <a href="${root }/event/list">이벤트/공지사항</a>
              <ul class="dropdown">
                <li><a href="${root }/event/list">진행중인 이벤트</a></li>
				<li><a href="${root }/event/endlist">종료된 이벤트</a></li>
 				<li><a href="${root }/admin/list">공지사항</a></li>
                </ul>
                </li>
            </ul>
          </nav>
          <!-- 메뉴 탭 end -->
          
          <div class="right-cta-menu text-right d-flex aligin-items-center col-6">
            <div class="ml-auto">
            	<!-- 검색 버튼 만들기~!~!~!~!~!~!~!~!~!~!~!~!~!~!~  -->
            	
            	
            	<!-- 로그인 유무에 따른 로그인/로그아웃 -->
            	<div class="login">
					<c:if test="${sessionScope.loginok==null}">
						<button type="button" id="loginbtn" class="btn btn-outline-white border-width-2 d-none d-lg-inline-block" data-bs-toggle="modal" data-bs-target="#ModalForm" style="position:relative; z-index:999; background-color: #339EB2; border: 0px; color: white;">로그인</button>
					</c:if>
					<c:if test="${sessionScope.loginok!=null}">
						<span onclick="location.href='${root}/member/mypage?num=${memnum }'"><i class="fa-solid fa-user" style="color: #fff; font-size: 15pt; cursor: pointer; position:relative; z-index:999;"></i></span>&nbsp;&nbsp;
						<b style="color: white;">${sessionScope.myid }님 로그인 중</b>&nbsp;&nbsp;
						<button type="button" class="btn btn-info btn-m" onclick="location.href='${root}/login/logoutprocess'" style="position:relative; z-index:999; background-color: #339EB2; border: 0px; color: white;">로그아웃</button>
					</c:if>
				</div>
            	
            </div>
          </div>

        </div>
      </div>
    </header>
    </div>
    
    <!-- 로그인 모달창 -->
    <div class="modal fade" id="ModalForm" tabindex="-1" aria-labelledby="ModalFormLabel" aria-hidden="true">
	    <div class="modal-dialog modal-dialog-centered">
	      <div class="modal-content">
	        <div class="modal-body">
	            <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal" aria-label="Close"></button>
	            <div class="myform bg-dark">
	                <h1 class="text-center">로그인</h1>
	                <!-- 어디서든 로그인 가능하게 -->
	                <form action="${root }/login/loginprocess" method="post">
	                    <div class="mb-3 mt-4">
	                        <label for="exampleInputEmail1" class="form-label">아이디</label>
	                        <input type="text" class="form-control" name="id" placeholder="아이디" value="${sessionScope.saveok==null?"":sessionScope.myid}" >
	                    </div>
	                    <div class="mb-3">
	                        <label for="exampleInputPassword1" class="form-label">비밀번호</label>
	                        <input type="password" class="form-control" name="pass" placeholder="비밀번호">
	                    </div>
	                    <input type="checkbox" name="cbsave" ${sessionScope.saveok==null?"":"checked"}><span style="font-size: 15px; color: gray;"> 아이디 저장</span>
	                    <button type="submit" class="btn btn-light mt-3">LOGIN</button>
	                    <p align="center;" style="padding-top : 2em;">아직 회원이 아니신가요? <a href="${root }/member/memberform">회원가입</a></p>
	                </form>
	            </div>
	        </div>
	      </div>
	    </div>
	</div>
    
    <%-- <!-- The Modal -->
	<div class="modal" id="myModal">
	  <div class="modal-dialog modal-lg">
	    <div class="modal-content" >
	
	      <!-- Modal Header -->
	      <div class="modal-header" style="background-color: #6464CD; z-index: 100; position: relative;">
	        <h4 class="modal-title">로그인</h4>
	        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
	      </div>
	
	      <!-- Modal body -->
	      <div class="modal-body" >
	      <form action="login/loginprocess" method="post">
	      	<input type="text" name="id" class="form-control" placeholder="아이디" value="${sessionScope.saveok==null?"":sessionScope.myid}" style="width: 300px;">
	      	<input type="password" name="pass" class="form-control" placeholder="비밀번호" required="required" style="width: 300px; margin-top: 10px;">
	      	<input type="checkbox" name="cbsave" ${sessionScope.saveok==null?"":"checked"}><span style="font-size: 11px; color: gray;">아이디 저장</span>
	      	<button type="submit">로그인</button>
	      	<button type="button" class="btn btn-outline-dark btn-m" onclick="location.href='${root }/member/memberform'">회원가입</button>
	      </form>
	      </div>
	
	      <!-- Modal footer -->
	      <div class="modal-footer">
	        <button type="button" class="btn btn-danger" data-bs-dismiss="modal">Close</button>
	      </div>
	
	    </div>
	  </div>
	</div> --%>
    
    <!-- 템플릿 스크립트 -->
    <script src="js/jquery-3.3.1.min.js"></script>
    <script src="js/popper.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/jquery.sticky.js"></script>
    <script src="js/main.js"></script>
    

</body>
</html>