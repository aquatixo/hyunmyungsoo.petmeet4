package hyunmyungsoo.petmeet.dao.map.like;

import java.util.List;

import org.springframework.stereotype.Repository;

import hyunmyungsoo.petmeet.domain.Like;

@Repository
public interface LikeMap {
	List<Like> selectLikes();
	
	boolean insertLike(Like like);
	boolean deleteLike(int likeNum);
}