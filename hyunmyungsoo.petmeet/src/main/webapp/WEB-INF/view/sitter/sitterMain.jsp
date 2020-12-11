<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	session.removeAttribute("main");
%>
<!DOCTYPE html>
<html>
<head>
<%@ include file= '../include/library.jsp' %>
<title>Pet & Meet</title>
</head>

<script>
$(()=>{
   $('#dog').click(function(){
      if($(this).prop('checked')==true){
         $('#dogRadios').removeAttr('hidden');
      }
   })
   $('#cat').click(function(){
      if($(this).prop('checked')==true){
         $('#dogRadios').attr('hidden','true');
      }
   });
});
var imgError6 = function(image) {
	image.onerror = ""
	var parent = image.parentElement
	var parentTag = parent.innerHTML
	var brokenImageTag = image.outerHTML
	parent.innerHTML = parentTag.replace(brokenImageTag,
			'<div class="broken carouImg">메인안내 이미지</div>')
	return true;

}
/*  $(()=>{
 	$('.thisSitter${sitter.sitterNum}').click(()=>{
 		this.$('#sitterNumForm').submit();
	})
}) */
</script>
<%
	Object sitterList = request.getAttribute("sitterList");
	Object userList = request.getAttribute("userList");
%>
<body>
	<div class='container'>
	<%@ include file= '../include/header.jsp' %>
	<%@ include file= '../include/nav.jsp' %>
		<div>
			<h3 class='titleFont'>펫 시터 찾기</h3>
      	</div>
   
      	<div class='row fieldset'>
      		<fieldset>
      		<form id='sitterForm'>
         		<div class='form-group row mt-3'>
            		<label for='sitterLocation' class='col-2 col-form-label text-right'>위치</label>
            		<div class='col-3'>
               			<input type='text' class='form-control' id='sitterLocation' />
            		</div>
            		<label for='sitterDate' class='col-2 col-form-label text-right'>날짜</label>
            		<div class='col-3'>
               			<input type='date' class='form-control' id='sitterDate'/>
            		</div>
         		</div>
         		<div class='form-group row justify-content-center'>
            		<label for='animalType' class='col-4 col-form-label text-right mr-2'>반려동물 종류</label>
            		<div class='form-check from-check-inline mt-2'>
               			<input type='radio' name='amimalType' class='form-check-input' id='dog'/>
               			<label class='form-check-label mr-5' for='dog'>강아지</label>
              	 		<input type='radio' name='amimalType' class='form-check-input' id='cat'/>
               			<label class='form-check-label mr-4' for='cat'>고양이</label>
            		</div>
            		<div class='col-3'>
               			<button type='submit' class='btn btn-primary justify-content-end mt-1'>검색하기</button>
            		</div>
         		</div>
         
        		<div id='dogRadios' class='text-center form-check from-check-inline mb-3' hidden='true'>
            		<input type='radio' name='dogRad' class='form-check-input' id='big'/>
            		<label class='form-check-label mr-4' for='big'>대형견</label>
            		<input type='radio' name='dogRad' class='form-check-input' id='mid'/>
            		<label class='form-check-label mr-4' for='mid'>중형견</label>
            		<input type='radio' name='dogRad' class='form-check-input' id='small'/>
            		<label class='form-check-label mr-4' for='small'>소형견</label>
         		</div>
      		</form>
      		</fieldset>
      	</div>
     
      	
      	<c:choose>
      		<c:when test='${sitterList.size() >0 }'>
      			<c:forEach var='sitter' items='${sitterList }'>
     				<a href='/hyunmyungsoo.petmeet/reservation/sitterMain?sitterNum=${sitter.sitterNum}' id='list'>
					<div id='sitter' class='mt-3 row thisSitter'>
						<div id='sitterImg' class='mt-2 ml-2 col-3 form-group'>
							<img src='../img/sitter${sitter.userId}.PNG' class='mainImg2' onerror='imgError6(this);'> 
						</div>
						
						<div id='sitterInfo' class='col-8 form-group'>
							<div class='row line mt-3 pb-0 mb-0'>
								<c:forEach var='user' items='${userList }'>
									<c:if test='${sitter.userId == user.userId }'>
										<p class='col-3 mr-0 pr-0 sitterFont'>
											<b>${user.userNickname }</b>
										</p>
									</c:if>
								</c:forEach>
								<p class='col-5mr-0 ml-0 mb-0 mt-2 p-0'>${sitter.sitterLocSi }시
									${sitter.sitterLocGu }구 ${sitter.sitterLocDong }동</p>
							</div>
							<br>
							<div class='row line pt-0 mt-0'>
								<h4 class='col-9 sitterFont'>${sitter.sitterTitle }</h4>
								<p class='col-3 font'>
									<svg width="1em" height="1em" viewBox="0 0 16 16"
										class="bi bi-star-fill" fill="currentColor"
										xmlns="http://www.w3.org/2000/svg">
	                 				<path
											d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.283.95l-3.523 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z" />
	               					</svg>
									<small>&nbsp;${sitter.sitterRating }</small>
								</p>
							</div>
						</div>
						<form method='post' id='sitterNumForm' hidden>
							<input name='sitterNum' type='number' class='form-control'
									id='sitterNum' value='${sitter.sitterNum}' />
						</form>
					</div>
					</a>
				</c:forEach>
      		</c:when>
      		
      		<c:otherwise>
				<div class='font'>현재 시터가 없습니다.</div>					
			</c:otherwise>
      	</c:choose>
      	
      
      	<div class='d-flex justify-content-center mt-3'>   
			<ul class='pagination'>
				<li class='page-item'><a class='page-link' href='#'><span>«</span></a></li>
               	<li class='page-item'><a class='page-link' href='#'>1</a></li>
               	<li class='page-item'><a class='page-link' href='#'>2</a></li>
               	<li class='page-item'><a class='page-link' href='#'>3</a></li>
               	<li class='page-item'><a class='page-link' href='#'>4</a></li>
               	<li class='page-item'><a class='page-link' href='#'><span>»</span></a></li>
            </ul>
		</div>
      	<%@ include file= '../include/footer.jsp' %>
   </div>
</body>