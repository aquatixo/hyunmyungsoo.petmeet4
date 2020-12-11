<%@ page language='java' contentType='text/html; charset=UTF-8' pageEncoding='utf-8' isELIgnored='false'%>
<%
	Object mainCheckLib2 = session.getAttribute("main");
%>
<meta charset='UTF-8'>
<meta name='viewport' content='width=device-width, initial-scale=1'>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core'%>
<%@ taglib prefix='form' uri='http://www.springframework.org/tags/form'%>
<script src='https://code.jquery.com/jquery-3.5.1.min.js'></script>
<script src='https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js'></script>
<link rel='stylesheet' href='http://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css'>
<%
	if(mainCheckLib2 != null){
%>
		<link rel='stylesheet' href='../res/css/admin/lib.css'>
<%
	}else{
%>
		<link rel='stylesheet' href='../../res/css/admin/lib.css'>
<%
	}
%>