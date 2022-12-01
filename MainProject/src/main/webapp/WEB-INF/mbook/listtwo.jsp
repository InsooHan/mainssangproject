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
div.back
{
background-color: black;
}
div.up
{
color: white;
}
</style>
<script type="text/javascript">
$(function() {
	capa=${sdto.capacity};
	var seat="<i class='fa-regular fa-square fa-2xl'></i>&nbsp;";
	var a=1;
	var abc = ['A','B','C','D'];
	if(capa==32){
	for(var i=0;i<capa;i++){
		
		$(".se").append(seat);
		if((a+2)%2==0)
			$(".se").append("&nbsp;&nbsp;&nbsp;");
		if((a+8)%8==0)
			$(".se").append("<br>");a++;
		if(i>=24)
			
		
	}
	}
});
</script>
</head>
<body>
<div class="back">

<div class="up">${sdto.capacity}</div>

</div>
<div class="number">
<div class="se">
</div>
</div>
</body>
</html>