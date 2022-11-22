<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
<script src="https://kit.fontawesome.com/a47cf79e39.js" crossorigin="anonymous"></script>

   <!-- 메뉴 템플릿 css 추가-->
    <link href="https://fonts.googleapis.com/css?family=Quicksand:400,600,700&display=swap" rel="stylesheet"> 

    <link rel="stylesheet" href="../fonts/icomoon/style.css">

    <link rel="stylesheet" href="../css/owl.carousel.min.css">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="../css/bootstrap.min.css">
    
    <!-- Style -->
    <link rel="stylesheet" href="../css/style.css">
    <!-- 메뉴 템플릿 css end-->

<title>Insert title here</title>
<style type="text/css">
html {
	height: 100%;
}
body {
	margin: 0;
	height: 100%;
}
div.layout{
	min-height: 100%;
	position: relative;
	padding-bottom: 348px;
}
div.layout div{
      border: 0px solid gray;
   }
div.layout div.title{
      position: absolute;
	  top: 0; 
	  left: 0;
	  height: 100px;
	  width: 100%;
      background-color: #100B0B;
   }
   

   div.layout div.main{
   	  width: 100%;
   	  height: auto;
      padding-top: 150px; 
      padding-bottom: 200px;
   }
   
     
   div.layout div.footer {
	  position: absolute;
	  width: 100%;
	  bottom: 0; 
	  left: 0;
   }
   

</style>
</head>
<body>
<div class="layout">
   <div class="title">
      <tiles:insertAttribute name="title"/>
   </div>
   <div class="main">
      <tiles:insertAttribute name="main"/>
   </div>
   <div class="footer">
      <tiles:insertAttribute name="footer"/>
   </div>
</div>
</body>
</html>