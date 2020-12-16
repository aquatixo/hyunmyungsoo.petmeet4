<%@ page language='java' contentType='text/html; charset=UTF-8' pageEncoding='utf-8' isELIgnored='false'%>
<%
	Object mainCheckNav = session.getAttribute("main");
	Object loginCheck = session.getAttribute("userEmail");
%>
<%
	if(mainCheckNav != null){
   		if(loginCheck == null){
%>
	      <nav class='nav justify-content-end mb-2'>
	          <a class='nav-link btn-sm navBtn p-2' href='board/listBoard'><small>자유게시판</small></a>
	          <a class='nav-link btn-sm navBtn p-2' href='sitter/listSitter'><small>펫시터 찾기</small></a>
	          <a class='nav-link btn-sm navBtn p-2' href='user/login'><small>로그인</small></a>
	          <a class='nav-link btn-sm navBtn p-2' href='user/signUp'><small>회원가입</small></a>   
	      </nav>
<%
   		}else{
%>
	      <nav class='nav justify-content-end mb-2'>
	          <a class='nav-link btn-sm navBtn p-2' href='board/listBoard'><small>자유게시판</small></a>
	          <a class='nav-link btn-sm navBtn p-2' href='sitter/listSitter'><small>펫시터 찾기</small></a>
	          <a class='nav-link btn-sm navBtn p-2' href='common/mypage'><small>마이페이지</small></a>
	          <a class='nav-link btn-sm navBtn p-2' href='logout'><small>로그아웃</small></a>
	      </nav>
<%
   		}
	}else{
		if(loginCheck == null){
%>
			<nav class='nav justify-content-end mb-2'>
			    <a class='nav-link btn-sm navBtn p-2' href='../board/listBoard'><small>자유게시판</small></a>
			    <a class='nav-link btn-sm navBtn p-2' href='../sitter/listSitter'><small>펫시터 찾기</small></a>
			    <a class='nav-link btn-sm navBtn p-2' href='../user/login'><small>로그인</small></a>
			    <a class='nav-link btn-sm navBtn p-2' href='../user/signUp'><small>회원가입</small></a>   
			</nav>
<%
		}else{ 
%>
			<nav class='nav justify-content-end mb-2'>
			    <a class='nav-link btn-sm navBtn p-2' href='../board/listBoard'><small>자유게시판</small></a>
			    <a class='nav-link btn-sm navBtn p-2' href='../sitter/listSitter'><small>펫시터 찾기</small></a>
			    <a class='nav-link btn-sm navBtn p-2' href='../common/mypage'><small>마이페이지</small></a>
			    <a class='nav-link btn-sm navBtn p-2' href='../logout'><small>로그아웃</small></a>
			</nav>
<%
		}
	}
%>