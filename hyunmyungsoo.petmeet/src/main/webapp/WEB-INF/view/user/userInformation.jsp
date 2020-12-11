<%@ page language='java' contentType='text/html; charset=UTF-8' pageEncoding='utf-8' isELIgnored='false'%>
<%
   session.removeAttribute("main");
%>
<!DOCTYPE html>
<html>
<head>
<%@ include file= '../include/library.jsp' %>
<%@ page import= 'hyunmyungsoo.petmeet.domain.User' %>
<%@ page import='java.util.*'%>
<%
	Object userList = request.getAttribute("userList");
	List<User> userList2 = (List<User>)userList;
	String userId = session.getAttribute("userEmail").toString();
	User user = null;
	for(User findUser : userList2){
		if(findUser.getUserId().equals(userId)){
			user = findUser;break;
		}
	}
%>
<title>Pet & Meet</title>
</head>
<body>
<div class='container'>
	<%@ include file= '../include/header.jsp' %>
	<%@ include file= '../include/nav.jsp' %>
	<div>
		<h3 class='titleFont'>내정보</h3>
		</div>
		<hr class='color'>
   	
   		<form id='new' action='changePw'></form>
		<form method='post'>
			<div class='row mt-3 font'>
				<div class='offset-3'>아이디</div>
			</div>
			<div class='row'>
				<input type='email' class='form-control w-50 offset-3' id='userId'
			name='userId' readonly value='<%=user.getUserId() %>' />
			</div>
			<div class='row mt-3 font'>
				<div class='offset-3'>비밀번호</div>
			</div>
			<div class='row font'>
				<button type='submit' form='new' 
			class='btn btn-sm btn-outline-primary offset-3'>비밀번호 변경</button>
			</div>
			<div class='row font'>
				<div class='offset-3'>이름</div>
			</div>
			<div class='row'>
				<input type='text' class='form-control w-50 offset-3' id='userName'
				name='userName' value='<%=user.getUserName() %>'  maxlength='19' required />
			</div>
			<div class='row mt-3 font'>
				<div class='offset-3'>닉네임</div>
			</div>
			<div class='row'>
				<input type='text' class='form-control w-50 offset-3' id='userNick'
				name='userNick' value='<%=user.getUserNickname()%>' maxlength='19' required/>
			</div>
			<div class='row mt-3 font'>
				<div class='offset-3'>주소</div>
			</div>
			<div class='row'>
				<input type='text' class='form-control offset-3' id='userAddressSi' name='userAddressSi' value='<%=user.getUserLocSi() %>' style='width : 15%' maxlength='10' required/>시
				<input type='text' class='form-control' id='userAddressGu' name='userAddressGu' value='<%=user.getUserLocGu() %>' style='width : 15%' maxlength='10' required/>구
				<input type='text' class='form-control' id='userAddressDong' name='userAddressDong' value='<%=user.getUserLocDong() %>' style='width : 15%' maxlength='10' required/>동
			</div>
		   <div class='row mt-3'>
				<div class='offset-3'>생년월일</div>
			</div>
			<div class='row'>
				<input type='date' class='form-control w-50 offset-3' id='userBirth' name='userBirth' value='<%=user.getUserBirth()%>'required/>
			</div>
			<div class='row mt-3 font'>
				<div class='offset-3'>전화번호</div>
			</div>
			<div class='row'>
				<input type='tel' class='form-control w-50 offset-3' id='userPhone'
				name='userPhone' pattern='[0-9]{3}-[0-9]{4}-[0-9]{4}'
				value='<%=user.getUserPhone()%>' maxlength='15' placeholder='010-0000-0000' required />
			</div>
			<hr class='color'>
			<div class='row justify-content-end mt-4'>
				<button type='button'
				class='btn btn-outline-danger mr-2 font'
				data-toggle='modal' data-target='#userBye'>회원탈퇴</button>
				<button type='button'
				class='btn btn-outline-info col-1 mr-2 font'
				data-toggle='modal' data-target='#userFix'>수정</button>
				<a href='../common/mypage'
				class='btn btn-outline-primary font'>마이페이지</a>
			</div>
	
			<div id='userBye' class='modal fade' tabindex='-1'>
				<div class='modal-dialog'>
				<div class='modal-content'>
					<div class='modal-body'>
						<div class='row justify-content-center'>
							<p>회원 탈퇴하겠습니까?</p>
						</div>
						<div class='row justify-content-center'>
							<button type='submit' 
							class='btn btn-primary submitBtn mr-2' formaction='userInformation/del'>확인</button>
							<button type='button' class='btn btn-secondary'
							data-dismiss='modal'>취소</button>
						</div>
					</div>
				</div>
				</div>
			</div>
			<div id='userFix' class='modal fade' tabindex='-1'>
				<div class='modal-dialog'>
				<div class='modal-content'>
					<div class='modal-body'>
					<div class='row justify-content-center'>
						<p>회원 수정하겠습니까?</p>
					</div>
					<div class='row justify-content-center'>
						<button type='submit' 
						class='btn btn-primary submitBtn mr-2' formaction='userInformation/fix'>확인</button>
						<button type='button' class='btn btn-secondary'
						data-dismiss='modal'>취소</button>
					</div>
					</div>
				</div>
				</div>
			</div>
		</form>
   <%@ include file= '../include/footer.jsp' %>   
</div>
</body>
</html>