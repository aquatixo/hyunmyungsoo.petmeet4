<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%
   session.removeAttribute("main");
%>
<!DOCTYPE html>
<html lang= 'ko'>
<head>

<%@ include file= '../include/library.jsp' %>

<%
   Object userId = session.getAttribute("userEmail");
%>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src='https://kit.fontawesome.com/8461f18566.js' crossorigin='anonymous'></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script>
$(() => {
   let totalPrice = 0;
   let petType = '';
   let petSize = '';
   let petCount = 0;
   let catPrice = 40000;
   let smallDogPrice = 40000;
   let middleDogPrice = 50000;
   let bigDogPrice = 60000;
   let reservDisabled = document.getElementById('reservationBtn');
   
   let finishDate = '${sitter.sitterFinish}';
   let startDate = '';
   startDate = ($('#reservStart').val()).split(",") + '';
            
   $('#reservStart').datepicker({
       dateFormat : 'yy-mm-dd',
       minDate : 0,
       maxDate : finishDate,
       onClose : function(selectedDate){
          let date = new Date(selectedDate);
          date.setDate(date.getDate() + 1);
          $('#reservFinish').datepicker("option","minDate",date);
       }
   });
  
      $('#reservFinish').datepicker({
         dateFormat : 'yy-mm-dd',
         maxDate : finishDate,
         onClose : function( selectedDate ) {
            $("#reservStart").datepicker("option", "maxDate", selectedDate );
        }
      });
    
   let resetVal = function(){
     $('#reservPrice').text('이용요금 : -원');
       $('#reservPetCount').val('');
       reservDisabled.disabled = 'disabled';
   }
   
   let setPrice = function(price){
      if($('#reservPetCount option:selected').val() == '1') {
         petCount = 1;
         totalPrice = price;
      }
      else if($('#reservPetCount option:selected').val() == '2') {
         petCount = 2;
         totalPrice = price * 2;
      }
      else if($('#reservPetCount option:selected').val() == '3') {
         petCount= 3;
         totalPrice = price * 3;
      }
    
       $('#reservPrice').text('이용요금 : ' + totalPrice + '원');
       reservDisabled.disabled = false;
   }
   
   $('#dog').click(function(){
      if($(this).prop('checked')==true){
        petType='dog';
        resetVal();
         $('#reservPetSize').removeAttr('hidden');
      }
   });
   
   $('#cat').click(function(){
      if($(this).prop('checked')==true){
         petType='cat';
         resetVal();
          $('#reservPetSize').attr('hidden','true');
      }
   });
   
   $('#reservPetSize').change(function() {
       if($('#reservPetSize option:selected').val() == 'small') {
          resetVal();
          petSize = 'small';
       }
       if($('#reservPetSize option:selected').val() == 'middleDog') {
          resetVal();
          petSize = 'middle';   
       }
       if($('#reservPetSize option:selected').val() == 'bigDog') {
          resetVal();
          petSize = 'big';
       }
   })
   
   $('#reservPetCount').change(function() {
      if(petType == 'dog'){
        if(petSize == 'small') setPrice(smallDogPrice);
        else if(petSize == 'middle') setPrice(middleDogPrice);
        else if(petSize == 'big') setPrice(bigDogPrice);
        
      } else if(petType == 'cat') setPrice(catPrice);
   })

   $('.submitBtn').click(() =>{
      $.ajax({
           url: 'reserve',
           method: 'post', 
           contentType: 'application/json',
           data: JSON.stringify({ 
              userId: '${sessionScope.userEmail}',
              reservStart: $('#reservStart').val(),
              reservFinish:$('#reservFinish').val(),
              reservPrice: totalPrice,
              reservAccept: 'n',
              reservPetType: petType,
              reservPetSize: petSize,
              reservPetCount: petCount,
              sitterNum: ${sitterNum}
           }),                           
           success: result => location.href='../reservation/checkReservation' 
        })
   })
});
var imgError14 = function(image) {
   image.onerror = ""
   var parent = image.parentElement
   var parentTag = parent.innerHTML
   var houseImgTag = image.outerHTML
   parent.innerHTML = parentTag.replace(houseImgTag,
   '<div class="houseImg ml-3">집이미지</div>')
   return true;
}
var imgError15 = function(image) {
      image.onerror = ""
      var parent = image.parentElement
      var parentTag = parent.innerHTML
      var reviewImageReserv = image.outerHTML
      parent.innerHTML = parentTag.replace(reviewImageReserv,
      '<div class="reviewImageReserv">후기이미지</div>')
      return true;
   }
</script>
<title>Pet & Meet</title>
</head>
<body>
   <div class='container'>
         <%@ include file= '../include/header.jsp' %>
       <%@ include file= '../include/nav.jsp' %>
         <div>
         <h3 class='titleFont'>예약</h3>
         </div>
      <hr class='color'>
       <div class='row text-center'>
            <img src='../img/sitter${sitter.userId}.PNG' class='houseImg' onerror='imgError14(this);' style='width:100%; height:300px;'> 
       </div>
       <div class='row m-2'>
       <hr class='color'>
         <div id='left' class='col-sm-8'>
         <hr class='color'>
            <div>
               <h5 class='resevartionFont'><strong>${sitter.sitterTitle}</strong></h5>
               <strong>${sitter.sitterLocGu} ${sitter.sitterLocDong}, ${sitterNick}</strong>
               <p class='mt-2'>${sitter.sitterContent}</p>
            </div>
             <hr class='color'>
             <h5 class='font'><strong></strong></h5>
             <div class='font mt-3'>후기</div>
            <table class='table table-hover mt-3'>
               <tbody>
               <c:choose>
               	 <c:when test='${reviewForViews.size() > 0}'>
                  <c:forEach var='reviewForView' items='${reviewForViews}'>
                      <tr style="border-bottom :1px solid; border-top :1px solid; border-color:#e2e2e2">
                  <c:forEach var='review' items='${reviewList}'>
                  	<c:forEach var='resv' items='${revList}'>
                          <c:if test="${review.reservNum eq resv.reservNum}">
                          <td>
							<img src='../img/review${review.userId}${review.reservNum}.PNG' class='img-fluid' 
							style='height:200px;' onerror='imgError15(this);'>
                         </td>
                          </c:if>
                    </c:forEach>
				  </c:forEach>                          
                         <td class='font'>
                        
                           <div class='mb-2'>
                              <b>${reviewForView.userNickname}</b>
                                ${reviewForView.reviewRegDate}<br>★ ${reviewForView.reviewRating}<br><br>
                           </div>
                                ${reviewForView.reviewContent}
                        </td>
                      </tr>
                  </c:forEach>
                  </c:when>
                  <c:otherwise>
                  	 <strong>등록된 후기가 없습니다.</strong>
                  </c:otherwise>
               </c:choose>
               </tbody>
            </table>
            <hr>
         </div>
         
         <div id='right' class='col-sm-4'>
            <form id='reservationForm' action='02' >
               <div id='reservationDiv'>
                  <div class='form-group font' class='reviewBox'>
                      <div class='reviewBox'>
                        <label for='reservStart'>체크인 날짜</label>
                     </div>
                     <input type='text' class='form-control mb-3' id='reservStart'/>
                     <div class='reviewBox'>
                        <label for='reservEnd'>체크아웃 날짜</label>
                     </div>
                     <input type='text' class='form-control' id='reservFinish'/>
                  </div>
                  
                  <div class='form-group font'>
                    <div class='reviewBox'>
                     <label for='reservPetType font'>맡기시는 반려동물</label>
                      </div>
                        <div class='form-check from-check-inline mt-2 form-gorup-row'>
                        <input type='radio' name='reservPetType' class='form-check-input' id='dog'/>
                        <label class='form-check-label mr-3' for='dog'>강아지</label>
                        <input type='radio' name='reservPetType' class='form-check-input' id='cat'/>
                        <label class='form-check-label' for='cat'>고양이</label>
                     </div> 
                     <div id='dogRadios' class='mb-3'>
                        <select class='form-control' id='reservPetSize' hidden='true' required>
                              <option value='' disabled selected hidden>사이즈 선택</option>
                              <option value='small'>소형견</option>
                              <option value='middleDog'>중형견</option>
                              <option value='bigDog'>대형견</option>
                           </select>
                        </div>
                  </div>
                  
                  <div class='form-group font'>
                    <div class='reviewBox'>
                     <label for='reservPetCount'>마릿수</label>
                     </div>
                        <select class='form-control' id='reservPetCount' required>
                           <option value='' disabled selected hidden></option>
                           <option value='1'>1마리</option>
                           <option value='2'>2마리</option>
                           <option value='3'>3마리</option>
                        </select>
                  </div>
                           
                  <div class='form-group font'>
                     <strong id='reservPrice'>이용요금 : -원</strong>
                  </div>
               </div>

               <div class='pagination pagination-sm justify-content-center mt-3'>
                  <button type='button' class='btn btn-outline-primary mr-2 font' data-toggle='modal' data-target='#resRequest' id='reservationBtn' 
                     disabled='disabled'>예약 요청</button>
                  <button type='button' class='btn btn-outline-warning font' data-toggle='modal' data-target='#attention' >관심</button>
               </div>
               
               <div id='resRequest' class='modal fade' tabindex='-1'>
               <div class='modal-dialog'>
                  <div class='modal-content'>
                     <div class='modal-body'>
                        <div class='row justify-content-center'>
                           <p>예약 요청 하겠습니까?</p>
                        </div>
                        <div class='row justify-content-center'>
                           <button type='button' class='btn btn-primary mr-2 submitBtn'>확인</button>
                           <button type='button' class='btn btn-secondary ml-1' data-dismiss='modal'>취소</button>
                        </div>
                     </div>
                  </div>
               </div>
            </div>      
            </form>
            <form action='../like/addLike' method='post'>
            <div id='attention' class='modal fade' tabindex='-1'>
               <div class='modal-dialog'>
               <div class='modal-content'>
                  <div class='modal-body'>
                     <div class='row justify-content-center'>
                        <p>펫 시터를 관심 목록에 추가하겠습니까?</p>
                     </div>
                     <div class='row justify-content-center'>
                        <button type='submit' class='btn btn-primary submitlikeBtn mr-2'>확인</button>
                        <button type='button' class='btn btn-secondary ml-1' data-dismiss='modal'>취소</button>
                     </div>
                  </div>
               </div>
               </div>
            </div>
            <div class='form-group row' hidden>         
               <input name='userId' type='text' class='form-control' id='userId'
                  value='<%=userId%>'/>
            </div>
            <div class='form-group row' hidden>         
               <input name='sitterNum' type='number' class='form-control' id='sitterNum'
                  value='${sitterNum}'/>
            </div>
         </form>
         </div>
      </div>
      <%@ include file= '../include/footer.jsp' %>
   </div>
</body>
</html>