<%@ page language='java' contentType='text/html; charset=UTF-8' pageEncoding='utf-8' isELIgnored='false'%>
<%
	Object mainCheckNav2 = session.getAttribute("main");

	if(mainCheckNav2 != null){
%>
		<nav class='nav justify-content-center'>
			<a class='nav-link p-2' href='user/userList'><small>회원 관리</small></a> 
			<a class='nav-link p-2' href='#'><small>펫시터게시판 관리</small></a> 
			<a class='nav-link p-2' href='#'><small>후기 관리</small></a> 
			<a class='nav-link p-2' href='#'><small>자유게시판 관리</small></a> 
			<a class='nav-link p-2' href='common/image'><small>이미지 관리</small></a>
		</nav>
		<div class='gnbBar'>
			<hr class='line'>
		</div>
<% 
	}else{
%>
		<nav class='nav justify-content-center'>
			<a class='nav-link p-2' href='../user/userList'><small>회원 관리</small></a> 
			<a class='nav-link p-2' href='#'><small>펫시터게시판 관리</small></a> 
			<a class='nav-link p-2' href='#'><small>후기 관리</small></a> 
			<a class='nav-link p-2' href='#'><small>자유게시판 관리</small></a> 
			<a class='nav-link p-2' href='../common/image'><small>이미지 관리</small></a>
		</nav>
		<div class='gnbBar'>
			<hr class='line'>
		</div>
<%
	}
%>
