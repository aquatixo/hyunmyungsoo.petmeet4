<%@ page language='java' contentType='text/html; charset=UTF-8' pageEncoding='utf-8' isELIgnored='false'%>
<%
   session.removeAttribute("main");
%>
<!DOCTYPE html>
<html>
<head>
<%@ include file= '../include/library.jsp' %>
<title>Pet & Meet Admin</title>
</head>
<body>
<div class='container'>
	<%@ include file= '../include/header.jsp' %>
	<%@ include file= '../include/nav.jsp' %>
	<div>
		<h3 class='titleFont'>회원정보</h3>
	</div>
	<hr class='color'>
  	
	<form method='post' action='listUser/update'>
		<div class='row mt-3 font'>
			<div class='offset-3'>아이디</div>
		</div>
		<div class='row'>
			<input type='email' class='form-control w-50 offset-3' id='userId'
		name='userId' readonly value='${user.getUserId() }' />
		</div>
		<div class='row mt-3 font'>
			<div class='offset-3'>비밀번호</div>
		</div>
		<div class='row font'>
			<input type='text' class='form-control w-50 offset-3' id='userPw'
			name='userPw' value='${user.getUserPw()}'  maxlength='19' required />
		</div>
		<div class='row font'>
			<div class='offset-3'>이름</div>
		</div>
		<div class='row'>
			<input type='text' class='form-control w-50 offset-3' id='userName'
			name='userName' value='${user.getUserName()}'  maxlength='19' required />
		</div>
		<div class='row mt-3 font'>
			<div class='offset-3'>닉네임</div>
		</div>
		<div class='row'>
			<input type='text' class='form-control w-50 offset-3' id='userNick'
			name='userNick' value='${user.getUserNickname()}' maxlength='19' required/>
		</div>
	   <div class='row mt-3'>
			<div class='offset-3'>생년월일</div>
		</div>
		<div class='row'>
			<input type='date' class='form-control w-50 offset-3' id='userBirth' name='userBirth' value='${user.getUserBirth()}'required/>
		</div>
		<div class='row mt-3 font'>
			<div class='offset-3'>전화번호</div>
		</div>
		<div class='row'>
			<input type='tel' class='form-control w-50 offset-3' id='userPhone'
			name='userPhone' pattern='[0-9]{3}-[0-9]{4}-[0-9]{4}'
			value='${user.getUserPhone()}' maxlength='15' placeholder='010-0000-0000' required />
		</div>
		<hr class='color'>
		<div class='row justify-content-end mt-4'>
			<button type='button'
			class='btn btn-outline-info col-1 mr-2 font'
			data-toggle='modal' data-target='#userFix'>수정</button>
			<a href='../user/listUser'
			class='btn btn-outline-primary font'>뒤로</a>
		</div>
		<div id='userFix' class='modal fade' tabindex='-1'>
			<div class='modal-dialog'>
			<div class='modal-content'>
				<div class='modal-body'>
				<div class='row justify-content-center'>
					<p>회원 수정하겠습니까?</p>
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
</div>
</body>
</html>