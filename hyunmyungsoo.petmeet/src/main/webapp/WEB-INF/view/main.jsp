<%@ page language='java' contentType='text/html; charset=UTF-8' pageEncoding='utf-8' isELIgnored='false'%>
<%
	session.setAttribute("main", "main");
%>
<!DOCTYPE html>
<html>
<head>
<%@ include file= './include/library.jsp' %>
<%@ page import= 'hyunmyungsoo.petmeet.domain.Review' %>
<%@ page import='java.util.*'%>
<title>Pet & Meet</title>
<script>
	var imgError2 = function(image) {
		image.onerror = ""
		var parent = image.parentElement
		var parentTag = parent.innerHTML
		var brokenImageTag = image.outerHTML
		parent.innerHTML = parentTag.replace(brokenImageTag,
				'<div class="brokenMain carouImg">메인안내 이미지</div>')
		return true;
	}
	var imgError16 = function(image) {
		image.onerror = ""
		var parent = image.parentElement
		var parentTag = parent.innerHTML
		var brokenImageTag = image.outerHTML
		parent.innerHTML = parentTag.replace(brokenImageTag,
				'<div class="brokenMain carouImg">후기 이미지</div>')
		return true;
	}
</script>
</head>
<body>
	<div class='container'>
	<%@ include file= './include/header.jsp' %>
	<%@ include file= './include/nav.jsp' %>
   
		<div class='carousel slide' data-ride='carousel'>
			<div id='mainCarou' class='carousel slide' data-ride='carousel'>
				<ol class='carousel-indicators'>
					<li data-target='#mainCarou' data-slide-to='1'></li>
					<li data-target='#mainCarou' data-slide-to='2'></li>
					<li data-target='#mainCarou' data-slide-to='3'></li>
				</ol>
				<div class='carousel-inner'>
					<div class='carousel-item active text-center'>
						<img src='img/main1.png' class='mainImg1 img-fluid' onerror='imgError2(this);'>
						<div class='carousel-caption text-dark'>
							<a href='./manual/listManual' class='font'>자세히 보기</a>
						</div>
					</div>
					<div class='carousel-item text-center'>
						<img src='img/main2.png' class='mainImg2 img-fluid' onerror='imgError2(this);'>
						<div class='carousel-caption text-dark'>
						</div>
					</div>
					<div class='carousel-item text-center'>
						<img src='img/main3.png' class='mainImg3 img-fluid' onerror='imgError2(this);'>
						<div class='carousel-caption text-dark'>
						</div>
					</div>
				</div>
				<a href='#mainCarou' class='carousel-control-prev' data-slide='prev'>
					<span class='carousel-control-prev-icon'></span>
				</a> <a href='#mainCarou' class='carousel-control-next'
					data-slide='next'> <span class='carousel-control-next-icon'></span>
				</a>
			</div>
		</div>
		<div class='reviewBar'>
			<hr>
			<div class='reviewBarFont'>Review</div>
			<hr>
		</div>

		<div class='card-deck mt-3'>
			<c:choose>
				<c:when test='${reviewList.size()>0}'>
					<c:forEach var='review' items='${reviewList}'>
						<div class='card'>
							<div class='reviewImg'>
								<img src='img/review${review.userId}${review.reservNum}.PNG' class='img-fluid reviewImg' onerror='imgError16(this);'>
							</div>
				            <div class='card-body'>
								<h5 class='card-title'>${review.reviewRating}</h5>
								<p class='card-text'>${review.reviewContent}</p>
							</div>
				            <div class='card-footer'>
								<small class='text-muter'>${review.reviewRegdate}</small>
							</div>
						</div>
					</c:forEach>
				</c:when>
				<c:otherwise>
					<div class='font'>현재 후기가 없습니다.</div>					
				</c:otherwise>
			</c:choose>
		</div>
	<%@ include file= './include/footer.jsp' %>
	</div>
</body>
</html>