<%@ page language='java' contentType='text/html; charset=UTF-8' pageEncoding='utf-8' isELIgnored='false'%>
<%
	session.removeAttribute("main");
	Object errorMsg = request.getAttribute("error");
%>
<!DOCTYPE html>
<html>
<head>
<%@ include file= '../include/library.jsp' %>
<title>Pet & Meet</title>
</head>
<body>
	<div class='container'>
		<%@ include file= '../include/header.jsp' %>
		<%@ include file= '../include/nav.jsp' %>
		<div>
			<h3 class='titleFont'>아이디찾기</h3>
		</div>
		<hr class='color'>
		<form method='post'>
			<div class='form-group row justify-content-center'>
				<input type='text' class='form-control formSize' id='userName'
					name='userName' placeholder='이름' required/>
			</div>
			<div class='form-group row justify-content-center'>
				<input type='tel' class='form-control formSize' id='userPhone'
					name='userPhone' pattern='[0-9]{3}-[0-9]{4}-[0-9]{4}'
					placeholder='전화번호 예) 010-0000-0000' required />
			</div>
			<div class='row justify-content-center'>
				<button type='submit' id='idFind' class='btn formSize font btn-primary'>아이디찾기</button>
			</div>
		</form>
		
		<hr class='color'>	
		<div class='row justify-content-center'>
			<div class='ml-2'>
				<a href='findPw' class='btn btn-outline-primary font'>비밀번호찾기</a>
			</div>
			<div class='ml-2'>
				<a href='signUp' class='btn btn-outline-primary font'>회원가입</a>
			</div>
		</div>
		<br>
		<div class='row justify-content-center'>
			<p class='errorCode'>
<%
				if(errorMsg!=null){
					out.print(errorMsg);
				}
%>
			</p>
		</div>
	<%@ include file= '../include/footer.jsp' %>	
	</div>
</body>
</html>