<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%
	session.removeAttribute("main");
%>
<!DOCTYPE html>
<html lang= 'ko'>
<head>
<%@ include file= '../include/library.jsp' %>
<%
	Object sitterNum = request.getAttribute("sitterNum");
	Object userId = session.getAttribute("userEmail");
%>
<script src='https://kit.fontawesome.com/8461f18566.js' crossorigin='anonymous'></script>
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
   
   let resetVal = function(){
	  $('#reservPrice').text('이용요금 : -원');
  	  $('#reservPetCount').val('');
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
   let sitterNumber = <%=sitterNum%>;
   $('.submitBtn').click(() =>{
	   $.ajax({
           url: '../reservation/reserve',
           method: 'post', 
           contentType: 'application/json',
           data: JSON.stringify({ 
        	   userId: 'hyunms@gmail.com',
        	   reservStart: $('#reservStart').val(),
        	   reservFinish:$('#reservFinish').val(),
        	   reservPrice: totalPrice,
        	   reservAccept: 'no',
        	   reservPetType: petType,
        	   reservPetSize: petSize,
        	   reservPetCount: petCount,
        	   sitterNum: sitterNumber
           }),                           
           success: result => location.href='../reservation/reservationCheck' 
           //error: e => showMsg('추가', false)
        })
   })
});
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
      <div id='houseImgs' class='carousel slide carousel' data-ride='carousel'>
            <div class='carousel-inner' data-interval='1000'>
               <div class='carousel-item'>
                  <div class='houseImg'><p>집이미지1</p></div>
               </div>
               <div class='carousel-item' data-interval='1000'>
                  <div class='houseImg'>집이미지2</div>
               </div>
               <div class='carousel-item active' data-interval='1000'>
                  <div class='houseImg'>집이미지3</div>
               </div>
            </div>
            <a href='#houseImgs' class='carousel-control-prev' data-slide='prev'>
               <span class='carousel-control-prev-icon'></span>
            </a>
            <a href='#houseImgs' class='carousel-control-next' data-slide='next'>
               <span class='carousel-control-next-icon'></span>
            </a>
         </div>
       <div class='row m-2'>
       <hr class='color'>
         <div id='left' class='col-sm-8'>
         <hr class='color'>
            <div>
               <h5 class='resevartionFont'><strong>${sitter.sitterTitle}</strong></h5>
               <strong>${sitter.sitterLocGu} ${sitter.sitterLocDong}, 별명: ${sitterNick}</strong>
               <p class='mt-2'>${sitter.sitterContent}</p>
            </div>
             <hr class='color'>
             <h5 class='font'><strong>펫 시터 후기 5개</strong></h5>
            <table class='table table-hover'>
               <tbody>
	               <c:forEach var='reviewForView' items='${reviewForViews}'>
                      <tr>
                          <td class='test'>
                            <div class='text-center reviewImage'>${reviewForView.reviewFileName}</div>
                         </td>
                         <td class='font'>
                        
                           <div class='mb-2'>
                              <b>${reviewForView.userNickname}</b>
                                ${reviewForView.reviewRegDate}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;★ ${reviewForView.reviewRating}<br>
                           </div>
                                ${reviewForView.reviewContent}
                        </td>
                      </tr>
                  </c:forEach>
               </tbody>
            </table>
               
              <div class='d-flex justify-content-center'>   
            <ul class='pagination'>
               <li class='page-item'><a class='page-link' href='#'><span>«</span></a></li>
               <li class='page-item'><a class='page-link' href='#'>1</a></li>
               <li class='page-item'><a class='page-link' href='#'>2</a></li>
               <li class='page-item'><a class='page-link' href='#'><span>»</span></a></li>
            </ul>
         </div>
         </div>
         
         <div id='right' class='col-sm-4'>
            <form id='reservationForm' action='02' >
               <div id='reservationDiv'>
                  <div class='form-group font' class='reviewBox'>
                  	 <div class='reviewBox'>
                    	 <label for='reservStart'>체크인 날짜</label>
                     </div>
                     <input type='date' class='form-control mb-3' id='reservStart'/>
                     <div class='reviewBox'>
                    	 <label for='reservEnd'>체크아웃 날짜</label>
                     </div>
                     <input type='date' class='form-control' id='reservFinish'/>
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
	                           <option value='bigDog' disabled>대형견&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;예약불가</option>
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
                  <button type='button' class='btn btn-outline-primary mr-2 font' data-toggle='modal' data-target='#resRequest'>예약 요청</button>
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
            
            <div id='infoDiv' class='reviewBox'>
              
            </div>
         </div>
      </div>
      
      <!-- include : footer  -->
      <div class='mt-3 footerLine'>
         <div class='footer'>
            INFO.<br> COMPANY : ㈜현명수 OWNER : 현명수 TEL : 010-0000-0000 /
            02-0000-0000 ADD : 00000 서울특별시 중구 명동 88 에이콘아카데미 15F 1 class <br>
            COPYRIGHT © HYUN ALL RIGHTS RESERVED. DESINES BY SOMETHING HOSTING
            BY HONG㈜
         </div>
         <!-- /include : footer  -->
         </div>
      
   </div>
</body>
</html>