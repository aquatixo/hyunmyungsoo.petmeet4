<%@ page language='java' contentType='text/html; charset=UTF-8' pageEncoding='utf-8' isELIgnored='false'%>
<%
	session.removeAttribute("main");
	Object userId = session.getAttribute("findUserId");
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
		<div class='row offset-3 sitterFont'>
			<p>user님의 아이디는</p>
		</div>
		<div class='row offset-4 font'>
			<p>[<%=userId%>]</p>
		</div>
		<div class='row offset-6 sitterFont'>
			<p>입니다.</p>
		</div>
		
		<hr class='color'>	
		<div class='row justify-content-center'>
			<div class=''>
				<a href='login' class='btn btn-outline-primary font'>로그인</a>
			</div>
			<div class='ml-2'>
				<a href='findPw' class='btn btn-outline-primary font'>비밀번호찾기</a>
			</div>
		</div>
	<%@ include file= '../include/footer.jsp' %>	
	</div>
</body>
<%
	session.removeAttribute("findUserId");
%>
</html>