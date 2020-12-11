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
				'<div class="broken carouImg">메인안내 이미지</div>')
		return true;
	}
</script>
</head>
<%
	List<Review> reviewList = (List<Review>)request.getAttribute("reviewList");
	List<Review> twoReviewList = new ArrayList<>();
	
	if(!reviewList.isEmpty() && reviewList.size()>1){
		Review r1 = reviewList.get(reviewList.size()-2);
		Review r2 = reviewList.get(reviewList.size()-1);
		twoReviewList.add(r1);twoReviewList.add(r2);
	}else if(!reviewList.isEmpty() && reviewList.size() == 1){
		Review r1 = reviewList.get(0);
		twoReviewList.add(r1);
	}
%>
<body>
	<div class='container'>
	<%@ include file= './include/header.jsp' %>
   
	<%@ include file= './include/nav.jsp' %>
   
		<div class='carousel slide' data-ride='carousel'>
			<div id='mainCarou' class='carousel slide' data-ride='carousel'>
				<ol class='carousel-indicators'>
					<li data-target='#mainCarou' data-slide-to='1'></li>
					<li data-target='#mainCarou' data-slide-to='2'></li>
				</ol>
				<div class='carousel-inner'>
					<div class='carousel-item active text-center'>
						<img src='img/main1.png' class='mainImg1 img-fluid' onerror='imgError2(this);'>
						<div class='carousel-caption text-dark'>
							<a href='./manual/manualList' class='font'>자세히 보기</a>
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
				<c:when test='${twoReviewList.size()>0}'>
					<c:forEach var='review' items='${twoReviewList}'>
						<div class='card'>
							<div class='reviewImg'>후기 이미지</div>
				            <div class='card-body'>
								<h5 class='card-title'>${twoReviewList.getReviewRating()}</h5>
								<p class='card-text'>${twoReviewList.getReviewContent()}</p>
							</div>
				            <div class='card-footer'>
								<small class='text-muter'>${twoReviewList.getReviewRegdate()}</small>
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