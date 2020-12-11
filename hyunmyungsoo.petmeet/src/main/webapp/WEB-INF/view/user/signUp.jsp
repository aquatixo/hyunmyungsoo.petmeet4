<%@ page language='java' contentType='text/html; charset=UTF-8' pageEncoding='utf-8' isELIgnored='false'%>
<%
	session.removeAttribute("main");
	int checkcode = (int)(Math.random()*999999)+1;
	session.setAttribute("checkcode", checkcode);
	Object errorCode = request.getAttribute("error");
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
		<h3 class='titleFont'>회원가입</h3>
	</div>
	<hr class='color'>
	<form method='post'>
		<div class='form-group row'>
            <input type='email' class='form-control w-50 offset-3 col-5' id='to' name='to' placeholder='이메일를 입력하세요' maxlength='30' required/>
            <button type='submit' class='btn btn-sm btn-outline-primary col-1 p-0'><small>인증받기</small></button>
		</div>

		<div class='form-group row' hidden>
			<label for='subject' class='col-2 col-form-label'>제목: </label>
			<div class='col-4'>
				<input name='subject' type='text' class='form-control' id='subject'
					value='Pet&Meet 회원가입 인증메일입니다.'/>
			</div>
		</div>
		<div class='form-group row' hidden>
			<label for='text' class='col-2 col-form-label'>내용: </label>
			<div class='col-4'>
				<input name='text' type='text' class='form-control' id='text'
					value='안녕하세요. Pet&Meet입니다.<br>
					아래의 인증 번호를 입력해서 회원가입을 진행해주세요.<br>
					인증번호<br>
					<h2>[<%=checkcode%>]<h2>'/>
			</div>
		</div>
	</form>
	<div class='row justify-content-center'>
		<p class='errorCode'>
		<%
			if(errorCode != null){
				out.print(errorCode);
			}
		%>
		</p>
	</div>
	<%@ include file= '../include/footer.jsp' %>	
</div>
</body>
</html>