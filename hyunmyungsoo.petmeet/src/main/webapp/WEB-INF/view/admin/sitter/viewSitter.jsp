<%@ page language='java' contentType='text/html; charset=UTF-8' pageEncoding='utf-8' isELIgnored='false'%>
<%
	session.removeAttribute("main");
%>
<!DOCTYPE html>
<html>
<head>
<%@ include file= '../include/library.jsp' %>
<%
	Object sitter = request.getAttribute("sitter");
	Object user = request.getAttribute("user");	
%>

<title>Pet & Meet Admin</title>
</head>
<body>
	<div class='container'>
		<div class='main'>
			<h3>펫 시터 게시판 관리</h3>
		</div>
		<hr class='hr'>
		<div class='row form-group justify-content-center'>
			<img src='../../img/sitter${sitter.userId}.PNG'
				class='col-4 mainImg2 img-fluid justify-content-center'
				onerror='imgError6(this);'>
		</div>

		<div class='row'>
			<div class='col mt-2'>
				<div class='form-inline justify-content-center mt-1'>
					<label for='sitterName'
						class='col-4 col-form-label text-center m-0 p-0'>이름</label> 
					<input type='text' class='form-control col-6 m-0 p-0 text-center'
						id='sitterName' value='${user.userName}' readonly />
				</div>
				<div class='form-inline justify-content-center mt-1'>
					<label for='sitterNick'
							class='col-4 col-form-label text-center m-0 p-0'>닉네임</label> 
					<input type='text' class='form-control col-6 m-0 p-0 text-center'
						id='sitterNick' value='${user.userNickname}' readonly />
				</div>
				<div class='form-inline justify-content-center mt-1'>
					<label for='sitterTel' class='col-4 col-form-label text-center m-0 p-0'>전화번호</label> 
					<input type='tel' class='form-control col-6 m-0 p-0 text-center'
						id='sitterTel' value='${user.userPhone}' readonly />
				</div>
				<div class='form-inline justify-content-center mt-1'>
					<label for='sitterBirth' class='col-4 col-form-label text-center m-0 p-0'>생년월일</label> 
					<input type='text' class='form-control col-6 m-0 p-0 text-center'
						id='sitterBirth' value='${user.userBirth}' readonly />
				</div>
				<div class='form-inline justify-content-center mt-1'>
					<label for='sitterAddr' class='col-4 col-form-label text-center m-0 p-0'>주소</label> 
						<input type='text' class='form-control m-0 p-0 text-center'
							id='sitterAddr' value='${sitter.sitterLocOrg}' readonly />
				</div>
			</div>

			<div class='col ml-0 mt-2'>
				<div class='form-inline mt-1'>
					<label for='sitterTitle' class='col-2 col-form-label text-center m-0 p-0'>제목</label> 
					<input type='text' class='form-control col-8 m-0 p-0 text-center'
						id='sitterTitle' value='${sitter.sitterTitle}' readonly />
				</div>
				<div class='form-inline mt-1'>
					<label for='sitterContent' class='col-2 col-form-label text-center m-0 p-0'>소개글</label>
					<textarea class='form-control col-8 m-0 p-0 text-center' id='sitterContent'
						readonly>${sitter.sitterContent}</textarea>
				</div>
				<div class='form-inline mt-1'>
					<label for='grade' class='col-2 col-form-label text-center m-0 p-0'>평점</label>
					<svg width='1em' height='1em' viewBox='0 0 16 16' class='bi bi-star-fill' fill='currentColor'
						xmlns='http://www.w3.org/2000/svg'>
 					 	<path d='M3.612 15.443c-.386.198-.824-.149-.746-.592l.
 					 	83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898
 					 	-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.4
 					 	41.062.612.636.283.95l-3.523 3.356.83 4.73c.078.443-.36.79-.7
 					 	46.592L8 13.187l-4.389 2.256z' />
					</svg>
					<p class='col-2 mt-3 ml-0 mr-3'>★${sitter.sitterRating}</p>
				</div>
			</div>
		</div>
		<hr class='hr'>
		<div class='d-flex form-group justify-content-end'>
			<button type='button' class='btn btn-outline-danger mt-3 mr-2'
				data-toggle='modal' data-dismiss='modal' data-target='#sitterDelMod'>삭제</button>
			<a href='listSitter' class='btn btn-outline-primary mt-3' data-dismiss='modal'>목록</a>
		</div>
		
		<form action='viewSitter/del' method='post'>
			<div class='form-group row' hidden>
				<input name='userId' type='text' class='form-control' id='userId'
					value='${sitter.userId }' />
			</div>
			<div class='modal fade' id='sitterDelMod' tabindex='-1'>
				<div class='modal-dialog'>
					<div class='modal-content'>
						<div class='modal-body '>
							<p class='text-center'>게시물을 삭제하겠습니까?</p>
							<div class='row justify-content-center'>
                  				<button type='submit' class='btn btn-primary submitBtn mr-2' >확인</button>
                  				<button type='button' class='btn btn-secondary' data-dismiss='modal'>취소</button>
              				</div>
						</div>
					</div>
				</div>
			</div>
		</form>
	</div>
</body>
</html>