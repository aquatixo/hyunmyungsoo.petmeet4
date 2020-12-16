<%@ page language='java' contentType='text/html; charset=UTF-8'
   pageEncoding='utf-8' isELIgnored='false'%>
<%@ page import='hyunmyungsoo.petmeet.domain.Review'%>
<%@ page import='hyunmyungsoo.petmeet.domain.Sitter'%>
<%@ page import='hyunmyungsoo.petmeet.domain.User'%>
<%@ page import='hyunmyungsoo.petmeet.domain.Reservation'%>
<%@ page import='java.util.List'%>

<%
   session.removeAttribute("main");
   Object userId = session.getAttribute("userEmail");
%>
<%
   List<Review> reviewList = (List<Review>) request.getAttribute("reviewList");
   List<Review> reservationList = (List<Review>) request.getAttribute("reservationList");
   List<Sitter> sitterList = (List<Sitter>) request.getAttribute("sitterList");
   List<User> userList = (List<User>) request.getAttribute("userList");
%>
<!DOCTYPE html>
<html>
<head>
<%@ include file='../include/library.jsp'%>
<title>Pet & Meet</title>
<script>
$(()=>{
   $('#myPage').click(()=>{
         location.href='../common/mypage';
  })
})

$(()=>{
   $('#userDelModal').click(() => {
      $("#form").submit();
   });
});

var imgError15 = function(image) {
	image.onerror = ""
	var parent = image.parentElement
	var parentTag = parent.innerHTML
	var listReviewImg = image.outerHTML
	parent.innerHTML = parentTag.replace(listReviewImg,
			'<div class="listReviewImg">후기 이미지</div>')
	return true;
}
</script>
</head>
<body>
   <div class='container'>
      <%@ include file='../include/header.jsp'%>
      <%@ include file='../include/nav.jsp'%>
      <div>
         <h3 class='titleFont'>후기</h3>
      </div>

      <form method='post' id="form" enctype='multipart/form-data'>
         <table class='table'>
            <thead class='text font'>
               <tr class='color font'>
                  <th class='text-center text-nowrap'>예약 번호</th>
                  <th class='text-center text-nowrap'>펫 시터 정보</th>
                  <th class='text-center text-nowrap'>후기 이미지</th>
                  <th class='text-center'>후기 </th>
               </tr>
            </thead>
            <tbody>
				<c:choose>
					<c:when test='${reservationList.size()>0}'>
						<c:forEach var='reservation' items='${reservationList}'>
							<c:forEach var='sitter' items='${sitterList}'>
								<c:if test="${reservation.userId eq userId}">									
									<tr>
										<th class='text-center align-middle'>${reservation.reservNum}</th>
										<c:if test="${reservation.sitterNum eq sitter.sitterNum}">
											<c:forEach var='user' items='${userList}'>
												<c:if test="${user.userId eq sitter.userId}">
													<td class='text-center align-middle'>
														<strong>${user.userNickname}</strong><br>
														${sitter.sitterLocSi}&nbsp;${sitter.sitterLocDong}<br><br>
    	                          		       		    ${sitter.sitterContent} 
													</td>
												</c:if>
											</c:forEach>
										</c:if>			
										
										<c:if test="${reviewList.size() eq '0'}">
											<td class='text-center align-middle'>후기를 작성해주세요</td>
											<td class='text-center align-middle'>
												<a href="insertReview?reservNum=${reservation.reservNum}" class='btn btn-outline-primary text-nowrap font'>
													작성하기
												</a>
											</td>
										</c:if>
										
										<c:if test="${reviewList.size() > 0}">
											<c:forEach var='review' items='${reviewList}'>
												<c:if test='${review.userId eq userId}'>
													<td class='text-center align-middle'>
														<img src='../img/review${review.userId}${review.reservNum}.PNG' class='img-fluid' onerror='imgError15(this);'>
													</td>
													<td class='text-center align-middle'>
														<p class='font text-nowrap'>작성완료</p>
														<a href="updateReview?reviewNum=${review.reviewNum}" class='btn btn-outline-info font p-1 btn-sm'>
                                       	   				수정
                                       					</a>
                                       					<input type="hidden" id="reviewNum" name="reviewNum" value="${review.reviewNum}">
                                       				<button type='button' class='btn btn-outline-danger font p-1 btn-sm text-nowrap' id='delBtn' data-toggle='modal' data-target='#userDelModal'>삭제</button>
												</td>
												</c:if>
												
												<c:if test='${review.userId ne userId}'>
													<td class='text-center align-middle'>후기를 작성해주세요</td>
													<td class='text-center align-middle'>
														<a href="insertReview?reservNum=${reservation.reservNum}" class='btn btn-outline-primary text-nowrap font'>
															작성하기
														</a>
													</td>
												</c:if>
											</c:forEach>
										</c:if>
									</tr>
								</c:if>
							</c:forEach>
                  		</c:forEach>
                  		</c:when>
                  		 <c:otherwise>
							<tr>
								<td colspan='12' class='text-center'>예약이 없습니다</td>
							</tr>
						</c:otherwise>
				</c:choose>               
      	      </tbody>
         </table>
         <div id='userDelModal' class='modal fade' tabindex='-1'>
         <div class='modal-dialog'>
            <div class='modal-content'>
               <div class='modal-body'>
                  <div class='row justify-content-center'>
                     <p>후기를 삭제하겠습니까?</p>
                  </div>
                  <div class='row justify-content-center'>
                  <button type='button' class='btn btn-primary' data-dismiss='modal' id='del2'>확인</button>
                  <button type='submit' class='btn btn-secondary ml-2' data-dismiss='modal' id='can'>취소</button>
                  </div>
               </div>
            </div>
         </div>
      </div>
      </form>
      
      <div id='userDelModal' class='modal fade' tabindex='-1'>
         <div class='modal-dialog'>
            <div class='modal-content'>
               <div class='modal-body'>
                  <div class='row justify-content-center'>
                     <p>후기를 삭제하겠습니까?</p>
                  </div>
                  <div class='row justify-content-center'>
                  <button type='button' class='btn btn-primary' data-dismiss='modal' id='del2'>확인</button>
                  <button type='submit' class='btn btn-secondary ml-2' data-dismiss='modal' id='can'>취소</button>
                  </div>
               </div>
            </div>
         </div>
      </div>
     
      <hr class='color'>
      <div class='d-flex justify-content-end mt-4'>
         <button class='btn btn-outline-primary font' type='button'
            id='myPage'>마이페이지</button>
      </div>
      <%@ include file='../include/footer.jsp'%>
   </div>
</body>
</html>