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
	Object userList = request.getAttribute("userList");
%>
<script>
	$(function(){ 
		$(".upBoard").click(function() {
			   var boardNum = $(this).attr('id').substr(1);
			   location.href = "upBoard?boardNum=" + boardNum;
		});
	});
   var imgError7 = function(image) {
	   image.onerror = ""
	   var parent = image.parentElement
	   var parentTag = parent.innerHTML
	   var brokenImageTag = image.outerHTML
	   parent.innerHTML = parentTag.replace(brokenImageTag,
		'<div></div>')
	   return true;
	   }	
</script>
<body>
<div class='container'>
  	<%@ include file= '../include/header.jsp' %>
	<%@ include file= '../include/nav.jsp' %>
	
    <h3 class='titleFont'>자유게시판 관리</h3>
    
    <table class='table'>
      <tr class='thead'>
         <th colspan='12' class='font'>${board.boardTitle}
      </tr>
      <tr class='font'>
         <td>등록일</td>
         <td>${board.regDate}</td>
         <td>작성자</td>
		<td>
			<c:forEach var='user' items='${userList}'>
				<c:if test='${board.userId == user.userId}'>
					${user.userNickname}
				</c:if>
			</c:forEach>
		</td>
      </tr>
      <tr>
         <td colspan='4'>
          	<img src='../../img/board${board.userId}${board.boardTitle}.PNG' class='img-fluid' style='height : 200px;' onerror='imgError7(this);'>
			<br>
			<br>
            <div style=' float: left;'><br>
			${board.boardContent} 
             </div>
             <br>
         </td>
      </tr>
     </table>
     
      <hr class='color'>      
      <div class='d-flex mt-4'>
          <input type='button' class='btn btn-outline-primary mr-1 font' value='목록' value='list' id='list' onclick="location.href='/hyunmyungsoo.petmeet/admin/board/listBoard'">
          <div class='flex-fill'></div> 
	      <form action='view/del' method='post'>
	        <div class='form-group row' hidden>
	           <input name='boardNum' type='text' class='form-control' id='${board.boardNum}'
	                  value='${board.boardNum}' />
	        </div>
	        
	        <button type='button' class='btn btn-outline-danger mr-2 font'
	               	data-toggle='modal' data-dismiss='modal'
            		data-target='#delBoardBtn'>삭제</button>
            		
	         <div class='modal fade' id='delBoardBtn' tabindex='-1'>
	            <div class='modal-dialog'>
	               <div class='modal-content'>
	                  <div class='modal-body '>
						<div class='row justify-content-center'>
							<p>게시글을 삭제하겠습니까?</p>
						</div>
                 		<div class='row justify-content-center'>
                            <button type='submit' class='btn btn-primary submitBtn mr-2' >확인</button>
                            <button type='button' class='btn btn-secondary' data-dismiss='modal'>취소</button>
                        </div>
	                  </div>
	               </div>
	            </div>
	         </div>
	       </form>
		</div>
	</div>
</body>
</html> 