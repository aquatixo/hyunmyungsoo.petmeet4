<%@ page language='java' contentType='text/html; charset=UTF-8' pageEncoding='utf-8' isELIgnored='false'%>
<%
	session.removeAttribute("main");
	Object errorMsg = request.getAttribute("error");
	int checkcode = (int)(Math.random()*999999)+1;
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
			<h3 class='titleFont'>비밀번호찾기</h3>
		</div>
		<hr class='color'>
		<form method='post'>
			<div class='form-group row justify-content-center'>
				<input type='email' class='form-control formSize' id='to'
					name='to' placeholder='이메일 입력하세요' required/>
			</div>
			<div class='row justify-content-center'>
				<button type='submit' id='idFind' class='btn formSize font btn-primary'>비밀번호찾기</button>
			</div>
			
			<div class='form-group row' hidden>
				<label for='subject' class='col-2 col-form-label'>제목: </label>
				<div class='col-4'>
					<input name='subject' type='text' class='form-control' id='subject'
						value='Pet&Meet 비밀번호 찾기 인증메일입니다.'/>
				</div>
			</div>
			<div class='form-group row' hidden>
				<label for='text' class='col-2 col-form-label'>내용: </label>
				<div class='col-4'>
					<input name='text' type='text' class='form-control' id='text'
						value='안녕하세요. Pet&Meet입니다.<br>
						아래의 인증 번호를 입력해서 비밀번호 변경을 진행해주세요.<br>
						인증번호<br>
						<h2>[<%=checkcode%>]<h2>'/>
				</div>
			</div>
			<div class='form-group row' hidden>			
				<input name='checkCode' type='number' class='form-control' id='checkCode'
						value='<%=checkcode%>'/>
			</div>
						
		</form>
		<hr class='color'>	
		<div class='row justify-content-center'>
			<div class=''>
				<a href='findId' class='btn btn-outline-primary font'>아이디찾기</a>
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