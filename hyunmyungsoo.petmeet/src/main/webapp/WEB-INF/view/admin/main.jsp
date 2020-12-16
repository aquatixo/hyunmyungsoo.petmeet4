<%@ page language='java' contentType='text/html; charset=UTF-8' pageEncoding='utf-8' isELIgnored='false'%>
<%
	session.setAttribute("main", "main");
	Object userCnt = request.getAttribute("userCnt");
	Object sitterCnt = request.getAttribute("sitterCnt");
	Object boardCnt = request.getAttribute("boardCnt");
%>
<!DOCTYPE html>
<html>
<head>
<%@ include file= './include/library.jsp' %>
<title>Pet & Meet Admin</title>
</head>
<body>
	<div class='container'>
	<%@ include file= './include/header.jsp' %>
	<%@ include file= './include/nav.jsp' %>
     
		<div class='row justify-content-center'>
			<div class='col-3'>
				<a href='user/listUser' 
				class='btn btn-outline-primary d-flex justify-content-center align-items-center adminMainBtnSize'>회원수<br>${userCnt}개
	            </a>
			</div>
			<div class='col-3'>
				<a href='sitter/listSitter'
				class='btn btn-outline-primary d-flex justify-content-center align-items-center adminMainBtnSize'>펫 시터 게시판 글의 수<br>${sitterCnt}개
				</a>
			</div>
			<div class='row col-3'>
				<a href='board/listBoard'
					class='btn btn-outline-primary d-flex justify-content-center align-items-center adminMainBtnSize'> 자유게시판 글의 수<br>${boardCnt}개
				</a>
			</div>
		</div>	
	</div>
</body>
</html>