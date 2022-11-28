<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
<script src="https://kit.fontawesome.com/a47cf79e39.js" crossorigin="anonymous"></script>
<style type="text/css">
button.btn{
	background: #339EB2;
	color: white;
	border-color: #339EB2;
}

button.btn:hover{
	background: #339EB2 !important;
	color: white !important;
	border-color: #339EB2 !important;
}
</style>
<c:set var="root" value="<%=request.getContextPath() %>"/>

<!-- se2 폴더에서 js 파일 가져오기 -->
<script type="text/javascript" src="${root }/se2/js/HuskyEZCreator.js"
	charset="utf-8"></script>

<script type="text/javascript" src="${root }/se2/photo_uploader/plugin/hp_SE2M_AttachQuickPhoto.js"
	charset="utf-8"></script>	
</head>
<body>
<form action="update" method="post">
	<!-- 5개 hidden넣어주기 -->
		<input type="hidden" name="num" value="${dto.num }">
		<input type="hidden" name="currentPage" value="${currentPage }">
		
		
	<table class="table table" style="margin: 40px; width: 700px;">
	<tr>
		<td>	
			<!-- 새글일때만 카테고리 보이게(답글일 경우에는 원글의 카테고리가 그대로 보이기때문에 필요업ㄱ음) -->
			<c:if test="${dto.restep==0 }">
			<select class="form-select" aria-label="Default select example" name="category">
 			 <option value="" disabled selected hidden>게시판을 선택해주세요</option>
 			 <c:if test="${sessionScope.myid=='admin' }">
 			 <option value="공지사항" ${dto.category=='공지사항'?"selected":"" }>공지사항</option>
 			 </c:if>
 			 <option value="영화수다" ${dto.category=='영화수다'?"selected":"" }>영화수다</option>
 			 <option value="영화정보" ${dto.category=='영화정보'?"selected":"" }>영화정보</option>
			</select>
			</c:if>
			
			<div class="mb-3" style="padding-top: 10px;">
		  <input class="form-control" id="exampleFormControlInput1" name="subject" placeholder="제목을 입력해주세요" value="${dto.subject }">
		  	</div>
		  	
		  	<textarea name="content" id="content"		
					required="required"			
					style="width: 100%;height: 300px;display: none;">${dto.content }</textarea>
		</td>
	</tr>
	

		<tr>
			<td colspan="2" align="center">
				<button type="button" class="btn btn-warning"
					style="width: 120px;"
					onclick="submitContents(this)">수정</button>
				
				<button type="button" class="btn btn-warning"
					style="width: 120px;"
					onclick="location.href='list?currentPage=${currentPage}'">목록</button>
			</td>
		</tr>
		
	</table>   
</form>

<!-- 스마트게시판에 대한 스크립트 코드 넣기 -->
<script type="text/javascript">
var oEditors = [];

nhn.husky.EZCreator.createInIFrame({

    oAppRef: oEditors,

    elPlaceHolder: "content",

    sSkinURI: "${root }/se2/SmartEditor2Skin.html",

    fCreator: "createSEditor2"

}); 

//‘저장’ 버튼을 누르는 등 저장을 위한 액션을 했을 때 submitContents가 호출된다고 가정한다.

function submitContents(elClickedObj) {

    // 에디터의 내용이 textarea에 적용된다.

    oEditors.getById["content"].exec("UPDATE_CONTENTS_FIELD", [ ]);

 

    // 에디터의 내용에 대한 값 검증은 이곳에서

    // document.getElementById("textAreaContent").value를 이용해서 처리한다.
    try {
        elClickedObj.form.submit();
    } catch(e) { 

    }

}

// textArea에 이미지 첨부

function pasteHTML(filepath){
    var sHTML = '<img src="${root }/save/'+filepath+'">';
    oEditors.getById["content"].exec("PASTE_HTML", [sHTML]); 

}
</script>

</body>
</html>






















