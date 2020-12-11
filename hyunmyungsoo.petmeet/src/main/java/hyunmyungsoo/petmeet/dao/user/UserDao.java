package hyunmyungsoo.petmeet.dao.user;

import java.util.List;

import hyunmyungsoo.petmeet.domain.User;

public interface UserDao {
	List<User> selectUsers();
	List<User> selectDelUsers();

	User selectUser(String userId);
	User selectFindId(String userName, String userPhone);

	boolean insertUser(User user);
	boolean updateUserPw(User user);
	boolean deleteUser(String userId);
	boolean insertDelUser(User user); 
	boolean updateUserInfo(User user);
}