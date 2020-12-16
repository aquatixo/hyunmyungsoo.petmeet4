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
	
    <h3 class='titleFont'>자유게시판</h3>

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
          	<img src='../img/board${board.userId}${board.boardTitle}.PNG' class='img-fluid' style='height : 200px;' onerror='imgError7(this);'>
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
  	 <form action='view/addComment' method='post'>  
	      <div class='row ml-3 font'>
			<c:forEach var='user' items='${userList}'>
				<c:if test='${idForDel == user.userId}'>
					<p>${user.userNickname}</p>
				</c:if>
			</c:forEach>
	
	      </div>
	      <div class='row ml-3 mb-3'>
	         <textarea class='form-control col-11' id='commentContent' name='commentContent' placeholder='댓글을 작성해주세요' maxlength='800' required></textarea>
	      </div>
	      <div class='d-flex justify-content-end mt-1'>
		      <button type='button' class='btn btn-outline-primary font'
		      	data-toggle='modal' data-dismiss='modal'
		  		data-target='#addComment'>등록</button>
	  	  </div>
	  		
	 	  <div class='form-group row' hidden>			
			<input name='boardNum' type='text' class='form-control' id='boardNum'
					value='${board.boardNum}'/>
			<input name='userId' type='text' class='form-control' id='userId'
					value='<%=userId%>'/>
	  	  </div>

      	  <div id='addComment' class='modal fade' tabindex='-1'>
	         <div class='modal-dialog'>
	            <div class='modal-content'>
	               <div class='modal-body'>
	                  <div class='row justify-content-center'>
	                     <p>댓글을 등록하겠습니까?</p>
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
     </form>
   
    <hr class='color'> 
     <form>  
     	<c:choose>
		    <c:when test='${commentList.size() >0 }'>
			   	<c:forEach var="list" items="${commentList}"  varStatus="vs">
					  <div class='row ml-3'>
					  	<span>
							<c:forEach var='user' items='${userList}'>
								<c:if test='${list.userId == user.userId}'>
									${user.userNickname}
								</c:if>
							</c:forEach>
						</span>			    
				      </div>
				      
				      <div class='row ml-3'>
				      	<span class='commentDate'>${list.regDate}</span>
				      </div>
				      <div class='row ml-3 mb-3'>
				         <input value='${list.commentContent}' readonly='readonly' id='textbox' class='form-control col-11'/>
				      </div>
				      
		          	 <div class='form-group row' hidden>			
					 	<input name='commentNum' type='text' class='form-control' id='commentNum'
								value='${list.commentNum}'/>
						<input name='boardNum' type='text' class='form-control' id='boardNum'
						value='${board.boardNum}'/>
					 </div>
				      
				     <div class='d-flex justify-content-end mt-1'>
						<c:if test='${list.userId eq idForDel}'>
							<input type='button' class='btn btn-danger mr-1' 
							data-toggle='modal' data-dismiss='modal' value='삭제'
							data-target='#delComment${vs.index}' data-id="${list.commentNum}"/>		  
						</c:if>		
					  </div>

			      	  <div id='delComment${vs.index}' class='del modal fade' tabindex='-1'>
				         <div class='modal-dialog'>
				            <div class='modal-content'>
				               <div class='modal-body'>
				                  <div class='row justify-content-center'>
				                     <p>댓글을 삭제하겠습니까?</p>
				                  </div>
									<div class='row justify-content-center'>
									<input type='button' class='del2 btn btn-danger mr-1' id='Num' value='삭제' onclick="location.href='/hyunmyungsoo.petmeet/board/viewBoard/del?commentNum=${list.commentNum}&boardNum=${board.boardNum}'">
									<button type='button' class='btn btn-secondary'
									data-dismiss='modal'>취소</button>
				              	 </div>
				              </div>
				            </div>
				         </div>
				      </div>   
				      
				</c:forEach>
			</c:when>
			<c:otherwise>
				<div class='font ml-4'>현재 댓글이 없습니다.</div>			
		    </c:otherwise>
	    </c:choose>
     </form>

      <hr class='color'>      
      <div class='d-flex mt-4'>
          <input type='button' class='btn btn-outline-primary mr-1 font' value='목록' value='list' id='list' onclick="location.href='/hyunmyungsoo.petmeet/board/listBoard'">
          <div class='flex-fill'></div> 
          
          <c:if test='${board.userId eq idForDel}'>
          	<input type='button' class='btn btn-outline-info mr-1 font upBoard' value='수정' value='update' id="a${board.boardNum}" onclick="location.href='/hyunmyungsoo.petmeet/board/updateBoard'">
          </c:if>
          
	      <form action='view/del' method='post'>
	        <div class='form-group row' hidden>
	           <input name='boardNum' type='text' class='form-control' id='${board.boardNum}'
	                  value='${board.boardNum}' />
	        </div>
     
        	<c:if test='${board.userId eq idForDel}'>
	        <button type='button' class='btn btn-outline-danger mr-2 font'
	               	data-toggle='modal' data-dismiss='modal'
            		data-target='#delBoardBtn'>삭제</button>
       	   </c:if>

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
      <%@ include file= '../include/footer.jsp' %>
</div>    
</body>
</html> 