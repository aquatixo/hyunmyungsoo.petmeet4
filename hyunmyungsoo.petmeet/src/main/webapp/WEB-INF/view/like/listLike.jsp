<%@ page language='java' contentType='text/html; charset=UTF-8' pageEncoding='utf-8' isELIgnored='false'%>
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
	$('#delBtn').click(()=>{
		
		let choice = $('input:checked').val();
		$('#likeNumInput').val(choice);
		
		if(choice != undefined){
			$('#likeChoiceForm').submit();
		}else{	
			$('.errorCode').text('삭제할 관심을 선택하세요.');
		}
	})
})
</script>
<style>
img {
	width: 80px;
	height: 80px;
}
</style>
<body>
<div class='container'>
   <%@ include file= '../include/header.jsp' %>
   <%@ include file= '../include/nav.jsp' %>
   <div>
      <h3 class='titleFont'>관심</h3>
   </div>
   <hr class='color'>
   
   	<table class='table'>
		<thead class='thead-light'> 
			<tr><th>선택</th><th>이미지</th><th>닉네임</th><th>제목</th><th>시</th><th>구</th><th>동</th><th>평점</th></tr>
		</thead>
		<tbody>
			<c:choose>
				<c:when test='${likeList.size()>0}'>
					<c:forEach var='like' items='${likeList}'>
						<c:forEach var='sitter' items='${sitterList}'>
							<c:if test="${like.sitterNum eq sitter.sitterNum}">
								<tr>
									<th><input type='radio' name='likeChoice' class='likeChoice' value='${like.likeNum}'/></th>
									<td><img src='../img/sitter${sitter.userId}.PNG' class='img-fluid' onerror='imgError9(this);'></td>
									<c:forEach var='user' items='${userList}'>
										<c:if test="${sitter.userId eq user.userId}">
										<td>${user.userNickname}</td>
										</c:if>
									</c:forEach>
									<td>${sitter.sitterTitle}</td>
									<td>${sitter.sitterLocSi}</td>
									<td>${sitter.sitterLocGu}</td>	
									<td>${sitter.sitterLocDong}</td>
									<td>평점 자리</td>
								</tr>					
							</c:if>
						</c:forEach>
					</c:forEach>
				</c:when>
				<c:otherwise>
					<tr><td colspan='4' class='text-center'>관심이 없습니다</td></tr>
				</c:otherwise>
			</c:choose>
		</tbody>
	</table>
	<div class='row justify-content-center'>
		<p class='errorCode'></p>
	</div>
	<div class='row justify-content-end mr-2'>
		<button type='button' id='delBtn' class='btn btn-outline-danger'>삭제</button>
	</div>
	<form id='likeChoiceForm' method='post'>
		<div class='form-group row' >			
			<input name='likeNumInput' type='text' class='form-control' id='likeNumInput'/>
		</div>
	</form>
   <%@ include file= '../include/footer.jsp' %>   
</div>
</body>	
</html>