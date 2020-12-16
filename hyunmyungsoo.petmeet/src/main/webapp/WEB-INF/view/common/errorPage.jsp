<%@ page language='java' contentType='text/html; charset=UTF-8' pageEncoding='utf-8' isELIgnored='false'%>
<!DOCTYPE html>
<html>
<head>
<%
	Object main = session.getAttribute("main");
%>
<%@ include file= '../include/library.jsp' %>
<%@ page import= 'hyunmyungsoo.petmeet.domain.Review' %>
<%@ page import='java.util.*'%>
<title>Pet & Meet</title>
<script>
	var imgError13 = function(image) {
		image.onerror = ""
		var parent = image.parentElement
		var parentTag = parent.innerHTML
		var brokenImageTag = image.outerHTML
		parent.innerHTML = parentTag.replace(brokenImageTag,
				'<div class="brokenMain carouImg">에러 이미지</div>')
		return true;
	}
</script>
</head>
<body>
	<div class='container'>
	<div>
		<h3 class='titleFont'>에러</h3>
	</div>
	<hr class='color'>
<%
	if(main != null){
%>
	<img src='img/error.PNG' class='img-fluid' style='height : 90%;width : 100%;' onerror='imgError13(this);'>
<%
	}else{
%>
	<img src='../img/error.PNG' class='img-fluid' style='height : 90%;width : 100%;' onerror='imgError13(this);'>
<%
	}
%>
	<br>
	<a href='http://localhost/hyunmyungsoo.petmeet/main' class='btn btn-outline-primary'>메인으로</a>
	</div>
</body>
</html>