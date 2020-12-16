<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang='ko'>
<head>
<%@ include file= '../include/library.jsp' %>

<script src='https://kit.fontawesome.com/8461f18566.js' crossorigin='anonymous'></script>
<link rel='stylesheet' href='../res/css/lib.css'>
<title>Pet & Meet</title>
<style>
</style>
</head>
<%
	int reservationSize = Integer.parseInt(request.getAttribute("reservationSize").toString());
	int lastNum = 0;

	if(((reservationSize/5.0) * 10) % 10 != 0 ){
		lastNum = (int)(reservationSize/5.0) + 1;
	  } else lastNum = reservationSize/5;
	
	int gottenReservationSize = Integer.parseInt(request.getAttribute("gottenReservationSize").toString());
	int lastNum2 = 0;
	
	if(((gottenReservationSize/5.0) * 10) % 10 != 0 ){
		lastNum2 = (int)(gottenReservationSize/5.0) + 1;
	  } else lastNum2 = gottenReservationSize/5;
%>
<body>
	<div class='container'>
        <%@ include file= '../include/header.jsp' %>
		<%@ include file= '../include/nav.jsp' %>
      <div>
         <h3 class='titleFont'>예약 확인</h3>
      </div>
      <hr class='color'>
      <h5 class='resevationFont'>신청한 예약 내역</h5>
      <table class='table table-hover' id='reservationTb1'>
         <thead class='thead text'>
            <tr class='font'>
               <th class='text-nowrap'>예약번호</th>
               <th class='text-nowrap'>펫 시터 정보</th>
               <th class='text-nowrap'>예약일자</th>
               <th class='text-nowrap'>예약상태</th>
            </tr>
         </thead>
         <tbody>
         	<c:choose>
      		   <c:when test='${reservations.size() > 0 }'>
	               <c:forEach var='reservation' items='${reservations}'>
	               	     <tr>
			               <td class='text-center align-middle'>${reservation.reservNum}</td>
			               <td>
			               	  <c:forEach var='sitter' items='${sitters}'>
				               	  <c:if test="${reservation.sitterNum eq sitter.sitterNum}">
					                  <div>
				                     	 <p class='text-center text-nowrap'>
				                     	 	<c:forEach var='user' items='${users}'>
				                     	 		<c:if test="${sitter.userId eq user.userId}">
					                         		${user.userNickname } (${user.userPhone})
					                         	</c:if>
					                        </c:forEach>
				                    	 </p>
					                     <p class='text-center'>${sitter.sitterLocSi} ${sitter.sitterLocGu} ${sitter.sitterLocDong}</p>
					                     <p class='text-center'>${sitter.sitterTitle}</p>
					                  </div>
					              </c:if>
			                  </c:forEach>
			               </td>
			               <td class='text-center align-middle text-nowrap'>${reservation.reservStart}</td>
			               <td class='text-center align-middle'>
			                  <c:if test="${reservation.reservAccept eq 'y'}">
			                      	<p class='font'>예약완료</p>
			                      	<a class='btn btn-primary font text-nowrap'
				                  	href='../review/listReview'>후기작성</a>
			                  </c:if>
			                  <c:if test="${reservation.reservAccept eq 'n'}">
			                      	<p class='font pt-3'>예약대기</p>
			                  </c:if>
			               </td>
			            </tr>
			          </c:forEach>
	               </c:when>
             <c:otherwise>
	   	         <div class='font'>신청한 예약이 없습니다.</div>					
	         </c:otherwise>
           </c:choose>
         </tbody>
      </table>

	  <c:set var='page' value='${(param.p == null)?1:param.p}'/>
	  <c:set var='startNum' value='${page-(page-1)%5}' />
	  <c:set var='lastNum' value='<%=lastNum %>'/>
      <div class='d-flex justify-content-center'>
         <ul class='pagination'>
         	<c:if test='${startNum > 1 }'>
         		<a href='?p=${startNum-1}' class='page-link'>«</a>
         	</c:if>
         	<c:if test='${startNum <= 1}'>
		    	<span id='noPrev' class='page-link' data-toggle='modal' data-target='#prePageAlert'>«</span>
		    </c:if>
			
         	<c:forEach var='i' begin='0' end='4'>
         		<c:if test='${page eq startNum+i}'>
         			<li class='page-item'><a class='page-link' href='?p=${startNum+i}' style='background:#d3d3d3'>${startNum+i}</a></li>
         		</c:if>
         		<c:if test='${page ne startNum+i}'>
         			 <c:if test='${startNum+i <= lastNum }'> 
           				<li class='page-item'><a class='page-link' href='?p=${startNum+i}'>${startNum+i}</a></li>
           			 </c:if> 
           		</c:if>
            </c:forEach>
            <c:if test='${startNum+5 <= lastNum}'>
	      		<a href='?p=${startNum+5}' class='page-link'>»</a>
		    </c:if>
		    <c:if test='${startNum+5 > lastNum}'>
		    	<span class='page-link' data-toggle='modal' data-target='#nextPageAlert'>»</span>
		    </c:if>
         </ul>
      </div>      
      
      <div id='prePageAlert' class='modal fade' tabindex='-1'>
         <div class='modal-dialog'>
            <div class='modal-content'>
               <div class='modal-body'>
                  <div class='row justify-content-center'>
                     <p id='alertContent'>이전 페이지가 없습니다.</p>
                  </div>
                  <div class='row justify-content-center'>
                     <button type='button' class='btn btn-primary mr-2 submitBtn' data-dismiss='modal'>확인</button>
                     <button type='button' class='btn btn-secondary ml-1' data-dismiss='modal'>취소</button>
                  </div>
               </div>
            </div>
         </div>
      </div>
      
      <div id='nextPageAlert' class='modal fade' tabindex='-1'>
         <div class='modal-dialog'>
            <div class='modal-content'>
               <div class='modal-body'>
                  <div class='row justify-content-center'>
                     <p id='alertContent'>다음 페이지가 없습니다.</p>
                  </div>
                  <div class='row justify-content-center'>
                     <button type='button' class='btn btn-primary mr-2 submitBtn' data-dismiss='modal'>확인</button>
                     <button type='button' class='btn btn-secondary ml-1' data-dismiss='modal'>취소</button>
                  </div>
               </div>
            </div>
         </div>
      </div>

     <hr class='color'>
      <h5 class='resevationFont'>신청받은 예약 내역</h5>
      <table class='table table-hover' id='reservationTb2'>
         <thead class='thead text'>
            <tr class='font'>
               <th class='text-nowrap'>예약번호</th>
               <th class='text-nowrap'>예약정보</th>
               <th class='text-nowrap'>예약일자</th>
               <th class='text-nowrap'>예약상태</th>
            </tr>
         </thead>
         <tbody>
            <c:choose>
      		   <c:when test='${gottenReservations.size() > 0 }'>
	               <c:forEach var='reservation' items='${gottenReservations}'>
                    	<tr>
			               <td class='text-center align-middle'>${reservation.reservNum}</td>
			               <td class='text-center align-middle'>
			                   <p>
			                   <c:if test="${reservation.reservPetType eq 'dog'}"> 
			                       	강아지	
			                   </c:if>
			                   <c:if test="${reservation.reservPetType eq 'cat'}"> 
			                       	고양이	
			                   </c:if>
			                   ${reservation.reservPetCount}마리</p>
			                   <c:forEach var='user' items='${users}'>
			                       <c:if test='${user.userId eq reservation.userId }'>
			                           <p class='text-nowrap'>( 펫주인 연락처 : ${user.userPhone } )</p>
			                       </c:if>
			                   </c:forEach>
			               </td>
			               <td class='text-center align-middle text-nowrap'>${reservation.reservStart}</td>
			               <td class='text-center align-middle text-nowrap'>
			               <c:if test="${reservation.reservAccept eq 'n'}">
			                  <p class='font pt-3'>예약 대기</p>
			                  <div class='btn-group'>
		                  	 	  <a class='btn btn-sm btn-primary okBtn mr-2 font' 
		                  	 	      href='accept?reservNum=${reservation.reservNum}'>수락</a>
		                  	      <a class='btn btn-sm btn-danger noBtn font'
		                  	      	href='reject?reservNum=${reservation.reservNum}'>거절</a>
			                  </div>
			               </c:if>
		                   <c:if test="${reservation.reservAccept eq 'y'}">
		                  	  <p class='font'>예약 완료</p>
		                   </c:if>
			               </td>
			            </tr>
	               </c:forEach>
	           </c:when>
	           <c:otherwise>
	   	           <div class='font'>받은 예약이 없습니다.</div>					
	           </c:otherwise>
	        </c:choose>
         </tbody>
      </table>
     
	  <c:set var='page2' value='${(param.p2 == null)?1:param.p2}'/>
	  <c:set var='startNum2' value='${page2-(page2 - 1)%5}' />
	  <c:set var='lastNum2' value='<%=lastNum2 %>'/>
      <div class='d-flex justify-content-center'>
         <ul class='pagination'>
         	<c:if test='${startNum2 > 1 }'>
         		<a href='?p=${startNum2 - 1}' class='page-link'>«</a>
         	</c:if>
         	<c:if test='${startNum2 <= 1}'>
		    	<span id='noPrev' class='page-link' data-toggle='modal' data-target='#prePageAlert'>«</span>
		    </c:if>
			
         	<c:forEach var='i' begin='0' end='4'>
         		<c:if test='${page2 eq startNum2 + i}'>
         			<li class='page-item'><a class='page-link' href='?p2=${startNum2 +i}' style='background:#d3d3d3'>${startNum2 +i}</a></li>
         		</c:if>
         		<c:if test='${page2 ne startNum2 +i}'>
         			<c:if test='${startNum2 +i <= lastNum2 }'>
           				<li class='page-item'><a class='page-link' href='?p2=${startNum2 +i}'>${startNum2 +i}</a></li>
           			</c:if>
           		</c:if>
            </c:forEach>
            <c:if test='${startNum2 +5 <= lastNum2 }'>
	      		<a href='?p2=${startNum2 +5}' class='page-link'>»</a>
		    </c:if>
		    <c:if test='${startNum2 +5 > lastNum2 }'>
		    	<span class='page-link' data-toggle='modal' data-target='#nextPageAlert'>»</span>
		    </c:if>
         </ul>
      </div> 
      
      <hr class='color'>
      <div class='row justify-content-end mt-4 mr-1'>
         <a class='btn btn-outline-primary mb-3 font' href='../common/mypage'>마이페이지</a>
      </div>
      <%@ include file= '../include/footer.jsp' %>   
    </div>
</body>
</html>