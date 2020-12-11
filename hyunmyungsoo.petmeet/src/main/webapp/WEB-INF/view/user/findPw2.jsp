<%@ page language='java' contentType='text/html; charset=UTF-8' pageEncoding='utf-8' isELIgnored='false'%>
<%
	session.removeAttribute("main");
	
	Object userId = request.getAttribute("email");
	session.setAttribute("userId", userId);
	
	Object checkCode = request.getAttribute("checkCode");
%>
<!DOCTYPE html>
<html>
<head>
<%@ include file= '../include/library.jsp' %>
<title>Pet & Meet</title>
</head>
<script>
$(()=>{
	let checkCodeChecker = <%=checkCode%>;
	$('#PwFind').click(()=>{
		if($('#checkNum').val()==checkCodeChecker){
			location.href='changePw';
		}else{
			$('.errorCode').empty();
			$('.errorCode').append('일치하는 정보가 없습니다.');
		}
	})
})
</script>
<body>
	<div class='container'>
		<%@ include file= '../include/header.jsp' %>
		<%@ include file= '../include/nav.jsp' %>
		<div>
			<h3 class='titleFont'>비밀번호찾기</h3>
		</div>
		<hr class='color'>
		<form id='findPw' method='post'>
			<div class='form-group row justify-content-center'>
				<input type='number' class='form-control formSize' id='checkNum'
					name='checkNum' placeholder='인증번호 입력하세요' required/>
			</div>
			<div class='row justify-content-center'>
				<button type='button' id='PwFind' class='btn formSize font btn-primary'>비밀번호찾기</button>
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

			</p>
		</div>
	<%@ include file= '../include/footer.jsp' %>	
	</div>
</body>
</html>