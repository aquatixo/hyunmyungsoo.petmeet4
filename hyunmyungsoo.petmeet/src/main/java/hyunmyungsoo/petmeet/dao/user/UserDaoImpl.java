package hyunmyungsoo.petmeet.dao.user;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import hyunmyungsoo.petmeet.dao.map.user.UserMap;
import hyunmyungsoo.petmeet.domain.User;

@Repository
public class UserDaoImpl implements UserDao {
	@Autowired private UserMap userMap;
	
	@Override
	public List<User> selectUsers() {
		return userMap.selectUsers();
	}

	@Override
	public User selectUser(String userId) {
		return userMap.selectUser(userId);
	}

	@Override
	public List<User> selectDelUsers() {
		return userMap.selectDelUsers();
	}

	@Override
	public User selectFindId(String userName, String userPhone) {
		return userMap.selectFindId(userName, userPhone);
	}

	@Override
	public boolean insertUser(User user) {
		return userMap.insertUser(user);
	}

	@Override
	public boolean updateUserPw(User user) {
		return userMap.updateUserPw(user);
	}

	@Override
	public boolean deleteUser(String userId) {
		return userMap.deleteUser(userId);
	}

	@Override
	public boolean insertDelUser(User user) {
		return userMap.insertDelUser(user);
	}

	@Override
	public boolean updateUserInfo(User user) {
		return userMap.updateUserInfo(user);
	}
}