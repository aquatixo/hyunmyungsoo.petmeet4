<%@ page language='java' contentType='text/html; charset=UTF-8' pageEncoding='utf-8' isELIgnored='false'%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<%@ include file= '../include/library.jsp' %>
<title>Pet & Meet</title>
</head>
<%
	Object userId = session.getAttribute("userEmail");
%>
<script>
function showImg(input) {
	   if(input.files[0]) { // 파일이 있는지 확인
	      let reader = new FileReader();
	                     // load이벤트가 발생하면 실행되는 리스너 callback
	      reader.addEventListener('load', () => {
	         $('#previewImg').attr('src', reader.result); // img미리보기가 나타남
	      }, false) // 자바스크립트가 제공하는 리스너
	      reader.readAsDataURL(input.files[0]); // 선택한 파일을 읽어들인다.
	   }
	}	
$(() => {
$('input').change(function() {
	   $("#previewImg").css("height", "200px");
	   showImg(this);
});
});	

var imgError8 = function(image) {
	image.onerror = ""
	var parent = image.parentElement
	var parentTag = parent.innerHTML
	var brokenImageTag = image.outerHTML
	parent.innerHTML = parentTag.replace(brokenImageTag,
			'<div class="broken carouImg">메인안내 이미지</div>')
	return true;

	}	
</script>
<body>
	<div class='container'>
  	<%@ include file= '../include/header.jsp' %>
	<%@ include file= '../include/nav.jsp' %>
	
		<div>
			<h3 class='titleFont'>자유게시판</h3>
		</div>
		
		<form id='updateForm' method='post' enctype='multipart/form-data'>
		<input type='text' class='form-control col-12 mt-3 font color' value='${board.boardTitle}' 
		id='boardTitle' name='boardTitle' required />
		
		기존 이미지
		<img src='../img/board${board.userId}${board.boardTitle}.PNG' class='img-fluid' onerror='imgError8(this);'>
		
		<div class='form-row mt-2'>
			<div class='form-group col-4'>
				<div class='custom-file'>
					<input name='attachFile' type='file' class='custom-file-input' id='attachFile'/>
					<label class='custom-file-label' for='attachFile'>파일찾기</label>
				</div>
			</div>
		</div>
		<img id='previewImg'/>
		<!-- <img width="250" height="200" class="previewImg2" id='${board.boardFile}'>-->
		
		<textarea class='form-control mt-2 col-12 font color' style='height : 300px;'  id='boardContent' name='boardContent'>${board.boardContent}</textarea>		
		
		
		<div class='d-flex justify-content-end mt-4'>
			<button type='button' class='btn btn-outline-primary mr-2 font' 
					data-toggle='modal' data-target='#addBoard' 
					data-dismiss='modal' id='addBtn'>수정</button>
			<button class='btn btn-outline-danger ml-1 font' type='button' value='취소' id='back'>취소</button>
		</div>

		<div id='addBoard' class='modal fade' tabindex='-1'>
			<div class='modal-dialog'>
				<div class='modal-content'>
					<div class='modal-body'>
						<div class='row justify-content-center'>
							<p>게시글을 수정하겠습니까?</p>
						</div>
						<div class='row justify-content-center'>
							<button type='submit' class='btn btn-primary submitBtn mr-2'>확인</button>
							<button type='button' class='btn btn-secondary' data-dismiss='modal'>취소</button>
						</div>
					</div>
				</div>
			</div>
		</div>

		
		<div class='form-group row' hidden>			
			<input name='userId' type='text' class='form-control' id='userId'
					value='<%=userId%>'/>
			<input name='boardNum' type='text' class='form-control' id='boardNum'
					value='${board.boardNum}'/>
		</div>
		
	</form>
		
		
	<%@ include file= '../include/footer.jsp' %>
		</div>

</body>
</html>