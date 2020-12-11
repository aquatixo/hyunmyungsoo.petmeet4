package hyunmyungsoo.petmeet.service.user;

import java.util.List;

import hyunmyungsoo.petmeet.domain.User;

public interface UserService {
	List<User> getUsers();
	List<User> getDelUsers();
	
	User getUser(String userId);
	User getFindId(String userName, String userPhone);
	
	boolean addUser(User user);
	boolean fixUserPw(User user);
	boolean delUser(String userId);
	boolean addDelUser(User user);
	boolean fixUserInfo(User user);
	
	String loginCheck(String userEmail, String userPw);
	String signUpCheck(String userEmail);
	boolean addUserHelper(String userId, String userPw, String userName,
			String userNick, String userBirth, String userPhone,
			String userSi, String userGu, String userDong);
	String findIdHelper(String userName, String userPhone);
	String fixPwHelper(String userId);
	boolean changePwHelper(String userId, String userPw);
	boolean delUserHelper(String userId);
	boolean fixUserInfoHelper(String userId, String userName,
			String userNick, String userBirth, String userPhone,
			String userSi, String userGu, String userDong);
}