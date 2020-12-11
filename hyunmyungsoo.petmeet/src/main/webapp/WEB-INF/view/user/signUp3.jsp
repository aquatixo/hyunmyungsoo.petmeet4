<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	session.removeAttribute("main");
	session.removeAttribute("checkcode");
	Object email = session.getAttribute("email2");
%>
<!DOCTYPE html>
<html>
<head>
<%@ include file= '../include/library.jsp' %>
<title>Pet & Meet</title>
</head>
<script>
$(()=>{
	$('#userPw').keyup(function(){
		$('#showPw').text($(this).val());
	})
})
</script>
<body>
	<div class='container'>
		<%@ include file= '../include/header.jsp' %>
		<%@ include file= '../include/nav.jsp' %>
		<div>
		<h3 class='titleFont'>회원가입</h3>
		</div>
		<hr class='color'>
      
		<form id='signUpForm' class='font' method='post'>
			<div class='row'>
				<div class='offset-3'>아이디</div>
			</div>
			<div class='row'>
				<input type='email' class='form-control w-50 offset-3' id='userId' name='userId' value='<%=email%>' readonly/>
			</div>
			<div class='row mt-3'>
				<div class='offset-3'>비밀번호</div>
			</div>
			<div class='row'>
				<input type='password' class='form-control w-50 offset-3' id='userPw' name='userPw' maxlength='20' required/>
<!--             	<input type='password' class='form-control w-50 offset-3' id='userPw2' name='userPw2' maxlength='20' placeholder='비밀번호 재입력' required/> -->
				<p class='offset-3' id='showPw'></p>
			</div>
			<div class='row mt-3'>
            	<div class='offset-3'>이름</div>
			</div>
			<div class='row'>
				<input type='text' class='form-control w-50 offset-3' id='userName' name='userName' maxlength='19' required/>
			</div>
			<div class='row mt-3'>
				<div class='offset-3'>닉네임</div>
			</div>
			<div class='row'>
				<input type='text' class='form-control w-50 offset-3' id='userNick' name='userNick' maxlength='19' required/>
			</div>
			<div class='row mt-3'>
				<div class='offset-3'>생년월일</div>
			</div>
			<div class='row'>
				<input type='date' class='form-control w-50 offset-3' id='userBirth' name='userBirth' required/>
			</div>
			<div class='row mt-3'>
				<div class='offset-3'>전화번호</div>
			</div>
			<div class='row'>
				<input type='tel' class='form-control w-50 offset-3' id='userPhone' name='userPhone' pattern='[0-9]{3}-[0-9]{4}-[0-9]{4}' placeholder='010-0000-0000' required maxlength='15'/>
			</div>
			<div class='row mt-3'>
				<div class='offset-3'>주소</div>
			</div>
			<div class='row'>
				<input type='text' class='form-control offset-3' id='userAddressSi' name='userAddressSi' style='width : 15%' maxlength='10' required/>시
				<input type='text' class='form-control' id='userAddressGu' name='userAddressGu' style='width : 15%' maxlength='10' required/>구
				<input type='text' class='form-control' id='userAddressDong' name='userAddressDong' style='width : 15%' maxlength='10' required/>동
			</div>
			<div class='row'>
				<p class='offset-3' id='errorMsg'></p>
			</div>
			<div class='row'>
				<button type='submit' id='signUpBtn' class='btn btn-primary offset-3 col-6 mt-2'>회원가입</button>
			</div>
		</form>
		<%@ include file= '../include/footer.jsp' %>
   </div>
</body>
</html>