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
	List<User> userList = (List<User>)request.getAttribute("userList");
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
     	<table class='table'>
			<thead class='thead-light'> 
				<tr><th class='text-center'>선택</th><th>회원ID</th><th>회원이름</th><th>닉네임</th></tr>
			</thead>
			<tbody>
				<c:choose>
					<c:when test='${userList.size()>0}'>
						<c:forEach var='user' items='${userList}'>
							<tr>
								<th class='text-center'>
									<input type='radio' name='userChoice' value='${user.getUserId()}' form='userChoice'/>
								</th>
								<td>${user.getUserId()}</td>
								<td>${user.getUserId()}</td>
								<td>${user.getUserId()}</td>
							</tr>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<tr><td colspan='4' class='text-center'>사원이 없습니다</td></tr>
					</c:otherwise>
				</c:choose>
			</tbody>
		</table>
		<div class='row justify-content-center'>
			<p class='errorCode'></p>
		</div>
		<form method='post' id='userUpdate'>
			<div class='row justify-content-end'>
				<button type='button' class='btn btn-outline-primary mr-1'>수정</button>
				<button type='button' class='btn btn-outline-danger mr-3' data-toggle='modal' data-target='#userBye'>탈퇴</button>
			</div>
			<div class='form-group row' hidden>			
				<input name='userId' type='text' class='form-control userId'/>
			</div>
		</form>
		
		<form method='post' id='userDel' action='userList/del'>
			<div id='userBye' class='modal fade' tabindex='-1'>
				<div class='modal-dialog'>
				<div class='modal-content'>
					<div class='modal-body'>
						<div class='row justify-content-center'>
							<p>회원 탈퇴하겠습니까?</p>
						</div>
						<div class='row justify-content-center'>
							<button type='button' id='delBtn' 
							class='btn btn-primary submitBtn mr-2'>확인</button>
							<button type='button' class='btn btn-secondary'
							data-dismiss='modal'>취소</button>
						</div>
					</div>
				</div>
				</div>
			</div>
			<div class='form-group row' hidden>			
				<input name='userId' type='text' class='form-control userId'/>
			</div>
		</form>
			
	</div>
</body>
</html>