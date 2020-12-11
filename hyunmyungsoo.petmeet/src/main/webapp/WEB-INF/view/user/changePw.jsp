<%@ page language='java' contentType='text/html; charset=UTF-8' pageEncoding='utf-8' isELIgnored='false'%>
<%
	session.removeAttribute("main");

	Object userId = session.getAttribute("userId");
	if(userId == null){
		userId = session.getAttribute("userEmail");
	}
%>
<!DOCTYPE html>
<html>
<head>
<%@ include file= '../include/library.jsp' %>
<title>Pet & Meet</title>
</head>
<script>
$(()=>{
	$('#idFind').click(()=>{
	    let pw = ''; 
	    pw1 = $.trim($('#userPw').val());
	    let pw2 = '';
	    pw2 = $.trim($('#userPw2').val());
	    if(pw1 != '' && pw2 != ''){
	       if(pw1 == pw2){
	          $('#changePw').submit();
	       }else{
	          $('.errorCode').empty();
	          $('.errorCode').append('비밀번호가 동일하지 않습니다.');
	       }
	    }else{
	       $('.errorCode').empty();
	       $('.errorCode').append('비밀번호를 입력 및 재입력해주세요.');
	    }   
	});
});
</script>
<body>
	<div class='container'>
		<%@ include file= '../include/header.jsp' %>
		<%@ include file= '../include/nav.jsp' %>
		<div>
			<h3 class='titleFont'>비밀번호변경</h3>
		</div>
		<hr class='color'>
		<form method='post' id='changePw'>
			<div class='form-group row justify-content-center'>
				<input type='password' class='form-control formSize' id='userPw'
					name='userPw' placeholder='변경할 비밀번호 입력하세요' required/>
			</div>
			<div class='form-group row justify-content-center'>
				<input type='password' class='form-control formSize' id='userPw2'
					name='userPw2' placeholder='변경할 비밀번호 재입력하세요' required/>
			</div>
			<div class='row justify-content-center'>
				<button type='button' id='idFind' class='btn formSize font btn-primary'>비밀번호찾기</button>
			</div>
			<div class='form-group row' hidden>			
				<input name='userId' type='text' class='form-control' id='userId'
						value='<%=userId%>'/>
			</div>
		</form>
		<br>
		<div class='row justify-content-center'>
			<p class='errorCode'></p>
		</div>
		<hr class='color'>	

		<br>
	<%@ include file= '../include/footer.jsp' %>	
	</div>
</body>
<%
	session.removeAttribute("userId");
%>
</html>