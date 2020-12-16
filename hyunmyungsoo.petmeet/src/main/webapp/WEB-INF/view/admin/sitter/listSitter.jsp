<%@ page language='java' contentType='text/html; charset=UTF-8' pageEncoding='utf-8' isELIgnored='false'%>
<%
	session.removeAttribute("main");
%>
<!DOCTYPE html>
<html>
<head>
<%@ include file= '../include/library.jsp' %>
<%@ page import= 'hyunmyungsoo.petmeet.domain.User' %>
<%@ page import='java.util.List'%>
<%
	Object userList = request.getAttribute("userList");
	Object sitterList = request.getAttribute("sitterList");
%>
<title>Pet & Meet Admin</title>
</head>
<script>
$(()=>{
	$('#delBtn').click(()=>{
		
		let choice = $('input:checked').val();
		$('.userId').val(choice);
		
		if(choice != undefined){
			$('#userDel').submit();
		}else{	
			$('.errorCode').text('삭제할 회원을 선택하세요.');
		}
	})
})
</script>
<body>
	<div class='container'>
	<%@ include file= '../include/header.jsp' %>
	<%@ include file= '../include/nav.jsp' %>
		<div>
			<h4 class='titleFont'>펫 시터 게시판 관리</h4>
		</div>
     	<table class='table'>
			<thead class='thead-light'> 
				<tr><th class='text-center'>번호</th><th class='text-center'>닉네임</th><th class='text-center'>제목</th></tr>
			</thead>
			<tbody>
				<c:choose>
					<c:when test='${sitterList.size()>0}'>
						<c:forEach var='sitter' items='${sitterList}'>
							<tr>
								<th class='text-center'>
									<a href='/hyunmyungsoo.petmeet/admin/sitter/viewSitter?sitterNum=${sitter.sitterNum}'>${sitter.sitterNum }</a>
								</th>
								<c:forEach var='user' items='${userList }'>
								<c:if test='${sitter.userId == user.userId }'>
									<td class='text-center'>${user.userNickname}</td>
								</c:if>
								</c:forEach>
								<td class='text-center'>${sitter.sitterTitle}</td>
							</tr>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<tr><td colspan='4' class='text-center'>게시글이 없습니다</td></tr>
					</c:otherwise>
				</c:choose>
			</tbody>
		</table>
	</div>
</body>
</html>