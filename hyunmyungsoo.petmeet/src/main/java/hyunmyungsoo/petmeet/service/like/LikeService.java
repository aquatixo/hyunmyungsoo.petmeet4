package hyunmyungsoo.petmeet.service.like;

import java.util.List;

import hyunmyungsoo.petmeet.domain.Like;

public interface LikeService {
	List<Like> getLikes();
	
	boolean addLike(Like like);
	boolean addLikeHelper(String userId, int sitterNum);
	boolean deleteLike(String likeNum);
}