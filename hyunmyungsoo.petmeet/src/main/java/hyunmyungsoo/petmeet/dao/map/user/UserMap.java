package hyunmyungsoo.petmeet.dao.map.user;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import hyunmyungsoo.petmeet.domain.User;

@Repository
public interface UserMap {
	List<User> selectUsers();
	List<User> selectDelUsers();
	
	User selectUser(@Param("userId") String userId);
	User selectFindId(@Param("userName") String userName, 
			@Param("userPhone") String userPhone);
	
	boolean insertUser(User user);
	boolean updateUserPw(User user);
	boolean deleteUser(String userId);
	boolean insertDelUser(User user); 
	boolean updateUserInfo(User user);
}