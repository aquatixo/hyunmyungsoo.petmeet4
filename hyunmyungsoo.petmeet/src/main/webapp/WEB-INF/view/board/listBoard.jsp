<%@ page language='java' contentType='text/html; charset=UTF-8' pageEncoding='utf-8' isELIgnored='false'%>
<%
	session.removeAttribute("main");
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<!-- include : lib -->
<meta charset='UTF-8'>
<meta name='viewport' content='width=device-width, initial-scale=1'>
<script src='https://code.jquery.com/jquery-3.5.1.min.js'></script>
<link rel='stylesheet' href='https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css' />
<link rel='stylesheet' href='../res/css/lib.css'>
<!-- /include : lib -->
<title>Pet & Meet</title>
</head>
<script>

$(function(){ 
	$(".getBoard").click(function() {
		   var boardNum = $(this).attr('id').substr(1);
		   location.href = "view?boardNum=" + boardNum;
	});
});
</script>
<body>
	<div class='container'>
  		<%@ include file= '../include/header.jsp' %>
		<%@ include file= '../include/nav.jsp' %>
        
        
		<div>
			<h3 class='titleFont'>자유게시판</h3>
		</div>
	
			<table class='table table-hover'>
				<thead class='thead text'>
					<tr class='font'>
						<th>번호</th>
						<th>제목</th>
						<th>작성자</th>
						<th>등록일</th>
					</tr>
				</thead>
				<tbody class='text'>
					<c:forEach var="list" items="${boardList}">
						<tr id="a${list.boardNum}" class="getBoard">
							<th><a>${list.boardNum}</a></th>
							<td>${list.boardTitle}</td>
							<td>${list.userId}님</td>
							<td>${list.regDate}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		

			
			<div class='d-flex justify-content-center'>	
				<ul class='pagination'>
					<li class='page-item'><a class='page-link' href='#'><span>«</span></a></li>
					<li class='page-item'><a class='page-link' href='#'>1</a></li>
					<li class='page-item'><a class='page-link' href='#'>2</a></li>
					<li class='page-item'><a class='page-link' href='#'>3</a></li>
					<li class='page-item'><a class='page-link' href='#'>4</a></li>
					<li class='page-item'><a class='page-link' href='#'><span>»</span></a></li>
				</ul>
			</div>
			
		<hr class='color'>
		
			<div class='d-flex justify-content-end mt-4'>
				<button class='btn btn-outline-primary font' type='button' id='write'
				onclick="location.href='/hyunmyungsoo.petmeet/board/addBoard'">글쓰기</button>
			</div>		
			
	<%@ include file= '../include/footer.jsp' %>
</div>
</body>
</html>