<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%
	session.removeAttribute("main");
%>
<!DOCTYPE html>
<html>
<head>
<%@ include file='../include/library.jsp'%>
<title>Pet & Meet</title>
<script>
      var imgError3 = function (image) {
    	  image.onerror = ""
    	  var parent = image.parentElement
    	  var parentTag = parent.innerHTML
    	  var brokenImageTag = image.outerHTML
    	  parent.innerHTML = parentTag.replace(brokenImageTag, 
    	        '<div class="broken img">안내 이미지</div>')
    	  return true;
}
</script>
</head>
<body> 
	<div class='container' id='wrap'>
		<%@ include file='../include/header.jsp'%>
		<%@ include file='../include/nav.jsp'%>
		<div class='box' id='reservationInfo'>
			<div class='col-12'><a href="#">Reservation</a></div>
			<img src='../img/reservation.png' class='img-fluid ' onerror='imgError3(this);'>
		</div>

		<div class='box' id='boardInfo'>
			<div class='col-12'><a href="#">Board</a></div>
			<img src='../img/border.png' class='img-fluid' onerror='imgError3(this);'>
		</div>

		<div class='box' id='likeInfo'>
			<div class='col-12'><a href="#">Like</a></div>
			<img src='../img/like.png' class='img-fluid' onerror='imgError3(this);'>
		</div>

		<div class='box' id='MessageInfo'>
			<div class='col-12'><a href="#">Message</a></div>
			<img src='../img/message.png' class='img-fluid' onerror='imgError3(this);'>
		</div>
		<%@ include file='../include/footer.jsp'%>
	</div>
</body>
</html>