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
%>
<script>
	//수정
	$(function(){ 
		$(".upBoard").click(function() {
			   var boardNum = $(this).attr('id').substr(1);
			   location.href = "upBoard?boardNum=" + boardNum;
		});
	});

   //댓글
   $(document).ready(function(){
      $('#upComm1').click(function(){
         $('#recelComm1').show();
         $('#reupComm1').show();
         $('#delComm1').hide();
         $('#upComm1').hide();
         $('#textbox').attr('readonly',false).attr('disabled'.false);
         
         });
      $('#recelComm1, #reupComm1').click(function(){
         $('#recelComm1').hide();
         $('#reupComm1').hide();
         $('#delComm1').show();
         $('#upComm1').show();
         $('#textbox').attr('readonly',true).attr('disabled'.false);      
         });
   });
   $(document).ready(function(){   
      $('#upComm2').click(function(){
         $('#recelComm2').show();
         $('#reupComm2').show();
         $('#delComm2').hide();
         $('#upComm2').hide();
         $('#textbox1').attr('readonly',false).attr('disabled'.false);
         
         });
      
      $('#recelComm2, #reupComm2').click(function(){
         $('#recelComm2').hide();
         $('#reupComm2').hide();
         $('#delComm2').show();
         $('#upComm2').show();
         $('#textbox1').attr('readonly',true).attr('disabled'.false); 
         });
      
   });
   
 var imgError7 = function(image) {
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
	
    <h3 class='titleFont'>자유게시판</h3>
    
    <table class='table'>
      <tr class='thead'>
         <th colspan='12' class='font'>${board.boardTitle}
      </tr>
      <tr class='font'>
         <td>등록일</td><td>${board.regDate}</td><td>작성자</td><td>${board.userId} </td>
      </tr>
      <tr>
         <td colspan='4'>
			<img src='../img/board${board.userId}${board.boardTitle}.PNG' class='img-fluid' onerror='imgError7(this);'>
			<br>
			<br>
            <div style=' float: left;'><br>
			${board.boardContent} 
             </div>
             <br>
         </td>
      </tr>
      
    <!-- 댓글 -->
   </table>
   <hr class='color'>
   <form>
      <div class='row ml-3 font'>
         <p>강철검</p>
      </div>
      <div class='row ml-3 mb-3'>
         <textarea class='form-control col-11' id='comment' name='comment' placeholder='댓글을 작성해주세요'></textarea>
      </div>
     <div class='d-flex justify-content-end mt-1'>
       <input type='button' class='btn btn-outline-primary font' value='등록' data-toggle='modal' data-target='#addComment'>
      </div>
   </form>
   <hr class='color'> 
   <form class='font'>
      <div class='row ml-3'>
         <span class='commentName'>차차차 </span>
      </div>
      <div class='row ml-3'>
      <span class='commentDate'>2020-11-20</span>
      </div>
      <div class='row ml-3 mb-3'>
         <input value='헐 바로 사러 가야겠네요,,,,' readonly='readonly' id='textbox' class='form-control col-11'/>
      </div>
      
   <div class='d-flex justify-content-end mt-1'>
      <input type='button' class='btn btn-info mr-1' value='수정' id='upComm1'>
      <input type='button' class='btn btn-danger mr-1' value='삭제' id='delComm1' data-toggle='modal' data-target='#delComment'>
      <input type='button' class='btn btn-primary mr-1' value='등록' style='display: none;'  id='reupComm1'>
      <input type='button' class='btn btn-secondary mr-1' value='취소' style='display: none ' id='recelComm1'>
   </div>
   </form>
   <form class='font'>
      <div class='row ml-3'>
         <span class='commentName'>멍멍주 </span>
      </div>
      <div class='row ml-3'>
      <span class='commentDate'>2020-11-20</span>
      </div>
      <div class='row ml-3 mb-3'>
      <input value='이거 좋아요~!~!~!' readonly='readonly' id='textbox1' class='form-control col-11'/>
      </div>
      
   <div class='d-flex justify-content-end mt-1'>
      <input type='button' class='btn btn-info mr-1' value='수정' id='upComm2'>
      <input type='button' class='btn btn-danger mr-1' value='삭제' id='delComm2' data-toggle='modal' data-target='#delComment'>
      <input type='button' class='btn btn-primary mr-1' value='등록' style='display: none;'  id='reupComm2'>
      <input type='button' class='btn btn-secondary mr-1' value='취소' style='display: none ' id='recelComm2'>
   </div>
   </form>
   
   
      <!-- 모달 댓글
      <div id='addComment' class='modal fade' tabindex='-1'>
         <div class='modal-dialog'>
            <div class='modal-content'>
               <div class='modal-body'>
                  <div class='row justify-content-center'>
                     <p>댓글을 등록하겠습니까?</p>
                  </div>
                  <div class='row justify-content-center'>
                     <button type='button' class='btn btn-primary' data-dismiss='modal' id='add'>등록</button>
                     <button type='submit' class='btn btn-secondary ml-2' data-dismiss='modal' id='can'>취소</button>
                  </div>
               </div>
            </div>
         </div>
      </div>   
      <div id='delComment' class='modal fade' tabindex='-1'>
         <div class='modal-dialog'>
            <div class='modal-content'>
               <div class='modal-body'>
                  <div class='row justify-content-center'>
                     <p>댓글을 삭제하겠습니까?</p>
                  </div>
                  <div class='row justify-content-center'>
                     <button type='button' class='btn btn-primary' data-dismiss='modal' id='add'>확인</button>
                     <button type='submit' class='btn btn-secondary ml-2' data-dismiss='modal' id='can'>취소</button>
                  </div>
               </div>
            </div>
         </div>
      </div>         -->
      
      
      <!-- 버튼 모음 -->
      <hr class='color'>      
      <div class='d-flex mt-4'>
          <input type='button' class='btn btn-outline-primary mr-1 font' value='목록' value='list' id='list' onclick="location.href='/hyunmyungsoo.petmeet/board/listBoard'">
          <div class='flex-fill'></div> 
          <input type='button' class='btn btn-outline-info mr-1 font upBoard' value='수정' value='update' id="a${board.boardNum}" onclick="location.href='/hyunmyungsoo.petmeet/board/updateBoard'">
          <!-- a를 넣어야지 int로,, 이유는 모름,,ㅎㅎ-->

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
	<%@ include file= '../include/footer.jsp' %>
        </div>    

</body>
</html> 