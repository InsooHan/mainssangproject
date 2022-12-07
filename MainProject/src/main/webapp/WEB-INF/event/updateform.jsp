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

<c:set var="root" value="<%=request.getContextPath() %>"/>

<!-- se2 폴더에서 js 파일 가져오기 -->
<script type="text/javascript" src="${root }/se2/js/HuskyEZCreator.js"
	charset="utf-8"></script>

<script type="text/javascript" src="${root }/se2/photo_uploader/plugin/hp_SE2M_AttachQuickPhoto.js"
	charset="utf-8"></script>	
</head>
<body>
<div class="container">
<h4>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>이벤트 수정</b></h4>
<form action="update" method="post" enctype="multipart/form-data" ><!-- action insert로 번경 그리고 enctype은 설정다돼있으므로 추가안해도됨 -->
	<input type="hidden" name="num" value="${dto.num }">
		
	<table class="table table-bordered" style="width: 800px;margin-left: 100px;">
	
		<tr>
			<th bgcolor="#fff0f5" width="200" >제목</th>
			<td >
				<input type="text" name="subject" class="form-control"
					required="required" style="width: 600px;" value="${dto.subject }" >
			</td>	
		</tr>
		<tr>
					<th width="120" bgcolor="pink">카테고리</th>
				<td>
					<input type="radio" name="category" 
					value='메가pick'>메가pick
					<input type="radio" name="category" 
					value='영화'>영화
					<input type="radio" name="category"
					value='극장' checked="checked">극장
					<input type="radio" name="category"
					value='제휴/할인' checked="checked">제휴/할인
					<input type="radio" name="category"
					value='시사회/무대인사'>시사회/무대인사
				</td>
		</tr>
		<tr>
					
			<th width="120" bgcolor="pink">썸네일</th>
				<td>
					<input type="file" name="upload" class="form-control" "
					required="required">
				</td>
		
			
		</tr>
		<tr>
		<th bgcolor="#fff0f5" width="100">시작일</th>
			<td>
				<input type="date" name="startday" class="form-control"
					value="${dto.startday }" style="width: 150px;">
			</td>
			
		</tr>
		<tr>
		<th bgcolor="#fff0f5" width="100">종료일</th>
			<td>
				<input type="date" name="endday" class="form-control"
					value="${dto.endday }" style="width: 150px;" >
			</td>
		</tr>
		<tr>
			<td colspan="4">
				<textarea name="content" id="content"		
					required="required"			
					style="width: 100%;height: 300px;display: none;" >${dto.content }</textarea>		
			
			</td>
		</tr>
	<tr>
			<td colspan="2" align="center">
				<button type="button" class="btn btn-default"
					style="width: 120px;"
					onclick="submitContents(this)">수정</button>
				
								<button type="button" class="btn btn-default" style="width: 100px;"
				onclick="location.href='list'">목록</button>			</td>
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
</div>
</body>
</html>
