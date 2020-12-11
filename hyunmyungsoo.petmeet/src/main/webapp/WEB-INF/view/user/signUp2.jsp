<%@ page language='java' contentType='text/html; charset=UTF-8' pageEncoding='utf-8' isELIgnored='false'%>
<%
	session.removeAttribute("main");
	Object email = request.getAttribute("email");
	session.setAttribute("email2", email);
	Object checkcode = session.getAttribute("checkcode");
%>
<!DOCTYPE html>
<html>
<head>
<%@ include file= '../include/library.jsp' %>
<title>Pet & Meet</title>
</head>
<script>
$(()=>{
	let checkcodeChecker = <%=checkcode %>;
	$('#checkNumBtn').click(()=>{
		if($('#checkNum').val() == checkcodeChecker){
			location.href='signUp3';
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
			<h3 class='titleFont'>회원가입</h3>
		</div>
		<hr class='color'>
		<form method='post'>
			<div class='row'>
	            <input type='number' class='form-control w-50 offset-3 col-5' id='checkNum' name='checkNum' placeholder='인증번호 입력하세요'/>
	            <button type='button' id='checkNumBtn' class='btn btn-sm btn-outline-primary col-1 p-0'><small>인증하기</small></button>
	         </div>
		</form>
		<div class='row justify-content-center'>
			<p class='errorCode'></p>
		</div>
		<%@ include file= '../include/footer.jsp' %>	
	</div>
</body>
</html>