package hyunmyungsoo.petmeet.dao.like;

import java.util.List;

import hyunmyungsoo.petmeet.domain.Like;


public interface LikeDao {
	List<Like> selectLikes();
	
	boolean insertLike(Like like);
	boolean deleteLike(int likeNum);
}
