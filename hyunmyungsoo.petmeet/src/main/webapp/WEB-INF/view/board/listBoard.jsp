<%@ page language='java' contentType='text/html; charset=UTF-8' pageEncoding='utf-8' isELIgnored='false'%>
<%
	session.removeAttribute("main");
	Object userList = request.getAttribute("userList");
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<%@ include file= '../include/library.jsp' %>
<title>Pet & Meet</title>
</head>
<script>
	function selChange() {
		var sel = document.getElementById('cntPerPage').value;
		location.href="/hyunmyungsoo.petmeet/board/listBoard?nowPage=${paging.nowPage}&cntPerPage="+sel;
	}
</script>
<body>
	<div class='container'>
  		<%@ include file= '../include/header.jsp' %>
		<%@ include file= '../include/nav.jsp' %>
		
		<div>
			<h3 class='titleFont'>자유게시판</h3>
		</div>
		
		<form>
			<div style="float: right;">
				<select id="cntPerPage" name="sel" onchange="selChange()" class='font text'>
					<option value="5"
						<c:if test="${paging.cntPerPage == 5}">selected</c:if>>5줄 보기</option>
					<option value="10"
						<c:if test="${paging.cntPerPage == 10}">selected</c:if>>10줄 보기</option>
					<option value="15"
						<c:if test="${paging.cntPerPage == 15}">selected</c:if>>15줄 보기</option>
					<option value="20"
						<c:if test="${paging.cntPerPage == 20}">selected</c:if>>20줄 보기</option>
				</select>
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
					<c:choose>
		      			<c:when test='${boardList.size() >0 }'>
							<c:forEach var="list" items="${boardList}">
								<tr id="${list.boardNum}" class="getBoard"
								onclick="location.href='/hyunmyungsoo.petmeet/board/view?boardNum=${list.boardNum}'">
									<th><a>${list.boardNum}</a></th>
									<td>${list.boardTitle}</td>
									<td>
										<c:forEach var='user' items='${userList}'>
											<c:if test='${list.userId == user.userId}'>
												${user.userNickname}
											</c:if>
										</c:forEach>
									</td>
									<td>${list.regDate}</td>
								</tr>			
							</c:forEach>
						</c:when>
						<c:otherwise>
							<th class='font'>현재 게시글이 없습니다.</th>			
					    </c:otherwise>
				    </c:choose>
				</tbody>
			</table>
			
			<div class='form-group row' hidden>
	           <input name='boardNum' type='text' class='form-control' id='${list.boardNum}'
	                  value='${list.boardNum}' />
	        </div>

			<div class='d-flex justify-content-center'>	
				<ul class='pagination'>
					<c:if test="${paging.startPage != 1 }">
						<li class='page-item'>
						<a class='page-link'  href="/hyunmyungsoo.petmeet/board/listBoard?nowPage=${paging.startPage - 1 }&cntPerPage=${paging.cntPerPage}">&lt;</a>
						</li>
					</c:if>
					<c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="p">
						<c:choose>
							<c:when test="${p == paging.nowPage }">
								<li class='page-item'>
								<a class='page-link' style="font-weight:bold">${p }</a>
								</li>
							</c:when>
							<c:when test="${p != paging.nowPage }">
								<li class='page-item'>
								<a class='page-link'  href="/hyunmyungsoo.petmeet/board/listBoard?nowPage=${p }&cntPerPage=${paging.cntPerPage}">${p }</a>
								</li>
							</c:when>
						</c:choose>
					</c:forEach>
					<c:if test="${paging.endPage != paging.lastPage}">
						<li class='page-item'>
						<a class='page-link' href="/hyunmyungsoo.petmeet/board/listBoard?nowPage=${paging.endPage+1 }&cntPerPage=${paging.cntPerPage}">&gt;</a>
						</li>
					</c:if>
				</ul>
			</div>		
	  </form>
	  
		<hr class='color'>
		<div class='d-flex justify-content-end mt-4'>
			<button class='btn btn-outline-primary font' type='button' id='write'
			onclick="location.href='/hyunmyungsoo.petmeet/board/insertBoard'">글쓰기</button>
		</div>		
		
		<%@ include file= '../include/footer.jsp' %>
	</div>
</body>
</html>