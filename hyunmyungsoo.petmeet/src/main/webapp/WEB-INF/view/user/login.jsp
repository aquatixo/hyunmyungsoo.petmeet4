<%@ page language='java' contentType='text/html; charset=UTF-8' pageEncoding='utf-8' isELIgnored='false'%>
<%
	session.removeAttribute("main");
	Object errorMsg = request.getAttribute("errorMsg");
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
			<h3 class='titleFont'>로그인</h3>
		</div>
		<hr class='color'>
		<form  method='post'>
	   		<div class='form-group row justify-content-center'>
	   			<input type='text' class='form-control formSize' id='userEmail' name='userEmail' placeholder='아이디' required/>
	   		</div>
			<div class='form-group row justify-content-center'>
	   			<input type='password' class='form-control formSize' id='userPw' name='userPw' placeholder='비밀번호' required/>
	   		</div>
	   		<div class='row justify-content-center'>
	   			<button type='submit' class='btn btn-primary form-control font formSize' id='loginBtn'>로그인</button>
	   		</div>
		</form>
		
		<hr class='color'>
		
		<div class='row justify-content-center'>
			<div class=''>
				<a href='findId' class='btn btn-outline-primary font'>아이디찾기</a>
			</div>
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