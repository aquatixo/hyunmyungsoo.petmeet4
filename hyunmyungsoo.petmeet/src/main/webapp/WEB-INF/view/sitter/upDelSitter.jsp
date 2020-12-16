<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file= '../include/library.jsp' %>
<script type="text/javascript" src="https://cdn.jsdelivr.net/jquery/latest/jquery.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />
<title>Pet & Meet</title>
</head>
<script>
$(() => {
	$('#animalType').click(function(){
		var choice = $('#animalType option:selected').val();
		if(choice == '강아지') {
			$('#dogType').removeAttr('hidden');
			$('#dogType').attr('required', true);
		}
		
		else if(choice == '고양이'){
			$('#dogType').attr('hidden', 'true');
			$('#dogType option:selected').val(null);
			$('#dogType').attr('required', false);
		}
	});
});

$(function() {
  $('input[name="daterange"]').daterangepicker({
    opens: 'left'
  }, function(start, end, label) {
    console.log($('input[name="daterange"]').val());
  });
});
	
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
      showImg(this);
   });
});	
</script>
<%
	Object userId = session.getAttribute("userEmail");
	Object sitter = request.getAttribute("sitter");
	Object sitterStartDate = request.getAttribute("sitterStartDate");
	Object sitterFinishDate = request.getAttribute("sitterFinishDate");
%>
<body>
	<div class='container'>
		<%@ include file='../include/header.jsp'%>
		<%@ include file='../include/nav.jsp'%>
		<div>
			<h3 class='titleFont'>펫 시터 등록 관리</h3>
		</div>
		<hr class='color'>
		
		<div  class='col-4 form-group'>
			<p class='font mb-0'>기존 이미지</p>			
			<img src='../img/sitter${sitter.userId}.PNG' class='mainImg2 img-fluid' onerror='imgError6(this);'>
		</div>

		<hr class='color'>
		<form id='sitterInForm justify-content-center mt-3' method='post'
			enctype='multipart/form-data'>
			<div class='form-row'>
				<div class='form-group col-4'>
					<div class='custom-file'>
						<input name='attachFile' type='file' class='custom-file-input'
							id='attachFile'  /> <label class='custom-file-label'
							for='attachFile'>파일찾기</label>
					</div>
				</div>
			</div>
			<img id='previewImg' class="img-fluid"/>
			
			<div class='form-group row' hidden>
				<input name='userId' type='text' class='form-control' id='userId'
					value='<%=userId%>' />
			</div>

			<input type='text' name='sitterTitle' class='form-control col-12 mt-3 font color'
				id='sitterTitle' value='${sitter.sitterTitle }' />
			<textarea class='form-control mt-2 col-12 font color' name='sitterContent' 
				id='sitterContent'>${sitter.sitterContent }</textarea>

			<div class='form-group row sitterOption mt-2 mb-0'>
				<select id='animalType' name='sitterPetType'
					class='form-control col-4 ml-3 font color'>
					<c:if test='${sitter.sitterPetType eq "강아지" }'>
						<option selected>강아지</option>
						<option>고양이</option>
					</c:if>
					<c:if test='${sitter.sitterPetType eq "고양이" }'>
						<option>강아지</option>
						<option selected>고양이</option>
					</c:if>
				</select>

				<c:if test='${sitter.sitterPetType eq "고양이" }'>
					<select id='dogType' name='sitterPetSize'
						class='form-control col-4 ml-1 font color' hidden>
						<c:if test='${sitter.sitterPetSize eq "대형견" }'>
							<option selected>대형견</option>
							<option>중형견</option>
							<option>소형견</option>
						</c:if>
						<c:if test='${sitter.sitterPetSize eq "중형견" }'>
							<option>대형견</option>
							<option selected>중형견</option>
							<option>소형견</option>
						</c:if>
						<c:if test='${sitter.sitterPetSize eq "소형견" }'>
							<option>대형견</option>
							<option>중형견</option>
							<option selected>소형견</option>
						</c:if>
						<c:if test='${sitter.sitterPetSize eq null }'>
							<option value='' selected disabled hidden></option>
							<option>대형견</option>
							<option>중형견</option>
							<option>소형견</option>
						</c:if>
					</select>
				</c:if>
				
				<c:if test='${sitter.sitterPetType eq "강아지" }'>
					<select id='dogType' name='sitterPetSize'
						class='form-control col-4 ml-1 font color'>
						<c:if test='${sitter.sitterPetSize eq "대형견" }'>
							<option selected>대형견</option>
							<option>중형견</option>
							<option>소형견</option>
						</c:if>
						<c:if test='${sitter.sitterPetSize eq "중형견" }'>
							<option>대형견</option>
							<option selected>중형견</option>
							<option>소형견</option>
						</c:if>
						<c:if test='${sitter.sitterPetSize eq "소형견" }'>
							<option>대형견</option>
							<option>중형견</option>
							<option selected>소형견</option>
						</c:if>
						<c:if test='${sitter.sitterPetSize eq null }'>
							<option value='' selected disabled hidden></option>
							<option>대형견</option>
							<option>중형견</option>
							<option>소형견</option>
						</c:if>
					</select>
				</c:if>
			</div>

			<div class='form-group row sitterOption mt-2'>
               <label for='sitterLocation' class='col-2 font mt-3 mr-0 pr-0'>위치 입력</label>
               <div class='form-group row mt-3'>
            		<input type="text" class='col-3' value='${sitter.sitterPostNum }' name='sitterPostNum' id="sample4_postcode" placeholder="우편번호"> 
            		<input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기"><br> 
            		<input type="text" value='${sitter.sitterLocOrg }' name='sitterLocOrg' id="sample4_jibunAddress" placeholder="지번주소"> 
            	</div>
            </div>	
				
			<div class='row sitterOption mt-2'>
					<label for='sitterDate' class='col-2 font mt-1 mr-0 pr-0'>기간 선택</label>
					<input id='sitterDate' type="text" name="daterange" value='${sitterStartDate } - ${sitterFinishDate }' class='form-contrl col-5  font color' id='sitterDate' required />
			</div>
			<hr class='color'>

			<div class='form-group row justify-content-end mt-4'>
				<button type='button' class='btn btn-outline-info mr-2 font'
					data-toggle='modal' data-dismiss='modal'
					data-target='#sitterFixMod'>수정</button>
				<button type='button' class='btn btn-outline-danger mr-2 font'
					data-toggle='modal' data-dismiss='modal'
					data-target='#sitterDelMod'>삭제</button>
				<a href='../common/mypage.html'
					class='btn btn-outline-secondary font'>취소</a>
			</div>
 
			<div class='modal fade' id='sitterFixMod' tabindex='-1'>
				<div class='modal-dialog'>
					<div class='modal-content'>
						<div class='modal-body '>
							<p class='text-center'>게시물을 수정하겠습니까?</p>
							<div class='row justify-content-center'>
                  				<button type='submit' class='btn btn-primary submitBtn mr-2' >확인</button>
                  				<button type='button' class='btn btn-secondary' data-dismiss='modal'>취소</button>
              				</div>
						</div>
					</div>
				</div>
			</div>
		</form>

		<form action='upDelSitter/del' method='post'>
			<div class='form-group row' hidden>
				<input name='userId' type='text' class='form-control' id='userId'
					value='<%=userId%>'/>
			</div>
			<div class='modal fade' id='sitterDelMod' tabindex='-1'>
				<div class='modal-dialog'>
					<div class='modal-content'>
						<div class='modal-body '>
							<p class='text-center'>게시물을 삭제하겠습니까?</p>
							<div class='row justify-content-center'>
                  				<button type='submit' class='btn btn-primary submitBtn mr-2' >확인</button>
                  				<button type='button' class='btn btn-secondary' data-dismiss='modal'>취소</button>
              				</div>
						</div>
					</div>
				</div>
			</div>
		</form>
		<%@ include file='../include/footer.jsp'%>
	</div>
</body>