package hyunmyungsoo.petmeet.service.user;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import hyunmyungsoo.petmeet.dao.user.UserDao;
import hyunmyungsoo.petmeet.domain.User;

@Service
public class UserServiceImpl implements UserService{
	@Autowired private UserDao userDao;
	
	@Override
	public List<User> getUsers() {
		return userDao.selectUsers();
	}

	@Override
	public User getUser(String userId) {
		return userDao.selectUser(userId);
	}

	@Override
	public String loginCheck(String userEmail, String userPw) {
		String loginChecker = "";
		User hasUser = null;
		String hasUserPw = "";
		
		hasUser = getUser(userEmail);
		if(hasUser != null)
			hasUserPw = hasUser.getUserPw();
		if(hasUser == null)
			loginChecker = "ID";
		if(hasUser != null && !hasUserPw.equals(userPw)) {
			hasUser = null;
			loginChecker = "PW";
		}
		if(hasUser != null && hasUserPw.equals(userPw)) {
			loginChecker = "SUCCESS";
		}
		if(userEmail.equals("admin") && userPw.equals("admin"))
			loginChecker = "ADMIN";
		
		return loginChecker;
	}

	@Override
	public List<User> getDelUsers() {
		return userDao.selectDelUsers();
	}
	
	@Override
	public String signUpCheck(String userEmail) {
		String signUpChecker = "";
		List<User> userList = getUsers();
		List<User> delList = getDelUsers();
		
		for(User user : userList) {
			if(user.getUserId().equals(userEmail)) {
				signUpChecker = "ALREADY";
			}
		}
		
		for(User delUser : delList) {
			if(delUser.getUserId().equals(userEmail)) {
				signUpChecker = "DELUSER";
			}
		}
		
		if(!signUpChecker.equals("ALREADY") && !signUpChecker.equals("DELUSER"))
			signUpChecker = "SEND";
		
		return signUpChecker;
	};
	
	@Override
	public boolean addUserHelper(String userId, String userPw, String userName,
			String userNick, String userBirth, String userPhone,
			String userSi, String userGu, String userDong
			) {
		User newUser = new User();
		LocalDate userBirth2 = LocalDate.parse(userBirth, DateTimeFormatter.ISO_DATE);

		newUser.setUserId(userId); newUser.setUserPw(userPw);
		newUser.setUserName(userName);newUser.setUserNickname(userNick);
		newUser.setUserBirth(userBirth2);
		newUser.setUserPhone(userPhone); newUser.setUserLocSi(userSi);
		newUser.setUserLocGu(userGu); newUser.setUserLocDong(userDong);
		
		return addUser(newUser);
	}
	
	@Override
	public boolean addUser(User user) {
		return userDao.insertUser(user);
	}
	
	@Override
	public User getFindId(String userName, String userPhone) {
		return userDao.selectFindId(userName, userPhone);
	}
	
	@Override
	public String findIdHelper(String userName, String userPhone) {
		User hasUser = null;
		hasUser = getFindId(userName, userPhone);
		String userId = "empty";
		if(hasUser != null)
			userId = hasUser.getUserId();

		return userId;
	}
	
	@Override
	public String fixPwHelper(String userId) {
		User hasUser = null;
		hasUser = getUser(userId);
		String fixPwChecker = "";
		
		if(hasUser == null)
			fixPwChecker = "EMPTY";
		else fixPwChecker = "SUCCESS";
		
		return fixPwChecker;
	}
	
	@Override
	public boolean fixUserPw(User user) {
		return userDao.updateUserPw(user);
	}
	
	@Override
	public boolean changePwHelper(String userId, String userPw) {
		User changePwUser = null;
		changePwUser = getUser(userId);
		changePwUser.setUserPw(userPw);
		fixUserPw(changePwUser);
		return true;
	}
	
	@Override
	public boolean delUser(String userId) {
		return userDao.deleteUser(userId);
	}
	
	@Override
	public boolean delUserHelper(String userId) {
		addDelUser(getUser(userId));
		delUser(userId);
		return true;
	}
	
	@Override
	public boolean addDelUser(User user) {
		return userDao.insertDelUser(user);
	}
	
	@Override
	public boolean fixUserInfo(User user) {
		return userDao.updateUserInfo(user);
	}

	@Override
	public boolean fixUserInfoHelper(String userId, String userName, String userNick, String userBirth,
			String userPhone, String userSi, String userGu, String userDong) {
		
		User changeInfoUser = null;
		LocalDate userBirth2 = LocalDate.parse(userBirth, DateTimeFormatter.ISO_DATE);

		changeInfoUser = getUser(userId);
		changeInfoUser.setUserName(userName);
		changeInfoUser.setUserNickname(userNick);
		changeInfoUser.setUserLocSi(userSi);
		changeInfoUser.setUserLocGu(userGu);
		changeInfoUser.setUserLocDong(userDong);
		changeInfoUser.setUserPhone(userPhone);
		changeInfoUser.setUserBirth(userBirth2);
		fixUserInfo(changeInfoUser);
		
		return true;
	}
}