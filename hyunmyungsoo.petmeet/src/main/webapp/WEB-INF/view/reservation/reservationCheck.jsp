<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang='ko'>
<head>
<!-- include : lib -->
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core'%>
<meta charset='utf-8'>
<meta name='viewport' content='width=device-width, initial-scale=1'>
<script src='https://code.jquery.com/jquery-3.5.1.min.js'></script>
<script src='https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js'></script>
<link rel='stylesheet' href='http://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css'>
<!-- include : lib -->
<script src='https://kit.fontawesome.com/8461f18566.js' crossorigin='anonymous'></script>
<link rel='stylesheet' href='../res/css/lib.css'>
<title>Pet & Meet</title>
<style>
</style>
</head>
<script>
$(() => {
   $('.okBtn').click(() =>{
      tableData.deleteRow(1);
   })
   
   $('.noBtn').click(() =>{
      tableData.deleteRow(1);
   });
});
</script>

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
               <th>예약번호</th>
               <th>펫 시터 정보</th>
               <th>예약일자</th>
               <th>예약상태</th>
            </tr>
         </thead>
            <tbody>
               <c:forEach var='reservation' items='${reservations}'>
               	 <c:if test="${reservation.userId eq sessionScope.userEmail}">
               	     <tr>
		               <td class='text-center align-middle'>${reservation.reservNum}</td>
		               <td>
		               	  <c:forEach var='sitter' items='${sitters}'>
			                  <div>
			                     <strong class='font'>
			                         <c:forEach var='user' items='${users}'>
			                         	<c:if test="${user.userId eq sitter.userId}">
			                         		${user.userNickname }
			                         	</c:if>
			                         </c:forEach>
			                     </strong>
			                     <p>${sitter.sitterLocSi} ${sitter.sitterLocGu} ${sitter.sitterLocDong}</p>
			                     <p>
			                     <p>${sitter.sitterTitle}</p>
			                  </div>
		                  </c:forEach>
		               </td>
		               <td class='text-center align-middle'>${reservation.reservStart}</td>
		               <td class='text-center align-middle'>
		                  <p class='font'>${reservation.reservAccept}</p> <a class='btn btn-primary font'
		                  href='../review/01.html'>후기작성</a>
		               </td>
		            </tr>
               	 </c:if>
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
      <hr class='color'>
      <h5 class='resevationFont'>신청받은 예약 내역</h5>
      <table class='table table-hover' id='reservationTb2'>
         <thead class='thead text'>
            <tr class='font'>
               <th>예약번호</th>
               <th>예약정보</th>
               <th>예약일자</th>
               <th>예약상태</th>
            </tr>
         </thead>
         <tbody>
            <tr>
               <td class='text-center align-middle'>1</td>
               <td class='text-center align-middle'>강아지 1마리</td>
               <td class='text-center align-middle'>2020.11.21</td>
               <td class='text-center align-middle'>
                  <p class='font'>예약 대기</p>
                  <div class='btn-group'>
                     <button class='btn btn-sm btn-primary okBtn mr-2 font'>수락</button>
                     <button class='btn btn-sm btn-danger noBtn font'>거절</button>
                  </div>
               </td>
            </tr>
            <tr class='text'>
               <td class='align-middle'>2</td>
               <td class='align-middle'>고양이 1마리</td>
               <td class='align-middle'>2020.09.11</td>
               <td class='font'>예약 완료</td>
            </tr>
            <tr class='text'>
               <td class='align-middle'>3</td>
               <td class='align-middle'>강아지 1마리</td>
               <td class='align-middle'>2020.07.19</td>
               <td class='font'>예약 완료</td>
            </tr>
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
      <hr class='color'>
      <div class='row justify-content-end mt-4 mr-1'>
         <a class='btn btn-outline-primary mb-3 font' href='../common/mypage'>마이페이지</a>
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