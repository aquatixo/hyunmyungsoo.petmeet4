<%@ page language='java' contentType="text/html; charset=UTF-8"
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
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    function sample4_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                var roadAddr = data.roadAddress; 
                var extraRoadAddr = '';

                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
              
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
               
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }
                document.getElementById('sample4_postcode').value = data.zonecode;
                document.getElementById("sample4_jibunAddress").value = data.jibunAddress;
            }
        }).open();
    }
</script>
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
%>
<body>
   <div class='container'>
      <%@ include file= '../include/header.jsp' %>
      <%@ include file= '../include/nav.jsp' %>
      <div>
         <h3 class='titleFont'>펫 시터 등록</h3>
      </div>
      <hr class='color'>
      <img id='previewImg' class='img-fluid'/>
      <form id='sitterInForm justify-content-center mt-3' method='post' enctype='multipart/form-data'>
            <div class='form-row'>
               <div class='form-group col-4'>
                  <div class='custom-file'>
                     <input name='attachFile' type='file' class='custom-file-input' id='attachFile' required/>
                     <label class='custom-file-label' for='attachFile'>파일찾기</label>
                  </div>
               </div>
            </div>
            <div class='form-group row' hidden>         
            <input name='userId' type='text' class='form-control' id='userId'
                  value='<%=userId%>' />
            </div>
            
            <input type='text' class='form-control col-12 mt-3 font color' id='sitterTitle' name='sitterTitle'
               placeholder='제목을 입력하세요.' maxlength='20' required/>
            <textarea class='form-control mt-2 col-12 font color' id='sitterContent' name='sitterContent'
               placeholder='소개를 입력하세요.' maxlength='500' required></textarea>
               
            <div class='form-group row sitterOption mt-2 mb-0'>
               <select id='animalType' name='sitterPetType' class='form-control font color col-4 ml-3' required>
                  <option value='' selected disabled hidden>반려동물 종류</option>
                  <option value='강아지' id='dog'>강아지</option>
                  <option value='고양이' id='cat'>고양이</option>
               </select>

               <select id='dogType' name='sitterPetSize' class='form-control col-4 ml-1 font color' hidden='true'>
                  <option value='' selected disabled hidden>강아지 크기</option>
                  <option value='대형견'>대형견</option>
                  <option value='중형견'>중형견</option>
                  <option value='소형견'>소형견</option>
               </select>
            </div>

            <div class='form-group row sitterOption mt-2'>
               <label for='sitterLocation' class='col-2 font mt-3 mr-0 pr-0'>위치 입력</label>
               <div class='form-group row mt-3'>
            		<input type="text" class='col-3' name='sitterPostNum' id="sample4_postcode" placeholder="우편번호"> 
            		<input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기"><br> 
            		<input type="text" name='sitterLocOrg' id="sample4_jibunAddress" placeholder="지번주소"> 
            	</div>
            </div>
            <div class='row sitterOption mt-2'>
               <label for='sitterDate' class='col-2 font mt-1 mr-0 pr-0'>기간 선택</label>
               <input id='sitterDate' type="text" name="daterange" placeholder='기간을 입력하세요.' class='form-contrl col-5  font color' id='sitterDate' required />
            </div>
            
            <hr class='color'>

            <div class='form-group row justify-content-end mt-4'>
               <button type='button' class='btn btn-outline-primary mr-2 font' data-toggle='modal' data-dismiss='modal' data-target='#sitterMod'>등록</button>
               <a href='../common/mypage' class='btn btn-outline-danger font'>취소</a>
            </div>
            <div class='modal fade' id='sitterMod' tabindex='-1'>
               <div class='modal-dialog'>
                  <div class='modal-content'>
                     <div class='modal-body '>
                        <p class='text-center'>게시물을 등록하겠습니까?</p>
                        <div class='text-center'>
                           <button type='submit' class='btn btn-primary'>확인</button>
                           <button type='button' class='btn btn-secondary' data-dismiss='modal'>취소</button>
                        </div>
                     </div>
                  </div>
               </div>
            </div>
            </form>
      <%@ include file= '../include/footer.jsp' %>
   </div>
</body>
</html>