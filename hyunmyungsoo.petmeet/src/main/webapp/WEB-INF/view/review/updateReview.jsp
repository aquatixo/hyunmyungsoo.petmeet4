<%@ page language='java' contentType='text/html; charset=UTF-8' pageEncoding='utf-8' isELIgnored='false'%>
<!DOCTYPE html>
<html>
<head>
<%@ include file= '../include/library.jsp' %>
<script src='https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js'></script>
<title>Pet & Meet</title>
<link rel='stylesheet' href='../../../res/css/lib.css'>
</head>

<%
   Object userId = session.getAttribute("userEmail");
%>
<script>
$(()=>{
   $('#fixReview').click(()=>{
      $("#form").submit();
   });
});

$(()=>{
   $('#canBoard').click(()=>{
      location.href="listReview";
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
         <h3 class='titleFont'>후기 수정</h3>
      </div>
      <hr class='color'>
     <form method="post" id="form" enctype='multipart/form-data'>
         <div class='center-block'>
            <table class='table table-sm'>
               <thead>
                  <tr>
                     <th>
                        <div class='form-row ml-1 mt-2'>
                           <div class='form-group'>
                              <div class='custom-file'>
                                 <input id='attachFile' name='attachFile' type='file' class='custom-file-input' />
                                 <label class='custom-file-label' for='attachFile'>파일찾기</label>
                              </div>
                           </div>
                        </div>
                        <img id='previewImg'/>
                     </th>
                  </tr>
                  <c:forEach var='review' items='${reviewList}'>
                  <tr>
                     <th class='d-flex justify-content-end font'>후기별점&nbsp;★&nbsp;
                        <input type="number" id="reviewRating" name="reviewRating" value='${review.reviewRating}' maxlength='1' >
                     </th>
                  </tr>
                  <tr>
                     <th class='thead'>
                        <textarea class='form-control' style='height: 300px;' 
                        id="reviewContent" name="reviewContent" maxlength='20'>${review.reviewContent}</textarea>
                     </th>
                  </tr>
                                    
                  </c:forEach>
                  <tr style="visibility:hidden;">
                     <td>
                        <c:choose>
                           <c:when test = '${reservationList.size()>0}'>
                              <c:forEach var="reservation" items="${reservationList}">
                                 <c:forEach var="review" items="${reviewList}">
                                 <c:if test='${reservation.reservNum eq review.reservNum}'>
                                    <input type="number" id="reservNum" name="reservNum" value="${reservation.reservNum}"/>
                                    <input type="number" id="sitterNum" name="sitterNum" value="${reservation.sitterNum}"/>
                                    <input type="text" id="userId" name="userId" value="<%=userId%>"/>
                                 </c:if>
                                 </c:forEach>
                              </c:forEach>
                           </c:when>
                        </c:choose>
                     </td>
                  </tr>
               </thead>
            </table>
         </div>
         
         <div id='fixReview' class='modal fade' tabindex='-1'>
            <div class='modal-dialog'>
               <div class='modal-content'>
                  <div class='modal-body'>
                     <div class='row justify-content-center'>
                        <p>후기를 수정하겠습니까?</p>
                     </div>
                     <div class='row justify-content-center'>
                        <button type='button' class='btn btn-primary' data-dismiss='modal' id='fix'>확인</button>
                        <button type='submit' class='btn btn-secondary ml-2' data-dismiss='modal' id='can'>취소</button>
                     </div>
                  </div>
               </div>
            </div>
         </div>
         
         <div class='d-flex justify-content-end mt-3'>
            <button type='button' class='btn btn-outline-info mr-2 font' data-toggle='modal' data-target='#fixReview'>수정</button>
            <button class='btn btn-outline-danger ml-1 font' type='button' value='취소' id='canBoard'>취소</button>
         </div>
      </form>
      
      <%@ include file= '../include/footer.jsp' %>
   </div>
</body>
</html>