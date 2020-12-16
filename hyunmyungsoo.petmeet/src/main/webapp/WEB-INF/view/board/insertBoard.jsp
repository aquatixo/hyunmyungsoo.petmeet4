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
	   if(input.files[0]) {
	      let reader = new FileReader();
	      reader.addEventListener('load', () => {
	         $('#previewImg').attr('src', reader.result); 
	      }, false) 
	      reader.readAsDataURL(input.files[0]);
	   }
	}	
$(() => {
   $('input').change(function() {
	   $("#previewImg").css("height", "200px");
	   showImg(this);
   });
});	
</script>
<body>
<div class='container'>
  	<%@ include file= '../include/header.jsp' %>
	<%@ include file= '../include/nav.jsp' %>
	
	<div>
		<h3 class='titleFont'>자유게시판</h3>
	</div>
	
	<form id='addForm' method='post' enctype='multipart/form-data'>
		<input type='text' class='form-control col-12 mt-3 font color' id='boardTitle' name='boardTitle' maxlength='30' required
					placeholder='제목을 입력하세요.'/>
		<div class='form-row mt-2'>
			<div class='form-group col-4'>
				<div class='custom-file'>
					<input name='attachFile' type='file' class='custom-file-input' id='attachFile'/>
					<label class='custom-file-label' for='attachFile'>파일찾기</label>
				</div>
			</div>
		</div>
		<img id='previewImg'/>
		
		<textarea class='form-control mt-2 col-12 font color' style='height : 300px;' id='boardContent' name='boardContent' maxlength='800' required
					placeholder='내용을 입력하세요.'></textarea>		
					
		<div class='d-flex justify-content-end mt-4'>
			<button type='button' class='btn btn-outline-primary mr-2 font' data-toggle='modal' data-target='#addBoard' id='addBtn'>
				등록
			</button>
			<button class='btn btn-outline-danger ml-1 font' type='button' value='취소' onclick="location.href='/hyunmyungsoo.petmeet/board/listBoard'">취소</button>
		</div>
		
		<div id='addBoard' class='modal fade' tabindex='-1'>
			<div class='modal-dialog'>
				<div class='modal-content'>
					<div class='modal-body'>
						<div class='row justify-content-center'>
							<p>게시글을 등록하겠습니까?</p>
						</div>
						<div class='row justify-content-center'>
							<button type='submit' 
							class='btn btn-primary submitBtn mr-2'>확인</button>
							<button type='button' class='btn btn-secondary'
							data-dismiss='modal'>취소</button>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class='form-group row' hidden>			
			<input name='userId' type='text' class='form-control' id='userId' value='<%=userId%>'/>
		</div>
	</form>
	<%@ include file= '../include/footer.jsp' %>	
</div>
</body>
</html>